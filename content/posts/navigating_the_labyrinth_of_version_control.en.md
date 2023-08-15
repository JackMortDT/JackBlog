---
title: "Git: Navigating the labyrinth of version control"
date: 2023-08-14T16:04:50-06:00
tags: ["git", "analogy"]
author: "JackMortDT"
description: "Breve introducción sobre que es git"
---

Vamos a centrarnos un poco en explicar que es git y el como se usa en el desarrollo de software de una manera amena para entender.

![image](/posts/navigating_the_labyrinth_of_version_control/labyrinth.jpeg "Labyrinth")

Imagina Git como un intrincado laberinto virtual para tus proyectos de desarrollo de software. En este laberinto, cada esquina representa un momento en la historia de tu proyecto. A medida que avanzas por los pasillos del laberinto, puedes crear nuevas direcciones en cada esquina. Si decides retroceder, no borraras lo que hiciste, simplemente sigues las rutas anteriores. Y aquí está la magia de git.

Si te encuentras en un punto crucial y quieres explorar una nueva idea, puedes bifurcar un nuevo pasillo sin perder el tema principal. Además, puedes compartir el mapa del laberinto con otros, permitiéndoles seguir tus pasos o explorar nuevos caminos.

Así como un laberinto te permite explorar diferentes rutas sin perder el rumbo, Git te da el poder de experimentar y colaborar en tu proyecto sin temor a perder el trabajo anterior. Al final, este laberinto de versiones enriquece la historia de tu proyecto y te permite navegar con confianza en cada esquina del desarrollo.

## Iniciando un nuevo proyecto en Git

Comenzar un nuevo proyecto con Git es como entrar en el laberinto donde puedes registrar cada paso que das. Primero te adentras usando el comando `git init`. Esto crea una especie de mapa en blanco para tu proyecto, listo para ser explorado.

```bash
~/Development/hello_git
> git init
Inicializado repositorio Git vacío en ~/Development/hello_git/.git/
~/Development/hello_git master
> lsa
total 0
drwxr-xr-x@ 3 jack  staff    96B Aug 15 08:57 .
drwxr-xr-x  6 jack  staff   192B Aug 15 08:56 ..
drwxr-xr-x@ 9 jack  staff   288B Aug 15 08:57 .git
```

Luego como un explorador en el laberinto, agregas archivos al rincón que te encuentras con `git add`. Es como dejar marcas en los pasillos para saber por donde has pasado. Cuando sientes que has avanzado lo suficiente, usas el comando `git commit`, que es como para poner una señal en la esquina donde estás, describiendo lo que has logrado. Puedes tener un registro de que marcas dejas con el comando `git status`, el cuál como el nombre lo dice te da un estatus de todas aquellas marcas registradas en tu mapa.

```bash
~/Development/hello_git master
> touch hello.txt
~/Development/hello_git master ?1
> git status

Archivos sin seguimiento:
  (usa "git add <archivo>..." para incluirlo a lo que será confirmado)
        hello.txt

~/Development/hello_git master ?1
> echo "world" >> hello.txt
~/Development/hello_git master ?1
> git add hello.txt
~/Development/hello_git master +1
> git status
En la rama master

Cambios a ser confirmados:
  (usa "git rm --cached <archivo>..." para sacar del área de stage)
        nuevos archivos: hello.txt

~/Development/hello_git master +1
> git commit -m "Adding new txt file"
[master (commit-raíz) 016fde6] Adding new txt file
 1 file changed, 1 insertion(+)
 create mode 100644 hello.txt
```

Ahora tienes un hito registrado en tu mapa del laberinto, puedes usar `git branch`, como si estuvieras abriendo una nueva senda en el laberinto. Cada rama puede tener su propia aventura. Y, por supuesto, puedes compartir tu laberinto con otros exploradores usando `git push` para que vean el camino que has trazado. De esta manera, al iniciar un nuevo proyecto en el laberinto de Git, registras cada paso y creas un camino para explorar y compartir con el mundo.

## Viendo la historia

En este laberinto puedes regresar en tus propios pasos o explorar el camino ya explorado por otras personas, para eso nos podemos ayudar del comando `git log`, este comando nos saca todos esos registros o nuestra bitácora por los cuales otros exploradores o tu mismo has hecho tus anotaciones.

```bash
commit 2f39b6245a19591c953a4ed86ef3dc794301f083 (HEAD -> master)
Author: JackMortDT <soul6496@gmail.com>
Date:   Tue Aug 15 09:37:01 2023 -0600

    Adding iguana word into txt

commit ef8f30f7db6c08215e6b6d7f535f8f0411ed29ad
Author: JackMortDT <soul6496@gmail.com>
Date:   Tue Aug 15 09:36:42 2023 -0600

    Adding cat word into txt

commit 5b431ce7ad9ca8158105d9e808456809c29c9919
Author: JackMortDT <soul6496@gmail.com>
Date:   Tue Aug 15 09:36:28 2023 -0600

    Adding dog word into txt

commit 016fde675ae20fae639944dcb61b25f0ebfc8755
Author: JackMortDT <soul6496@gmail.com>
Date:   Tue Aug 15 09:11:47 2023 -0600

    Adding new txt file
```

Aparte de ver esas anotaciones que hemos hecho, podemos tener el detalle de cada anotación con ese hash después de la palabra `commit`. Para ver el detalle de cada anotación nos ayudamos del comando `git show [hash]` y con esto podemos tener un detalle del conjunto de pasos que anotaron los anteriores exploradores del laberinto.

```bash
~/Development/hello_git master
> git show 2f39b6245a19591c953a4ed86ef3dc794301f083

commit 2f39b6245a19591c953a4ed86ef3dc794301f083 (HEAD -> master)
Author: JackMortDT <soul6496@gmail.com>
Date:   Tue Aug 15 09:37:01 2023 -0600

    Adding iguana word into txt

diff --git a/hello.txt b/hello.txt
index 91e10e0..19bf55b 100644
--- a/hello.txt
+++ b/hello.txt
@@ -1,3 +1,4 @@
 world
 dog
 cat
+iguana
```

Con el simbolo de `+` o `-` podemos darnos cuenta de esos cambios agregados o removidos de nuestra bitácora.

En el intrincado laberinto de Git, descrubrimos un poderoso aliado para el desarrollo. Al igual que un explorador en busca de tesoros ocultos, usamos comandos para trazar rutas, bifurcar caminos y registrar nuestros hallazgos. Cada `commit` se convierte en un faro de nuestro progreso, y cada `branch` es una senda hacia nuevas posibilidades. Al tejer esta analogía del laberinto en nuestra experiencia con Git, nos damos cuenta de que cada esquina, cada bifurcación, cuenta una historia única. Así como en un laberinto, a veces retroceder es necesario para avanzar con más sabiduría. Al final, en este laberinto digital, encontramos la libertad de explorar, la confianza de experimentar y la certeza de que, sin importar cuántas vueltas tomemos, estamos construyendo algo significativo en cada paso que damos.