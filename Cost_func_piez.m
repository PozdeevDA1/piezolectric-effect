function out = Cost_func_piez(cur_item)
% a.m

 %% Initialization of the model
import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('D:\Matlab');

% В случае с черными дырами, оптимизировали формулу, для удобства, создадим
% собственную "формулу", чтобы использовать часть кода Ярослава
% 
% Расположение кристаллов (далее цилиндров) на пластине пьезокерамики 
% можно разбить на полоски и затем оптимизировать одну из них Объединяя 
% полоски с полученным результатом получим оптимизированную пластину

%% Parameters
cylinders = cur_item{1};
heights = cur_item{2};
height = heights(1);
radius = cur_item{3};
pos = cur_item{4};

size_cyl = size(cylinders);

if cylinders == ones(1, size_cyl(1))
    out = 0;
    return
end


%% Set up geometry
comp1 = model.component.create('comp1', true);
geom1 = comp1.geom.create('geom1', 3);
geom1.lengthUnit('mm');


% SK: always parametrize everything
plate_x = 13;
plate_y = 13;
plate_z = 0.6;




%cylinders
r_poses = pos;
r_domains = [];

% SK: better to parameterize the possible number of cylinders
nx_cylinders = size_cyl(2);
ny_cylinders = size_cyl(2);

if max(radius) == 0
    return
end
% 
% SK: add distance between the lines of cylinders
% period_x = max(radius*koeff)*2;

% SK: we need to fit the cylinder into the plate
% Hence, we can limit the radius by the number of cylinders along the x
% direction, assuming that there is a gap between a cylinder and the edge
% of the plate:
dx_plate_edge = 0.5;
line_width = ((plate_x - dx_plate_edge*2)/(nx_cylinders))/2;
if max(radius) > line_width
    radius = radius*(line_width/max(radius));
end
% Then we set the initial coordinate along the line:
dy_plate_edge = 0.5; % distance between a cylinder and plate edge[mm]
r_poses = abs(r_poses - r_poses(1));

% ALso, we need to stretch/compress the coordinates along the y direction:
if (max(abs(r_poses)) + radius(end)) > (plate_y - dy_plate_edge)
    pos_y_max = plate_y - max(radius) - dy_plate_edge + (-radius(1)-dy_plate_edge);
    %SK: (-radius(1)-dy_plate_edge) is a shift of plate along y (see
    %below)
    r_poses = r_poses * (pos_y_max/max(r_poses));
end

for r_ind = 1:ny_cylinders
    if cylinders(r_ind) == 1 && radius(r_ind) ~=0
        if r_ind == 1 || pos(r_ind) - pos(r_ind - 1) - radius(r_ind - 1) > 0
            r_name = 'r' + string(r_ind);
            r_obj = geom1.create(r_name, 'Cylinder');
            r_obj.set('r', radius(r_ind));
            r_obj.set('h', height);
            r_obj.set('pos', [max(radius) + dx_plate_edge, r_poses(r_ind), plate_z]);       
            r_obj.set('createselection', 'on');
            geom1.run(r_name);
        end
    end
end


% plate
geom1.create('blk1', 'Block');
geom1.feature('blk1').set('size', [plate_x plate_y plate_z]);
%SK: shift the plate to align with the cylinders:
geom1.feature('blk1').set('pos', [0 (-radius(1)-dy_plate_edge) 0]);
geom1.feature('blk1').set('createselection', 'on');
geom1.run('blk1');
mphgeom(model, "geom1")
% SK: should be at the end of any geometry build:
geom1.run;

% SK: create selection with cylinders
cylinders_domains_line = [];
cylinders_names = cell(1, ny_cylinders);
for r_ind = 1:ny_cylinders
    if cylinders(r_ind) == 1 && radius(r_ind)~=0
        if r_ind == 1 || pos(r_ind) - pos(r_ind - 1) - radius(r_ind - 1) > 0
            cylinders_domains_ent = ...
                mphgetselection(model.selection(...
                sprintf('geom1_r%i_dom', r_ind)));
            cylinders_domains_line = ...
                [cylinders_domains_line cylinders_domains_ent.entities];
            cylinders_names{r_ind} = sprintf('r%i', r_ind);
        end
    end
end
if size(cylinders_domains_line) == 0
    out = 0;
    return
end
% SK: sinc we preallocate the cell, we need to remove empty cells for the
% cylinders which were removed
cylinders_names = cylinders_names(~cellfun('isempty', cylinders_names));

