# Instalación de Wordpress.

En este ejemplo se hace la instalación de Wordpress. Para ello vamos a instalar Apache en una máquina virtual y MySQL server en otra máquina virtual.

Cada máquina virtual tendrá su Script diferente para provisionar el Software. Y las máquinas virtuales estarán comunicadas por una red privada como se ha visto en el paso anterior.

El fichero _000-default.conf_ es un fichero de configuración totalmente básico para apache2 que se insertará desde el script de provisión de la máquina virtual de Wordpress de forma que el Apache quede configurado para poder trabajar con Wordpress.

Conviene recordar que Vagrant monta la carpeta compartida __/vagrant__ y que podemos acceder desde la máquina virtual para poder tomar de ahí configuraciones, o dejar información. Esta carpeta compartida puede también servirnos para que a la hora de provisionar varias máquinas se puedan dejar ficheros ahí para poder comunicarse información entre ellas.

El Vagrantfile y el código fuente de los scripts de provisión de las máquinas virtuales están comentados.