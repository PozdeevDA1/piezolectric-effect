function Export_3D(res_param)
    %% Parameters
    waveguide_width = 115/2;
    cd result/
    import com.comsol.model.*
    import com.comsol.model.util.*
    ModelUtil.clear
    
    model = ModelUtil.create('Model');
    
    comp1 = model.component.create('comp1',true);
    geom1 = comp1.geom.create('geom1', 3);
    geom1.lengthUnit('mm');
    
    wp1 = geom1.feature.create('wp1', 'WorkPlane');
    wp1.set('planetype', 'quick');
    wp1.set('quickplane', 'xy');
    
    rings = res_param{1};
    r_sizes = res_param{2};
    r_widths = res_param{3};
    r_poses = res_param{4};
    x7 = 0;


% SK: I add separate coefficient to reduce the length of the structure
   if max(r_poses) > 500
        koeff_y = 500/max(r_poses);
    else
        koeff_y = 1;
    end
    r_poses = r_poses*koeff_y;

% SK: I set koeff only to scale ABH structure along horizontal axis. If the
% with of ABH exceeds the width of the waveguide (which is fixed), it is
% scaled to have the width of 0.9*waveguide_width.
    if max(r_sizes) > waveguide_width
        koeff = 0.9*waveguide_width/max(r_sizes);
    else
        koeff = 1;
    end

    present_index = 0;
    for r_ind = 1:18
        if rings(r_ind) == 1 && r_widths(r_ind) > 0 && r_sizes(r_ind) > 0
            if r_ind == 1 || r_sizes(r_ind) - r_sizes(r_ind - 1) - r_widths(r_ind - 1) > 0
                present_index = present_index + 1;
                r_name = 'r' + string(r_ind + 1);
                r_obj = wp1.geom.create(r_name, 'Rectangle');
    
                r_obj.set('size', [r_sizes(present_index)*koeff r_widths(present_index)]);
                r_obj.set('pos', [x7*koeff r_poses(present_index)]);
            end
        end
    end
    

    r1 = wp1.geom.feature.create('r1', 'Rectangle');
    r1.set('size', [0.1 max(r_poses)]);
    r1.set('pos', [-0.1 0]);

    geom1.run
    
    ext1 = geom1.feature.create('ext1', 'Extrude');
    ext1.set('distance', '6');
    ext1.selection('input').set({'wp1'});
    geom1.run;

    %mphgeom(model, "geom1")
    
    mphsave(model, 'optimized_model_3d');
end