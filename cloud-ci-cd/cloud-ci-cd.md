---
marp: true
title: Cloud CI/CD
description: Get to know Cloud CI/CD tools
theme: uncover
class: invert
footer: 'DoiT International, 31 August 2020'
paginate: true
---

## _Alexei Ledenev_

@doitint

github.com/alexei-led

---

## Why Cloud CI/CD

* Managed/Serverless
* Pay as you go
* Container Native
* Security
* Integrations
* Pricing
* Accessible

<!--
Managed - fully managed build service; no servers to manage
Pay as you go - pay per build minutes, no idle build capacity
Container Native - build environments/tools; Docker target
Security - IAM, KMS
Integrations - deployment, monitoring
Integrations - personal feeling
Pricing - good free tier; per minute price
-->

---

## Common

* YAML syntax
    * steps
    * artifacts
    * conditions
* Custom builders
* Per minute pricing
* Security: IAM Role/SA
* Git Commit/Push trigger

---

## Google Cloud Build

![height:350](https://cdn.activestate.com/wp-content/uploads/2020/04/GCB_BuildFlow-1200x622.png)

---

## Google Cloud Build Features

### Unique features

* Super-simple Docker build
* Integrations: GCR, GKE, CloudRun

---

## Docker build with Dockerfile

```bash
# ... with Dockerfile
gcloud builds submit --tag gcr.io/[PROJECT_ID]/[IMAGE_NAME]
```

---

## Docker build with config

```bash
# ... with codebuild.yaml
gcloud builds submit --config codebuild.yaml .

# codebuild.yaml
  steps:
  - name: 'gcr.io/cloud-builders/docker'
    args: ['build', '-t', 'gcr.io/[PROJECT_ID]/[IMAGE_NAME]', '.']
  images: ['gcr.io/[PROJECT_ID]/[IMAGE_NAME]']
```
---

## Google Cloud Build Dashboard

![bg dashboard w:90%](https://cdn.activestate.com/wp-content/uploads/2020/04/GCBdashboard.png)

---

## Google Cloud Build Logs

![bg log w:90%](https://cdn.activestate.com/wp-content/uploads/2020/04/LogFile.png)

---

## Google Cloud Build Pricing

![width:1000](https://i.imgur.com/c4r2run.png)

https://cloud.google.com/cloud-build/pricing

---

## AWS CodeBuild Features

### Unique Features

* Matrix and dependency builds
* VPC Access
* Windows, ARM, GPU builds
* Test and Coverage Reporting
* CD with CodePipeline and CodeDeploy

## AWS CodeBuild CI/CD

![bg width:100%](https://s3.amazonaws.com/chrisb/CICD-refarch.png)

---

## AWS CodeBuild Price

![width:1000](https://i.imgur.com/aavqfs6.png)

https://aws.amazon.com/codebuild/pricing

---

## AWS Image Builder (Free)

![](https://d1.awsstatic.com/re19/image-builder/Product-Page-Diagram_Image-Factory.cbf8db591ca6de1c5d9149f3cd6ccfe6c6a64f33.png)

---

## AWS ECR

* Storage: $0.10 GB-month

![width:1000](https://d1.awsstatic.com/diagrams/product-page-diagrams/Product-Page-Diagram_Amazon-ECR.bf2e7a03447ed3aba97a70e5f4aead46a5e04547.png)

---

## AWS CodeArtifact

* Storage: $0.05 GB-month
* Requests: $0.05 10,000

![width:1000](https://d1.awsstatic.com/diagrams/CodeArtifact_HIW_Diagram.9640a3361d4c20f79fbca661ee00d6a0ea706316.png)

---

## Google Container Registry

* Storage: $0.026 GB-month
* Scanning: $0.26 scan-image
