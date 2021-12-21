# Introducción a Vagrant con VirtualBox


Vagrant es una herramienta que nos permite crear máquinas virtuales usando algún proveedor/hipervisor de cloud/virtualización.

En este punto voy a centrarme simplemente en crear un repositorio que de alguna forma ayude a seguir una pequeña sucesión a la hora de configurar Vagrant para llegar a hacer algo más o menos útil con esta potente herramienta. Deplegar máquinas virtuales de forma que se puedan configurar automáticamente con algún tipo de Software que pueda resultar útil.

[01_Init](./01_init/READE.md) muestra la primera experiencia con Vagrant. Simplemente muestra como crear una nueva máquina virtual con sistema Operativo Ubuntu 20.04

[02_bootstrap_apache](02_bootstrap_apache/README.md) Muestra como levantar la máquina virtual e instalar el servidor Apache2 en Ubuntu 20.04. Es la primera prueba de provisión de software automatizado.

[02_bootstrap_apache_ansible](02_bootstrap_apache2_ansible/README.md) Muestra como levantar la máquina virtual e instalar el servidor Apache2 en Ubuntu 20.04. Es un ejemplo para adquirir la noción de que no sólo se puede utilizaer Vagrant con scripts de Shell, sino con otro tipo de providers, como por ejemplo Ansible.

[03_hardware](03_hardware/README.md) Se muestra cómo configurar algunos parámetros del Hardware virtual para la máquina que creemos. La provisión, al igual que en el caso anterior es de Apache2

[04_plugin_disksize](04_plugin_disksize/README.md) Se muestra como utilizar plugins, usando el plugin _vagrant-disksize_ para mostrar un ejemplo de utilización de Plugins en Vagrant.

[05_2vms_red_privada](05_2vms_red_privada/README.md) En este ejemplo, a pesar de que no se hagan provisiones de ningún tipo, se muestra como utilizar 2 VMs comunicandose con una red privada.

[06_Wordpress](06_Wordpress/README.md) Un ejemplo mezclando los conceptos vistos hasta ahora. Instalar un Wordpress con la base de datos en una VM y el Wordpress en la otra.

[07_VagrantEsRuby](07_VagrantEsRuby/README.md) Vagrant es Ruby. Un Vagrantfile es "simplemente" un Script de Ruby.

[Docker](Docker/README.md) Ejemplo de instalación de Docker / Dockercompose en una única máquina virtual

[Jupyter](Jupyter/README.md) Ejemplo de instalación de Jupyter notebook con 2 Kernels: El de Python 3 y el de R. Además de algunas librerías muy utilizadas en ambos lenguajes.

[Hadoop 1 nodo](Hadoop01/README.md) Ejemplo de instalación de Hadoop en un nodo.

[Swarm](swarm/README.md) Ejemplo de instalación de un cluster de Docker Swarm y GlusterFS.

[Swarm2](Swarm2/README.md) Ejemplo de instalación del Cluster Swarm usando para ello un bucle para crear las máquinas virtuales y varios ficheros de instalación.

[Hadoop varios nodos](Hadoop02/README.md) Ejemplo de instalación de Hadoop en varios nodos.
