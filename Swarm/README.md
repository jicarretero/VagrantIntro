# Ejemplo de Swarm con 3 nodos y GlusterFS.

Este ejemplo es algo más complicado que los anteriores. Se despliega un Nodo de Docker Swarm con 3 nodos (ya sé que no es muy correcto el cómo está hecho el Vagrantfile, que es mejor con un bucle).

El Vagrantfile, además, crea 3 discos virtuales, uno por nodo, que se crea.

Además, a cada nodo se le proporciona un disco extra que se formateará en XFS y se utilizará por GlusterFS para generar un sistema de disco compartido.

