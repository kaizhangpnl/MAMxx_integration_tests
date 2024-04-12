;;......................................................................
;; This script calculates the aerosol burden based on 3d aerosol mass 
;; on the native spectral element grid 
;;...................................................................... 


   fna = "scream_mamxx_ne4pg2_t05.scream.h2.INSTANT.nhours_x1.0001-01.d1-d5.nc"

   fla = addfile(fna,"r") 

   ;;..........................................................
   ;; reading data 
   ;;..........................................................
   
   area = fla->area_PG2
   
   ;;..........................................................
   ;; calculate pressure thickness 
   ;;..........................................................

   p_int = fla->p_int
   p_mid = fla->p_mid

   nlev = dimsizes(p_mid(0,0,0,:)) 
   
   dp = p_mid
   dp = p_int(:,:,1:nlev) - p_int(:,:,0:nlev-1) 

   ;;..........................................................
   ;; load aerosol mass 
   ;;..........................................................

   ;; copy data structure  
   
   mbc    = p_mid 
   mpom   = p_mid 
   msoa   = p_mid 
   mso4   = p_mid 
   mss    = p_mid 
   mmom   = p_mid 
   mdst   = p_mid 

   ;; sum over modes 
   
   mbc    = fla->bc_a1   + fla->bc_a3   + fla->bc_a4   
   mpom   = fla->pom_a1  + fla->pom_a3  + fla->pom_a4  
   msoa   = fla->soa_a1  + fla->soa_a2  + fla->soa_a3
   mso4   = fla->so4_a1  + fla->so4_a2  + fla->so4_a3
   mss    = fla->nacl_a1 + fla->nacl_a2 + fla->nacl_a3
   mmom   = fla->mom_a1  + fla->mom_a3  + fla->mom_a4  
   mdst   = fla->dst_a1  + fla->dst_a3

   ;;..........................................................
   ;; mass * delp / g 
   ;;..........................................................

   const_g = 9.80616  ;; Gravitational acceleration (m/s2) 

   mbc  = mbc  * dp / const_g 
   mpom = mpom * dp / const_g 
   msoa = msoa * dp / const_g 
   mso4 = mso4 * dp / const_g 
   mss  = mss  * dp / const_g 
   mmom = mmom * dp / const_g 
   mdst = mdst * dp / const_g 
 
   ;;..........................................................
   ;; vertical integration 
   ;;..........................................................
   
   vint_mbc = mbc(:,:,0)
   vint_mbc = 0.
   vint_mbc = dim_sum_n(mbc,2)
   vint_mbc@long_name = "BC burden"
   vint_mbc@units = "kg/m2"
 
   vint_mpom = mpom(:,:,0)
   vint_mpom = 0.
   vint_mpom = dim_sum_n(mpom,2)
   vint_mpom@long_name = "POM burden"
   vint_mpom@units = "kg/m2"
 
   vint_msoa = msoa(:,:,0)
   vint_msoa = 0.
   vint_msoa = dim_sum_n(msoa,2)
   vint_msoa@long_name = "SOA burden"
   vint_msoa@units = "kg/m2"
 
   vint_mso4 = mso4(:,:,0)
   vint_mso4 = 0.
   vint_mso4 = dim_sum_n(mso4,2)
   vint_mso4@long_name = "SO4 burden"
   vint_mso4@units = "kg/m2"
 
   vint_mss = mss(:,:,0)
   vint_mss = 0.
   vint_mss = dim_sum_n(mss,2)
   vint_mss@long_name = "SS burden"
   vint_mss@units = "kg/m2"
 
   vint_mmom = mmom(:,:,0)
   vint_mmom = 0.
   vint_mmom = dim_sum_n(mmom,2)
   vint_mmom@long_name = "MOM burden"
   vint_mmom@units = "kg/m2"
 
   vint_mdst = mdst(:,:,0)
   vint_mdst = 0.
   vint_mdst = dim_sum_n(mdst,2)
   vint_mdst@long_name = "DU burden"
   vint_mdst@units = "kg/m2"
 
   ;;..........................................................
   ;; output 
   ;;..........................................................
   
   fno = "ne4pg2_mam4_burden_hourly.nc" 

   system("rm -f " + fno) 

   flo = addfile(fno,"c") 

   flo->BURDENBC=vint_mbc
   flo->BURDENPOM=vint_mpom
   flo->BURDENSOA=vint_msoa
   flo->BURDENSO4=vint_mso4
   flo->BURDENSS=vint_mss
   flo->BURDENMOM=vint_mmom
   flo->BURDENDST=vint_mdst


