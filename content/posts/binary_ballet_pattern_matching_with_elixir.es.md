---
title: "Ballet Binario: Haciendo Juegos de Patrones con Elixir"
date: 2023-08-28T17:22:33-06:00
tags: ["elixir", "pattern matching"]
author: "JackMortDT"
description: "Binary pattern matching"
---

El pattern matching es un concepto fundamental en Elixir y en muchos lenguajes funcionales. En Elixir, se refiere a la capacidad de comparar y desestructurar datos en base a su forma y contenido. Permite realizar acciones basadas en las caracteristicas específicas de los datos.

En lugar de usar condicionales tradicionales como `if` o `switch` para verificar condiciones, en Elixir puedes utilizar el pattern matching para manejar diferentes casos directamente en las expresiones. Aquí un ejemplo:

```elixir
iex> {a, b, c} = {1, 2, 3}
{1, 2, 3}
iex> a
1
iex> b
2
iex> c
3
```

Con este ejemplo, el código utiliza el pattern matching para comparar una tupla `{1, 2, 3}` con valores diferentes en un tupla de variables, si por alguna razón el patrón no coincide nos arrojará un error

```elixir
iex> {a, b, c, d} = {1, 2, 3}
** (MatchError) no match of right hand side value: {1, 2, 3}
```

O podemos tener algo un poco más complejo como hacer match de diferentes valores de una lista

```elixir
iex> [a, b, c] = [1, [2, 3], %{hola: "adios"}]
[1, [2, 3], %{hola: "adios"}]
iex> a
1
iex> b
[2, 3]
iex> c
%{hola: "adios"}
```

En este caso vamos a ir por un tema un poco más complejo, pero igual de útil en Elixir, el pattern matching de binarios.

El pattern matching de binarios en Elixir se refiere a la capacidad para descomponer y analizar binarios(secuencias de bytes) utilizando patrones específicos. Esto es especialmente útil cuando trabajas con datos binarios, como archivos, protocolos de red y formatos de datos estructurados.

En elixir se puede usar el pattern matching de binarios en combinación con el operador `<<>>` para especificar patrones de descomposición en binarios. Aquí hay un ejemplo básico:

```elixir
iex> <<a::8, b::8, c::8, d::8>> = "Hola"
"Hola"
iex> a
72
iex> b
111
iex> c
108
iex> d
97
```

Aquí hay 2 cosas interesantes, la primera es porque ponemos un 8 después de cada variable que tenemos, esto se refiere a la cantidad de bits que se deben capturar para cada variable. En este caso, estamos capturando 8 bits para cada una de las variables, lo que equivale a un byte.

En la mayoría de los sistemas informáticos, un byte consta de 8 bits. Cada carácter en el binario "Hola" se almacena en 1 byte, ya que los caracteres ASCII se ajustan a un byte.

Pero... por qué en lugar de arrojarnos la letra nos arroja números?
Esto se debe a la forma en que los caracteres se almacenan en  binarios en la mayoría de los sistemas informáticos modernos. Los números que estás obteniendo son los valores de los códigos ASCII de los caracteres en la cadena "Hola".

En la tabla ASCII, cada carácter se representa mediante un número. Cuando descompones un binario en Elixir, estás obteniendo los valores numéricos de los caracteres en lugar de los caracteres en sí.

> "H" en ASCII es 72
> 
> "o" en ASCII es 111
> 
> "l" en ASCII es 108
> 
> "a" en ASCII es 97

Si deseas obtener los caracteres originales en lugar de los valores numéricos, puedes usar `<<>>` para convertir los números de ASCII en caracteres:

```elixir
iex> <<72>>
"H"
iex> <<111>>
"o"
iex> <<108>>
"c"
iex> <<97>>
"a"
```

Esto nos dará los caractéres reales en lugar de los valoress numéricos