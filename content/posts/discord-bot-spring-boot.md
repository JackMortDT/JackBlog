---
title: Discord-bot Spring boot y Gradle
date: 2020-07-24T12:27:06+09:00
description: Introducción básica a lo que entiendo que es git y la ayuda que puede dar.
draft: false
hideToc: false
enableToc: true
enableTocContent: true
author: JackMortDT
authorEmoji: 🦎
tags:
- Groovy
- Spring boot
categories:
- Programming
series:
- Fun
image: images/posts/discord-bot-spring-boot/logo_discord.png
authorImage: "images/avatar/mybioimage.jpg"
---

Vamos a hacer un bot sencillo para discord con la ayuda de spring boot y JDA 🤖

## Requerimientos

* JDK8 +

```bash
$ echo $JAVA_HOME
/Users/jackmort/.jenv/versions/1.8
```
Recomiendo instalar Java con [jenv] que es un manejador de versiones de jdk

* Editor de código de preferencia
  * Vim
  * Visual studio code
  * Sublime
  * IntelliJ

* Gradle
```bash
$ echo $GRADLE_HOME
/Users/jackmort/.sdkman/candidates/gradle/current
```

Para instalar gradle de una manera fácil se puede hacer con [sdkman]

## Crear estructura del proyecto

Para crear un proyecto nuevo de Spring bot recomiendo ocupar el [Springboot Initializr], ya que te genera toda la estructura necesaria para empezar a trabajar.

![Springboot Initializr](/images/posts/discord-bot-spring-boot/springboot_initializr.png)

Descomprimimos el zip que descargamos y al momento de levantarlo

```bash
$ gradle bootRun
```

Nos descargara algunas dependencias y se vera algo similar a esto

![Springboot Initializr](/images/posts/discord-bot-spring-boot/springboot-1.png)

Con esto tenemos creado nuestro proyecto de spring boot 😎

## Creación de bot

Nota: Voy a versionar el proyecto para tener un poco más de orden 😅

### Agregar dependencias necesarias

Las dependencias que voy a agregar son estas

* org.springframework.boot:spring-boot-starter-web
* net.dv8tion:JDA:4.2.0_179

![Springboot Initializr](/images/posts/discord-bot-spring-boot/springboot-2.png)


[jenv]: https://www.jenv.be/
[sdkman]: https://sdkman.io/
[Springboot Initializr]: https://start.spring.io/
