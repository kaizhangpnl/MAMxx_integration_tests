#!/bin/bash -fe

set -e 

#..................................................................................
# setup
#..................................................................................
readonly MACHINE="chrysalis"
readonly COMPILER="intel"
readonly PROJECT="e3sm"
readonly QUEUE="debug"
readonly DEBUG_COMPILE=FALSE

#..................................................................................
# code
#..................................................................................
readonly CODE_ROOT="/lcrc/group/e3sm/ac.kzhang/model/E3SM"
readonly SCREAMDOCS_ROOT="${CODE_ROOT}/docs"
readonly CHECKOUT="date-of-checkout"
readonly BRANCH="master"
readonly CHERRY=( )

#..................................................................................
# compset, relution, pelayout, time 
#..................................................................................
readonly COMPSET="F2010-SCREAMv1"
readonly RESOLUTION="ne4pg2_ne4pg2"
readonly PELAYOUT="32x1"
readonly WALLTIME="01:59:00"

#..................................................................................
# case
#..................................................................................
readonly CASE_NAME=${COMPSET}_${RESOLUTION}_mamxx_id01
readonly CASE_ROOT="${CODE_ROOT}/work/${CASE_NAME}"
readonly CASE_GROUP=""

#..................................................................................
# coupler output frequecy
#..................................................................................
readonly HIST_OPTION="nmonths"
readonly HIST_N="1"

#..................................................................................
# run options
#..................................................................................
readonly MODEL_START_TYPE="initial"  # "initial", "continue", "branch", "hybrid"
readonly START_DATE="0001-01-01"     # "" for default, or explicit "0001-01-01"
readonly STOP_OPTION="nmonths"
readonly STOP_N="1"
readonly REST_OPTION="nmonths"
readonly REST_N="1"
readonly RESUBMIT="0"
readonly DO_SHORT_TERM_ARCHIVING=false
readonly OLD_EXECUTABLE=""

#..................................................................................
# branch/hybrid run setup
#..................................................................................
readonly GET_REFCASE=false
readonly RUN_REFDIR=""
readonly RUN_REFCASE=""
readonly RUN_REFDATE=""   # same as MODEL_START_DATE for 'branch', can be different for 'hybrid'

#..................................................................................
# sub-directories
#..................................................................................
readonly CASE_BUILD_DIR=${CASE_ROOT}/build
readonly CASE_ARCHIVE_DIR=${CASE_ROOT}/archive
readonly CASE_SCRIPTS_DIR=${CASE_ROOT}/case_scripts
readonly CASE_RUN_DIR=${CASE_ROOT}/run

umask 022

#..................................................................................
# create case
#..................................................................................
${CODE_ROOT}/cime/scripts/create_newcase \
	--case ${CASE_NAME} \
	--output-root ${CASE_ROOT} \
	--script-root ${CASE_SCRIPTS_DIR} \
	--handle-preexisting-dirs u \
	--res ${RESOLUTION} \
	--compset ${COMPSET} \
	--machine ${MACHINE} \
	--compiler ${COMPILER} \
	--project ${PROJECT} \
	--srcroot ${CODE_ROOT} \
	--pecount ${PELAYOUT} \
	--queue ${QUEUE} \
	--walltime ${WALLTIME}

pushd ${CASE_SCRIPTS_DIR}

./xmlchange EXEROOT=${CASE_BUILD_DIR}
./xmlchange RUNDIR=${CASE_RUN_DIR}
./xmlchange DOUT_S=${DO_SHORT_TERM_ARCHIVING}
./xmlchange DOUT_S_ROOT=${CASE_ARCHIVE_DIR}

#..................................................................................
# setup case 
#..................................................................................
./case.setup --reset
popd

pushd ${CASE_SCRIPTS_DIR}

#..................................................................................
# specific test configurations 
#..................................................................................
./xmlchange DEBUG=${DEBUG_COMPILE}
#for MAMxx
#./xmlchange --append SCREAM_CMAKE_OPTIONS="SCREAM_NUM_TRACERS 41"

# turn off aerosols in radiation 
#./atmchange do_aerosol_rad=false


