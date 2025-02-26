---
  title: "Tarea 1. Soluciones de ecuaciones"
author: "Jose Alejandro Reyes Cuadros"
format: html
editor: visual
lang: es
---

```{python}
import matplotlib.pyplot as plt
import numpy as np
from scipy import optimize
```

Para las funciones de los ejercicios 1-6 realiza lo siguiente:
  
a)  Gráfica de la función en el intervalo en caso que se indique.

b)  Aproximación de la raíz o raíces por medio de los métodos de bisección, Newton-Raphson y la secante.

c)  Compara los resultados.

::: {#exr-tarea1_1}
  Un polinomio cuadrático de la forma $f(x)=ax^2+bx+c$ con dos raíces reales distintas.
:::
    
  ```{python}
  #| code-fold: true
  #| fig-align: "center"
  
  f = lambda x: x**2 - 4*x + 3
  
  x = np.linspace(-2, 6, 200)
  y = f(x)
  
  plt.figure(figsize=(8, 5))
  plt.plot(x, y, color="yellow")
  plt.axhline(0, color="green", linewidth=0.8, linestyle="--") # Eje x
  plt.axvline(0, color="green", linewidth=0.8, linestyle="--") # Eje y
  plt.xlabel("x")
  plt.ylabel("y")
  plt.grid()
  plt.title("Gráfica de f(x) = x^2 - 4x + 3")
  plt.show() 
  
  ```
  
  Metodo biseccion 
  ```{python}
   #| code-fold: true
  
  root_biseccion, info_biseccion = optimize.bisect(f, 0, 2, full_output=True)
  
  print("Información de la convergencia del método:")
  print(info_biseccion)
  print("-------------------------------")
  print(f"La raíz de la función es: {root_biseccion}")
  ```
  
  Método Newton 
  ```{python}
  #| code-fold: true
  
  f_der = lambda x: 2*x - 4
  
  root_newton, info_newton = optimize.newton(f, 1.5, fprime=f_der, full_output=True)
  
  print("Información de la convergencia del método de Newton-Raphson:")
  print(info_newton)
  print("--------------------------------")
  print(f"La raíz de la función es: {root_newton}")
  ```
  
  Metodo de la secante 
  ```{python}
  #| code-fold: true
  
  root_secante, info_secante = optimize.newton(f, 0, x1=2, full_output=True)
  
  print("Información de la convergencia del método de la secante:")
  print(info_secante)
  print("----------------------------------")
  print(f"La raíz de la función es: {root_secante}")
  ```
  
  Comparación de resultados
  
  Primera raíz
  ```{python}
  round(root_biseccion, 10) == round(root_newton, 10)
  ```
  
  ```{python}
  round(root_secante, 10) == round(root_newton, 10)
  ```
  Segunda raiz 
  Método bisección. Intervalo [2, 4]
  ```{python}
  #| code-fold: true
  
  root_biseccion, info_biseccion = optimize.bisect(f, 2, 4, full_output=True)
  
  print("Información de la convergencia del método:")
  print(info_biseccion)
  print("-------------------------------")
  print(f"La raíz de la función es: {root_biseccion}")
  ```
  
  Metodo Newton-Rashson 
  ```{python}
  #| code-fold: true
  
  f_der = lambda x: 2*x - 4
  
  root_newton, info_newton = optimize.newton(f, 3.5, fprime=f_der, full_output=True)
  
  print("Información de la convergencia del método de Newton-Raphson:")
  print(info_newton)
  print("--------------------------------")
  print(f"La raíz de la función es: {root_newton}")
  ```
  
  Metodo de la secante x0=2 y x1=4
  ```{python}
  #| code-fold: true
  
  root_secante, info_secante = optimize.newton(f, x0=2, x1=4, full_output=True)
  
  print("Información de la convergencia del método:")
  print(info_secante)
  print("-------------------------------")
  print(f"La raíz de la función es: {root_secante}")
  ```
  
  ::: {#exr-tarea1_2}
  Un polinomio cúbico de la forma $f(x)=ax^3+bx^2+cx+d$ con tres raíces reales distintas.
  
  Consideremos $f(x)=x^3-2x^2-5x+6$
    
  Gráfica del polinomio:
    ```{python}
  #| code-fold: true
  #| fig-align: "center"
  
  f = lambda x: x**3 - 2*x**2 - 5*x + 6
  
  x = np.linspace(-3, 4, 200)
  y = f(x)
  
  plt.figure(figsize=(8, 5))
  plt.plot(x, y, color="red")
  plt.axhline(0, color="blue", linewidth=0.8, linestyle="--") # Eje x
  plt.axvline(0, color="blue", linewidth=0.8, linestyle="--") # Eje y
  plt.xlabel("x")
  plt.ylabel("y")
  plt.grid()
  plt.title("Gráfica de f(x) = x^3 - 2x^2 - 5x + 6")
  plt.show()
  ```
  
  Aproximaciones de la primera raíz
  
  Método bisección.
  ```{python}
  #| code-fold: true
  
  root_biseccion, info_biseccion = optimize.bisect(f, -3, 0, full_output=True)
  
  print("Información de la convergencia del método:")
  print(info_biseccion)
  print("-------------------------------")
  print(f"La raíz de la función es: {root_biseccion}")
  ```
  
  Método Newton
  ```{python}
  #| code-fold: true
  
  f_der = lambda x: 3*x**2 - 4*x - 5
  
  root_newton, info_newton = optimize.newton(f, -1.5, fprime=f_der, full_output=True)
  
  print("Información de la convergencia del método de Newton-Raphson:")
  print(info_newton)
  print("--------------------------------")
  print(f"La raíz de la función es: {root_newton}")
  ```
  
  Metodo de la secante 
  ```{python}
  #| code-fold: true
  
  root_secante, info_secante = optimize.newton(f, -3, x1=0, full_output=True)
  
  print("Información de la convergencia del método de la secante:")
  print(info_secante)
  print("----------------------------------")
  print(f"La raíz de la función es: {root_secante}")
  ```
  
  Comparación de resultados
  
  Primera raíz
  ```{python}
  round(root_biseccion, 10) == round(root_newton, 10)
  ```
  
  ```{python}
  round(root_secante, 10) == round(root_newton, 10)
  ```
  Segunda raíz
  
  Método bisección. Intervalo [0, 2]
  ```{python}
  #| code-fold: true
  
  root_biseccion, info_biseccion = optimize.bisect(f, 0, 2, full_output=True)
  
  print("Información de la convergencia del método:")
  print(info_biseccion)
  print("-------------------------------")
  print(f"La raíz de la función es: {root_biseccion}")
  ```
  
  Método Newton-Raphson
  ```{python}
  #| code-fold: true
  
  f_der = lambda x: 3*x**2 - 4*x - 5
  
  root_newton, info_newton = optimize.newton(f, 1.5, fprime=f_der, full_output=True)
  
  print("Información de la convergencia del método de Newton-Raphson:")
  print(info_newton)
  print("--------------------------------")
  print(f"La raíz de la función es: {root_newton}")
  ```
  
  Método de la secante x0=0 y x1=2
  ```{python}
  #| code-fold: true
  
  root_secante, info_secante = optimize.newton(f, x0=0, x1=2, full_output=True)
  
  print("Información de la convergencia del método:")
  print(info_secante)
  print("-------------------------------")
  print(f"La raíz de la función es: {root_secante}")
  ```
  
  ::: {#exr-tarea1_3}
    $f(x)=np.cos(x)-0.5$
  :::
    Grafica 
  ```{python}
    #| code-fold: true
  #| fig-align: "center"
    
  f = lambda x: np.cos(x) - 0.5
    
    x = np.linspace(0, 2*np.pi, 200)
    y = f(x)
    
    plt.figure(figsize=(8, 5))
    plt.plot(x, y, color="gray")
    plt.axhline(0, color="pink", linewidth=0.8, linestyle="--") # Eje x
    plt.axvline(0, color="pink", linewidth=0.8, linestyle="--") # Eje y
    plt.xlabel("x")
    plt.ylabel("y")
    plt.grid()
    plt.title("Gráfica de f(x) = cos(x) - 0.5")
    plt.show() 
    ```
    
    Aproximaciones de la primera raíz
    
    Método bisección.
    ```{python}
    #| code-fold: true
    
    root_biseccion, info_biseccion = optimize.bisect(f, 0, np.pi/2, full_output=True)
    
    print("Información de la convergencia del método:")
    print(info_biseccion)
    print("-------------------------------")
    print(f"La raíz de la función es: {root_biseccion}")
    ```
    
    Método Newton
    ```{python}
    #| code-fold: true
    
    f_der = lambda x: -np.sin(x)
    
    root_newton, info_newton = optimize.newton(f, 1.0, fprime=f_der, full_output=True)
    
    print("Información de la convergencia del método de Newton-Raphson:")
    print(info_newton)
    print("--------------------------------")
    print(f"La raíz de la función es: {root_newton}")
    ```
    
    Metodo de la secante
    ```{python}
    #| code-fold: true
    
    root_secante, info_secante = optimize.newton(f, 0, x1=np.pi/2, full_output=True)
    
    print("Información de la convergencia del método de la secante:")
    print(info_secante)
    print("----------------------------------")
    print(f"La raíz de la función es: {root_secante}")
    ```
    
    Comparación de resultados
    
    Primera raíz
    ```{python}
    round(root_biseccion, 10) == round(root_newton, 10)
    ```
    
    ```{python}
    round(root_secante, 10) == round(root_newton, 10)
    ```
    
    Segunda raíz
    
    Método bisección. Intervalo [np.pi/2, np.pi]
    ```{python}
    #| code-fold: true
    
    root_biseccion, info_biseccion = optimize.bisect(f, np.pi/2, np.pi, full_output=True)
    
    print("Información de la convergencia del método:")
    print(info_biseccion)
    print("-------------------------------")
    print(f"La raíz de la función es: {root_biseccion}")
    ```
    Método Newton-Raphson 
    ```{python}
    #| code-fold: true
    
    f_der = lambda x: -np.sin(x)
    
    root_newton, info_newton = optimize.newton(f, 2.0, fprime=f_der, full_output=True)
    
    print("Información de la convergencia del método de Newton-Raphson:")
    print(info_newton)
    print("--------------------------------")
    print(f"La raíz de la función es: {root_newton}")
    ```
    
    Método de la secante x0=np.pi/2 y x1=np.pi
    ```{python}
     #| code-fold: true
    
    root_secante, info_secante = optimize.newton(f, x0=np.pi/2, x1=np.pi, full_output=True)
    
    print("Información de la convergencia del método:")
    print(info_secante)
    print("-------------------------------")
    print(f"La raíz de la función es: {root_secante}")
    ```
    
    ::: {#exr-tarea1_4}:::
      $g(x)= e^x-a$ donde $a=2, 5, 8$.
      
      
   Gráfica de la función
      
  ```{python}
  #| code-fold: true
  #| fig-align: "center"
      
      g2 = lambda x: np.exp(x)-2 
      g5 = lambda x: np.exp(x)-5
      g8 = lambda x: np.exp(x)-8
      
      x = np.linspace(0.5, 2, 400)
      
      # Crear gráfica
      plt.figure(figsize=(8,5)) # Tamaño en pulgadas
      plt.plot(x, g2(x), label = "a=2") 
      plt.plot(x, g5(x), label = "a=5")
      plt.plot(x, g8(x), label = "a=8")
      plt.axhline(0, color = "brown", linewidth = 0.8, linestyle = "--") #Eje x
      plt.axvline(0, color = "brown", linewidth = 0.8, linestyle = "--") #Eje x
      
      # Personalizar gráfica
      plt.xlabel("x")
      plt.ylabel("y")
      plt.grid()
      plt.legend()
      
      plt.show()
      ```
      
      
      
      
      **Aproximaciones para la raíz cuando a=2**
        Método bisección.
      
      ```{python}
      #| code-fold: true
      
      root_biseccion, info_biseccion = optimize.bisect(g1, -0.25, 0.5, full_output = True)
      
      print("Información de la convergencia del método:")
      print(info_biseccion)
      print("------------------------------------")
      print(f"La raíz de la función es: {root_biseccion}")
      ```
      
      
Método Newton-Raphson. Hay que brindar la primera derivada $g'(x)=e^x$.


```{python}
#| code-fold: true

# Se brinda la derivada de la función
g_der = lambda x: np.exp(x)
# Se aplica el método de Newton-Raphson
root_newton, info_newton = optimize.newton(g1, 1, g_der, full_output = True)


print("Información de la convergencia del método de Newton-Raphson:")
print(info_newton)
print("------------------------------------")
print(f"La raíz de la función es: {root_newton}")
```

Método de la secante

```{python}
#| code-fold: true

# Se aplica el método de la secante
root_secante, info_secante = optimize.newton(g1, x0 = -0.5, x1= 1.5, full_output = True)


print("Información de la convergencia del método de la secante:")
print(info_secante)
print("------------------------------------")
print(f"La raíz de la función es: {root_secante}")
```




```{python}
round(root_biseccion,10) == round(root_newton, 10)
```



```{python}
round(root_secante,10) == round(root_newton, 10)
```

**Aproximaciones para la raíz cuando a=5**

Método bisección.

```{python}
#| code-fold: true

root_biseccion, info_biseccion = optimize.bisect(g3, 1, 1.5, full_output = True)

print("Información de la convergencia del método:")
print(info_biseccion)
print("------------------------------------")
print(f"La raíz de la función es: {root_biseccion}")
```


Método Newton-Raphson. Hay que brindar la primera derivada $g'(x)=e^x$.
      
      
```{python}
#| code-fold: true
      
# Se brinda la derivada de la función
g_der = lambda x: np.exp(x)
# Se aplica el método de Newton-Raphson
root_newton, info_newton = optimize.newton(g3, 1, g_der, full_output = True)
      
      
      print("Información de la convergencia del método de Newton-Raphson:")
      print(info_newton)
      print("------------------------------------")
      print(f"La raíz de la función es: {root_newton}")
      ```
      
      Método de la secante
      
      ```{python}
      #| code-fold: true
      
      # Se aplica el método de la secante
      root_secante, info_secante = optimize.newton(g3, x0 = -0.5, x1= 1.5, full_output = True)
      
      
      print("Información de la convergencia del método de la secante:")
      print(info_secante)
      print("------------------------------------")
      print(f"La raíz de la función es: {root_secante}")
      ```
      

      
      
  ```{python}
  round(root_biseccion,10) == round(root_newton, 10)
  ```
      
      
      
  ```{python}
  round(root_secante,10) == round(root_newton, 10)
  ```
  
  ::: {#exr-tarea1_5}
    $g(x)= np.log(x+1) -1$ 
  :::
   ```{python}
    #| code-fold: true
    #| fig-align: "center"
    
    f = lambda x: np.log(x + 1) - 1
    
    x = np.linspace(0, 3, 200)
    y = f(x)
    
    plt.figure(figsize=(8, 5))
    plt.plot(x, y, color="purple")
    plt.axhline(0, color="black", linewidth=0.8, linestyle="--") # Eje x
    plt.axvline(0, color="black", linewidth=0.8, linestyle="--") # Eje y
    plt.xlabel("x")
    plt.ylabel("y")
    plt.grid()
    plt.title("Gráfica de f(x) = ln(x + 1) - 1")
    plt.show()
    ```
    
    Aproximaciones de la raíz
    
    Método bisección.
    
    ```{python}
    #| code-fold: true
    
    root_biseccion, info_biseccion = optimize.bisect(f, 0, 3, full_output=True)
    
    print("Información de la convergencia del método:")
    print(info_biseccion)
    print("-------------------------------")
    print(f"La raíz de la función es: {root_biseccion}")
    ```
    
    Método Newton
    
    ```{python}
    #| code-fold: true
    
    f_der = lambda x: 1 / (x + 1)
    
    root_newton, info_newton = optimize.newton(f, 1.5, fprime=f_der, full_output=True)
    
    print("Información de la convergencia del método de Newton-Raphson:")
    print(info_newton)
    print("--------------------------------")
    print(f"La raíz de la función es: {root_newton}")
    ```
    
    Metodo de la secante
    
    ```{python}
    #| code-fold: true
    
    root_secante, info_secante = optimize.newton(f, 0, x1=3, full_output=True)
    
    print("Información de la convergencia del método de la secante:")
    print(info_secante)
    print("----------------------------------")
    print(f"La raíz de la función es: {root_secante}")
    ```
    
    Comparacion de resultados 
    
    ```{python}
    round(root_biseccion, 10) == round(root_newton, 10)
    ```
    
    ```{python}
    round(root_secante, 10) == round(root_newton, 10)
    ```
    
    ::: {#exr-tarea1_6}
      $f(x)= 1/(x+1) -0.5$ 
    :::
      
       ```{python}
      #| code-fold: true
      #| fig-align: "center"
      
      f = lambda x: 1 / (x + 1) - 0.5
      
      x = np.linspace(0, 2, 200)
      y = f(x)
      
      plt.figure(figsize=(8, 5))
      plt.plot(x, y, color="purple")
      plt.axhline(0, color="black", linewidth=0.8, linestyle="--") # Eje x
      plt.axvline(0, color="black", linewidth=0.8, linestyle="--") # Eje y
      plt.xlabel("x")
      plt.ylabel("y")
      plt.grid()
      plt.title("Gráfica de f(x) = 1/(x + 1) - 0.5")
      plt.show()  
      ```
  
      Aproximaciones de la raíz
      
      Método bisección.
      
      ```{python}
      #| code-fold: true
      
      root_biseccion, info_biseccion = optimize.bisect(f, 0, 2, full_output=True)
      
      print("Información de la convergencia del método:")
      print(info_biseccion)
      print("-------------------------------")
      print(f"La raíz de la función es: {root_biseccion}")
      ```
      
      
      Método Newton
      
      ```{python}
      #| code-fold: true
      
      f_der = lambda x: -1 / (x + 1)**2
      
      root_newton, info_newton = optimize.newton(f, 1.0, fprime=f_der, full_output=True)
      
      print("Información de la convergencia del método de Newton-Raphson:")
      print(info_newton)
      print("--------------------------------")
      print(f"La raíz de la función es: {root_newton}")
      ```
      
      Metodo de la secante
      
      ```{python}
      #| code-fold: true
      
      root_secante, info_secante = optimize.newton(f, 0, x1=2, full_output=True)
      
      print("Información de la convergencia del método de la secante:")
      print(info_secante)
      print("----------------------------------")
      print(f"La raíz de la función es: {root_secante}")
      ```
      
      
      Comparacion de resultados
      
      ```{python}
      round(root_biseccion, 10) == round(root_newton, 10)
      ```
      
      ```{python}
      round(root_secante, 10) == round(root_newton, 10)
      ```
      
      ::: {#exr-tarea1_7}
        El sistema de ecuaciones no lineales
        \begin{eqnarray}
        y^2 - 3x^2 + 2x - 2 &=& 0\\
        x^2 +y^2 - 3 &=& 0\\
        \end{eqnarray}
        
        tiene dos soluciones. Realiza una gráfica de las curvas de nivel y aproxima las soluciones con la función `fsolve`.
        
        Gráfica de las curvas de nivel.
        
        
        ```{python}
        #| code-fold: true
        #| fig-align: "center"
        
        f1 = lambda x: np.sqrt(3x**2 -2*x+2) 
        f2 = lambda x: - f1(x)
        g1 = lambda x: np.sqrt((-x**2+3)/1)
        g2 = lambda x: -g1(x)
        
        x = np.linspace(-2, 2, 500)
        
        # Crear gráfica
        plt.figure(figsize=(8,5)) # Tamaño en pulgadas
        plt.plot(x, f1(x), label = "f1") 
        plt.plot(x, f2(x), label = "f2")
        plt.plot(x, g1(x), label = "g1")
        plt.plot(x, g2(x), label = "g2")
        plt.axhline(0, color = "black", linewidth = 0.8, linestyle = "--") #Eje x
        plt.axvline(0, color = "black", linewidth = 0.8, linestyle = "--") #Eje x
        
        # Personalizar gráfica
        plt.xlabel("x")
        plt.ylabel("y")
        plt.grid()
        plt.legend()
        
        plt.show()
        ```
        
        Aproximamos la solución del sistema (los puntos de intersección de las curvas de nivel)
        
        ```{python}
        def sistema(variables): # variables debe ser una lista de dos elementos
          x, y = variables
        return [y ** 2 - x ** 2 + 4*x -3,3 x**2+1* y ** 2 -2]
        
        solucion_1 = optimize.fsolve(sistema, x0=[0.5,1])
        solucion_2 = optimize.fsolve(sistema, x0=[0.5,-1])
        print(f"Las soluciones del sistema son: ({round(solucion_1[0], 4)}, {round(solucion_1[1], 4)}) y ({round(solucion_2[0], 4)}, {round(solucion_2[1], 4)})")
        ```
        
        
        ```{python}
        #| code-fold: true
        #| fig-align: "center"
        
        # Crear gráfica
        plt.figure(figsize=(8,5)) # Tamaño en pulgadas
        plt.plot(x, f1(x), label = "f1") 
        plt.plot(x, f2(x), label = "f2")
        plt.plot(x, g1(x), label = "g1")
        plt.plot(x, g2(x), label = "g2")
        plt.plot(solucion_1[0], solucion_1[1], marker = 'o', ms=8, color= "orange")
        plt.plot(solucion_2[0], solucion_2[1], marker = 'o', ms=8, color= "orange")
        plt.axhline(0, color = "red", linewidth = 0.8, linestyle = "--") #Eje x
        plt.axvline(0, color = "red", linewidth = 0.8, linestyle = "--") #Eje x
        
        # Personalizar gráfica
        plt.xlabel("x")
        plt.ylabel("y")
        plt.grid()
        plt.legend()
        
        plt.show()
        ```
        
        
        :::
          
      :::{#exr-tarea1_8}
      Considera el siguiente sistema:
      
          ```{python}
       #| code-fold: true
       #| fig-align: "center"
        
        # Definimos las funciones
        def f1(x, y):
          return np.sin(x) + y**2 - 1
        
        def f2(x, y):
          return x + np.cos(y) - 1
        
        # Creamos una malla de puntos para graficar
        x = np.linspace(-2, 2, 400)
        y = np.linspace(-2, 2, 400)
        X, Y = np.meshgrid(x, y)
        
        # Calculamos los valores de las funciones en la malla
        Z1 = f1(X, Y)
        Z2 = f2(X, Y)
        
        # Graficamos las curvas de nivel
        plt.figure(figsize=(8, 6))
        plt.contour(X, Y, Z1, levels=[0], colors='blue', label='$\sin(x) + y^2 - 1 = 0$')
        plt.contour(X, Y, Z2, levels=[0], colors='red', label='$x + \cos(y) - 1 = 0$')
        plt.xlabel('x')
        plt.ylabel('y')
        plt.title('Curvas de nivel del sistema de ecuaciones')
        plt.grid()
        plt.legend()
        plt.show()
        ```
        
        b) Aproximación de la solución

```{python}
#| code-fold: true

# Definimos el sistema de ecuaciones
def sistema(vars):
  x, y = vars
eq1 = np.sin(x) + y**2 - 1
eq2 = x + np.cos(y) - 1
return [eq1, eq2]

# Aproximamos la solución
sol = fsolve(sistema, [0.5, 0.5])  # Punto inicial [0.5, 0.5]
print(f"Solución: x = {sol[0]}, y = {sol[1]}")
```

:::
  
  ::: {#exr-tarea1_9}
    Para el siguiente sistema de ecuaciones no lineal:
      
      ```{python}  
  #| code-fold: true
  #| fig-align: "center"
    
    # Definimos las funciones
    def f1(x, y):
      return x**3 + y - 6
    
    def f2(x, y):
      return y**3 - x - 4
    
    # Creamos una malla de puntos para graficar
    x = np.linspace(-3, 3, 400)
    y = np.linspace(-3, 3, 400)
    X, Y = np.meshgrid(x, y)
    
    # Calculamos los valores de las funciones en la malla
    Z1 = f1(X, Y)
    Z2 = f2(X, Y)
    
    # Graficamos las curvas de nivel
    plt.figure(figsize=(8, 6))
    plt.contour(X, Y, Z1, levels=[0], colors='blue', label='$x^3 + y - 6 = 0$')
    plt.contour(X, Y, Z2, levels=[0], colors='red', label='$y^3 - x - 4 = 0$')
    plt.xlabel('x')
    plt.ylabel('y')
    plt.title('Curvas de nivel del sistema de ecuaciones')
    plt.grid()
    plt.legend()
    plt.show()
    ```
    
    b) Aproximación de la solución usando

```{python} 
#| code-fold: true

# Definimos el sistema de ecuaciones
def sistema(vars):
  x, y = vars
eq1 = x**3 + y - 6
eq2 = y**3 - x - 4
return [eq1, eq2]

# Aproximamos la solución
sol = fsolve(sistema, [1.5, 1.5])  # Punto inicial [1.5, 1.5]
print(f"Solución: x = {sol[0]}, y = {sol[1]}")
```

::: {#exr-tarea1_10}
  Consideraremos un sistema de ecuaciones no lineal para describir un modelo de equilibrio económico.
  
  ```{python}
  # Importar las bibliotecas necesarias
  import matplotlib.pyplot as plt
  import numpy as np
  from scipy.optimize import fsolve
  
  # Definir las funciones de demanda y oferta
  def demanda(p):
    """
    Función de demanda no lineal.
    q_d = 150 - 8p^2
    """
  return 150 - 8 * p**2
  
  def oferta(p):
    """
    Función de oferta no lineal.
    q_s = 3p^3 + 20
    """
  return 3 * p**3 + 20
  
  # Crear un rango de precios para graficar
  p = np.linspace(0, 5, 400)  # Rango de precios de 0 a 5
  q_d = demanda(p)            # Cantidad demandada
  q_s = oferta(p)             # Cantidad ofrecida
  
  # Graficar las curvas de demanda y oferta
  plt.figure(figsize=(8, 6))
  plt.plot(p, q_d, color='blue', label='Demanda: $q_d = 150 - 8p^2$')
  plt.plot(p, q_s, color='red', label='Oferta: $q_s = 3p^3 + 20$')
  plt.xlabel('Precio (p)')
  plt.ylabel('Cantidad (q)')
  plt.title('Curvas de demanda y oferta')
  plt.grid()
  plt.legend()
  plt.show()
  
  # Definir el sistema de ecuaciones para el equilibrio
  def equilibrio(vars):
    """
    Sistema de ecuaciones para el equilibrio:
    q + 8p^2 - 150 = 0  (Demanda)
    q - 3p^3 - 20 = 0   (Oferta)
    """
  q, p = vars
  eq1 = q + 8 * p**2 - 150  # Ecuación de demanda
  eq2 = q - 3 * p**3 - 20   # Ecuación de oferta
  return [eq1, eq2]
  
  # Aproximar el punto de equilibrio usando fsolve
  sol = fsolve(equilibrio, [100, 3])  # Punto inicial [q=100, p=3]
  print(f"Punto de equilibrio: q = {sol[0]}, p = {sol[1]}")
  ```
  :::