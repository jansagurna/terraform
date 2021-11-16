# Links
| Tool  | Link |
| ------------- | ------------- |
| TF AWS Provider  | https://registry.terraform.io/providers/hashicorp/aws/latest  |
| TF AWS Provider Docs  | https://registry.terraform.io/providers/hashicorp/aws/latest/docs  |
| TF Docker Image  | https://hub.docker.com/r/hashicorp/terraform/tags  |



# Steps

Step 1:
```
docker-compose run --rm tf init
```
initalsiert den Docker Container \
\
Step 2:
```
docker-compose run --rm tf fmt
```
format all tf files \
\
Step 3:
```
docker-compose run --rm tf validate
```
Check if the File is valid and everything is fine
\
Step 4:
```
docker-compose run --rm tf plan "name"
```
Planning if everything will work fine
\
Step 5:
```
docker-compose run --rm tf apply "name"
```
Run the Code
\