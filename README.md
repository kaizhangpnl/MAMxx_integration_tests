## MAMxx integration tests and evaluations 

A space to exchange data, scripts, and analysis for MAMxx developent, integration, and evaluation. 

## MAMxx tests and evaluations 

- https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/
- https://github.com/kaizhangpnl/MAMxx_share/tree/main/diag
  
## MAMxx PRs 

### aerosol optics

https://github.com/E3SM-Project/scream/pull/2718

The new feature, when turned on in the simulation, will 

- read gas and aerosol tracers from the new initial condition file (with aerosol and gas tracers from a previous E3SMv2? simulation);
- transport the these tracers (homme & shoc);
- calculate the dry and wet sizes/aerosol water
- calculate the aerosol optical properties
- affect the radiative transfer calculation.
  
The aerosol and gas tracers are "prognostic" since their values are affected by transport and they change the aerosol optics that affects the radiation, but they are otherwise passive tracers (no interaction with clouds, no active aerosol microphysics and other source/sink calculations). The original model uses SPA (monthly mean fields) to calculate aerosol optical properties, while the new feature uses aerosol fields initialized from initial condition data and transported by model to calculate the aerosol properties. 

### aci 

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

### wetdep 

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


### drydep

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

### emission

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



