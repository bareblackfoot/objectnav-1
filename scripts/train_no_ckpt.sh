#!/bin/bash
#SBATCH --job-name=gc
#SBATCH --gres gpu:1
#SBATCH -p long

hostname
if [[ $# -lt 2 ]]
then
    echo "Expect two args to specify config file and suffix"
elif [[ $# -eq 2 ]]
then
    python -u -m habitat_baselines/run.py --run-type train --exp-config habitat_baselines/config/objectnav/$1.on.yaml --run-suffix $2
elif [[ $# -ge 3 ]]
then
    all_args=("$@")
    rest_args=("${all_args[@]:2}")
    echo ${rest_args[@]}
    python -u -m habitat_baselines/run.py --run-type train --exp-config habitat_baselines/config/objectnav/$1.on.yaml --run-suffix $2 ${rest_args[@]}
fi
