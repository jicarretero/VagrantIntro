# Modificando el Hardware de la VM
Este ejemplo es semejante al anterior. Se provisiona una máquina Virtual con Ubuntu 20.04 y se instala el servidor apache, aunque en este caso, se modifican los parámetros del Hardware Virtual de nuestra máquina virtual. El fragmento del Vagrantfile importante es el siguiente:

    # Configuramos el Hardware de nuestra VM.
    config.vm.provider "virtualbox" do |vb|
        vb.name = "apache"
        vb.memory = "2048"   # 2048 Mb de RAM
        vb.cpus = 3          # 3 Cores
        vb.customize ["modifyvm", :id, "--nictype1", "virtio"]  #Interfaz de red paravirtualizada
    end
    
Además, el Vagrantfile muestra cómo se cambia el nombre de la máquina para el hipervisor y se pone un tipo de red Paravirtualizada.

