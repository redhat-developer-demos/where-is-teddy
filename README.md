# Where is Teddy?

## Setup

1. Order an OpenShift Cluster using the [TAP catalog item](https://demo.redhat.com/catalog?search=tap&item=babylon-catalog-prod%2Fenterprise.redhat-tap-demo.prod)

1. Tick the checkbox to enable RHOAI

1. From the command line, login as a cluster administrator

1. Add the puller DaemonSet

   ```bash
   oc apply -f ./setup/rhoai-config/images-puller.yaml
   ```

1. Add the additional Triton server

   ```bash
   oc apply -f ./setup/rhoai-config/template-modelmesh-triton.yaml
   ```

1. Create the workspace `image-generation`

   ```bash
   oc apply -f ./setup/image-gen/ds-project.yaml
   ```

1. Wait for project to be created

1. Setup and configure Minio to enable the S3 storage

   ```bash
   oc apply -n image-generation -f ./setup/image-gen/setup-s3.yaml
   ```

1. Wait for job to finish

1. Change the default storage remove cepth

    ```sh
    oc patch storageclass ocs-storagecluster-ceph-rbd -p '{"metadata": {"annotations": {"storageclass.kubernetes.io/is-default-class": "false"}}}'
    ```

1. Make gp3 the default one

    ```sh
    oc patch storageclass gp3-csi -p '{"metadata": {"annotations": {"storageclass.kubernetes.io/is-default-class": "true"}}}'
    ```

1. Create a new Workbench:
    1. Go to Openshift AI (from the OpenShift console view, click on the applications menu in the top right, then select Red Hat OpenShift AI). 
    1. Then Go to Data Science Projects. Select the "image generation" project, then go to "Create workbench".
    1. From there, select the PyTorch image, GPU accelerator, and use the `My Storage` data connection.

1. Launch the newly created image-generation workbench, and clone the repo `https://github.com/cfchase/text-to-image-demo.git`.
    (go to the git menu in the menu bar)

1. Go to Red Hat Developer Hub. In the Catalog view,
    click "Create", "Register Existing Component" and add template from the following url:
    `https://github.com/redhat-developer-demos/where-is-teddy/blob/main/scaffolder-templates/wheres-teddy/template.yaml`

1. Register the serving runtime in Openshift AI > Settings > Serving Runtimes:
    1. Select "Single Model Serving Platform"
    1. API Protocol: REST
    1. In the "Add Serving Runtime" select "from scratch" and past the contents of
        https://github.com/cfchase/text-to-image-demo/blob/main/diffusers-runtime/templates/serving-runtime.yaml

1. Go back to the image-generation workbench and open run through the 3 notebooks of the demo:
    1. 1_experimentation.ipynb
    1. 2_fine_tuning.ipynb
    1. 3_remote_inferencing.ipynb

1. Deploy the model using the values from the notebook and the registered serving runtime (use custom resources 1Gb 1 CPU)

1. Register the API entity from the following url:
    `https://github.com/redhat-developer-demos/where-is-teddy/blob/main/genai-photo-generator-api/catalog-info.yaml`

1. Create a new component using the software template from Developer Hub
