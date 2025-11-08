# Download and installation

To get started with NAVSIM: 

### 1. Clone the navsim-devkit
This repo serves as a submodule, if the main repo was not cloned recursively, execute
```bash
git submodule update --init --recursive
```
and switch to current branch
```bash
cd $PROJECT_DIR/3rd_party/navsim_workspace/navsimv2.2
git switch <branch>
```

### 2. Download the dataset
You need to download the OpenScene logs and sensor blobs, as well as the nuPlan maps.
```bash
cd $PROJECT_DIR/3rd_party/navsim_workspace/dataset
bash $PROJECT_DIR/3rd_party/navsim_workspace/navsimv2.2/download/download_maps.sh
```
Next download the data splits you want to use.
```bash
bash $PROJECT_DIR/3rd_party/navsim_workspace/navsimv2.2/download/download_navtrain_parallel.sh
bash $PROJECT_DIR/3rd_party/navsim_workspace/navsimv2.2/download/download_test_parallel.sh
bash $PROJECT_DIR/3rd_party/navsim_workspace/navsimv2.2/download/download_navhard_two_stage.sh
```
This will download the splits into the download directory. From there, move it to create the following structure.
```angular2html
~/navsim_workspace
├── navsim (containing the devkit)
├── exp
└── dataset
    ├── maps
    ├── navsim_logs
    |    ├── test
    |    ├── trainval
    └── sensor_blobs
    |    ├── test
    |    ├── trainval
    └── navhard_two_stage
    |    ├── openscene_meta_datas
    |    ├── sensor_blobs
    |    ├── synthetic_scene_pickles
    |    └── synthetic_scenes_attributes.csv

```
Set the required environment variables, by adding the following to your `~/.bashrc` file
Based on the structure above, the environment variables need to be defined as:

```bash
export NUPLAN_MAP_VERSION="nuplan-maps-v1.0"
export NUPLAN_MAPS_ROOT="${PROJECT_DIR}/3rd_party/navsim_workspace/dataset/maps"
export NAVSIM_EXP_ROOT="${PROJECT_DIR}/3rd_party/navsim_workspace/exp"
#export NAVSIM_DEVKIT_ROOT="${PROJECT_DIR}/3rd_party/navsim_workspace/navsimv2.2"
export OPENSCENE_DATA_ROOT="${PROJECT_DIR}/3rd_party/navsim_workspace/dataset"
```

⏰ **Note:** The `navhard_two_stage` split is used for local testing of your model's performance in a two-stage pseudo closed-loop setup.
In contrast, `warmup_two_stage` is a smaller dataset designed for validating and testing submissions to the [Hugging Face Warmup leaderboard](https://huggingface.co/spaces/AGC2025/e2e-driving-warmup).
In other words, the results you obtain locally on `warmup_two_stage` should match the results you see after submitting to Hugging Face.
`private_test_hard_two_stage` contains the challenge data.
You will need it to generate a `submission.pkl` in order to participate in the official challenge on the [Hugging Face CPVR 2025 leaderboard](https://huggingface.co/spaces/AGC2025/e2e-driving-internal) (for more details, see [Submission](submission.md)).

### 3. Install the navsim-devkit

Finally, install navsim.
To this end, create a new environment and install the required dependencies:

```bash
conda env create --name navsimv2.2 -f environment.yml
conda activate navsimv2.2
pip install -e .
```

### 4. Install needed dependencies to integrate CARLA transfuser

```bash
pip install beartype jaxtyping carla numba
```