comp1.selection.create('sel_cylinders_line', 'Explicit');
comp1.selection('sel_cylinders_line').set(cylinders_domains_line);
comp1.selection('sel_cylinders_line').label('cylinders_line');

% SK: plate selection 
plate_domain_ent = mphgetselection(model.selection('geom1_blk1_dom'));
plate_domain = plate_domain_ent.entities;
comp1.selection.create('sel_plate', 'Explicit');
comp1.selection('sel_plate').set(plate_domain);
comp1.selection('sel_plate').label('plate');

mphsave(model,'dd2','component','on');

% SK: array of cylinders:
arr1 = geom1.create('arr1', 'Array');
arr1.selection('input').set(cylinders_names);
model.component('comp1').geom('geom1').feature('arr1').set('displ', [line_width*2 0 0]);
model.component('comp1').geom('geom1').feature('arr1').set('fullsize', [ny_cylinders 1 1]);
geom1.feature('arr1').set('createselection', 'on');
model.component('comp1').geom('geom1').run('arr1');
geom1.run;

% SK: array selection 
array_domain_ent = mphgetselection(model.selection('geom1_arr1_dom'));
array_domain = array_domain_ent.entities;
comp1.selection.create('sel_array', 'Explicit');
comp1.selection('sel_array').set(array_domain);
comp1.selection('sel_array').label('array');

pzt_domains = [plate_domain, array_domain];

% SK: selectbox to choose all top boundaries of the cylinders and bottom
% boundary of the plate
cylinders_top_bnds = mphselectbox(model, 'geom1', [0 (-radius(1)-dy_plate_edge) 0.9*(plate_z+height); plate_x (-radius(1)-dy_plate_edge)+plate_y 1.1*(plate_z+height)]', 'boundary');
plate_bottom_bnds = mphselectbox(model, 'geom1', [0 1.1*(-radius(1)-dy_plate_edge) -0.1; plate_x plate_y 0.1]', 'boundary');

mphgeom(model, 'geom1');


%% Set materials
addpath("auxiliary_functions/")
load_Lead_Zirconate_Titanate
model.component('comp1').material('mat1').selection.set(pzt_domains);


%% Set-up physics
% Solid Mechanics
model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').create('pzm1', 'PiezoelectricMaterialModel');
model.component('comp1').physics('solid').feature('pzm1').selection.set(pzt_domains);
model.component('comp1').physics('solid').create('fix1', 'Fixed', 1);
model.component('comp1').physics('solid').feature.remove('fix1');
model.component('comp1').physics('solid').create('fix1', 'Fixed', 2);
model.component('comp1').physics('solid').feature('fix1').selection.set(cylinders_top_bnds);
model.component('comp1').physics('solid').create('bndl1', 'BoundaryLoad', 2);
model.component('comp1').physics('solid').feature('bndl1').selection.set(plate_bottom_bnds);
model.component('comp1').physics('solid').feature('bndl1').set('FperArea', [0 0 10000]);

% Electrostatics
model.component('comp1').physics.create('es', 'Electrostatics', 'geom1');
model.component('comp1').physics('es').create('ccnp1', 'ChargeConservationPiezo');
model.component('comp1').physics('es').feature('ccnp1').selection.set(pzt_domains);
model.component('comp1').physics('es').create('gnd1', 'Ground', 2);
model.component('comp1').physics('es').feature('gnd1').selection.set(cylinders_top_bnds);
model.component('comp1').physics('es').create('fp1', 'FloatingPotential', 2);
model.component('comp1').physics('es').feature('fp1').selection.set(plate_bottom_bnds);

% Multiphysics: piezoeffect
model.component('comp1').multiphysics.create('pze1', 'PiezoelectricEffect', 3);
model.component('comp1').multiphysics('pze1').set('Solid_physics', 'solid');
model.component('comp1').multiphysics('pze1').set('Electrostatics_physics', 'es');




%% Study
model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
model.study('std1').feature('stat').activate('solid', true);
model.study('std1').feature('stat').activate('es', true);
model.study('std1').feature('stat').activate('pze1', true);

%% Set-up mesh
model.component('comp1').mesh.create('mesh1');
model.component('comp1').mesh('mesh1').autoMeshSize(4);
comp1.mesh('mesh1').run;


%% Run study
model.study('std1').run;

%% Results
% Floating potential:
fp_V0 = mphglobal(model,'es.fp1.V0');

out = fp_V0;


% mphsave(model,'dd','component','on');


