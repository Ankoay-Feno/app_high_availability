%{ for instance in instances ~}
[${instance.name}-group]
${instance.name} ansible_host=${instance.public_ip} ansible_user=${instance.ssh_user} ansible_private_key_file=${instance.ssh_key_path}
%{ endfor ~}