## Vertical coordinate information in EAMxx output 

## Standard information from EAM 

"lev" information is needed for e3sm_diags. 

```

	double hyai(ilev) ;
		hyai:long_name = "hybrid A coefficient at layer interfaces" ;
	double hyam(lev) ;
		hyam:long_name = "hybrid A coefficient at layer midpoints" ;
	double hybi(ilev) ;
		hybi:long_name = "hybrid B coefficient at layer interfaces" ;
	double hybm(lev) ;
		hybm:long_name = "hybrid B coefficient at layer midpoints" ;
	double ilev(ilev) ;
		ilev:long_name = "hybrid level at interfaces (1000*(A+B))" ;
		ilev:units = "hPa" ;
		ilev:positive = "down" ;
		ilev:standard_name = "atmosphere_hybrid_sigma_pressure_coordinate" ;
		ilev:formula_terms = "a: hyai b: hybi p0: P0 ps: PS" ;
	double lev(lev) ;
		lev:long_name = "hybrid level at midpoints (1000*(A+B))" ;
		lev:units = "hPa" ;
		lev:positive = "down" ;
		lev:standard_name = "atmosphere_hybrid_sigma_pressure_coordinate" ;
		lev:formula_terms = "a: hyam b: hybm p0: P0 ps: PS" ;

```

## EAMxx history output ("lev" is a coordinate variable but not a field variable.) 

```
netcdf scream_mamxx_ne4pg2_t05.scream.h0.AVERAGE.nmonths_x1.0001-01-01-00000 {
dimensions:
	time = UNLIMITED ; // (1 currently)
	dim2 = 2 ;
	lev = 72 ;
	ncol_d = 866 ;
	ilev = 73 ;
	lwband = 16 ;
	ncol = 384 ;
	swband = 14 ;
variables:
	double time(time) ;
		time:units = "days since 0001-01-01 00:00:00" ;
		time:long_name = "time" ;
		time:calendar = "noleap" ;
		time:bounds = "time_bnds" ;
	double time_bnds(time, dim2) ;
		time_bnds:units = "days since 0001-01-01 00:00:00" ;
		time_bnds:long_name = "time_bnds" ;
		time_bnds:note = "right endpoint accumulation" ;
	float horiz_winds(time, ncol, dim2, lev) ;
		horiz_winds:units = "m s^-1" ;
		horiz_winds:long_name = "horiz_winds" ;
		horiz_winds:_FillValue = 3.402824e+33f ;
		horiz_winds:sub_fields = "[ U, V ]" ;
	float landfrac(time, ncol) ;
		landfrac:units = "1" ;
		landfrac:long_name = "landfrac" ;
		landfrac:_FillValue = 3.402824e+33f ;
	float ocnfrac(time, ncol) ;
		ocnfrac:units = "1" ;
		ocnfrac:long_name = "ocnfrac" ;
		ocnfrac:_FillValue = 3.402824e+33f ;
	float omega(time, ncol, lev) ;
		omega:units = "m^-1 s^-3 kg" ;
		omega:long_name = "omega" ;
		omega:_FillValue = 3.402824e+33f ;
	float p_int(time, ncol, ilev) ;
		p_int:units = "Pa" ;
		p_int:long_name = "p_int" ;
		p_int:_FillValue = 3.402824e+33f ;
	float p_mid(time, ncol, lev) ;
		p_mid:units = "Pa" ;
		p_mid:long_name = "p_mid" ;
		p_mid:_FillValue = 3.402824e+33f ;
	float ps(time, ncol) ;
		ps:units = "Pa" ;
		ps:long_name = "ps" ;
		ps:_FillValue = 3.402824e+33f ;
... ... 
	float area_GLL(ncol_d) ;
		area_GLL:units = "1^2" ;
		area_GLL:long_name = "area_GLL" ;
		area_GLL:_FillValue = 3.402824e+33f ;
	float hyai_GLL(ilev) ;
		hyai_GLL:units = "1" ;
		hyai_GLL:long_name = "hyai_GLL" ;
		hyai_GLL:_FillValue = 3.402824e+33f ;
	float hyam_GLL(lev) ;
		hyam_GLL:units = "1" ;
		hyam_GLL:long_name = "hyam_GLL" ;
		hyam_GLL:_FillValue = 3.402824e+33f ;
	float hybi_GLL(ilev) ;
		hybi_GLL:units = "1" ;
		hybi_GLL:long_name = "hybi_GLL" ;
		hybi_GLL:_FillValue = 3.402824e+33f ;
	float hybm_GLL(lev) ;
		hybm_GLL:units = "1" ;
		hybm_GLL:long_name = "hybm_GLL" ;
		hybm_GLL:_FillValue = 3.402824e+33f ;
	float lat_GLL(ncol_d) ;
		lat_GLL:units = "1" ;
		lat_GLL:long_name = "lat_GLL" ;
		lat_GLL:_FillValue = 3.402824e+33f ;
	float lon_GLL(ncol_d) ;
		lon_GLL:units = "1" ;
		lon_GLL:long_name = "lon_GLL" ;
		lon_GLL:_FillValue = 3.402824e+33f ;
	float area_PG2(ncol) ;
		area_PG2:units = "1^2" ;
		area_PG2:long_name = "area_PG2" ;
		area_PG2:_FillValue = 3.402824e+33f ;
	float hyai_PG2(ilev) ;
		hyai_PG2:units = "1" ;
		hyai_PG2:long_name = "hyai_PG2" ;
		hyai_PG2:_FillValue = 3.402824e+33f ;
	float hyam_PG2(lev) ;
		hyam_PG2:units = "1" ;
		hyam_PG2:long_name = "hyam_PG2" ;
		hyam_PG2:_FillValue = 3.402824e+33f ;
	float hybi_PG2(ilev) ;
		hybi_PG2:units = "1" ;
		hybi_PG2:long_name = "hybi_PG2" ;
		hybi_PG2:_FillValue = 3.402824e+33f ;
	float hybm_PG2(lev) ;
		hybm_PG2:units = "1" ;
		hybm_PG2:long_name = "hybm_PG2" ;
		hybm_PG2:_FillValue = 3.402824e+33f ;
	float lat_PG2(ncol) ;
		lat_PG2:units = "1" ;
		lat_PG2:long_name = "lat_PG2" ;
		lat_PG2:_FillValue = 3.402824e+33f ;
	float lon_PG2(ncol) ;
		lon_PG2:units = "1" ;
		lon_PG2:long_name = "lon_PG2" ;
		lon_PG2:_FillValue = 3.402824e+33f ;
...

data:

 time = 31 ;
}

``` 

