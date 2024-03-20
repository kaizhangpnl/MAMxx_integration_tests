

   ;;     float aero_tau_sw(time, ncol, swband, lev) ;
   ;;             aero_tau_sw:units = "1" ;
   ;;             aero_tau_sw:long_name = "aero_tau_sw" ;
   ;;             aero_tau_sw:_FillValue = 3.402824e+33f ;

   ;; "scream.hi.INSTANT.ndays_x5.0001-01-01-00000.nc" 
   ;; "scream.hi.INSTANT.nhours_x1.0001-01-01-00000.nc

   testname = "SMS_P32x1.ne4pg2_oQU480.F2010-SCREAMv1-MPASSI.chrysalis_gnu"
   casename = "scream-mam4xx-optics.mam4_optics"
   filename = "scream.hi.INSTANT.ndays_x5.0001-01-01-00000.nc" 
   filename = "scream.hi.INSTANT.nhours_x1.0001-01-01-00000.nc"

   fna = testname + "." + casename + "." + filename 

   fla = addfile(fna,"r") 

   aero_tau_sw = fla->aero_tau_sw 
   aero_tau_lw = fla->aero_tau_lw 
   aero_ssa_sw = fla->aero_ssa_sw

   nlev = dimsizes(aero_tau_sw(0,0,0,:)) 

   aodsw = aero_tau_sw(:,:,0,0) 
   aodlw = aero_tau_lw(:,:,0,0) 
   ssasw = aero_ssa_sw(:,:,0,0) 

   ;; SW and LW diagnostic bands 
   ;; see https://github.com/E3SM-Project/E3SM/blob/master/components/eam/src/physics/rrtmg/radconstants.F90 

   idx_sw_diag = 10  
   idx_nir_diag = 8

   do ik = 0,nlev-1 
      aodsw(:,:) = aodsw(:,:) + aero_tau_sw(:,:,idx_sw_diag-1,ik)
      aodlw(:,:) = aodlw(:,:) + aero_tau_sw(:,:,idx_nir_diag-1,ik)
   end do  

   ;; aero_ssa_sw is omega * tau 

   ssasw(:,:) = aero_ssa_sw(:,:,idx_sw_diag-1,nlev-1) / aero_tau_sw(:,:,idx_sw_diag-1,nlev-1) 
 
   fno = "out.nc" 

   system("rm -f " + fno) 

   flo = addfile(fno,"c") 

   flo->aodsw=aodsw
   flo->aodlw=aodlw
   flo->ssasw=ssasw




