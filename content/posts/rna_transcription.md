---
author: JackMortDT
title: "Rna Transcription - Elixir - Exercism"
date: 2021-04-27T22:04:37-05:00
description: Rna Transcription
draft: true
hideToc: false
enableToc: true
enableTocContent: false
authorEmoji: 🦎
tags:
- Elixir
categories:
- Programming
series:
- Fun
image: images/posts/elixir/dnarna.jpeg
authorImage: "images/avatar/mybioimage.jpg"
---

## Exercism

Exercism es una plataforma para hacer ejercicios en varios lenguajes.

Algo interesante que ofrece esta plataforma es el como implementan la resolución los ejercicios, haciendo correr los test, en el momento en el que todos pasen, puedes subir tu respuesta.

Es algo sencillo pero efectivo, te ayuda a ir viendo temas como TDD de una forma amigable.

Vamos a realizar un ejercicio:

**Las instrucciones son**

Dado una hebra de DNA, devuelve el complemento RNA(RNA transcription).
Tanto las hembras de DNA como RNA son una secuencia de nucleoides.

Los 4 nucleoides encontrados que se encuentran en el DNA son **adenine (A)**, **cytosine (C)**, **guanine(G)** y **thymine (T)**

* G -> C
* C -> G
* T -> A
* A -> U

## Tests

Lo que se tiene que probar es lo siguiente.

```elixir
assert RnaTranscription.to_rna('G') == 'C'
assert RnaTranscription.to_rna('C') == 'G'
assert RnaTranscription.to_rna('T') == 'A'
assert RnaTranscription.to_rna('A') == 'U'
assert RnaTranscription.to_rna('ACGTGGTCTTAA') == 'UGCACCAGAAUU'
```

Donde se validan todos los casos del DNA incluyendo uno que tiene muchos caracteres.

## Código

En este caso la propia plataforma te ofrece el código necesario para empezar.

```elixir
defmodule RnaTranscription do

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
  end
end
```

Si corremos los tests nos arrojara un error ya que no se cumple la asersión.

Con esto vamos a escribir el código para pasar el primer test.

Hay que tener algo en consideración para el código, nosotros estamos trabajando con un **char list**, no un **string**, aquí una pequeña diferencia entre ambos.

```elixir
iex> IO.inspect("GCTAU", charlists: true)
"GCTAU"
"GCTAU"

iex> IO.inspect('GCTAU', charlists: true)
[71, 67, 84, 65, 85]
'GCTAU'
```

Aclarado eso, vamos a comenzar a escribir nuestro código para pasar la primera prueba

```elixir
defmodule RnaTranscription do

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    for char <- dna do
      case char do
        71 -> 67
      end
    end
  end

end
```

<script id="asciicast-tY0iTtNaMk62IJVjqtI7U62ce" src="https://asciinema.org/a/tY0iTtNaMk62IJVjqtI7U62ce.js" data-size="medium"></script>

De acuerdo al ejemplo anterior podemos sacar el valor de cada letra para tener lo siguiente:

* **'G' -> 'C'** = _71 -> 67_
* **'C' -> 'G'** = _67 -> 71_
* **'T' -> 'A'** = _84 -> 65_
* **'A' -> 'U'** = _65 -> 85_

Entonces, ya que tenemos esto y habiendo pasado la primera prueba con el código anterior, vamos a escribir los demas casos para el problema.

<script id="asciicast-P1kenlcxY59JRpazrvboO3iGI" src="https://asciinema.org/a/P1kenlcxY59JRpazrvboO3iGI.js" data-size="small"></script>

Con esto ya pasamos los test, pero no me convence al 100, para esto es algo bueno el TDD, podemos ir haciendo refactor a nuestro código sin afectar la funcionalidad del código.

### **Lo que tenemos que cambiar**

```elixir
def to_rna(dna) do
  for char <- dna do
    case char do
      71 -> 67
      67 -> 71
      84 -> 65
      65 -> 85
    end
  end
end
```

Podemos declarar un mapa como una variable de módulo y mandarlo llamar desde dentro de la iteración.

```elixir
defmodule RnaTranscription do

  @change_map %{
    71 => 67,
    67 => 71,
    84 => 65,
    65 => 85
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    for char <- dna, do: @change_map[char]
  end

end
```

De acuerdo con diferentes benchmarks el **for** consume más recursos que un [**Enum.map**](https://hexdocs.pm/elixir/Map.html#content), entonces vamos a cambiar un poco nuestro código.

```elixir
defmodule RnaTranscription do

  @change_map %{
    71 => 67,
    67 => 71,
    84 => 65,
    65 => 85
  }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(&change_dna_value/1)
  end

  defp change_dna_value(char) do
    @change_map[char]
  end

end
```

Y así habremos terminado el ejercicio de **RNA Transcription**.
# 🦎