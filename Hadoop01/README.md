# Hadoop en 1 Host

Esta instalación presenta la instalación de Hadoop en una única máquina virtual.

Básicamente es lo mismo que otras veces, sin embargo, se puede observar que el script para provisionar hadoop utiliza los ficheros del directorio config (config/*.xml) para configurar los parámetros de Hadoop y Yarn.

Además, hadoop utiliza ssh con clave para poder conectarse a los nodos (incluso en el caso de existir un único nodo, es por esta razón que el script genera un par de claves en la carpeta actual (recordar que estará montada en /vagrant dentro de la máquina virtual). Y configura las cosas para que el propietario de Hadoop (en este caso lo estamos haciendo con el usuario "vagrant").

Otro ejemplo más de provisión de una máquina Virtual.

Se expondrá más adelante cómo se puede hacer para varias máquinas virtuales con 1 namenode y con varios datanodes.
