Runner config
---------------------------------------
Pre Req -- Assuing a working centos vm
------------------

1. Install Docker
----------------------------------
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
systemctl status docker
docker version

2. Create Dockerfile and build image

sudo docker build -t github-runner-arm64 .

3. Get details from GH repo ( settings/runner)

4. Run the image with details
---------------------------------------------------------

sudo docker run -d --name my-gh-runner --restart always   -e REPO_URL="https://github.com/pk91kid/Devops"  \
 -e RUNNER_TOKEN="<token>"   -e RUNNER_NAME="my-docker-runner"   github-runner-arm64 bash -c "./config.sh --url \$REPO_URL \
 --token \$RUNNER_TOKEN --name \$RUNNER_NAME --unattended --replace && ./run.sh"
  
 sudo docker logs my-gh-runner
