#!/usr/bin/bash
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --time=1-00:00:00
#SBATCH --gres=gpu:0
#SBATCH --cpus-per-task=16
#SBATCH --partition=a100-galvani
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=long.nguyen@student.uni-tuebingen.de
#SBATCH --mem=200gb

TRAIN_TEST_SPLIT=navhard
CACHE_PATH=${LEAD_PROJECT_ROOT}/3rd_party/navsim_workspace/exp/metric_cache_navhard
export NAVSIM_DEVKIT_ROOT="${LEAD_PROJECT_ROOT}/3rd_party/navsim_workspace/navsimv2.2"

python $NAVSIM_DEVKIT_ROOT/navsim/planning/script/run_metric_caching.py \
train_test_split=$TRAIN_TEST_SPLIT \
cache.cache_path=$CACHE_PATH