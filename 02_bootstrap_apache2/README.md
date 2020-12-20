# Primera instalación con Vagrant

En esta primera prueba de instalar algo en Vagrant (provision), vamos a desplegar una máquina virtual usando Ubuntu 20.04 de nuevo y se a a probar a instalar Apache2. Apache "vacío" de contenido. Un apache sin nada más que el sistema operativo y un servidor Web Apache 2.

Para ellos, se necestia el Vagrantfile (tal y como se ve en los ficheros) y un script para provisionar Apache. Una vez tenemos un directorio con estos ficheros, simplemente se ejecuta

    vagrant up

Vagrant crea la máquina virtual y ejecuta el script como _root_.

Ya tenemos nuestra máquina virtual con Apache. Recordemos que el proveedor de virtualización que estamos utilizando por debajo es VirtualBox. Vagrant en VirtualBox utiliza un tipo de red NAT (es decir, no podemos conectarnos directamente a los servicios que proporciona esa máquina virtual), esto fuerza a necesitar el concepto de _Port Forwarding_ en VirtualBox.

Por eso, la última línea del _Vagrantfile_ hace Port Forwarding del puerto en el host 8080 al puerto 80 de la máquina virtual creada:

       config.vm.network "forwarded_port", guest: 80, host: 8880

Cuando termine la provisión de la máquina virtual, se podrá utilizar el navegador para acceder al apache en el puerto 8080 de nuestro host local.