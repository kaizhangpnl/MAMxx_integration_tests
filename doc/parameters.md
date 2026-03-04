## Parameter changes and bug fixes 

## Needed for MAM4xx 

### In-cloud stratiform wet removal limiter 

```
    sol_facti = haero::min(0.6, scav_fraction_in_cloud_strat);
```

See https://github.com/eagles-project/mam4xx/blob/82d7bb60950c3e1ddc3ab6b3c76a382334189d82/src/mam4xx/aero_model.hpp#L696C55-L697C63


### Number of monolayers for BC/POM aging 

```
n_so4_monolayers_pcage
```

PR in MAM4xx: https://github.com/eagles-project/mam4xx/pull/451 

### Hygroscopicity of POM 

Modified in the phys_property file. A larger POM kappa value will increase the wet removal of particles containing POM. 

- E3SMv2: close to zero (same as in MAM4xx) 
- E3SMv3: 0.06 

### Aqueous chemistry bug 

In E3SM v1 and v2, total condensate (liquid +ice) mass mixing ratio was used for the SO2 aqueous chemistry process, instead of using only liquid water mass mixing ratio. P3 produces more ice mass which leads to a much larger sulfate production from aqueous chemistry compared to MG2. 

https://github.com/E3SM-Project/E3SM/pull/5723 

#### Update 

This has been already fixed during porting. 
 
### DMS emission tuning 

From Susannah

In E3SMv3, DMS emissions are enhanced by a factor of 2. 

### Change to the coupling sequence of dry deposition 

From Susannah

The coupling of aerosol/gas emissions, dry removal, and mixing has been updated in E3SMv3 following Wan et al. (2024). This seems to be done in MAM4xx already. To be confirmed. 

#### Reference: 

Wan, H., Zhang, K., Vogl, C. J., Woodward, C. S., Easter, R. C., Rasch, P. J., Feng, Y., and Wang, H.: Numerical coupling of aerosol emissions, dry removal, and turbulent mixing in the E3SM Atmosphere Model version 1 (EAMv1) – Part 1: Dust budget analyses and the impacts of a revised coupling scheme, Geosci. Model Dev., 17, 1387–1407, https://doi.org/10.5194/gmd-17-1387-2024, 2024. 


## To be impletemented in MAM4xx in the future 

The following bug fixes are impletemented in E3SMv3 and some features are not yet avaialble in EAMxx/MAM4xx. 

### Bug fix for VBS vapor pressure calculation 

From Mingxuan and Hailong 

https://github.com/E3SM-Project/E3SM/pull/6502

### MAM4 part of the bug fix for coupling with ZM microphys and hetfrz ice nucleation  

From Mingxuan and Hailong 

https://github.com/E3SM-Project/E3SM/pull/7352 

## Relevant confluencee pages 

https://e3sm.atlassian.net/wiki/spaces/EAMXX/pages/6002475009/2026-03-04+mam4xx+eval+meeting+notes?atl_p=eyJpIjoiMzViNWJiYjEtZjUxYS1mODlkLTUyMDEtMWE1N2YxNTFhNDc1IiwidCI6InRvcExlZnRWaWV3Q29udGFpbmVyIiwic291cmNlIjoiZW1haWwiLCJlIjoiY2Mtbm90aWZpY2F0aW9uc19iYXRjaF91cGRhdGUifQ

