# OpenMM-Docker
Docker image for OpenMM with GPU (CUDA) support for running molecular simulations at-scale.


<h3 align="right">Colby T. Ford, Ph.D.</h3>


## Building the image...

Build:
```bash
docker build -t openmm --platform linux/amd64 .
```

Push to Docker Hub:
```bash
docker image tag openmm cford38/openmm:cuda12.5.0
docker push cford38/openmm:cuda12.5.0
```

## Using the image...

Pull the image:
```bash
docker pull cford38/openmm:cuda12.5.0
```

Run:
```bash
docker run -it --gpus all -v .:/mnt --name openmm cford38/openmm:cuda12.5.0
```

Once in the container, you can run the "protein in water" demo: `python run_demo.py` 


### Singularity

If you'd like to use this Docker image in a high-performance computing environment that requires Singularity, simply pull and convert the image using the following logic:

```bash
## Load the Singularity and CUDA modules
module load singularity
module load cuda/12.1

## Pull the Docker image from DockerHub and output a .sif file
singularity pull openmm.sif docker://cford38/openmm:cuda12.5.0

## Run commands inside the container interactively
singularity run --nv openmm.sif /bin/bash
```

#### Slurm Submission
To submit a job in an HPC cluster, you can submit via Slurm using: `sbatch submit.sh`