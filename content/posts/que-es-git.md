---
title: Qué es Git?
date: 2019-12-20T12:00:06+09:00
description: Introducción básica a lo que entiendo que es git y la ayuda que puede dar.
draft: false
hideToc: false
enableToc: true
enableTocContent: true
author: JackMortDT
authorEmoji: 🦎
tags:
- Git
categories:
- Tools
series:
- Tools
image: images/posts/git.png
authorImage: "images/avatar/mybioimage.jpg"
---

Este articulo ofrece un acercamiento a lo que es Git, lo que es a grandes rasgos y el uso que se le puede dar.

<!--more-->

## Qué es?

**Git** es un sistema de control de versiones, una herramienta que te permite versionar archivos de texto.

Pero esto para que sirve si hay muchas herramientas que te ayudan a lo mismo? 🤷🏻‍♂️

Pues eso es lo interesante de _Git_, es una herramienta la cúal tal vez no tiene la curva de aprendizaje mas fácil, pero una vez aprendiendola tiene mucho valor, puedes hacer bastantes cosas con ella y no solo si te dedicas al desarrollo, ocupandola bien puedes sacar un gran provecho.

### Como conoci Git?

La conocí hasta que empecé a trabajar en _Making Devs_, mi primera semana fue estar en un curso-capacitación de Git, me encanto, ya que era mi primer trabajo y estaba aprendiendo algo que llgué a ver una sola vez en la carrera, algo que intentamos usar y como no entendimos lo dejamos en el intento nada más.

Retormando, en esa semana de curso pude ver no solo conceptos de Git, también el moverme mas libremente por la terminal (Por que aprendí git en la terminal...).

Y después de esa semana aprendí... me acuerdo que nos enseño muchas cosas mi antiguo jefe ([@neodevelop](https://twitter.com/neodevelop)), pero al final no pase de como agregar archivos, hacer commit y algo muy básico de como hacer merge-branch.

Recordando lo del curso, nos enseño mucho, ver nuestra historia, explorar nuestro árbol de cambios, mezclar diferentes branch, rebasar 🤯, en esos momentos no entendia nada 😂, tuve que practicar bastante tiempo, el encontrarme con que se pueden ocasionar conflictos si se mueven mismas líneas de mismos archivos... versionar algunos conflictos ya que no sabía como arreglarlos 🤦🏻‍♂️.

### Qué puedes hacer con Git?

Como dije al principio, no sabía manejar esta herramienta, se me hacía dificil y algo tediosa, pero no por eso no veía el potencial y la gran ayuda que podia y puede dar, si tan solo la hubiera aprendido en la escuela, todos los proyectos hubieran salido diferente, de una forma mas organizada.

Git te ayuda a ver los cambios de los archivos y poder manejar esos cambios, pero esto que significa; A grandes rasgos, es como si tuvieras

`version 1 ->`
`version 1.1 ->`
`version 1.2 ->`
`version 2 ->` y así sucesivamente

Esto lo llegamos a hacer todos en algún momento con trabajos escolares y con varios archivos y documentos; Pero imaginense poder tener una versión nueva de cada archivo que tengamos por cada párrafo, por cada correción de ortografía, por cada espacio añadido entre palabras 🤯.

Este es el poder que tiene Git, que si bien el proposito para lo que mas se usa es para el versionamiento de código, esto no quiere decir que no pueda usarse para cualquier otro fin que involucre tener un archivo de texto, por ejemplo este blog y todo lo que tiene, esta siendo versionado con Git.

### Comó empezar a aprender Git.

Si bien no todos tienen esa oportunidad de tener un curso o capacitación y ayuda constante para poder usarla, siempre se puede aprender de su sitio oficial.

[https://git-scm.com/](https://git-scm.com/)

Su documentación esta explicada de una forma muy amena, vienen ejemplos, explicación de varios conceptos y un libro el cual viene todavía mas detallado, el cual es gratuito! 😬.

No solo eso, hay bastantes tutoriales, videos en internet y preguntas frecuentes acerca de como usar esta herramienta.


### Conclusión

Se que hay mas herramientas que te ayudan al control de versiones (Subversion, Mercual, etc..) no he tenido la oportunidad de usarlos, pero en lo que respecta a _Git_, se que es algo que me ha ayudado en el ambiente laboral, y en algun que otro trabajo en mi último semestre en la carrera.

Es una herramienta dificil de aprender, pero hay muchas páginas que te ayudan a aprender y por que no, el iniciar un proyecto de ejemplo que te ayude a ver como moverte entre diferentes puntos de la historia, poder mezclar varios conjuntos de cambios en uno solo, modificar nuestra historia y hasta poder borrar cambios hechos.

Git es eso que recomiendas aprender aunque sepas que va a ser un camino dificl, aparte de que es muy popular y se ocupa en muchos lugares.

##### Algó mas...

```
$ mkdir ejemplo
$ cd ejemplo
$ git init
$ ejemplo git:(master)
```

Y así es como empezamos con git 😅