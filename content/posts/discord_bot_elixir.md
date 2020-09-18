---
title: Bot de discord con elixir
date: 2020-09-11T12:00:47+09:00
description: Creación de bot con elixir para discord
draft: false
hideToc: false
enableToc: true
enableTocContent: true
author: JackMortDT
authorEmoji: 🦎
tags:
- Elixir
categories:
- Programming
series:
- Fun
image: images/posts/elixir_discord_bot/discord-elixir-banner.png
authorImage: "images/avatar/mybioimage.jpg"
---

Lo que se busca hacer con este post es hacer una interación entre el usuario y un bot creado apartir de elixir.

### Requerimientos

* Elixir (En este ejemplo se uso la versión 1.8)
* Erlang (Erlang otp 23)

### Crear una nueva aplicación

Para crear un nuevo proyecto en elixir, basta con ejecutar el siguiente comando.

```bash
$ mix new new_app

* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating config
* creating config/config.exs
* creating lib
* creating lib/new_app.ex
* creating test
* creating test/test_helper.exs
* creating test/new_app_test.exs

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd new_app
    mix test

Run "mix help" for more commands.
```

Al ejecutar el comando se te generaran diversos archivos en la carpeta new_app.


### Dependencias

Una vez el proyecto este creado procederemos a agregar las dependencias necesarias para el ejemplo.
```elixir
  {:discord_ex, "~> 1.1.18"}
```

La principal dependecia, la cual nos hara tener una conexión con discord es *disord_ex*.

En mi caso al momento de levantar la aplicación tenía un error de compilación por una de las dependencias que ocupaba *discord_ex*, para solucionar dicho problema fue tomar una versión más actual de la dependencia fallida y sobreescribirla por una versión que no tuviera ese error, si esto no te llega a pasar no es necesario agregar esta dependencia.

```elixir
  {:hackney, "~>1.16.0", override: true}
```

`mix.exs`
```elixir
defmodule DiscordElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :discord_elixir,
      version: "0.1.0",
      elixir: "~> 1.8",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      applications: [:logger, :discord_ex],
      mod: {JackbotElixir, []}
    ]
  end

  defp deps do
    [
      {:discord_ex, "~> 1.1.18"},
      {:hackney, "~>1.16.0", override: true}
    ]
  end
end
```

### Configuración

Se necesita tener un token para poder usar el bot, pero no es recomendable versionar ese token, por lo cual es recomendable tomarlo de una variable de entorno, en el caso de este ejemplo nombrada como *DISCORD_TOKEN*.

Se define un un caracter para poder hablar con el bot, y que solo interactue cuando ese comando esta precente como el primer caracter de la cadena escrita.

`config/config.exs`

```elixir
use Mix.Config

config :discord_elixir, token: System.get_env("DISCORD_TOKEN")
config :discord_elixir, discord_prefix: "!"
```

### Aplicación

Se agrega un Supervisor junto con un children para poder tener una constante comunicación entre discord y el bot.

Cuando creas un nuevo proyecto con Mix viene un ejemplo y un test de **hola mundo**, eso no es necesario tenerlo, por lo cual se quita y se agrega la configuración necesaria para la aplicación.

`lib/discord_elixir.ex`
```elixir
defmodule DicordElixir do
  use Application
  @moduledoc """
  Documentation for DiscordElixir.
  """

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(DiscordElixir.Manager.Worker, [%{
        handler: DiscordElixir.Manager.Worker,
        token: Application.get_env(:discord_elixir, :token)
      }])
    ]

    opts = [strategy: :one_for_one, name: DiscordElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
```

Se declara un archivo llamado Worker, en la ruta de lib/manager, este es el archivo crucial para la conexión entre elixir y discord, ya que va a ser el que va a iniciar el socket con una comunicación continua entre ambos, este archivo se va a encargar de esa comunicación y la deteción de los eventos provenientes de discord.

`lib/manager/worker.ex`
```elixir
defmodule DiscordElixir.Manager.Worker do
  @moduledoc false
  require Logger

  alias DiscordElixir.Util.ProcessMessageUtil
  alias DiscordEx.Client

  def start_link(otps \\ [] ) do
    Client.start_link(otps)
  end

  def handle_event({:message_create, payload}, state) do
    Logger.info("Author: #{payload.data["author"]["username"]} ")
    if !payload.data["author"]["bot"] do
      Task.start(fn -> ProcessMessageUtil.process_message(payload, state) end)
    end
    {:ok, state}
  end

  def handle_event({_event, _payload}, state) do
    {:ok, state}
  end

end
```

A repasar algunas lineas del archivo.

* 9. Se hace la conexión y es el encargado de recibir el token anteriormente pasado en el archivo de inicio
* 12. Es el que se encarga de escuchar los eventos de discord, se recibe un mensaje, el payload que es toda la infomación proveniente de quien escribio el mensaje, cuando, si es un bot o no etc y un estado.
* 14. Validación para verificar si el autor del mensaje es un bot o no.
* 15. Archivo de utilidad, para el proceso de todos los mensajes, es recomendable trabajarlo de manera asincrona.

Por último, se declara un archivo llamado **ProcessMessageUtil**, para poder procesar los mensajes llegados al evento y no tener todo lleno en nuestro archivo de conexión.

En este ejemplo solo se tienen 2 procesamientos de mensajes, para el comando _**!hello**_ y para el comando _**!info**_.

`lib/util/process_message_util.ex`
```elixir
defmodule DiscordElixir.Util.ProcessMessageUtil do
  @moduledoc false
  require Logger
  alias DiscordEx.Client.Helpers.MessageHelper
  alias DiscordEx.RestClient.Resources.Channel

  def process_message(payload, state) do
    prefix = Application.get_env(:discord_elixir, :discord_prefix)
    parsed_cmd = MessageHelper.msg_command_parse(payload, prefix)
    process_command(parsed_cmd, payload, state)
  end

  def process_command({"hello", _}, payload, state) do
    msg = "Hello #{payload.data["author"]["username"]} 🦎"
    send_message(msg, payload, state)
  end

  def process_command({"info", _}, payload, state) do
    msg = "Hi my name is Jackbot, I am a example bot made with Elixir and discord_ex"
    send_message(msg, payload, state)
  end

  def process_command(_, _payload, _state) do
    :noop
  end

  defp send_message(msg, payload, state) do
    Channel.send_message(state[:rest_client], payload.data["channel_id"], %{content: msg})
  end

end
```

A repasar algunas lineas de código
* 8. Se obtiene el prefixo escrito en `config/config.exs`, en este caso **!**.
* 9. La función que se llama de msg_command_parse, recibe uno o 2 parametros, en este caso, cuando tiene un parametro el prefixo por defecto que detecta es "**!**", y con 2 parametros, el segundo es prefixo cualesquiera, en el caso de ejemplo fue "**!**"
* 10. Se manda llamar la función process_command que se va a encargar de procesar los mensajes aparte de un default, en el cual no se va a mandar mensaje.
* 27. Función encargada de mandar mensajes por el Channel a discord. 🤖

Con eso se termina este ejemplo, dejo el repositorio de [Github] y me despido por hoy 🦎.

[Github]: https://github.com/JackMortDT/discord_bot_elixir_demo