#..................................................................................
# build model
#..................................................................................
./case.build --sharedlib-only
./case.build --model-only

#..................................................................................
# Some user_nl settings won't be updated to *_in files under the run directory
# Call preview_namelists to make sure *_in and user_nl files are consistent.
#..................................................................................
pushd ${CASE_SCRIPTS_DIR}
./preview_namelists

echo " " 
echo " " 
echo " " 

popd


#..................................................................................
# configure run
#..................................................................................
pushd ${CASE_SCRIPTS_DIR}

./xmlchange RUN_STARTDATE=${START_DATE}

./atmchange output_yaml_files="${CODE_ROOT}/work/scream_default_monthly_mam.yaml"
./atmchange output_yaml_files+="${CODE_ROOT}/work/scream_default_daily_mam.yaml"
./atmchange output_yaml_files+="${CODE_ROOT}/work/scream_default_hourly_mam.yaml"
# MAMxx 
#./atmchange output_yaml_files="${CODE_ROOT}/work/scream_default_monthly_mam.yaml"
#./atmchange output_yaml_files+="${CODE_ROOT}/work/scream_default_daily_mam.yaml"
#./atmchange output_yaml_files+="${CODE_ROOT}/work/scream_default_hourly_mam.yaml"

# MAMxx 
#./atmchange physics::atm_procs_list="mam4_constituent_fluxes,mac_aero_mic,mam4_wetscav,spa,rrtmgp,mam4_aero_microphys,mam4_srf_online_emiss,mam4_drydep" -b
#./atmchange mac_aero_mic::atm_procs_list="tms,shoc,cldFraction,mam4_aci,spa,p3" -b 

# MAMxx aci
#./atmchange p3::do_prescribed_ccn=false -b
#./atmchange p3::do_predict_nc=true -b

# Set atmos IC file
./atmchange initial_conditions::Filename='$DIN_LOC_ROOT/atm/scream/init/screami_mam4xx_ne4np4L72_c20240208.nc'

# Segment length
./xmlchange STOP_OPTION=${STOP_OPTION,,},STOP_N=${STOP_N}

# Restart frequency
./xmlchange REST_OPTION=${REST_OPTION,,},REST_N=${REST_N}

# Coupler history
./xmlchange HIST_OPTION=${HIST_OPTION,,},HIST_N=${HIST_N}

# Coupler budgets (always on)
./xmlchange BUDGETS=TRUE

# Set resubmissions
./xmlchange RESUBMIT=${RESUBMIT}

#..................................................................................
# run type
#..................................................................................
# Start from default of user-specified initial conditions
if [ "${MODEL_START_TYPE,,}" == "initial" ]; then
    ./xmlchange RUN_TYPE="startup"
    ./xmlchange CONTINUE_RUN="FALSE"

# Continue existing run
elif [ "${MODEL_START_TYPE,,}" == "continue" ]; then
    ./xmlchange CONTINUE_RUN="TRUE"

elif [ "${MODEL_START_TYPE,,}" == "branch" ] || [ "${MODEL_START_TYPE,,}" == "hybrid" ]; then
    ./xmlchange RUN_TYPE=${MODEL_START_TYPE,,}
    ./xmlchange GET_REFCASE=${GET_REFCASE}
    ./xmlchange RUN_REFDIR=${RUN_REFDIR}
    ./xmlchange RUN_REFCASE=${RUN_REFCASE}
    ./xmlchange RUN_REFDATE=${RUN_REFDATE}
    echo 'Warning: $MODEL_START_TYPE = '${MODEL_START_TYPE}
    echo '$RUN_REFDIR = '${RUN_REFDIR}
    echo '$RUN_REFCASE = '${RUN_REFCASE}
    echo '$RUN_REFDATE = '${START_DATE}

else
    echo 'ERROR: $MODEL_START_TYPE = '${MODEL_START_TYPE}' is unrecognized. Exiting.'
    exit 380
fi

echo " " 
echo " " 
echo " " 

popd

#..................................................................................
# submit job
#..................................................................................
pushd ${CASE_SCRIPTS_DIR}
#./case.submit --skip-preview-namelist
./case.submit
popd




