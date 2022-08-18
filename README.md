# azure_integrated_spark_streamming_structure

### 1. First of all install the azure CLI on the server who hosts the terraform as well
### 2. New terminal session:  az login --tenant 2890298d-6798-4ee8-8e84-320d2c1268cb   
##### Here tenant normally equivalent to GCP orgnazation, one subscription can only subscribe by one tenant, but one tenants can contain multiple subscriptions, also on company can have multiple tenants, so for the pilot user scenario, the tenant ID are only unique one and fixed
### 3. terraform init
### 4. terraform apply -auto-approve -var="outer_rs_gp_tf_nm=test_rs_gp_tf" -var="outer_location=eastasia”  
##### Here I take the advantage of azure CLI cached login info to create the project which is equivalent to GCP project concept, here we need the provisions, normally it done by the administrator who can create via azure GUI manually , here I wanna automate it so I did in terraform
### 5. terraform output -json    get necessary info to configure in the remaining part, it is not a neccessary step
### 6. Stay in the same session to check if the env property set properly 
##### echo $ARM_CLIENT_ID
### 7. stay in the same session, execute command: az logout   
##### make sure the login info in the previous terminal session is clear up, we only reply on the new created app service principal to create all the remaining parts.  Here is a command to check if the login info is clear up or not.  command is:  az ad user list
### 8. terraform apply -auto-approve -var="outer_rs_gp_tf_nm=test_rs_gp_tf" -var="outer_location=eastasia" -var="outer_app_client_id=32b37172-a292-45ef-bf28-a67d01ee80b3" -var="outer_app_service_principal_object_id=30313a55-f0fd-4a93-ad35-702e44a0ba65" -var="outer_client_current_tenant_id=2890298d-6798-4ee8-8e84-320d2c1268cb" -var="outer_client_secret_value=k6j8Q~zN3dtd7kclvW1Y3UB5xvd5Q0WEzia~qdi2" -var="outer_subcription_id=aaeab904-6f27-4f6f-8d79-04f05683e036"

## since the one month free tire subscription is expired, haven't got the chance to fully test all, and if the scope in the databricks can be created with service principal
