# Where is Teddy?

## Setup

1. Order OpenShift Cluster

2. Install RHOAI Operator

3. Create `DefaultCluster`

4. A

   ```bash
   oc apply -f ./setup/rhoai-config/images-puller.yaml
   ```

5. B

   ```bash
   oc apply -f ./setup/rhoai-config/template-modelmesh-triton.yaml
   ```

6. C

   ```bash
   oc apply -f ./setup/image-gen/ds-project.yaml
   ```

7. Wait for project to be created

8. D

   ```bash
   oc apply -n image-generation -f ./setup/image-gen/setup-s3.yaml
   ```

9. Wait for job to finish

10. Create a notebook using the PyTorch RHODS image and using the `My Storage` data connection

11. Clone the repo `https://github.com/cfchase/text-to-image-demo.git` 

11.

12. C