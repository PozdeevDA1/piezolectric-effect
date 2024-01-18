model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup.create('StrainCharge', 'Strain-charge form');
model.component('comp1').material('mat1').propertyGroup.create('StressCharge', 'Stress-charge form');
model.component('comp1').material('mat1').label('Lead Zirconate Titanate (PZT-8)');
model.component('comp1').material('mat1').set('family', 'custom');
model.component('comp1').material('mat1').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat1').set('diffuse', 'custom');
model.component('comp1').material('mat1').set('customdiffuse', [0.7843137254901961 0.7843137254901961 0.7843137254901961]);
model.component('comp1').material('mat1').set('noise', true);
model.component('comp1').material('mat1').set('fresnel', 0.9);
model.component('comp1').material('mat1').set('roughness', 0.1);
model.component('comp1').material('mat1').set('metallic', 0);
model.component('comp1').material('mat1').set('pearl', 0);
model.component('comp1').material('mat1').set('diffusewrap', 0);
model.component('comp1').material('mat1').set('clearcoat', 0);
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'904.4' '0' '0' '0' '904.4' '0' '0' '0' '561.6'});
model.component('comp1').material('mat1').propertyGroup('def').set('density', '7600[kg/m^3]');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('sE', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('dET', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('epsilonrT', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('eta_sE', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('eta_dET', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('eta_epsilonT', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('sE', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('dET', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('epsilonrT', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('eta_sE', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('eta_dET', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('eta_epsilonT', '');
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('sE', {'1.15e-011[1/Pa]' '-3.7e-012[1/Pa]' '-4.8e-012[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '-3.7e-012[1/Pa]' '1.15e-011[1/Pa]' '-4.8e-012[1/Pa]' '0[1/Pa]'  ...
'0[1/Pa]' '0[1/Pa]' '-4.8e-012[1/Pa]' '-4.8e-012[1/Pa]' '1.35e-011[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]'  ...
'0[1/Pa]' '3.19e-011[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '3.19e-011[1/Pa]' '0[1/Pa]'  ...
'0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '0[1/Pa]' '3.04e-011[1/Pa]'});
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('dET', {'0[C/N]' '0[C/N]' '-9.7e-011[C/N]' '0[C/N]' '0[C/N]' '-9.7e-011[C/N]' '0[C/N]' '0[C/N]' '2.25e-010[C/N]' '0[C/N]'  ...
'3.3e-010[C/N]' '0[C/N]' '3.3e-010[C/N]' '0[C/N]' '0[C/N]' '0[C/N]' '0[C/N]' '0[C/N]'});
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('epsilonrT', {'1290' '0' '0' '0' '1290' '0' '0' '0' '1000'});
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('eta_sE', {'0' '0' '0' '0' '0' '0' '0' '0' '0' '0'  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0'  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0'  ...
'0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('eta_dET', {'0' '0' '0' '0' '0' '0' '0' '0' '0' '0'  ...
'0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat1').propertyGroup('StrainCharge').set('eta_epsilonT', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('cE', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eES', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('epsilonrS', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eta_cE', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eta_eES', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eta_epsilonS', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('cE', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eES', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('epsilonrS', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eta_cE', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eta_eES', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eta_epsilonS', '');
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('cE', {'1.46876e+011[Pa]' '8.1087e+010[Pa]' '8.10537e+010[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '8.1087e+010[Pa]' '1.46876e+011[Pa]' '8.10537e+010[Pa]' '0[Pa]'  ...
'0[Pa]' '0[Pa]' '8.10537e+010[Pa]' '8.10537e+010[Pa]' '1.31712e+011[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]'  ...
'0[Pa]' '3.1348e+010[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '3.1348e+010[Pa]' '0[Pa]'  ...
'0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '0[Pa]' '3.28947e+010[Pa]'});
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eES', {'0[C/m^2]' '0[C/m^2]' '-3.87538[C/m^2]' '0[C/m^2]' '0[C/m^2]' '-3.87538[C/m^2]' '0[C/m^2]' '0[C/m^2]' '13.9108[C/m^2]' '0[C/m^2]'  ...
'10.3448[C/m^2]' '0[C/m^2]' '10.3448[C/m^2]' '0[C/m^2]' '0[C/m^2]' '0[C/m^2]' '0[C/m^2]' '0[C/m^2]'});
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('epsilonrS', {'904.4' '0' '0' '0' '904.4' '0' '0' '0' '561.6'});
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eta_cE', {'0' '0' '0' '0' '0' '0' '0' '0' '0' '0'  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0'  ...
'0' '0' '0' '0' '0' '0' '0' '0' '0' '0'  ...
'0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eta_eES', {'0' '0' '0' '0' '0' '0' '0' '0' '0' '0'  ...
'0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat1').propertyGroup('StressCharge').set('eta_epsilonS', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat1').set('groups', {});
model.component('comp1').material('mat1').set('family', 'custom');
model.component('comp1').material('mat1').set('lighting', 'cooktorrance');
model.component('comp1').material('mat1').set('fresnel', 0.9);
model.component('comp1').material('mat1').set('roughness', 0.1);
model.component('comp1').material('mat1').set('metallic', 0);
model.component('comp1').material('mat1').set('pearl', 0);
model.component('comp1').material('mat1').set('diffusewrap', 0);
model.component('comp1').material('mat1').set('clearcoat', 0);
model.component('comp1').material('mat1').set('reflectance', 0);
model.component('comp1').material('mat1').set('ambient', 'custom');
model.component('comp1').material('mat1').set('customambient', [0.7843137254901961 0.7843137254901961 0.7843137254901961]);
model.component('comp1').material('mat1').set('diffuse', 'custom');
model.component('comp1').material('mat1').set('customdiffuse', [0.7843137254901961 0.7843137254901961 0.7843137254901961]);
model.component('comp1').material('mat1').set('specular', 'custom');
model.component('comp1').material('mat1').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat1').set('noisecolor', 'custom');
model.component('comp1').material('mat1').set('customnoisecolor', [0 0 0]);
model.component('comp1').material('mat1').set('noisescale', 0);
model.component('comp1').material('mat1').set('noise', 'off');
model.component('comp1').material('mat1').set('noisefreq', 1);
model.component('comp1').material('mat1').set('normalnoisebrush', '0');
model.component('comp1').material('mat1').set('normalnoisetype', '0');
model.component('comp1').material('mat1').set('alpha', 1);