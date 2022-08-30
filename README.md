# Redis Deployment on OCI
Terraform Stack to deploy ScaleGrid Redis Cluster on OCI

## Instructions
1. Ensure ScaleGrid account has been created prior to the deployment.
2. For BYOC option, ensure the Cloud Profile is created and the Machine Pool ID of the Cloud Profile is obtained.
3. Machine Pool ID can be obtained by querying the following and use the `providerMachinePoolName` attribute to locate the cloud profile by name.
    ```
    curl -i https://console.scalegrid.io/clouds/list -b cookiejar.txt
    ``` 
4. Once the Machine Pool ID is obtained, update the `machine_pool_map`value in the [var.tf](vars.tf) file.