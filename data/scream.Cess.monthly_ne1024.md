
## Data from Chris Terai 

```
(mylib) kaizhang@perlmutter:login03:/global/cfs/cdirs/e3sm/zhang40/e3sm_diags_for_EAMxx/data/Cess> cat ~/jj
netcdf output.scream.Cess.monthly_ne1024.AVERAGE.nmonths_x1.2019-09-01-00000 {
dimensions:
	lat = 721 ;
	lon = 1440 ;
	nbnd = 2 ;
	time = UNLIMITED ; // (1 currently)
	lev = 128 ;
	ilev = 129 ;
	dim2 = 2 ;
variables:
	double lat(lat) ;
		lat:long_name = "Latitude of Grid Cell Centers" ;
		lat:standard_name = "latitude" ;
		lat:units = "degrees_north" ;
		lat:axis = "Y" ;
		lat:valid_min = -90. ;
		lat:valid_max = 90. ;
		lat:bounds = "lat_bnds" ;
	double lon(lon) ;
		lon:long_name = "Longitude of Grid Cell Centers" ;
		lon:standard_name = "longitude" ;
		lon:units = "degrees_east" ;
		lon:axis = "X" ;
		lon:valid_min = 0. ;
		lon:valid_max = 360. ;
		lon:bounds = "lon_bnds" ;
	double lat_bnds(lat, nbnd) ;
		lat_bnds:long_name = "Gridcell latitude interfaces" ;
	double lon_bnds(lon, nbnd) ;
		lon_bnds:long_name = "Gridcell longitude interfaces" ;
	double gw(lat) ;
		gw:long_name = "Latitude quadrature weights (normalized to sum to 2.0 on global grids)" ;
	double area(lat, lon) ;
		area:long_name = "Solid angle subtended by gridcell" ;
		area:standard_name = "solid_angle" ;
		area:units = "steradian" ;
		area:cell_mathods = "lat, lon: sum" ;
	float IceWaterPath(time, lat, lon) ;
		IceWaterPath:units = "m^-2 kg" ;
		IceWaterPath:long_name = "IceWaterPath" ;
		IceWaterPath:cell_measures = "area: area" ;
	float LW_clrsky_flux_dn_at_model_bot(time, lat, lon) ;
		LW_clrsky_flux_dn_at_model_bot:units = "s^-3 kg" ;
		LW_clrsky_flux_dn_at_model_bot:long_name = "LW_clrsky_flux_dn_at_model_bot" ;
		LW_clrsky_flux_dn_at_model_bot:cell_measures = "area: area" ;
	float LW_clrsky_flux_up_at_model_top(time, lat, lon) ;
		LW_clrsky_flux_up_at_model_top:units = "s^-3 kg" ;
		LW_clrsky_flux_up_at_model_top:long_name = "LW_clrsky_flux_up_at_model_top" ;
		LW_clrsky_flux_up_at_model_top:cell_measures = "area: area" ;
	float LW_flux_dn_at_model_bot(time, lat, lon) ;
		LW_flux_dn_at_model_bot:units = "s^-3 kg" ;
		LW_flux_dn_at_model_bot:long_name = "LW_flux_dn_at_model_bot" ;
		LW_flux_dn_at_model_bot:cell_measures = "area: area" ;
	float LW_flux_up_at_model_bot(time, lat, lon) ;
		LW_flux_up_at_model_bot:units = "s^-3 kg" ;
		LW_flux_up_at_model_bot:long_name = "LW_flux_up_at_model_bot" ;
		LW_flux_up_at_model_bot:cell_measures = "area: area" ;
	float LW_flux_up_at_model_top(time, lat, lon) ;
		LW_flux_up_at_model_top:units = "s^-3 kg" ;
		LW_flux_up_at_model_top:long_name = "LW_flux_up_at_model_top" ;
		LW_flux_up_at_model_top:cell_measures = "area: area" ;
	float LiqWaterPath(time, lat, lon) ;
		LiqWaterPath:units = "m^-2 kg" ;
		LiqWaterPath:long_name = "LiqWaterPath" ;
		LiqWaterPath:cell_measures = "area: area" ;
	float LongwaveCloudForcing(time, lat, lon) ;
		LongwaveCloudForcing:units = "s^-3 kg" ;
		LongwaveCloudForcing:long_name = "LongwaveCloudForcing" ;
		LongwaveCloudForcing:cell_measures = "area: area" ;
	float MeridionalVapFlux(time, lat, lon) ;
		MeridionalVapFlux:units = "m^-1 s^-1 kg" ;
		MeridionalVapFlux:long_name = "MeridionalVapFlux" ;
		MeridionalVapFlux:cell_measures = "area: area" ;
	float PotentialTemperature_at_1000hPa(time, lat, lon) ;
		PotentialTemperature_at_1000hPa:units = "K" ;
		PotentialTemperature_at_1000hPa:long_name = "PotentialTemperature_at_1000hPa" ;
		PotentialTemperature_at_1000hPa:cell_measures = "area: area" ;
	float PotentialTemperature_at_700hPa(time, lat, lon) ;
		PotentialTemperature_at_700hPa:units = "K" ;
		PotentialTemperature_at_700hPa:long_name = "PotentialTemperature_at_700hPa" ;
		PotentialTemperature_at_700hPa:cell_measures = "area: area" ;
	float PrecipIceSurfMassFlux(time, lat, lon) ;
		PrecipIceSurfMassFlux:units = "m s^-1" ;
		PrecipIceSurfMassFlux:long_name = "PrecipIceSurfMassFlux" ;
		PrecipIceSurfMassFlux:cell_measures = "area: area" ;
	float PrecipLiqSurfMassFlux(time, lat, lon) ;
		PrecipLiqSurfMassFlux:units = "m s^-1" ;
		PrecipLiqSurfMassFlux:long_name = "PrecipLiqSurfMassFlux" ;
		PrecipLiqSurfMassFlux:cell_measures = "area: area" ;
	float RainWaterPath(time, lat, lon) ;
		RainWaterPath:units = "m^-2 kg" ;
		RainWaterPath:long_name = "RainWaterPath" ;
		RainWaterPath:cell_measures = "area: area" ;
	float RelativeHumidity(time, lev, lat, lon) ;
		RelativeHumidity:units = "K" ;
		RelativeHumidity:long_name = "RelativeHumidity" ;
		RelativeHumidity:cell_measures = "area: area" ;
	float SW_clrsky_flux_dn_at_model_bot(time, lat, lon) ;
		SW_clrsky_flux_dn_at_model_bot:units = "s^-3 kg" ;
		SW_clrsky_flux_dn_at_model_bot:long_name = "SW_clrsky_flux_dn_at_model_bot" ;
		SW_clrsky_flux_dn_at_model_bot:cell_measures = "area: area" ;
	float SW_clrsky_flux_up_at_model_bot(time, lat, lon) ;
		SW_clrsky_flux_up_at_model_bot:units = "s^-3 kg" ;
		SW_clrsky_flux_up_at_model_bot:long_name = "SW_clrsky_flux_up_at_model_bot" ;
		SW_clrsky_flux_up_at_model_bot:cell_measures = "area: area" ;
	float SW_clrsky_flux_up_at_model_top(time, lat, lon) ;
		SW_clrsky_flux_up_at_model_top:units = "s^-3 kg" ;
		SW_clrsky_flux_up_at_model_top:long_name = "SW_clrsky_flux_up_at_model_top" ;
		SW_clrsky_flux_up_at_model_top:cell_measures = "area: area" ;
	float SW_flux_dn_at_model_bot(time, lat, lon) ;
		SW_flux_dn_at_model_bot:units = "s^-3 kg" ;
		SW_flux_dn_at_model_bot:long_name = "SW_flux_dn_at_model_bot" ;
		SW_flux_dn_at_model_bot:cell_measures = "area: area" ;
	float SW_flux_dn_at_model_top(time, lat, lon) ;
		SW_flux_dn_at_model_top:units = "s^-3 kg" ;
		SW_flux_dn_at_model_top:long_name = "SW_flux_dn_at_model_top" ;
		SW_flux_dn_at_model_top:cell_measures = "area: area" ;
	float SW_flux_up_at_model_bot(time, lat, lon) ;
		SW_flux_up_at_model_bot:units = "s^-3 kg" ;
		SW_flux_up_at_model_bot:long_name = "SW_flux_up_at_model_bot" ;
		SW_flux_up_at_model_bot:cell_measures = "area: area" ;
	float SW_flux_up_at_model_top(time, lat, lon) ;
		SW_flux_up_at_model_top:units = "s^-3 kg" ;
		SW_flux_up_at_model_top:long_name = "SW_flux_up_at_model_top" ;
		SW_flux_up_at_model_top:cell_measures = "area: area" ;
	float ShortwaveCloudForcing(time, lat, lon) ;
		ShortwaveCloudForcing:units = "s^-3 kg" ;
		ShortwaveCloudForcing:long_name = "ShortwaveCloudForcing" ;
		ShortwaveCloudForcing:cell_measures = "area: area" ;
	float T_2m(time, lat, lon) ;
		T_2m:units = "K" ;
		T_2m:long_name = "T_2m" ;
		T_2m:cell_measures = "area: area" ;
	float T_mid(time, lev, lat, lon) ;
		T_mid:units = "K" ;
		T_mid:long_name = "T_mid" ;
		T_mid:cell_measures = "area: area" ;
	float U(time, lev, lat, lon) ;
		U:units = "m s^-1" ;
		U:long_name = "U" ;
		U:cell_measures = "area: area" ;
	float V(time, lev, lat, lon) ;
		V:units = "m s^-1" ;
		V:long_name = "V" ;
		V:cell_measures = "area: area" ;
	float VapWaterPath(time, lat, lon) ;
		VapWaterPath:units = "m^-2 kg" ;
		VapWaterPath:long_name = "VapWaterPath" ;
		VapWaterPath:cell_measures = "area: area" ;
	float ZonalVapFlux(time, lat, lon) ;
		ZonalVapFlux:units = "m^-1 s^-1 kg" ;
		ZonalVapFlux:long_name = "ZonalVapFlux" ;
		ZonalVapFlux:cell_measures = "area: area" ;
	float cldfrac_ice_for_analysis(time, lev, lat, lon) ;
		cldfrac_ice_for_analysis:units = "1" ;
		cldfrac_ice_for_analysis:long_name = "cldfrac_ice_for_analysis" ;
		cldfrac_ice_for_analysis:cell_measures = "area: area" ;
	float cldfrac_liq(time, lev, lat, lon) ;
		cldfrac_liq:units = "1" ;
		cldfrac_liq:long_name = "cldfrac_liq" ;
		cldfrac_liq:cell_measures = "area: area" ;
	float cldfrac_tot_for_analysis(time, lev, lat, lon) ;
		cldfrac_tot_for_analysis:units = "1" ;
		cldfrac_tot_for_analysis:long_name = "cldfrac_tot_for_analysis" ;
		cldfrac_tot_for_analysis:cell_measures = "area: area" ;
	float hyai(ilev) ;
		hyai:units = "1" ;
		hyai:long_name = "hyai" ;
	float hyam(lev) ;
		hyam:units = "1" ;
		hyam:long_name = "hyam" ;
	float hybi(ilev) ;
		hybi:units = "1" ;
		hybi:long_name = "hybi" ;
	float hybm(lev) ;
		hybm:units = "1" ;
		hybm:long_name = "hybm" ;
	float landfrac(time, lat, lon) ;
		landfrac:units = "1" ;
		landfrac:long_name = "landfrac" ;
		landfrac:cell_measures = "area: area" ;
	float nc(time, lev, lat, lon) ;
		nc:units = "kg^-1" ;
		nc:long_name = "nc" ;
		nc:cell_measures = "area: area" ;
	float ni(time, lev, lat, lon) ;
		ni:units = "kg^-1" ;
		ni:long_name = "ni" ;
		ni:cell_measures = "area: area" ;
	float nr(time, lev, lat, lon) ;
		nr:units = "kg^-1" ;
		nr:long_name = "nr" ;
		nr:cell_measures = "area: area" ;
	float ocnfrac(time, lat, lon) ;
		ocnfrac:units = "1" ;
		ocnfrac:long_name = "ocnfrac" ;
		ocnfrac:cell_measures = "area: area" ;
	float omega(time, lev, lat, lon) ;
		omega:units = "m^-1 s^-3 kg" ;
		omega:long_name = "omega" ;
		omega:cell_measures = "area: area" ;
	float omega_at_500hPa(time, lat, lon) ;
		omega_at_500hPa:units = "m^-1 s^-3 kg" ;
		omega_at_500hPa:long_name = "omega_at_500hPa" ;
		omega_at_500hPa:cell_measures = "area: area" ;
	float p_mid(time, lev, lat, lon) ;
		p_mid:units = "m^-1 s^-2 kg" ;
		p_mid:long_name = "p_mid" ;
		p_mid:cell_measures = "area: area" ;
	float ps(time, lat, lon) ;
		ps:units = "m^-1 s^-2 kg" ;
		ps:long_name = "ps" ;
		ps:cell_measures = "area: area" ;
	float qc(time, lev, lat, lon) ;
		qc:units = "1" ;
		qc:long_name = "qc" ;
		qc:cell_measures = "area: area" ;
	float qi(time, lev, lat, lon) ;
		qi:units = "1" ;
		qi:long_name = "qi" ;
		qi:cell_measures = "area: area" ;
	float qm(time, lev, lat, lon) ;
		qm:units = "1" ;
		qm:long_name = "qm" ;
		qm:cell_measures = "area: area" ;
	float qr(time, lev, lat, lon) ;
		qr:units = "1" ;
		qr:long_name = "qr" ;
		qr:cell_measures = "area: area" ;
	float qv(time, lev, lat, lon) ;
		qv:units = "1" ;
		qv:long_name = "qv" ;
		qv:cell_measures = "area: area" ;
	float qv_2m(time, lat, lon) ;
		qv_2m:units = "1" ;
		qv_2m:long_name = "qv_2m" ;
		qv_2m:cell_measures = "area: area" ;
	float surf_evap(time, lat, lon) ;
		surf_evap:units = "m^-2 s^-1 kg" ;
		surf_evap:long_name = "surf_evap" ;
		surf_evap:cell_measures = "area: area" ;
	float surf_radiative_T(time, lat, lon) ;
		surf_radiative_T:units = "K" ;
		surf_radiative_T:long_name = "surf_radiative_T" ;
		surf_radiative_T:cell_measures = "area: area" ;
	float surf_sens_flux(time, lat, lon) ;
		surf_sens_flux:units = "s^-3 kg" ;
		surf_sens_flux:long_name = "surf_sens_flux" ;
		surf_sens_flux:cell_measures = "area: area" ;
	float surface_upward_latent_heat_flux(time, lat, lon) ;
		surface_upward_latent_heat_flux:units = "s^-3 kg" ;
		surface_upward_latent_heat_flux:long_name = "surface_upward_latent_heat_flux" ;
		surface_upward_latent_heat_flux:cell_measures = "area: area" ;
	double time(time) ;
		time:units = "days since 2019-08-01 00:00:00" ;
		time:long_name = "time" ;
		time:calendar = "gregorian" ;
		time:bounds = "time_bnds" ;
	double time_bnds(time, dim2) ;
		time_bnds:units = "days since 2019-08-01 00:00:00" ;
		time_bnds:long_name = "time_bnds" ;
		time_bnds:note = "right endpoint accummulation" ;
	float tke(time, lev, lat, lon) ;
		tke:units = "m^2 s^-2" ;
		tke:long_name = "tke" ;
		tke:cell_measures = "area: area" ;
	float z_mid(time, lev, lat, lon) ;
		z_mid:units = "m" ;
		z_mid:long_name = "z_mid" ;
		z_mid:cell_measures = "area: area" ;

// global attributes:
		:institutions = "LLNL (Lawrence Livermore National Laboratory, Livermore, CA 94550, USA);\n",
			"ANL (Argonne National Laboratory, Argonne, IL 60439, USA); \n",
			"BNL (Brookhaven National Laboratory, Upton, NY 11973, USA);\n",
			"LANL (Los Alamos National Laboratory, Los Alamos, NM 87545, USA);\n",
			"LBNL (Lawrence Berkeley National Laboratory, Berkeley, CA 94720, USA);\n",
			"ORNL (Oak Ridge National Laboratory, Oak Ridge, TN 37831, USA);\n",
			"PNNL (Pacific Northwest National Laboratory, Richland, WA 99352, USA);\n",
			"SNL (Sandia National Laboratories, Albuquerque, NM 87185, USA).\n",
			"Mailing address: LLNL Climate Program, c/o David C. Bader, Principal Investigator, L-103, 7000 East Avenue, Livermore, CA 94550, USA" ;
		:case_t0 = "2019-08-01-00000" ;
		:run_t0 = "2019-09-30-00000" ;
		:averaging_type = "AVERAGE" ;
		:averaging_frequency_units = "nmonths" ;
		:averaging_frequency = 1 ;
		:max_snapshots_per_file = 1 ;
		:fp_precision = "single" ;
		:source = "E3SM Atmosphere Model Version 4 (EAMxx)" ;
		:case = "" ;
		:title = "EAMxx History File" ;
		:compset = "" ;
		:git_hash = "" ;
		:host = "" ;
		:version = "" ;
		:initial_file = "" ;
		:topography_file = "" ;
		:contact = "" ;
		:institution_id = "" ;
		:product = "" ;
		:component = "ATM" ;
		:Conventions = "CF-1.8" ;
		:history = "Wed Aug 23 17:52:24 2023: ncks -O -t 2 --no_tmp_fl --hdr_pad=10000 --gaa remap_script=ncremap --gaa remap_hostname=login15 --gaa remap_version=5.1.4 --rgr lat_nm_out=lat --rgr lon_nm_out=lon --map_fl=/global/cfs/cdirs/e3sm/terai/mapping/map_ne1024pg2_to_fv721x1440_nco.20230406.nc /tmp/ncremap_tmp_pdq.nc.pid72186.flidx0 ./regridded/output.scream.Cess.monthly_ne1024.AVERAGE.nmonths_x1.2019-09-01-00000.nc\n",
			"Wed Aug 23 16:33:27 2023: ncpdq -O --no_tmp_fl --hdr_pad=10000 --gaa remap_script=ncremap --gaa remap_hostname=login15 --gaa remap_version=5.1.4 -a ilev,lev,dim2,ncol /global/cfs/cdirs/e3sm/terai/SCREAM/v1_production/Cess_plus4K/output.scream.Cess.monthly_ne1024.AVERAGE.nmonths_x1.2019-09-01-00000.nc /tmp/ncremap_tmp_pdq.nc.pid72186.flidx0" ;
		:remap_script = "ncremap" ;
		:remap_hostname = "login15" ;
		:remap_version = "5.1.4" ;
		:NCO = "netCDF Operators version 5.1.4 (Homepage = http://nco.sf.net, Code = http://github.com/nco/nco)" ;
		:nco_openmp_thread_number = 2 ;
		:map_file = "/global/cfs/cdirs/e3sm/terai/mapping/map_ne1024pg2_to_fv721x1440_nco.20230406.nc" ;
		:input_file = "/tmp/ncremap_tmp_pdq.nc.pid72186.flidx0" ;
data:

 lat = -90, -89.75, -89.5, -89.25, -89, -88.75, -88.5, -88.25, -88, -87.75, 
    -87.5, -87.25, -87, -86.75, -86.5, -86.25, -86, -85.75, -85.5, -85.25, 
    -85, -84.75, -84.5, -84.25, -84, -83.75, -83.5, -83.25, -83, -82.75, 
    -82.5, -82.25, -82, -81.75, -81.5, -81.25, -81, -80.75, -80.5, -80.25, 
    -80, -79.75, -79.5, -79.25, -79, -78.75, -78.5, -78.25, -78, -77.75, 
    -77.5, -77.25, -77, -76.75, -76.5, -76.25, -76, -75.75, -75.5, -75.25, 
    -75, -74.75, -74.5, -74.25, -74, -73.75, -73.5, -73.25, -73, -72.75, 
    -72.5, -72.25, -72, -71.75, -71.5, -71.25, -71, -70.75, -70.5, -70.25, 
    -70, -69.75, -69.5, -69.25, -69, -68.75, -68.5, -68.25, -68, -67.75, 
    -67.5, -67.25, -67, -66.75, -66.5, -66.25, -66, -65.75, -65.5, -65.25, 
    -65, -64.75, -64.5, -64.25, -64, -63.75, -63.5, -63.25, -63, -62.75, 
    -62.5, -62.25, -62, -61.75, -61.5, -61.25, -61, -60.75, -60.5, -60.25, 
    -60, -59.75, -59.5, -59.25, -59, -58.75, -58.5, -58.25, -58, -57.75, 
    -57.5, -57.25, -57, -56.75, -56.5, -56.25, -56, -55.75, -55.5, -55.25, 
    -55, -54.75, -54.5, -54.25, -54, -53.75, -53.5, -53.25, -53, -52.75, 
    -52.5, -52.25, -52, -51.75, -51.5, -51.25, -51, -50.75, -50.5, -50.25, 
    -50, -49.75, -49.5, -49.25, -49, -48.75, -48.5, -48.25, -48, -47.75, 
    -47.5, -47.25, -47, -46.75, -46.5, -46.25, -46, -45.75, -45.5, -45.25, 
    -45, -44.75, -44.5, -44.25, -44, -43.75, -43.5, -43.25, -43, -42.75, 
    -42.5, -42.25, -42, -41.75, -41.5, -41.25, -41, -40.75, -40.5, -40.25, 
    -40, -39.75, -39.5, -39.25, -39, -38.75, -38.5, -38.25, -38, -37.75, 
    -37.5, -37.25, -37, -36.75, -36.5, -36.25, -36, -35.75, -35.5, -35.25, 
    -35, -34.75, -34.5, -34.25, -34, -33.75, -33.5, -33.25, -33, -32.75, 
    -32.5, -32.25, -32, -31.75, -31.5, -31.25, -31, -30.75, -30.5, -30.25, 
    -30, -29.75, -29.5, -29.25, -29, -28.75, -28.5, -28.25, -28, -27.75, 
    -27.5, -27.25, -27, -26.75, -26.5, -26.25, -26, -25.75, -25.5, -25.25, 
    -25, -24.75, -24.5, -24.25, -24, -23.75, -23.5, -23.25, -23, -22.75, 
    -22.5, -22.25, -22, -21.75, -21.5, -21.25, -21, -20.75, -20.5, -20.25, 
    -20, -19.75, -19.5, -19.25, -19, -18.75, -18.5, -18.25, -18, -17.75, 
    -17.5, -17.25, -17, -16.75, -16.5, -16.25, -16, -15.75, -15.5, -15.25, 
    -15, -14.75, -14.5, -14.25, -14, -13.75, -13.5, -13.25, -13, -12.75, 
    -12.5, -12.25, -12, -11.75, -11.5, -11.25, -11, -10.75, -10.5, -10.25, 
    -10, -9.75, -9.5, -9.25, -9, -8.75, -8.5, -8.25, -8, -7.75, -7.5, -7.25, 
    -7, -6.75, -6.5, -6.25, -6, -5.75, -5.5, -5.25, -5, -4.75, -4.5, -4.25, 
    -4, -3.75, -3.5, -3.25, -3, -2.75, -2.5, -2.25, -2, -1.75, -1.5, -1.25, 
    -1, -0.75, -0.5, -0.25, 0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 
    2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 4.25, 4.5, 4.75, 5, 5.25, 5.5, 5.75, 6, 
    6.25, 6.5, 6.75, 7, 7.25, 7.5, 7.75, 8, 8.25, 8.5, 8.75, 9, 9.25, 9.5, 
    9.75, 10, 10.25, 10.5, 10.75, 11, 11.25, 11.5, 11.75, 12, 12.25, 12.5, 
    12.75, 13, 13.25, 13.5, 13.75, 14, 14.25, 14.5, 14.75, 15, 15.25, 15.5, 
    15.75, 16, 16.25, 16.5, 16.75, 17, 17.25, 17.5, 17.75, 18, 18.25, 18.5, 
    18.75, 19, 19.25, 19.5, 19.75, 20, 20.25, 20.5, 20.75, 21, 21.25, 21.5, 
    21.75, 22, 22.25, 22.5, 22.75, 23, 23.25, 23.5, 23.75, 24, 24.25, 24.5, 
    24.75, 25, 25.25, 25.5, 25.75, 26, 26.25, 26.5, 26.75, 27, 27.25, 27.5, 
    27.75, 28, 28.25, 28.5, 28.75, 29, 29.25, 29.5, 29.75, 30, 30.25, 30.5, 
    30.75, 31, 31.25, 31.5, 31.75, 32, 32.25, 32.5, 32.75, 33, 33.25, 33.5, 
    33.75, 34, 34.25, 34.5, 34.75, 35, 35.25, 35.5, 35.75, 36, 36.25, 36.5, 
    36.75, 37, 37.25, 37.5, 37.75, 38, 38.25, 38.5, 38.75, 39, 39.25, 39.5, 
    39.75, 40, 40.25, 40.5, 40.75, 41, 41.25, 41.5, 41.75, 42, 42.25, 42.5, 
    42.75, 43, 43.25, 43.5, 43.75, 44, 44.25, 44.5, 44.75, 45, 45.25, 45.5, 
    45.75, 46, 46.25, 46.5, 46.75, 47, 47.25, 47.5, 47.75, 48, 48.25, 48.5, 
    48.75, 49, 49.25, 49.5, 49.75, 50, 50.25, 50.5, 50.75, 51, 51.25, 51.5, 
    51.75, 52, 52.25, 52.5, 52.75, 53, 53.25, 53.5, 53.75, 54, 54.25, 54.5, 
    54.75, 55, 55.25, 55.5, 55.75, 56, 56.25, 56.5, 56.75, 57, 57.25, 57.5, 
    57.75, 58, 58.25, 58.5, 58.75, 59, 59.25, 59.5, 59.75, 60, 60.25, 60.5, 
    60.75, 61, 61.25, 61.5, 61.75, 62, 62.25, 62.5, 62.75, 63, 63.25, 63.5, 
    63.75, 64, 64.25, 64.5, 64.75, 65, 65.25, 65.5, 65.75, 66, 66.25, 66.5, 
    66.75, 67, 67.25, 67.5, 67.75, 68, 68.25, 68.5, 68.75, 69, 69.25, 69.5, 
    69.75, 70, 70.25, 70.5, 70.75, 71, 71.25, 71.5, 71.75, 72, 72.25, 72.5, 
    72.75, 73, 73.25, 73.5, 73.75, 74, 74.25, 74.5, 74.75, 75, 75.25, 75.5, 
    75.75, 76, 76.25, 76.5, 76.75, 77, 77.25, 77.5, 77.75, 78, 78.25, 78.5, 
    78.75, 79, 79.25, 79.5, 79.75, 80, 80.25, 80.5, 80.75, 81, 81.25, 81.5, 
    81.75, 82, 82.25, 82.5, 82.75, 83, 83.25, 83.5, 83.75, 84, 84.25, 84.5, 
    84.75, 85, 85.25, 85.5, 85.75, 86, 86.25, 86.5, 86.75, 87, 87.25, 87.5, 
    87.75, 88, 88.25, 88.5, 88.75, 89, 89.25, 89.5, 89.75, 90 ;

 lon = 0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 
    3.5, 3.75, 4, 4.25, 4.5, 4.75, 5, 5.25, 5.5, 5.75, 6, 6.25, 6.5, 6.75, 7, 
    7.25, 7.5, 7.75, 8, 8.25, 8.5, 8.75, 9, 9.25, 9.5, 9.75, 10, 10.25, 10.5, 
    10.75, 11, 11.25, 11.5, 11.75, 12, 12.25, 12.5, 12.75, 13, 13.25, 13.5, 
    13.75, 14, 14.25, 14.5, 14.75, 15, 15.25, 15.5, 15.75, 16, 16.25, 16.5, 
    16.75, 17, 17.25, 17.5, 17.75, 18, 18.25, 18.5, 18.75, 19, 19.25, 19.5, 
    19.75, 20, 20.25, 20.5, 20.75, 21, 21.25, 21.5, 21.75, 22, 22.25, 22.5, 
    22.75, 23, 23.25, 23.5, 23.75, 24, 24.25, 24.5, 24.75, 25, 25.25, 25.5, 
    25.75, 26, 26.25, 26.5, 26.75, 27, 27.25, 27.5, 27.75, 28, 28.25, 28.5, 
    28.75, 29, 29.25, 29.5, 29.75, 30, 30.25, 30.5, 30.75, 31, 31.25, 31.5, 
    31.75, 32, 32.25, 32.5, 32.75, 33, 33.25, 33.5, 33.75, 34, 34.25, 34.5, 
    34.75, 35, 35.25, 35.5, 35.75, 36, 36.25, 36.5, 36.75, 37, 37.25, 37.5, 
    37.75, 38, 38.25, 38.5, 38.75, 39, 39.25, 39.5, 39.75, 40, 40.25, 40.5, 
    40.75, 41, 41.25, 41.5, 41.75, 42, 42.25, 42.5, 42.75, 43, 43.25, 43.5, 
    43.75, 44, 44.25, 44.5, 44.75, 45, 45.25, 45.5, 45.75, 46, 46.25, 46.5, 
    46.75, 47, 47.25, 47.5, 47.75, 48, 48.25, 48.5, 48.75, 49, 49.25, 49.5, 
    49.75, 50, 50.25, 50.5, 50.75, 51, 51.25, 51.5, 51.75, 52, 52.25, 52.5, 
    52.75, 53, 53.25, 53.5, 53.75, 54, 54.25, 54.5, 54.75, 55, 55.25, 55.5, 
    55.75, 56, 56.25, 56.5, 56.75, 57, 57.25, 57.5, 57.75, 58, 58.25, 58.5, 
    58.75, 59, 59.25, 59.5, 59.75, 60, 60.25, 60.5, 60.75, 61, 61.25, 61.5, 
    61.75, 62, 62.25, 62.5, 62.75, 63, 63.25, 63.5, 63.75, 64, 64.25, 64.5, 
    64.75, 65, 65.25, 65.5, 65.75, 66, 66.25, 66.5, 66.75, 67, 67.25, 67.5, 
    67.75, 68, 68.25, 68.5, 68.75, 69, 69.25, 69.5, 69.75, 70, 70.25, 70.5, 
    70.75, 71, 71.25, 71.5, 71.75, 72, 72.25, 72.5, 72.75, 73, 73.25, 73.5, 
    73.75, 74, 74.25, 74.5, 74.75, 75, 75.25, 75.5, 75.75, 76, 76.25, 76.5, 
    76.75, 77, 77.25, 77.5, 77.75, 78, 78.25, 78.5, 78.75, 79, 79.25, 79.5, 
    79.75, 80, 80.25, 80.5, 80.75, 81, 81.25, 81.5, 81.75, 82, 82.25, 82.5, 
    82.75, 83, 83.25, 83.5, 83.75, 84, 84.25, 84.5, 84.75, 85, 85.25, 85.5, 
    85.75, 86, 86.25, 86.5, 86.75, 87, 87.25, 87.5, 87.75, 88, 88.25, 88.5, 
    88.75, 89, 89.25, 89.5, 89.75, 90, 90.25, 90.5, 90.75, 91, 91.25, 91.5, 
    91.75, 92, 92.25, 92.5, 92.75, 93, 93.25, 93.5, 93.75, 94, 94.25, 94.5, 
    94.75, 95, 95.25, 95.5, 95.75, 96, 96.25, 96.5, 96.75, 97, 97.25, 97.5, 
    97.75, 98, 98.25, 98.5, 98.75, 99, 99.25, 99.5, 99.75, 100, 100.25, 
    100.5, 100.75, 101, 101.25, 101.5, 101.75, 102, 102.25, 102.5, 102.75, 
    103, 103.25, 103.5, 103.75, 104, 104.25, 104.5, 104.75, 105, 105.25, 
    105.5, 105.75, 106, 106.25, 106.5, 106.75, 107, 107.25, 107.5, 107.75, 
    108, 108.25, 108.5, 108.75, 109, 109.25, 109.5, 109.75, 110, 110.25, 
    110.5, 110.75, 111, 111.25, 111.5, 111.75, 112, 112.25, 112.5, 112.75, 
    113, 113.25, 113.5, 113.75, 114, 114.25, 114.5, 114.75, 115, 115.25, 
    115.5, 115.75, 116, 116.25, 116.5, 116.75, 117, 117.25, 117.5, 117.75, 
    118, 118.25, 118.5, 118.75, 119, 119.25, 119.5, 119.75, 120, 120.25, 
    120.5, 120.75, 121, 121.25, 121.5, 121.75, 122, 122.25, 122.5, 122.75, 
    123, 123.25, 123.5, 123.75, 124, 124.25, 124.5, 124.75, 125, 125.25, 
    125.5, 125.75, 126, 126.25, 126.5, 126.75, 127, 127.25, 127.5, 127.75, 
    128, 128.25, 128.5, 128.75, 129, 129.25, 129.5, 129.75, 130, 130.25, 
    130.5, 130.75, 131, 131.25, 131.5, 131.75, 132, 132.25, 132.5, 132.75, 
    133, 133.25, 133.5, 133.75, 134, 134.25, 134.5, 134.75, 135, 135.25, 
    135.5, 135.75, 136, 136.25, 136.5, 136.75, 137, 137.25, 137.5, 137.75, 
    138, 138.25, 138.5, 138.75, 139, 139.25, 139.5, 139.75, 140, 140.25, 
    140.5, 140.75, 141, 141.25, 141.5, 141.75, 142, 142.25, 142.5, 142.75, 
    143, 143.25, 143.5, 143.75, 144, 144.25, 144.5, 144.75, 145, 145.25, 
    145.5, 145.75, 146, 146.25, 146.5, 146.75, 147, 147.25, 147.5, 147.75, 
    148, 148.25, 148.5, 148.75, 149, 149.25, 149.5, 149.75, 150, 150.25, 
    150.5, 150.75, 151, 151.25, 151.5, 151.75, 152, 152.25, 152.5, 152.75, 
    153, 153.25, 153.5, 153.75, 154, 154.25, 154.5, 154.75, 155, 155.25, 
    155.5, 155.75, 156, 156.25, 156.5, 156.75, 157, 157.25, 157.5, 157.75, 
    158, 158.25, 158.5, 158.75, 159, 159.25, 159.5, 159.75, 160, 160.25, 
    160.5, 160.75, 161, 161.25, 161.5, 161.75, 162, 162.25, 162.5, 162.75, 
    163, 163.25, 163.5, 163.75, 164, 164.25, 164.5, 164.75, 165, 165.25, 
    165.5, 165.75, 166, 166.25, 166.5, 166.75, 167, 167.25, 167.5, 167.75, 
    168, 168.25, 168.5, 168.75, 169, 169.25, 169.5, 169.75, 170, 170.25, 
    170.5, 170.75, 171, 171.25, 171.5, 171.75, 172, 172.25, 172.5, 172.75, 
    173, 173.25, 173.5, 173.75, 174, 174.25, 174.5, 174.75, 175, 175.25, 
    175.5, 175.75, 176, 176.25, 176.5, 176.75, 177, 177.25, 177.5, 177.75, 
    178, 178.25, 178.5, 178.75, 179, 179.25, 179.5, 179.75, 180, 180.25, 
    180.5, 180.75, 181, 181.25, 181.5, 181.75, 182, 182.25, 182.5, 182.75, 
    183, 183.25, 183.5, 183.75, 184, 184.25, 184.5, 184.75, 185, 185.25, 
    185.5, 185.75, 186, 186.25, 186.5, 186.75, 187, 187.25, 187.5, 187.75, 
    188, 188.25, 188.5, 188.75, 189, 189.25, 189.5, 189.75, 190, 190.25, 
    190.5, 190.75, 191, 191.25, 191.5, 191.75, 192, 192.25, 192.5, 192.75, 
    193, 193.25, 193.5, 193.75, 194, 194.25, 194.5, 194.75, 195, 195.25, 
    195.5, 195.75, 196, 196.25, 196.5, 196.75, 197, 197.25, 197.5, 197.75, 
    198, 198.25, 198.5, 198.75, 199, 199.25, 199.5, 199.75, 200, 200.25, 
    200.5, 200.75, 201, 201.25, 201.5, 201.75, 202, 202.25, 202.5, 202.75, 
    203, 203.25, 203.5, 203.75, 204, 204.25, 204.5, 204.75, 205, 205.25, 
    205.5, 205.75, 206, 206.25, 206.5, 206.75, 207, 207.25, 207.5, 207.75, 
    208, 208.25, 208.5, 208.75, 209, 209.25, 209.5, 209.75, 210, 210.25, 
    210.5, 210.75, 211, 211.25, 211.5, 211.75, 212, 212.25, 212.5, 212.75, 
    213, 213.25, 213.5, 213.75, 214, 214.25, 214.5, 214.75, 215, 215.25, 
    215.5, 215.75, 216, 216.25, 216.5, 216.75, 217, 217.25, 217.5, 217.75, 
    218, 218.25, 218.5, 218.75, 219, 219.25, 219.5, 219.75, 220, 220.25, 
    220.5, 220.75, 221, 221.25, 221.5, 221.75, 222, 222.25, 222.5, 222.75, 
    223, 223.25, 223.5, 223.75, 224, 224.25, 224.5, 224.75, 225, 225.25, 
    225.5, 225.75, 226, 226.25, 226.5, 226.75, 227, 227.25, 227.5, 227.75, 
    228, 228.25, 228.5, 228.75, 229, 229.25, 229.5, 229.75, 230, 230.25, 
    230.5, 230.75, 231, 231.25, 231.5, 231.75, 232, 232.25, 232.5, 232.75, 
    233, 233.25, 233.5, 233.75, 234, 234.25, 234.5, 234.75, 235, 235.25, 
    235.5, 235.75, 236, 236.25, 236.5, 236.75, 237, 237.25, 237.5, 237.75, 
    238, 238.25, 238.5, 238.75, 239, 239.25, 239.5, 239.75, 240, 240.25, 
    240.5, 240.75, 241, 241.25, 241.5, 241.75, 242, 242.25, 242.5, 242.75, 
    243, 243.25, 243.5, 243.75, 244, 244.25, 244.5, 244.75, 245, 245.25, 
    245.5, 245.75, 246, 246.25, 246.5, 246.75, 247, 247.25, 247.5, 247.75, 
    248, 248.25, 248.5, 248.75, 249, 249.25, 249.5, 249.75, 250, 250.25, 
    250.5, 250.75, 251, 251.25, 251.5, 251.75, 252, 252.25, 252.5, 252.75, 
    253, 253.25, 253.5, 253.75, 254, 254.25, 254.5, 254.75, 255, 255.25, 
    255.5, 255.75, 256, 256.25, 256.5, 256.75, 257, 257.25, 257.5, 257.75, 
    258, 258.25, 258.5, 258.75, 259, 259.25, 259.5, 259.75, 260, 260.25, 
    260.5, 260.75, 261, 261.25, 261.5, 261.75, 262, 262.25, 262.5, 262.75, 
    263, 263.25, 263.5, 263.75, 264, 264.25, 264.5, 264.75, 265, 265.25, 
    265.5, 265.75, 266, 266.25, 266.5, 266.75, 267, 267.25, 267.5, 267.75, 
    268, 268.25, 268.5, 268.75, 269, 269.25, 269.5, 269.75, 270, 270.25, 
    270.5, 270.75, 271, 271.25, 271.5, 271.75, 272, 272.25, 272.5, 272.75, 
    273, 273.25, 273.5, 273.75, 274, 274.25, 274.5, 274.75, 275, 275.25, 
    275.5, 275.75, 276, 276.25, 276.5, 276.75, 277, 277.25, 277.5, 277.75, 
    278, 278.25, 278.5, 278.75, 279, 279.25, 279.5, 279.75, 280, 280.25, 
    280.5, 280.75, 281, 281.25, 281.5, 281.75, 282, 282.25, 282.5, 282.75, 
    283, 283.25, 283.5, 283.75, 284, 284.25, 284.5, 284.75, 285, 285.25, 
    285.5, 285.75, 286, 286.25, 286.5, 286.75, 287, 287.25, 287.5, 287.75, 
    288, 288.25, 288.5, 288.75, 289, 289.25, 289.5, 289.75, 290, 290.25, 
    290.5, 290.75, 291, 291.25, 291.5, 291.75, 292, 292.25, 292.5, 292.75, 
    293, 293.25, 293.5, 293.75, 294, 294.25, 294.5, 294.75, 295, 295.25, 
    295.5, 295.75, 296, 296.25, 296.5, 296.75, 297, 297.25, 297.5, 297.75, 
    298, 298.25, 298.5, 298.75, 299, 299.25, 299.5, 299.75, 300, 300.25, 
    300.5, 300.75, 301, 301.25, 301.5, 301.75, 302, 302.25, 302.5, 302.75, 
    303, 303.25, 303.5, 303.75, 304, 304.25, 304.5, 304.75, 305, 305.25, 
    305.5, 305.75, 306, 306.25, 306.5, 306.75, 307, 307.25, 307.5, 307.75, 
    308, 308.25, 308.5, 308.75, 309, 309.25, 309.5, 309.75, 310, 310.25, 
    310.5, 310.75, 311, 311.25, 311.5, 311.75, 312, 312.25, 312.5, 312.75, 
    313, 313.25, 313.5, 313.75, 314, 314.25, 314.5, 314.75, 315, 315.25, 
    315.5, 315.75, 316, 316.25, 316.5, 316.75, 317, 317.25, 317.5, 317.75, 
    318, 318.25, 318.5, 318.75, 319, 319.25, 319.5, 319.75, 320, 320.25, 
    320.5, 320.75, 321, 321.25, 321.5, 321.75, 322, 322.25, 322.5, 322.75, 
    323, 323.25, 323.5, 323.75, 324, 324.25, 324.5, 324.75, 325, 325.25, 
    325.5, 325.75, 326, 326.25, 326.5, 326.75, 327, 327.25, 327.5, 327.75, 
    328, 328.25, 328.5, 328.75, 329, 329.25, 329.5, 329.75, 330, 330.25, 
    330.5, 330.75, 331, 331.25, 331.5, 331.75, 332, 332.25, 332.5, 332.75, 
    333, 333.25, 333.5, 333.75, 334, 334.25, 334.5, 334.75, 335, 335.25, 
    335.5, 335.75, 336, 336.25, 336.5, 336.75, 337, 337.25, 337.5, 337.75, 
    338, 338.25, 338.5, 338.75, 339, 339.25, 339.5, 339.75, 340, 340.25, 
    340.5, 340.75, 341, 341.25, 341.5, 341.75, 342, 342.25, 342.5, 342.75, 
    343, 343.25, 343.5, 343.75, 344, 344.25, 344.5, 344.75, 345, 345.25, 
    345.5, 345.75, 346, 346.25, 346.5, 346.75, 347, 347.25, 347.5, 347.75, 
    348, 348.25, 348.5, 348.75, 349, 349.25, 349.5, 349.75, 350, 350.25, 
    350.5, 350.75, 351, 351.25, 351.5, 351.75, 352, 352.25, 352.5, 352.75, 
    353, 353.25, 353.5, 353.75, 354, 354.25, 354.5, 354.75, 355, 355.25, 
    355.5, 355.75, 356, 356.25, 356.5, 356.75, 357, 357.25, 357.5, 357.75, 
    358, 358.25, 358.5, 358.75, 359, 359.25, 359.5, 359.75 ;

 time = 61 ;
}

```
