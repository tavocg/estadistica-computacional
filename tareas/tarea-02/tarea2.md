# Tarea 2: Caminos aleatorios y difusión

El propósito de esta tarea es practicar conceptos fundamentales sobre los
caminos aleatorios, la ley fundamental de difusión que emerge de este modelo
y las soluciones computacionales y analíticas del problema. Se entrega:

- `tarea2.ipynb`: El documento incluye la solución de los problemas de índole
  analítica y al problema computacional. Se esperan explicaciones con detalle
  de las soluciones respectivas.

## PROBLEMA 1: DIFUSIÓN FOTÓNICA EN EL SOL

La mayoría de la energía de fusión generada en el Sol se produce cerca de su
núcleo. El radio del Sol es de aproximadamente \(7 \times 10^5\) km. Procesos
de convección dominan el transporte calórico en el tercio más superficial del
Sol, pero se cree que la energía se transporta en las porciones internas
(digamos, a escalas de un radio de \(R = 5 \times 10^8\) m) mediante un
proceso de caminos aleatorios de los fotones rayos X (veamos estos rayos X
como partículas que se mueven a la la velocidad de la luz \(c\)). Asuma que
el camino libre medio de cada fotón es \(l = 5 \times 10^{-5}\) m.

a) En order de magnitud, ¿cuántos pasos aleatorios \(N\) de tamaño \(l\) toma
   el fotón para llegar al radio \(R\) donde la convección toma importancia?

b) En orden de magnitud, ¿cuántos años \(\delta t\) tarda el fotón en llegar a
   ese punto?

Para este ejercicio, puede asumir que el fotón toma pasos en direcciones
aleatorias con la misma probabilidad, cada paso tomado con el mismo tamaño
\(l\).

## PROBLEMA 2: DIFUSIÓN TÉRMICA

La tasa de flujo de energía en un material con conductividad térmica \(K\) y
campo térmico \(T(x, y, z, t) = T(r, t)\) ((x, y, z) posición, \(t\) tiempo)
es \(\mathbf{J} = -K \nabla T\). La energía se conserva de forma
local lo cual implica que

\[
\frac{\partial E}{\partial t} = -\nabla \cdot \mathbf{J}.
\tag{1}
\]

a) Si consideramos el perfil de temperatura en un material con capacidad de
   calor específica \(c_p\) constante y densidad \(\rho\), la energía es
   \(E = c_p \rho T\). Demuestre que la temperatura \(T\) satisface la ecuación
   de difusión

\[
\frac{\partial T}{\partial t} = \frac{K}{c_p \rho} \nabla^2 T.
\tag{2}
\]

De hecho, pudimos haber derivado esta ecuación de difusión si consideramos
caminos aleatorios de fonones.

b) Si colocamos nuestro material en una cavidad con ondas planas microondas,
   lo calentamos con una modulación periódica tal que \(T = \sin(k_0 x)\) para
   \(t = 0\), punto en el cual las microondas se apagan. Demuestre
   matemáticamente que i) la amplitud de la modulación de la temperatura decae
   exponencialmente en el tiempo y encuentre la expresión del perfil de
   temperatura en el espacio y tiempo haciendo un análisis de Fourier.
   ii) Adicionalmente, encuentre como la tasa de decaimiento de amplitud depende
   de la longitud de onda \(\lambda = 2\pi / k\).

c) Tal vez usted pudo haber notado que no usamos técnicas más tradicionales
   para resolver la ecuación diferencial de difusión. Por ejemplo, una técnica
   muy común para resolver ecuaciones diferenciales parciales en física
   corresponde a de forma ad hoc construir soluciones bajo la condición de
   separabilidad; la cual, para este caso, tiene la forma
   \(T(x, t) = A(t) \cdot B(x)\). Es decir, asumiendo que podemos factorizar la
   solución como productos de funciones de solo una de las variables. Con base en
   nuestra solución analítica usando análisis de Fourier, demuestre que
   considerar los casos \(T(x, t) = A(t) \cdot B(x)\) para la ecuación de
   difusión no es una suposición, si no que esta es la forma de la solución. Con
   base en este resultado, repita el apartado (b) usando esta condición de
   separabilidad. (Tip: utilice un antsatz para la parte espacial).

d) Usando un análisis de Fourier computacional como hicimos en clase
   (`np.fft.fft`), resuelva la ecuación de difusión térmica para distintos
   valores del tiempo y realice un análisis del comportamiento. Utilice
   \(K / c_p \rho = 1\) y \(k_0 = 10\).

## PROBLEMA 3: DIFUSIÓN CON CONDICIONES PERIÓDICAS

Considere la ecuación de difusión para la densidad de probabilidad en una
dimensión

\[
\frac{\partial \rho(x, t)}{\partial t}
= D \frac{\partial^2 \rho(x, t)}{\partial x^2},
\tag{3}
\]

con condición inicial periódica en el espacio de periodo \(L\) que consiste en
una suma de funciones \(\delta\) para cada \(x_n = nL\), tal que

\[
\rho(x, 0) = \sum_{n=-\infty}^{\infty} \delta(x - nL)
\tag{4}
\]

a) Usando el método de la función de Green, encuentre una expresión para la
   aproximación de la densidad válida para tiempos cortos y
   \(-L / 2 < x < L / 2\) que contiene solamente un término (no una suma
   infinita). (Tip: ¿cuántas Gaussianas son importantes en esta región a tiempos
   cortos?)

b) Usando una serie de Fourier, encuentre una expresión para la aproximación
   de la densidad válida para tiempos largos que contiene solamente dos términos
   (no una suma infinita). Para esto puede utilizar la relación de sumas de
   Poisson, la cual indica que

\[
\sum_{n=-\infty}^{\infty} f(n) = \sum_{n=-\infty}^{\infty} \tilde{f}(n)
\tag{5}
\]

(Tip: ¿cuántas longitudes de onda son importantes a tiempos muy largos?)

c) Resuelva el problema de la parte (a) usando un análisis computacional
   (`np.fft.fft`), es decir, validemos la aproximación para tiempos cortos.
   Para esto, aproxime la condición inicial como una suma de Gaussianas muy
   estrechas en lugar de usar funciones \(\delta\). Grafique la condición inicial
   y resuelva el problema usando \(D = 1\). Naturalmente, la aproximación inicial
   depende del valor de \(t\) pero también va a depender de la posición. Escoja
   distintos valores de la posición y realice un gráfico de la solución con
   respecto al tiempo junto con nuestra aproximación de la parte (a). Discuta los
   resultados.
