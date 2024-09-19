# Ejercicio 1: UICollectionView

En este ejercicio se valorará tu manejo de pintado de tablas usando UICollectionView.

## Objetivos

El objetivo de este ejercicio es hacer uso de la clase UICollectionView para desplegar un listado de contenidos con las siguientes características:

- En móvil debe aparecer a una sola columna en dispositivos en modo compacto, dos en modo regular.
- En iPad tiene que aparecer a dos columnas.

> Nota: Os recordamos que la propiedad `horizontalSizeClass` de la clase `UITraitCollection` indica si estás en modo compacto o regular

El diseño que debes aplicar para las celdas es el siguiente:

- iPhone14 portrait
![iPhone14Portrait](ej1_iphone_14_portrait.png)

- iPhone14 Pro landscape
![iPhone14Portrait](ej1_iphone_14_pro_max_landscape.png)

- iPad
![iPhone14Portrait](ej1_ipad.png)

Recuerda que tienes todos los recursos necesarios dentro de la carpeta "CollectionViewExercise" de este proyecto (las capas de negocio que obtienen los datos ya se encuentran implementadas)

## Recursos

Empezarás a trabajar en la clase `ExerciseCollectionViewController`. Esta clase tiene ya vinculado un `ExerciseCollectionViewModel` que te ofrece una lista de datos fake a pintar.

Para ayudarte con el pintado te explicamos las medidas y características:
- En el collection view la configuración de las celdas es:
    - Distancia entre celdas: { top, bottom = 8px, left, right = 16px }
    - Altura de las celdas: 128 (altura fija)

- En cuanto a las celdas:
    - Una imagen a tamaño completo para el final
    - Un velo a tamaño completo de la imagen en negro con una opacidad del 35%
    - Un label a máximo dos líneas a una distancia de 16px de los lados y 8 px desde abajo.
