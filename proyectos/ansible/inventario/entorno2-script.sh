#!/bin/bash

cat <<EOF

entorno2:
    hostname: 172.21.0.6
    username: usuario
    # Esto me va a complicar un huevo el mnto
    # Como ande metiendo a cada nodo la clave... 
    # Si el día de mañana cambio... la lio... y me toca cambiar cada nodo
    # Me interesa solo si este nodo tiene una clave MUY PARTICULAR... diferente a la generica que uso por defecto al ejecutar
    ssh-key-storage-path: keys/project/Ansible/clave-ssh
    lsb_codename: bionic
    virtualization_role: guest
    userspace_architecture: x86_64
    processor_count: 7
    tz: UTC
    bios_date: 10/16/2017
    distribution: Ubuntu
    pkg_mgr: apt
    memtotal_mb: 7831
    tz_offset: +0000
    userspace_bits: 64
    service_mgr: sshd
    system_vendor: Amazon EC2
    processor_cores: 1
    product_version: NA
    processor_threads_per_core: 2
    fips: false
    bios_version: 1.0
    distribution_major_version: 18
    product_name: t3.large
    processor0: 0
    processor1: GenuineIntel
    distribution_version: 22.04
    distribution_release: jammy
    virtualization_type: docker
    processor_vcpus: 2
    swaptotal_mb: 488
    form_factor: Other
EOF