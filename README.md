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

## MAMxx tests and evaluations <a name="tests"></a>

- https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/
- https://github.com/kaizhangpnl/MAMxx_share/tree/main/diag
  
## MAMxx PRs <a name="pullrequest"></a>

### Aerosol Optics <a name="aeropt"></a>

https://github.com/E3SM-Project/scream/pull/2718

The new feature, when turned on in the simulation, will 

- read gas and aerosol tracers from the new initial condition file (with aerosol and gas tracers from a previous E3SMv2? simulation);
- transport the these tracers (homme & shoc);
- calculate the dry and wet sizes/aerosol water
- calculate the aerosol optical properties
- affect the radiative transfer calculation.
  
The aerosol and gas tracers are "prognostic" since their values are affected by transport and they change the aerosol optics that affects the radiation, but they are otherwise passive tracers (no interaction with clouds, no active aerosol microphysics and other source/sink calculations). The original model uses SPA (monthly mean fields) to calculate aerosol optical properties, while the new feature uses aerosol fields initialized from initial condition data and transported by model to calculate the aerosol properties. 

### Aerosol Cloud Interaction  <a name="aci"></a>

https://github.com/E3SM-Project/scream/pull/2794

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

### Wet removal  <a name="wetdep"></a>

https://github.com/E3SM-Project/scream/pull/2848 

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


### Dry removal <a name="drydep"></a>

https://github.com/E3SM-Project/scream/pull/2894

> Feature description

The new feature (when turned on) will 

1. read gas and aerosol tracers from the new initial condition file; 
2. transport the these tracers (homme & shoc); 
3. make dry removal calculation 

The aerosol and gas tracers are "prognostic" since their values are affected by transport. When this feature (drydep) is turned on, the aerosol tracers (both interstitial and cloud-borne) are affected by dry removal. 

No new coupling (that affects meteorological fields) is added, except that aerosol concentrations will be changed by drydep and this will affect "aci" calculation in the next model time step. The "drydep" feature alone only changes aerosol concentrations and does not directly affect meteorological fields. 

The simulated changes in aerosol burden and dry deposition fluxes were assessed (here we only consider dry removal of aerosols). Over a period of five days, the simulated burden of black carbon (BC) aerosols decreased by 21% [(figure)](https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/drydep/figure_mam_drydep_surf_BURDENBC_daily_avg.pdf), while the dust burden declined by 43%  [(figure)](https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/drydep/figure_mam_drydep_surf_BURDENDST_daily_avg.pdf). The higher dry removal rate for dust is consistent with expectations, as the dry deposition flux accounts for sedimentation, a significant sink for larger dust particles. The dry removal rate for sea salt appears to be underestimated, with the burden decreasing by only 18% over the same five-day period [(figure)](https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/drydep/figure_mam_drydep_surf_BURDENSS_daily_avg.pdf). On the other hand, with the idealized configuration and short simulation, it's hard to tell whether this is correct or wrong. 

Additional diagnostics can be found here: https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/drydep/ 

> Additional notes

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

https://github.com/E3SM-Project/scream/pull/2944

> Feature description

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

> Additional notes

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

