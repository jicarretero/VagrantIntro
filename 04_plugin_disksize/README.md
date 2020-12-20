# Plugins en Vagrant. Ejemplo de "vagrant-disksize"

Vagrant admite plugins que nos permiten hacer cosas que por defecto no podemos hacer. En este caso, se muestra como instalar y utilizar el plugin __vagrant-disksize__. Este plugin tiene la capacidad de aumentar el tamaño de disco duro de la imágen. Primero lo tenemos que instalar de la siguiente forma:

    vagrant plugin install vagrant-disksize
    
 Una vez tenemos el plugin instalado, para cambiar el tamaño del disco virtual de nuestra máquina virtual, en el fichero _Vagrantfile_, basta con añadir una línea como la siguiente:
 
     config.disksize.size = '60GB'


Aprovecho este fichero para mostrar como se establece también el nombre del host dentro de la máquina virtual (aunque esto no es para nada necesario a la hora de aumentar el tamaño del disco).
