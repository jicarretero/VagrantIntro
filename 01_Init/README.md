# Primera prueba con Vagrant

Se muestra aquí como desplegar una primera máquina virtual sin ningún tipo de configuración extra. Para ello, simplemente tenemos que ejecutar el comando:

    vagrant init ubuntu/focal64
    
En el directorio actual, nos va a crear un fichero llamado __Vagrantfile__. Este fichero es bastante largo y abultado, sin embargo, si buscamos el contenido real del fichero, la configuración efectiva tendremos:

    egrep -v "^ *($|#)" Vagrantfile  
    Vagrant.configure("2") do |config|
        config.vm.box = "ubuntu/focal64"
    end

Una vez creado el Vagrant file, simplemente ejecutando el comando:

    vagrant up
    
La máquina virtual se desplegará.

## Comandos básicos Vagrant.

__Ayuda__: Para obtener ayuda y ver las opciones existentes, simplemente

    vagrant help
    
__Parar las máquinas virtuales__: Para apagar las máquinas virtuales, sin borrarlas

    vagrant halt
    
__Destruir (parar y destruir) las máquinas virtuales___:

    vagrant destroy
    