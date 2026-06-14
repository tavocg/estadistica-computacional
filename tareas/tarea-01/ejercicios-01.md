# Elementos de Probabilidad

## Problema 1: Funciones Características

Las funciones características en teoría de probabilidad contienen la misma
información que las PMFs/PDFs, sin embargo, son increíblemente útiles.

- Investigue qué es una función característica en teoría de probabilidad, sus
  propiedades y sus usos.
- Calcule la función característica de la variable aleatoria \(X \sim Bern(p)\) de
  Bernoulli que vimos en clase.
- Usando esta función característica, calcule todos los momentos \(E[X^n]\) de
  la variable aleatoria de Bernoulli, para todo \(n > 1\).
- Realice lo mismo para la distribución normal.

## Problema 2: Multivariable Aleatoria

Los dardos se lanzan hacia un disco de radio \(1\) alrededor del origen de un
plano cartesiano \(x-y\). Las variables aleatorias \(X\) y \(Y\) se refieren a
la posición \(x-y\) en las que un dardo puede caer, con función de la densidad
de probabilidad conjunta (PDF conjunta).

\[
f_{X,Y}(x,y) =
\begin{cases}
c, & \forall \sqrt{x^2 + y^2} \leq 1 \\
0, & \text{de lo contrario}
\end{cases}
\]

con \(c>0\). Note que en este caso, ningún dardo falla el disco.

1. Encuentre \(c\)
2. Calcule las funciones de la densidad de probabilidad marginales; i.e.,
   \(f_X(x)\) y \(f_Y(y)\)
3. ¿Son las variables \(X\) y \(Y\) variables aleatorias independientes?
4. Determine si las variables \(X\) y \(Y\) están correlacionadas (usando la
   definición de correlaciones vista en clase)

## Problema 3: Partículas Cuánticas y Marginales de la Distribución

Dos partículas cuánticas se mueven sobre el eje \(x\) con PDF conjunta (joint
PDF) \(f(x_1, x_2)\) dada por

\[
f(x_1, x_2) =
\frac{1}{\pi a^2}
\left(\frac{x_2 - x_1}{a}\right)^2
\exp\left[-\frac{x_1^2 + x_2^2}{a^2}\right],
\]

donde \(a\) es alguna constante. Naturalmente, \(X_1\) y \(X_2\) son las
variables aleatorias de la partícula 1 y la partícula 2, respectivamente.

- Determine si \(f(x_1, x_2)\) constituye una función de la densidad de
  probabilidad conjunta mediante normalización.
- Encuentre las distribuciones marginales de cada una de las partículas. ¿Las
  partículas son estadísticamente independientes?
- Encuentre la probabilidad condicional \(P(X_1 \mid X_2)\). Realice gráficos
  de los resultados para \(x_2 = 0, \frac{1}{2}, 1, 2\) para un valor de \(a\)
  de su escogencia.

## Problema 4: Teoría Cinética de Gases

Considere una partícula en un gas ideal 3D, con masa \(m = 1\) y
\(k_B T = 1\). Cada componente de velocidad de la partícula es muestreada de
una distribución normal

\[
v_x, v_y, v_z \sim \mathcal{N}(0, \sigma^2),
\]

donde consideramos \(\sigma^2 = k_B T / m = 1\) y

\[
\mathcal{N}(\mu, \sigma^2) = \frac{1}{\sigma \sqrt{2\pi}} e^{-(x-\mu)^2 / 2\sigma^2}
\]

es la distribución normal con valor de expectación \(\mu\) y varianza
\(\sigma^2\). La energía cinética total de la partícula es

\[
T = \frac{1}{2}(v_x^2 + v_y^2 + v_z^2).
\]

Vamos a verificar si se cumple la ley débil y fuerte de los números grandes en
este problema.

1. Demuestre que \(E[T] = 3/2\)
2. Realice un histograma de la energía cinética usando \(N = 5, 50, 1000\)
   muestras. Analice el resultado con base en la ley débil de los grandes
   números. Para esto puede ser muy útil `numpy.histogram` y
   `matplotlib.pyplot.hist`
3. Realice un gráfico del promedio acumulativo de la energía cinética con
   respecto al número de muestras. Es decir, realice un promedio de la energía
   cinética con respecto a \(N\). Para esto puede ser útil `numpy.cumsum`.
   Analice el resultado con respecto a la ley fuerte de los grandes números.