## Initial condition file 

```
(base) [ac.kai.zhang@chrlogin2 run]$ ncdump -c /lcrc/group/e3sm/data/inputdata/atm/scream/init/screami_mam4xx_ne4np4L72_c20240208.nc
netcdf screami_mam4xx_ne4np4L72_c20240208 {
dimensions:
	time = 1 ;
	ncol = 866 ;
	lev = 72 ;
	dim2 = 2 ;
	ilev = 73 ;
	nbnd = 2 ;
variables:
	double P0 ;
		P0:_FillValue = NaN ;
		P0:long_name = "reference pressure" ;
		P0:units = "Pa" ;
	double hyai(ilev) ;
		hyai:_FillValue = NaN ;
		hyai:long_name = "hybrid A coefficient at layer interfaces" ;
	double hyam(lev) ;
		hyam:_FillValue = NaN ;
		hyam:long_name = "hybrid A coefficient at layer midpoints" ;
	double hybi(ilev) ;
		hybi:_FillValue = NaN ;
		hybi:long_name = "hybrid B coefficient at layer interfaces" ;
	double hybm(lev) ;
		hybm:_FillValue = NaN ;
		hybm:long_name = "hybrid B coefficient at layer midpoints" ;
	double ilev(ilev) ;
		ilev:_FillValue = NaN ;
		ilev:long_name = "hybrid level at interfaces (1000*(A+B))" ;
		ilev:units = "hPa" ;
		ilev:positive = "down" ;
		ilev:standard_name = "atmosphere_hybrid_sigma_pressure_coordinate" ;
		ilev:formula_terms = "a: hyai b: hybi p0: P0 ps: PS" ;
	double lat(ncol) ;
		lat:_FillValue = NaN ;
		lat:long_name = "latitude" ;
		lat:units = "degrees_north" ;
	double lev(lev) ;
		lev:_FillValue = NaN ;
		lev:long_name = "hybrid level at midpoints (1000*(A+B))" ;
		lev:units = "hPa" ;
		lev:positive = "down" ;
		lev:standard_name = "atmosphere_hybrid_sigma_pressure_coordinate" ;
	double lon(ncol) ;
		lon:_FillValue = NaN ;
		lon:long_name = "longitude" ;
		lon:units = "degrees_east" ;
	double time(time) ;
		time:_FillValue = NaN ;
		time:long_name = "time" ;
		time:units = "days since 0001-01-01 00:00:00" ;
		time:calendar = "noleap" ;
		time:bounds = "time_bnds" ;
	double time_bnds(time, nbnd) ;
		time_bnds:_FillValue = NaN ;
		time_bnds:long_name = "time interval endpoints" ;

// global attributes:
		:history = "Tue Aug 23 12:07:06 2022: ncks -5 /global/cfs/cdirs/e3sm/bhillma/scream/data/init/screami_ne4np4L72_20220823.nc /global/cfs/cdirs/e3sm/bhillma/scream/data/init/screami_ne4np4L72_20220823.nc.cdf5" ;
		:NCO = "netCDF Operators version 5.0.1 (Homepage = http://nco.sf.net, Code = http://github.com/nco/nco)" ;
data:

 ilev = 0.100000003197544, 0.147650822913689, 0.218007648100008, 
    0.321890076141867, 0.475273331103897, 0.701744962025609, 
    1.03613217805539, 1.52985763845446, 2.25884732035832, 3.3352065502282, 
    4.92445975982147, 7.01243897441468, 9.74236978346886, 13.2052046776003, 
    17.4626717668335, 22.5300041895007, 28.3593888304225, 34.827113752148, 
    41.905452436706, 49.4369434421476, 57.1821794266375, 64.8481839141014, 
    72.1045965453237, 78.6060752491983, 85.2864750002711, 92.5346112988506, 
    100.398735591023, 108.931198982486, 118.188803860441, 128.233178994491, 
    139.131180869721, 150.95535019568, 163.784405484479, 177.703753558685, 
    192.806050899617, 209.191828842591, 226.970165223411, 246.25940795157, 
    267.187963858948, 289.895152760722, 314.532127483044, 341.262884695297, 
    370.265374181464, 401.732673658358, 435.874252100169, 472.917375878188, 
    512.019772166866, 551.259290548059, 589.990515658606, 627.297033184562, 
    663.342902738581, 697.653186137899, 729.756090502968, 759.193568143422, 
    785.532107743287, 808.373391694185, 827.364255260287, 842.826086512935, 
    856.496411708255, 869.856439590426, 882.884857077784, 895.560615114759, 
    907.863051465681, 919.771957375133, 931.267538919537, 942.330450725871, 
    952.941866982882, 963.083665759796, 972.738495041755, 981.889632697215, 
    990.52103362492, 996.992878983524, 1000 ;

 lev = 0.123825413055617, 0.182829235506849, 0.269948862120937, 
    0.398581703622882, 0.588509146564753, 0.8689385700405, 1.28299490825493, 
    1.89435247940639, 2.79702693529326, 4.12983315502484, 5.96844936711808, 
    8.37740437894177, 11.4737872305346, 15.3339382222169, 19.9963379781671, 
    25.4446965099616, 31.5932512912852, 38.366283094427, 45.6711979394268, 
    53.3095614343925, 61.0151816703695, 68.4763902297125, 75.355335897261, 
    81.9462751247347, 88.9105431495609, 96.466673444937, 104.664967286755, 
    113.560001421463, 123.210991427466, 133.682179932106, 145.0432655327, 
    157.369877840079, 170.744079521582, 185.254902229151, 200.998939871104, 
    218.080997033001, 236.61478658749, 256.723685905259, 278.541558309835, 
    302.213640121883, 327.89750608917, 355.76412943838, 385.999023919911, 
    418.803462879263, 454.395813989178, 492.468574022527, 531.639531357463, 
    570.624903103333, 608.643774421584, 645.319967961572, 680.49804443824, 
    713.704638320434, 744.474829323195, 772.362837943354, 796.952749718736, 
    817.868823477236, 835.095170886611, 849.661249110595, 863.17642564934, 
    876.370648334105, 889.222736096271, 901.71183329022, 913.817504420407, 
    925.519748147335, 936.798994822704, 947.636158854377, 958.012766371339, 
    967.911080400775, 977.314063869485, 986.205333161068, 993.756956304222, 
    998.496439491762 ;

 time = 365 ;
```




