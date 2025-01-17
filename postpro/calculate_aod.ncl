;;......................................................................
;; This script calculates the aod, abs, and ssa using 3d aerosol optical
;; properties diagnosed in EAMxx. 
;; Calculation is performed on the native spectral element grid. 
;;...................................................................... 



   fna = "scream_mamxx_ne4pg2_t05.scream.h2.INSTANT.nhours_x1.0001-01.d1-d5.nc"

   fla = addfile(fna,"r") 

   ;;..........................................................
   ;; reading data 
   ;;..........................................................
   
   area        = fla->area
   aero_tau_sw = fla->aero_tau_sw 
   aero_tau_lw = fla->aero_tau_lw 
   aero_ssa_sw = fla->aero_ssa_sw

   nlev = dimsizes(aero_tau_sw(0,0,0,:)) 

   aodsw = aero_tau_sw(:,:,0,0) 
   abssw = aero_tau_sw(:,:,0,0) 
   aodlw = aero_tau_lw(:,:,0,0) 
   ssasw = aero_ssa_sw(:,:,0,0) 

   ;;..........................................................
   ;; SW and LW diagnostic bands 
   ;; see https://github.com/E3SM-Project/E3SM/blob/master/components/eam/src/physics/rrtmg/radconstants.F90 
   ;;..........................................................

   idx_sw_diag = 10  
   idx_nir_diag = 8

   do ik = 0,nlev-1 
      aodsw(:,:) = aodsw(:,:) + aero_tau_sw(:,:,idx_sw_diag-1,ik)
      abssw(:,:) = abssw(:,:) + aero_tau_sw(:,:,idx_sw_diag-1,ik) - aero_ssa_sw(:,:,idx_sw_diag-1,ik)
      aodlw(:,:) = aodlw(:,:) + aero_tau_sw(:,:,idx_nir_diag-1,ik)
   end do  

   ;;..........................................................
   ;; aero_ssa_sw is omega * tau 
   ;;..........................................................

   ssasw(:,:) = aero_ssa_sw(:,:,idx_sw_diag-1,nlev-1) / aero_tau_sw(:,:,idx_sw_diag-1,nlev-1) 

   aodsw@long_name = "AOD for visible band (440–630 um)"
   abssw@long_name = "ABS for visible band (440–630 nm)"
   aodlw@long_name = "AOD for near infrared (778-1240 nm) band" 
   ssasw@long_name = "Single scattering albedo at surface"

   ;;..........................................................
   ;; output 
   ;;..........................................................
   
   fno = "ne4pg2_mam4_optics_hourly.nc" 

   system("rm -f " + fno) 

   flo = addfile(fno,"c") 
   
   flo->area=area

   flo->aodsw=aodsw
   flo->abssw=abssw
   flo->aodlw=aodlw
   flo->ssasw=ssasw

