# Where is Teddy?

## Setup

1. Order an OpenShift Cluster using the [TAP catalog item](https://demo.redhat.com/catalog?search=tap&item=babylon-catalog-prod%2Fenterprise.redhat-tap-demo.prod)

2. Tick the checkbox to enable RHOAI

3. Add the puller DaemonSet

   ```bash
   oc apply -f ./setup/rhoai-config/images-puller.yaml
   ```

5. Add the additional Triton server

   ```bash
   oc apply -f ./setup/rhoai-config/template-modelmesh-triton.yaml
   ```

6. Create the workspace `image-generation`

   ```bash
   oc apply -f ./setup/image-gen/ds-project.yaml
   ```

7. Wait for project to be created

8. Setup and configure Minio to enable the S3 storage

   ```bash
   oc apply -n image-generation -f ./setup/image-gen/setup-s3.yaml
   ```

9. Wait for job to finish

10. Create a notebook using the PyTorch RHODS image and using the `My Storage` data connection

11. Clone the repo `https://github.com/cfchase/text-to-image-demo.git` 

11. Register the template as a new component from the following url: `https://github.com/hguerrero/where-is-teddy/blob/main/scaffolder-templates/wheres-teddy/template.yaml`
12. Go over the notebooks to follow the flow of the demo to enable the inference server

12. Create a new component using the software template from Developer Hub.