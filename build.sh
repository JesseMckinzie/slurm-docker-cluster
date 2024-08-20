docker build -t slurm-docker-cluster:21.08.6 .

IMAGE_TAG=19.05.2 docker-compose up -d

docker cp config.sh slurmctld:/home