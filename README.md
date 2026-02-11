Terraform-Based Portfolio Website with Azure Blob Image Hosting


Project Overview:
This project demonstrates an end-to-end **Azure Infrastructure as Code (IaC)** implementation using **Terraform**.  
The entire portfolio infrastructure — including compute, networking, storage, and static asset hosting — is provisioned **only through Terraform code**, without any manual Azure Portal configuration.

A portfolio website is hosted on an **Azure Virtual Machine (NGINX)**, while the **profile image is stored in Azure Blob Storage**, uploaded directly using Terraform and consumed dynamically by the website.

---

 Aim
The objective of this project is to:
- Automate Azure infrastructure provisioning using Terraform
- Store static assets (profile image) in Azure Blob Storage using Terraform
- Integrate Blob-hosted images into a VM-hosted portfolio website
- Eliminate all manual uploads and portal-based configurations

---

Architecture:
The following Azure resources are provisioned using Terraform:

- Azure Resource Group  
- Virtual Network & Subnet  
- Network Security Group (allowing HTTP – Port 80)  
- Ubuntu Linux Virtual Machine  
- NGINX Web Server  
- Azure Storage Account  
- Azure Blob Container for static assets  

---

Tools & Technologies Used:
- **Terraform**
- **Microsoft Azure**
- **Azure Blob Storage**
- **Ubuntu Linux**
- **NGINX Web Server**
- **HTML / CSS**

---

Terraform Backend & Storage Configuration:
- Terraform backend configuration is used for secure state management  
- Using the same Terraform codebase:
  - An Azure Storage Account is created
  - A Blob Container is provisioned
  - A local image file is uploaded to the Blob Container using Terraform resources  
- No manual image uploads via Azure Portal are performed

---

Virtual Machine & NGINX Setup:
- An Ubuntu Linux VM is provisioned using Terraform
- NGINX is installed using Linux package manager commands
- Default web root (`/var/www/html`) is replaced with custom portfolio HTML code

---

Image Integration into Portfolio:
- The profile image uploaded to Azure Blob Storage via Terraform is referenced directly in the HTML code
- The VM-hosted website dynamically loads the image from Azure Blob Storage
- This demonstrates a clean separation of compute and static asset storage

---

Execution Steps:
terraform init
terraform validate
terraform plan
terraform apply

---

Output & Verification

- The portfolio website is accessed using the public IP address of the Azure VM
- The profile image stored in Azure Blob Storage is successfully rendered on the website
- This confirms correct Terraform-based provisioning and integration

---

Key Highlights

- Fully automated Azure infrastructure using Terraform
- Image upload handled entirely via Terraform code
- No manual Azure Portal configuration
- Real-world DevOps Infrastructure as Code implementation
- Scalable and reusable Terraform modules

---

Conclusion

- This project demonstrates a real-world DevOps workflow using Terraform to manage both compute and storage resources in Azure.
- It highlights best practices in Infrastructure as Code, backend state management, and automation by completely eliminating manual intervention.