## Vertical coordinate file 

```
(base) [ac.kai.zhang@chrlogin2 run]$ ncdump -c  /lcrc/group/e3sm/data/inputdata/atm/scream/init/vertical_coordinates_L72_20220927.nc 
netcdf vertical_coordinates_L72_20220927 {
dimensions:
	ilev = 73 ;
	lev = 72 ;
variables:
	double P0 ;
		P0:_FillValue = NaN ;
		P0:long_name = "reference pressure" ;
		P0:units = "Pa" ;
	double hyai(ilev) ;
		hyai:_FillValue = NaN ;
		hyai:long_name = "hybrid A coefficient at layer interfaces" ;
	double hyam(lev) ;
		hyam:_FillValue = NaN ;
		hyam:long_name = "hybrid A coefficient at layer midpoints" ;
	double hybi(ilev) ;
		hybi:_FillValue = NaN ;
		hybi:long_name = "hybrid B coefficient at layer interfaces" ;
	double hybm(lev) ;
		hybm:_FillValue = NaN ;
		hybm:long_name = "hybrid B coefficient at layer midpoints" ;
	double ilev(ilev) ;
		ilev:_FillValue = NaN ;
		ilev:long_name = "hybrid level at interfaces (1000*(A+B))" ;
		ilev:units = "hPa" ;
		ilev:positive = "down" ;
		ilev:standard_name = "atmosphere_hybrid_sigma_pressure_coordinate" ;
		ilev:formula_terms = "a: hyai b: hybi p0: P0 ps: PS" ;
	double lev(lev) ;
		lev:_FillValue = NaN ;

// global attributes:
		:history = "Tue Sep 27 19:46:30 2022: ncks -v P0,hyam,hybm,hyai,hybi,lev,ilev screami_ne30np4L72_20220823.nc vertical_coordinates_L72_20220927.nc\n",
			"Tue Aug 23 14:22:09 2022: ncks -5 /global/cfs/cdirs/e3sm/bhillma/scream/data/init/screami_ne30np4L72_20220823.nc /global/cfs/cdirs/e3sm/bhillma/scream/data/init/screami_ne30np4L72_20220823.nc.cdf5" ;
		:NCO = "netCDF Operators version 5.0.1 (Homepage = http://nco.sf.net, Code = http://github.com/nco/nco)" ;
data:

 ilev = 0.100000003197544, 0.147650822913689, 0.218007648100008, 
    0.321890076141867, 0.475273331103897, 0.701744962025609, 
    1.03613217805539, 1.52985763845446, 2.25884732035832, 3.3352065502282, 
    4.92445975982147, 7.01243897441468, 9.74236978346886, 13.2052046776003, 
    17.4626717668335, 22.5300041895007, 28.3593888304225, 34.827113752148, 
    41.905452436706, 49.4369434421476, 57.1821794266375, 64.8481839141014, 
    72.1045965453237, 78.6060752491983, 85.2864750002711, 92.5346112988506, 
    100.398735591023, 108.931198982486, 118.188803860441, 128.233178994491, 
    139.131180869721, 150.95535019568, 163.784405484479, 177.703753558685, 
    192.806050899617, 209.191828842591, 226.970165223411, 246.25940795157, 
    267.187963858948, 289.895152760722, 314.532127483044, 341.262884695297, 
    370.265374181464, 401.732673658358, 435.874252100169, 472.917375878188, 
    512.019772166866, 551.259290548059, 589.990515658606, 627.297033184562, 
    663.342902738581, 697.653186137899, 729.756090502968, 759.193568143422, 
    785.532107743287, 808.373391694185, 827.364255260287, 842.826086512935, 
    856.496411708255, 869.856439590426, 882.884857077784, 895.560615114759, 
    907.863051465681, 919.771957375133, 931.267538919537, 942.330450725871, 
    952.941866982882, 963.083665759796, 972.738495041755, 981.889632697215, 
    990.52103362492, 996.992878983524, 1000 ;

 lev = 0.123825413055617, 0.182829235506849, 0.269948862120937, 
    0.398581703622882, 0.588509146564753, 0.8689385700405, 1.28299490825493, 
    1.89435247940639, 2.79702693529326, 4.12983315502484, 5.96844936711808, 
    8.37740437894177, 11.4737872305346, 15.3339382222169, 19.9963379781671, 
    25.4446965099616, 31.5932512912852, 38.366283094427, 45.6711979394268, 
    53.3095614343925, 61.0151816703695, 68.4763902297125, 75.355335897261, 
    81.9462751247347, 88.9105431495609, 96.466673444937, 104.664967286755, 
    113.560001421463, 123.210991427466, 133.682179932106, 145.0432655327, 
    157.369877840079, 170.744079521582, 185.254902229151, 200.998939871104, 
    218.080997033001, 236.61478658749, 256.723685905259, 278.541558309835, 
    302.213640121883, 327.89750608917, 355.76412943838, 385.999023919911, 
    418.803462879263, 454.395813989178, 492.468574022527, 531.639531357463, 
    570.624903103333, 608.643774421584, 645.319967961572, 680.49804443824, 
    713.704638320434, 744.474829323195, 772.362837943354, 796.952749718736, 
    817.868823477236, 835.095170886611, 849.661249110595, 863.17642564934, 
    876.370648334105, 889.222736096271, 901.71183329022, 913.817504420407, 
    925.519748147335, 936.798994822704, 947.636158854377, 958.012766371339, 
    967.911080400775, 977.314063869485, 986.205333161068, 993.756956304222, 
    998.496439491762 ;
}
```

