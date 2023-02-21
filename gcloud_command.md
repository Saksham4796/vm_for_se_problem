#### GCloud command to start a VM Instance
gcloud compute instances start master-instance --zone us-central1-a

#### GCloud command to start all the VM Instances
gcloud compute instances start --project=PROJECT_ID --zone=ZONE $(gcloud compute instances list --project=PROJECT_ID --format="value(name)")

#### GCloud command to stop a VM Instance
gcloud compute instances stop master-instance --zone us-central1-a

#### GCloud command to stop all the VM Instances
gcloud compute instances stop --project=PROJECT_ID --zone=ZONE $(gcloud compute instances list --project=PROJECT_ID --format="value(name)")

#### GCloud command to get into the VM Environment
gcloud compute ssh master-instance --zone us-central1-a

#### GCloud command to list of the created instances
gcloud compute instances list

#### GCloud command to copy a file from local machine to VM Instance
gcloud compute scp test.py saksham@master-instance:/home/saksham --zone us-central1-a

#### GCloud command to upload a folder from the local machine to VM Instance
gcloud compute scp --recurse ../Industrial_Problem_Statement saksham@worker-instance-1:~/ --zone us-west1-a
