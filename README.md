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

### emission

https://github.com/E3SM-Project/scream/pull/2944
