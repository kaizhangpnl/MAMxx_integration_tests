## MAMxx integration tests and evaluations 

A space to exchange data, scripts, and analysis for MAMxx developent, integration, and evaluation. 

## MAMxx tests and evaluations 

- https://web.lcrc.anl.gov/public/e3sm/diagnostic_output/ac.kzhang/TMP/
- https://github.com/kaizhangpnl/MAMxx_share/tree/main/diag
  
## MAMxx PRs 

### aerosol optics

- https://github.com/E3SM-Project/scream/pull/2718

The new feature, when turned on in the simulation, will 

- read gas and aerosol tracers from the new initial condition file (with aerosol and gas tracers from a previous E3SMv2? simulation);
- transport the these tracers (homme & shoc);
- calculate the dry and wet sizes/aerosol water
- calculate the aerosol optical properties
- affect the radiative transfer calculation.
  
The aerosol and gas tracers are "prognostic" since their values are affected by transport and they change the aerosol optics that affects the radiation, but they are otherwise passive tracers (no interaction with clouds, no active aerosol microphysics and other source/sink calculations). The original model uses SPA (monthly mean fields) to calculate aerosol optical properties, while the new feature uses aerosol fields initialized from initial condition data and transported by model to calculate the aerosol properties. 

### aci 

- https://github.com/E3SM-Project/scream/pull/2794



### wetdep 

- https://github.com/E3SM-Project/scream/pull/2848 

### drydep

- https://github.com/E3SM-Project/scream/pull/2894

### emission

- https://github.com/E3SM-Project/scream/pull/2944
