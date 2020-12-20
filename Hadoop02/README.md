# Instalación de un cluster de Hadoop con 3 nodos

Esta instalación continúa un poco con el espíritu de la instalación del cluster de Swarm/GlusterFS. Utiliza un bucle para la generación de las máquinas virtuales y tiene la configuración de Hadoop en ./config.

El bucle empieza del revés: Primero se crea el segundo nodo, luego el primero, etc. Siendo el nodo 0 el NameNode para controlar el resto de nodos.

El factor de Replica es 1, pero estas configuraciones se pueden alterar en el directorio de configuración, en el fichero correspondiente antes de hacer la instalación.

Además, la instalación está dividia en multiples partes, demostrando que se pueden dividir los scripts en varios, es decir, que no es necesario la existencia de un único script de provisión sino que se pueden encadenar varios.

Es interesante ver como podemos generar la clave en Ruby antes de empezar a levantar las maquinas virtuales. Se hace en lenguaje Ruby y luego ya levantamos las máquinas virtuales.
