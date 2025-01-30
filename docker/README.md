
## GCNV2_SLAM的安装环境docker镜像

Use the following command to build an image

```bash
docker build --network host -f dockerfile -t gcnv2slam:latest .
```

Note that this image only contains the necessary runtime environment and does not include the GCNv2 project itself. The project ontology needs to be mapped to a directory for use

```bash
# docker run to create a docker container
./docker_run.sh
# docker into for enter docker container
./docker_into.sh
# in container `cd /work` to compile code
cd /work
# before run this scripts
# modify TORCH_PATH to /tmp/install/pytorch/torch/lib/tmp_install/share/cmake/Torch
./build.sh
```
