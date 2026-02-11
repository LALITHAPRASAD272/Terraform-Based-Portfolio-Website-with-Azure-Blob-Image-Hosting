resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_E2s_v3"

  admin_username = "azadmin"
  admin_password = "password@123"

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  custom_data = base64encode(<<EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

sudo tee /var/www/html/index.html > /dev/null <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Palnati Lalitha Prasad | DevOps Portfolio</title>

<style>
body {
  margin: 0;
  font-family: "Segoe UI", Tahoma, sans-serif;
  background-color: #0f172a;
  color: #e5e7eb;
}

.container {
  max-width: 1000px;
  margin: auto;
  padding: 40px 20px;
}

header {
  text-align: center;
  padding-bottom: 30px;
  border-bottom: 1px solid #334155;
}

header h1 {
  font-size: 36px;
  margin-bottom: 10px;
  color: #38bdf8;
}

header p {
  font-size: 18px;
  color: #cbd5f5;
}

.profile-pic {
  width: 140px;
  height: 140px;
  border-radius: 50%;
  border: 4px solid #38bdf8;
  object-fit: cover;
  position: absolute;
  top: 20px;
  right: 20px;
}

section {
  margin-top: 40px;
}

section h2 {
  font-size: 26px;
  color: #38bdf8;
  margin-bottom: 15px;
  border-left: 5px solid #38bdf8;
  padding-left: 10px;
}

.about p {
  font-size: 17px;
  line-height: 1.8;
  color: #d1d5db;
}

.skills {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 20px;
}

.skill-card {
  background-color: #020617;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 15px rgba(56,189,248,0.1);
}

.skill-card h3 {
  margin-bottom: 10px;
  color: #22d3ee;
  font-size: 20px;
}

.skill-card ul {
  list-style: none;
  padding: 0;
}

.skill-card ul li {
  padding: 6px 0;
  border-bottom: 1px solid #1e293b;
}

footer {
  text-align: center;
  margin-top: 60px;
  padding-top: 20px;
  border-top: 1px solid #334155;
  color: #94a3b8;
}
</style>
</head>

<body>

<img src="https://${azurerm_storage_account.portfolio_sa.name}.blob.core.windows.net/${azurerm_storage_container.images.name}/${azurerm_storage_blob.profile_photo.name}"
     class="profile-pic"
     alt="Profile Photo">

<div class="container">

<header>
  <h1>PALNATI LALITHA PRASAD</h1>
  <p>Multi Cloud | DevOps | DevSecOps Engineer</p>
</header>

<section class="about">
  <h2>Profile Summary</h2>
  <p>
    Aspiring DevOps and Multi-Cloud Engineer with strong hands-on experience in
    CI/CD pipelines, containerization, cloud infrastructure, and DevSecOps practices.
    Passionate about automating workflows, improving system reliability, and
    implementing secure cloud-native solutions.
  </p>
</section>

<section>
<h2>Technical Skills</h2>

<div class="skills">
  <div class="skill-card">
    <h3>Operating Systems</h3>
    <ul><li>Linux (Ubuntu, CentOS)</li><li>Shell Scripting</li></ul>
  </div>

  <div class="skill-card">
    <h3>Version Control</h3>
    <ul><li>Git</li><li>GitHub</li></ul>
  </div>

  <div class="skill-card">
    <h3>CI / CD Tools</h3>
    <ul><li>Jenkins</li><li>GitHub Actions</li></ul>
  </div>

  <div class="skill-card">
    <h3>Containerization</h3>
    <ul><li>Docker</li><li>Kubernetes</li></ul>
  </div>

  <div class="skill-card">
    <h3>Configuration & IaC</h3>
    <ul><li>Ansible</li><li>Terraform</li></ul>
  </div>

  <div class="skill-card">
    <h3>Cloud Platforms</h3>
    <ul><li>AWS</li><li>Azure</li></ul>
  </div>

  <div class="skill-card">
    <h3>DevSecOps Tools</h3>
    <ul><li>SonarQube</li><li>Trivy</li></ul>
  </div>

  <div class="skill-card">
    <h3>Monitoring</h3>
    <ul><li>Prometheus</li><li>Grafana</li></ul>
  </div>
</div>
</section>

<footer>
© 2026 | Palnati Lalitha Prasad | DevOps Portfolio
</footer>

</div>
</body>
</html>
HTML
EOF
  )

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}