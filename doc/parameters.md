## Parameter changes and bug fixes 

### Number of monolayers for BC/POM aging 

```
n_so4_monolayers_pcage
```

PR in MAM4xx: https://github.com/eagles-project/mam4xx/pull/451 

### Aqeous chemistry bug 



### In-cloud stratiform wet removal limiter 

```
    sol_facti = haero::min(0.6, scav_fraction_in_cloud_strat);
```

See https://github.com/eagles-project/mam4xx/blob/82d7bb60950c3e1ddc3ab6b3c76a382334189d82/src/mam4xx/aero_model.hpp#L696C55-L697C63


### Hygroscopicity of POM 

Modified in the phys_property file. 








