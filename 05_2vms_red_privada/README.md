# Redes privadas entre VMs
Aveces, no es suficiente utilizar una única máquina virtual para poder hacer nuestro despliegue. Vagrant nos permite realizar despliegues de varias máquinas virtuales simultáneamente y hacer provisiones en ambas segun las necesidades. 

En este ejemplo no se va a hacer una provisión de ningún tipo de software en las máquinas virtuales, pero sí que se crea una red privada entre las máquinas virtuales. Esta red privada es la forma en que las máquinas virtuales podrán comunicarse entre sí. Cabe recordar que por defecto, toda máquina virtual en Vagrant con el proveedor VirtualBox, utiliza una interfaz NAT (siempre con IP 10.0.0.15), y no se puede comunicar las maquinas virtuales de forma efectiva usando un tipo de red NAT.

Además, en este ejemplo se muestra cómo se pueden crear 2 máquinas virtuales en el mismo Vagrantfile. ¿Qué sentido tendría crear una máquina virtual con su propia red? -- Es por eso que en este caso se crean 2 VMs.

Como siempre, el Vagrantfile de esta carpeta muestra como hacerlo.