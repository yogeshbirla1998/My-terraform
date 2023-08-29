#! /bin/bash
sudo apt update -y
sudo adduser --disabled-password --gecos "" ansible
echo "ansible user created"
sleep 2
echo "ansible ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
sleep 2
sudo mkdir -p /home/ansible/.ssh
sleep 1
sudo bash -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiAJ1F6wRGSlQoDlkrj0HLvKg7MLt4npEirGlE5XGXkjJOjDse9Hq8bgnHR8dKkopST3b54GU1CYqXNP/s6v84U+nyCdwF8dhjEcC5vYrFC9+dy24HhxdCaRoCzUJhMsNFCfTIc8jEI/Rq4RdpCvhwBTs/KZI//f0RY9vSdWntqBaTeZ2T55SED0WACai3c6dHsF+xnlN+Q8qgRgTTLBim1+Z3kiOOEAQhZaWLuHuI3q5I26RuX3TdbTWkjKgb94EeDn6D7LmzhunhuG3QwPSdmixLQ1MUGFRKyQjRoTKFsYjIOrA3LEVZKU6p+04ziaum/ilmucJewqdiM6JIMQ2S/3oCDsHh2pBaR9toxn6vy+wayM5GlgGzF0yPQKSDQuxkoH43bTOsIyeHSktrFGsyFW6GbqU71sboCT6x+1zSKsqt5QpGgOco7WagCCUbrxj53iYAjA6M96qhdUHfUdpoVRQVTHfoDNBEyRfNBA4uYkugsJXbWQOy1JFDF39p43s= ansible@ip-10-63-34-244" > /home/ansible/.ssh/authorized_keys'
sleep 1
sudo chown -R ansible:ansible /home/ansible/.ssh
sleep 1
sudo chmod 700 /home/ansible/.ssh
sudo chmod 600 /home/ansible/.ssh/authorized_keys 
