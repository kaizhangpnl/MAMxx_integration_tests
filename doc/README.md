## MAMxx integration tests and evaluations 

A space to exchange data, scripts, and analysis for MAMxx developent, integration, and evaluation. 

## Table of contents
1. [MAMxx tests and evaluations](#tests)
2. [MAMxx PRs](#pullrequest)
    1. [Aerosol Optics](#aeropt)
    2. [Aerosol Cloud Interaction](#aci)
    3. [Wet Removal](#wetdep)
    4. [Dry Removal](#drydep)
    5. [Emission](#emis)
    6. [Microphysics and Chemistry](#microchem)

## E3SM repo 

https://github.com/E3SM-Project/E3SM/

## original SCREAM repo (frozen)

https://github.com/E3SM-Project/scream

## MAM repo 

https://github.com/eagles-project/mam4xx

## Useful pages from EAGLES 

- https://eagles-project.atlassian.net/wiki/spaces/Computation/pages/1760428034/EAMxx-MAM4xx+Global+simulations+using+CIME+workflow
- https://eagles-project.atlassian.net/wiki/spaces/Computation/pages/1832452098/A+script+for+global+simulation+with+EAMxx-MAM4xx 
- https://eagles-project.atlassian.net/wiki/spaces/Computation/pages/1944387602/Running+Standalone+alone+EAMxx-MAM4xx+tests
- https://eagles-project.atlassian.net/wiki/spaces/Computation/pages/1847787521/TODO+Remaining+tasks+for+MAM4xx+integration
- https://eagles-project.atlassian.net/wiki/spaces/Computation/pages/1859911682/Tracking+simulations+at+various+resolutions+and+machines 

## MAMxx tests and evaluations <a name="tests"></a>

- https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/
- https://github.com/kaizhangpnl/MAMxx_share/tree/main/diag

## MAMxx PRs <a name="pullrequest"></a>

### Aerosol Optics <a name="aeropt"></a>

#### PR 

https://github.com/E3SM-Project/scream/pull/2718

#### Feature description 

The new feature, when turned on in the simulation, will 

- read gas and aerosol tracers from the new initial condition file (with aerosol and gas tracers from a previous E3SMv2? simulation);
- transport the these tracers (homme & shoc);
- calculate the dry and wet sizes/aerosol water
- calculate the aerosol optical properties
- affect the radiative transfer calculation.
  
The aerosol and gas tracers are "prognostic" since their values are affected by transport and they change the aerosol optics that affects the radiation, but they are otherwise passive tracers (no interaction with clouds, no active aerosol microphysics and other source/sink calculations). The original model uses SPA (monthly mean fields) to calculate aerosol optical properties, while the new feature uses aerosol fields initialized from initial condition data and transported by model to calculate the aerosol properties. 

#### Output 

```
      - aero_g_sw
      - aero_ssa_sw
      - aero_tau_sw
      - aero_tau_lw
```

### Aerosol Cloud Interaction  <a name="aci"></a>

#### PR 

https://github.com/E3SM-Project/scream/pull/2794

#### Feature description 

The new feature, when turned on in the simulation, will

- read gas and aerosol tracers from the new initial condition file;
- transport the these tracers (homme & shoc);
- droplet nucleation and ice nucleation:
  - droplet number tendencies due to aerosol activation and vertical diffusion (after tms, shoc, cldFraction, but before p3 cloud microphysics)
  - provisional ice crystal number from the cirrus ice nucleation
  - ice crystal number tendency from the heterogeneous ice nucleation
- apply the droplet number tendencies and the provisional ice crystal number in p3 cloud microphysics
  
The aerosol and gas tracers are "prognostic" since their values are affected by transport and they affect droplet and ice nucleation, but they are otherwise passive tracers (not scavenged by clouds, no affect on radiation, no active aerosol microphysics and other source/sink calculations).

If the feature is turned on, the aerosols will affect droplet and ice nucleation, and subsequent cloud microphysics calculation. The original model uses SPA (monthly mean fields) to provide CCN concentrations, while the new feature uses aerosol fields initialized from initial condition data and transported by model to calculate the aerosol properties and droplet nucleation/vertical diffusion rates. 

The new feature, when turned on, will affect the cloud microphysics calculation through droplet and ice nucleation. Note that the heterogeneous ice nucleation tendencies are not applied in p3 yet.

We evaluated the CCN fields at various supersaturation, droplet nucleation/vertical diffusion tendency, and droplet and ice number. The simulated CCN concentrations and their time evolution look reasonable.

Vertical diffusion of (interstitial) aerosols and cloud droplets are currently also calculated by SHOC (in addition to ndrop). This needs to be addressed to avoid double counting.

#### Output 

```
      - ccn_0p02
      - ccn_0p05
      - ccn_0p1
      - ccn_0p2
      - ccn_0p5
      - ccn_1p0
      - nc_inp_to_aci
      - nsource
      - ndropmix
      - nc_nuceat_tend
      - ni_activated
      - hetfrz_immersion_nucleation_tend
      - hetfrz_contact_nucleation_tend
      - hetfrz_deposition_nucleation_tend
```

### Wet removal  <a name="wetdep"></a>

#### PR 

https://github.com/E3SM-Project/scream/pull/2848 

#### Feature description 

The new feature, when turned on in the simulation together with "aci", will

- read gas and aerosol tracers from the new initial condition file;
- transport the these tracers (homme & shoc);
- if "aci" is activated, cloud-borne aerosol concentrations will be updated. This will subsequently affect both in-cloud and below-cloud scavenging.
- calculate the aerosol dry size
- calculate aerosol water uptake (aerosol water content, wet size, & wet density)
- make wet removal calculation; currently wet removal is only from stratiform clouds.
  
Note that the wetdep feature can be turned on alone without "aci", but in this case there won't be in-cloud scavenging (cloud-borne aerosol concentrations are zero).

The aerosol and gas tracers are "prognostic" since their values are affected by transport. The aerosol tracers affect droplet and ice nucleation (if "aci" is turned on) and they are removed by wet scavenging.

If the feature ("aci"+"wetdep") is turned on, the aerosols will affect droplet and ice nucleation, and subsequent cloud microphysics calculation. On the other hand, compared to the "aci" feature, no new coupling (that affects meteorological fields) is added, except that aerosol concentrations will be changed by wetdep and this will affect "aci" calculation in the next model time step.

The "wetdep" feature alone only changes aerosol concentrations and does not directly affect meteorological fields.

We evaluated the aerosol burden changes and wet deposition flux in the simulation. The simulated BC aerosol burden decreases by 23% and SO4 burden by 31% in 5 days. Note that we only consider wet removal of aerosols in our simulation (no other sinks). Additional diagnostics can be found here: https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP

Additional notes 

- Because EAMxx doesn't have a deep convection parameterization, aerosol wet scavenging is only considered for stratiform clouds/precipitation.
- Also, the precipitation used to calculate wet removal only includes rain, but not frozen precipitation (snow-like). -
- To improve it, P3 code needs to be revised. 

#### Output

```
      - dgncur_a
      - qaerwat
      - wetdens
      - dgnumwet
      - aerdepwetis
      - aerdepwetcw
```

### Dry removal <a name="drydep"></a>

#### PR 

https://github.com/E3SM-Project/scream/pull/2894

#### Feature description

The new feature (when turned on) will 

1. read gas and aerosol tracers from the new initial condition file; 
2. transport the these tracers (homme & shoc); 
3. make dry removal calculation 

The aerosol and gas tracers are "prognostic" since their values are affected by transport. When this feature (drydep) is turned on, the aerosol tracers (both interstitial and cloud-borne) are affected by dry removal. 

No new coupling (that affects meteorological fields) is added, except that aerosol concentrations will be changed by drydep and this will affect "aci" calculation in the next model time step. The "drydep" feature alone only changes aerosol concentrations and does not directly affect meteorological fields. 

The simulated changes in aerosol burden and dry deposition fluxes were assessed (here we only consider dry removal of aerosols). Over a period of five days, the simulated burden of black carbon (BC) aerosols decreased by 21% [(figure)](https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/drydep/figure_mam_drydep_surf_BURDENBC_daily_avg.pdf), while the dust burden declined by 43%  [(figure)](https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/drydep/figure_mam_drydep_surf_BURDENDST_daily_avg.pdf). The higher dry removal rate for dust is consistent with expectations, as the dry deposition flux accounts for sedimentation, a significant sink for larger dust particles. The dry removal rate for sea salt appears to be underestimated, with the burden decreasing by only 18% over the same five-day period [(figure)](https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/drydep/figure_mam_drydep_surf_BURDENSS_daily_avg.pdf). On the other hand, with the idealized configuration and short simulation, it's hard to tell whether this is correct or wrong. 

Additional diagnostics can be found here: https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/drydep/ 

#### Additional notes

1. Available diagnostics output fields: 

```
      - deposition_flux_of_cloud_borne_aerosols
      - deposition_flux_of_interstitial_aerosols
```

   The dry deposition flux includes both turbulent dry deposition at the surface and sedimentation flux. In the future, it would be nice to diagnose the two (turbulent dry deposition and sedimentation) separately. 

2. Process coupling

The process coupling between emission, dry deposition, and turbulent transport needs to be revisited when all of the aerosol processes/parameterizations have been integrated into EAMxx. 

3. Related drydep code (aerosol only) in MAMxx repository : 

- https://github.com/eagles-project/mam4xx/blob/main/src/mam4xx/drydep.hpp
- https://github.com/eagles-project/mam4xx/blob/main/src/mam4xx/spitfire_transport.hpp

4. This PR only handles the dry deposition calculation for aerosols, but not for gases.  

### Emission <a name="emis"></a>

#### PR 

https://github.com/E3SM-Project/scream/pull/2944

### Code 

- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/mam/eamxx_mam_srf_and_online_emissions_process_interface.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/mam/eamxx_mam_srf_and_online_emissions_process_interface.cpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/mam/eamxx_mam_srf_and_online_emissions_functions.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/mam/eamxx_mam_constituent_fluxes_interface.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/mam/eamxx_mam_constituent_fluxes_functions.hpp

`eamxx_mam_srf_and_online_emissions_process_interface` is the overall interface for reading all surface emissions. The code to set up and read those emissions is in `srf_emission` (just the headers), and `srf_emission_impl` (body of the functions).

### Emission data

- https://github.com/eagles-project/scream/blob/767c2a0c08c0b41409ce95ba465c9d56fb32f355/components/eamxx/cime_config/namelist_defaults_scream.xml#L296-L327

The emission are for present-day climatology (time average of 2005-2014) and they are remapped from the E3SM input data. 

### Feature description

The new feature (when turned on) will 

1. read gas and aerosol tracers from the new initial condition file; 
2. transport the these tracers (homme & shoc); 
3. read prescribed surface emission fluxes from input data 
4. update the surface concentrations of interstitial aerosols (mass/number) and trace gases (DMS & SO2) 

The aerosol and gas tracers are "prognostic" since their values are affected by transport. When this feature is turned on, the aerosol tracers (interstitial only) are affected by surface emission. 

No new coupling (that directly affects meteorological fields) is added, except that aerosol concentrations will be changed by surface emission. If this feature is coupled with aci and/or aerosol optics, it will affect the aerosol effect on clouds and radiation. The surface emission feature alone only changes aerosol and trace gas concentrations and does not directly affect meteorological fields. 

The simulated surface emission fluxes and the changes in aerosol burden were assessed. The simulated spatial distributions of the emission fluxes for tracer gases (DMS & SO2) and interstitial aerosols agree with the input emission data. The simulated tracer gas & aerosol burden increases due to emissions (especially patterns) look reasonable. 

The feature is also tested (coupled) with other mamxx features (see link below). No obvious problem is identified. 

Additional diagnostics can be found here: https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/emis/ 

###  Additional notes

1. Available diagnostics output fields: 

```
      - constituent_fluxes(time, ncol, num_phys_constituents)
```

num_phys_constituents = 40 

2. Process coupling

The process coupling between emission, dry deposition, and turbulent transport needs to be revisited when all of the aerosol processes/parameterizations have been integrated into EAMxx. 

3. Emission data handling

With the current implementation, MAMxx will read emission data on the model native grid (ne4pg2 or ne30pg2). For resolutions other than ne4pg2 and ne30pg2, the model will make online remapping with pre-calculated mapping weights. Supported resolutions are 
```
ne120pg2
ne256pg2
ne512pg2
ne1024pg2
```
RRM simulations are not supported yet. 

### Microphysics & Chemistry <a name="microchem"></a>

#### PR 

https://github.com/E3SM-Project/scream/pull/3013

#### Notes  

The new "microphysics" feature contains calculations for 5 processes (see PR description). When it is turned on, the model will

- read gas and aerosol tracers from the new initial condition file;
- transport the these tracers (homme & shoc);
- update gas species concentrations due to gas phase chemistry
- update gas species & cloud-borne aerosol concentrations due to aqueous phase chemistry
- read prescribed elevated emission fluxes from input data
- update aerosol & gas species concentrations due to aerosol microphysics (condensation, renaming, nucleation, coagulation, aging)
- update gas species concentration due to LINOZ O3 chemistry

The aerosol and gas tracers are "prognostic". When this feature is turned on, the aerosol & gas tracers are affected by elevated emissions, gas-phase chemistry, aqueous chemistry, aerosol microphysics, and transport.

Due to the idealized configuration with this feature, there is no benchmark to compare with. On the other hand, the temporal evolution of aerosol & gas burden can be assessed.

No new coupling (that directly affects meteorological fields) is added, except that aerosol & gas concentrations will be changed. If this feature is coupled with aci and/or aerosol optics, it will affect the aerosol effect on clouds and radiation.

This feature alone only changes aerosol and trace gas concentrations and does not directly affect meteorological fields. When coupled with aci and aerosol optics, it will affect the climate. However, the current tests are short idealized simulations and the impact on climate is not evaluated.

The team has performed many sensitivity simulations to evaluate the impact of individual features (see PR description). Due to the idealized configuration of the current model feature, we can only evaluate the feature impact qualitatively. Therefore, I think the current evaluations are sufficient. It would be more meaningful to perform the aerosol mass and number budget analysis when we can run a longer simulation with all the necessary output for process rate diagnostics. These will be implemented in future PRs.

#### Evaluation 

- Impact of elevated emissions. Compared to Fig. 2 (in PR description above), the larger SO2 burden in Fig. 1 shows the impact of the elevated emissions (similar differences between Figs 9 and 10). The associated sulfate aerosol burden differences are also noticeable.
- Impact of gas/aqueous chemistry. In Fig. 2 (without elevated emissions), we see expected SO2 decreases over time due to chemical sink (oxidized to H2SO4). Compared to Fig. 2, Fig. 4 shows expected larger SO2 burden when aqueous chemistry is switched off.
- Impact of aerosol microphysics. In Fig. 2, we see expected increases of accumulation mode sulfate mass and the aging conversion from primary carbon mode to accumulation mode BC and POM. We also see expected very small changes in marine organic and sea salt aerosols.
- The feature is also tested (coupled) with other mamxx features. The spatial distributions of aerosol mass/number and gas concentrations are aslo assessed. No obvious problem is identified.

Additional diagnostics can be found here: https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/micro/

#### Additional notes

In the future, it would be useful to

1. Add diagnostics output fields for aerosol/gas microphysical/chemical process rates, so that we can perform a detailed aerosol mass and number budget analysis. 2D diagnostics are sufficient for the aerosol budget analysis. The corresponding Fortran variables can be found in:
- https://github.com/E3SM-Project/E3SM/blob/master/components/eam/src/chemistry/modal_aero/modal_aero_amicphys.F90 and
- https://github.com/E3SM-Project/E3SM/blob/master/components/eam/src/chemistry/modal_aero/sox_cldaero_mod.F90 by searching “outfld”.

2. Add diagnostics output fields for column-integrated elevated aerosol emission fluxes.
3. Figure out an efficient & convenient way to verify the mass conservation of individual species.

### Vertical mixing control 

https://github.com/E3SM-Project/E3SM/pull/6926

### Gas dry deposition and bug fix for aerosol dry deposition 

https://github.com/E3SM-Project/E3SM/pull/6929

### CNT heterogeneous ice nucleation <a name="cntice"></a>

#### PR 

https://github.com/E3SM-Project/E3SM/pull/6947 

#### Modified code 

- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_ice_classical_nucleation_impl.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/eti/p3_ice_classical_nucleation_impl.cpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/eamxx_p3_process_interface.cpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_update_prognostics_impl.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_main_impl.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_main_impl_part2.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/disp/p3_main_impl_disp.cpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/disp/p3_main_impl_part2_disp.cpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/p3_functions.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_back_to_cell_average_impl.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_back_to_cell_average_impl.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_ice_supersat_conservation_impl.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_conservation_impl.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_nc_conservation_impl.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/src/physics/p3/impl/p3_ni_conservation_impl.hpp
- https://github.com/E3SM-Project/E3SM/blob/master/components/eamxx/cime_config/namelist_defaults_scream.xml



#### Notes  


To switch on the feature, add the following line to runscript: 

```
./atmchange p3::use_hetfrz_classnuc=true -b
```


### Bug in gas drydep <a name="bug_gas_drydep"></a>

Balwinder found a bug: 

https://github.com/E3SM-Project/E3SM/blob/8e9685763275d531bb45317eab6822fcc68100dc/components/eamxx/src/physics/mam/eamxx_mam_microphysics_process_interface.cpp#L988

```
        for(int ispc = offset_aerosol; ispc < mam4::pcnst; ++ispc) {
          constituent_fluxes(icol, ispc) = dflx[ispc - offset_aerosol];
        }
```

should be 

```
        for(int ispc = offset_aerosol; ispc < mam4::pcnst; ++ispc) {
          constituent_fluxes(icol, ispc) = constituent_fluxes(icol, ispc) - dflx[ispc - offset_aerosol];
        }
```

This was likely caused by a confusion about the following two lines in the original Fortran code: 

```
mo_gas_phase_chemdr.F90
         cflx(:ncol,m)      = cflx(:ncol,m) - sflx(:ncol,n)
         drydepflx(:ncol,m) = sflx(:ncol,n)
```

Note that the drydep of gas species is considered on top of cflx. When emission is called before microphysics and gas drydep, it won’t affect the aerosol concentrations in the current time step (since gas drydep is added to cflx after aerosol microphysics), but it will affect them in the next time step (since gas drydep is ignored).

### bugfix in mo_photo.hpp 

- https://github.com/E3SM-Project/E3SM/pull/7126
- https://github.com/eagles-project/mam4xx/compare/07badaf70335eeb0753c4c4e68e3b7e77f6a6ed3...a143adf51c691c0cdd85821d32746c01d7e1d821#diff-a8d7cdcd1d306ce77b9d6c0476ce83ac58f726f339bda6d681550390f113a4c3 

### New compsets 

- https://github.com/E3SM-Project/E3SM/pull/7131 

```
F2010-EAMxx-MAM4xx
F2010-EAMxx-MAM4xx-MPASSI
```

### top_lev 

- https://github.com/E3SM-Project/E3SM/pull/7141
- https://github.com/E3SM-Project/E3SM/blob/f1d3265ac4562eb023e706443a4c7b162fe80694/components/eamxx/cime_config/namelist_defaults_eamxx.xml#L267-L268

```
top_level_mam4xx = 0 for 128-layer model. 
top_level_mam4xx = 6 for 72-layer model. 
```

### Tracer handling in SHOC 

Replacing `TracerAdvection::DynamicsOnly` with `TracerAdvection::DynamicsAndTurbulence` will turn off the diffusional transport of interstitial aerosols in SHOC. 

- https://github.com/E3SM-Project/E3SM/blob/6e0e7d4be88fdd886b346dee4af1fb95acfa9137/components/eamxx/src/physics/mam/eamxx_mam_generic_process_interface.cpp#L153-L161
- https://github.com/E3SM-Project/E3SM/blob/8e0afec014270ffd738eac07a2c7ad14618cfea4/components/eamxx/src/share/atm_process/atmosphere_process.hpp#L354-L363
- https://github.com/E3SM-Project/E3SM/blob/8e0afec014270ffd738eac07a2c7ad14618cfea4/components/eamxx/src/share/field/field_request.hpp#L18-L21

### PR to avoid mixing nc in SHOC 

- https://github.com/E3SM-Project/E3SM/pull/7155 

### PR for memory buffer 

- https://github.com/E3SM-Project/E3SM/pull/7139

### PR for calsize enhancement 

- https://github.com/E3SM-Project/E3SM/pull/7161

### PR for adding aqchem tendencies 

- https://github.com/E3SM-Project/E3SM/pull/7394 
- https://github.com/eagles-project/mam4xx/pull/446

### PR for adding gaschem tendencies 

- https://github.com/E3SM-Project/E3SM/pull/7459
- https://github.com/eagles-project/mam4xx/pull/457 

### PR for adding microphysics tendencies 

- https://github.com/E3SM-Project/E3SM/pull/7452
- https://github.com/eagles-project/mam4xx/pull/455

### PR for updating lower/upper bounds 

- https://github.com/E3SM-Project/E3SM/pull/7402
  
