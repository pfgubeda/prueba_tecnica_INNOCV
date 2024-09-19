# Ejercicio 4: Arquitectura

El objetivo de este ejercicio es que nos ayudes a entender como te manejas con las arquitecturas, algunos patrones de diseño y nombrado de archivos. No tendrás que completar tus propias implementaciones, podrás dejarlas vacias pero si tendrás que definir todos los interfaces que requerirán la resolución del ejemplo concreto. 


## Objetivos

Diseña los interfaces, clases, carpetas ... necesarias para completar la lógica de UI, negocio y datos que cumplan los siguientes requisitos:

- Tienes que desplegar un listado de noticias
- Este listado de noticias va a pantalla completa
- La pantalla tiene un título personalizado en base al nombre de la sección de noticias (Actualidad, Deportes, ...)
- Todas las celdas son iguales y pintan siempre una imagen y un título
- El flujo de llegada a la pantalla es el siguiente:
    - Nada más entrar se pinta un spinner y se llama a un servicio que carga las noticias
    - Si el servicio falla se pinta un mensaje en pantalla indicando que no se han podido cargar las noticias. El spinner se quita.
    - Si el servicio no falla pero no devuelve noticias se pinta un mensaje en pantalla indicando que no hay noticias disponibles. El spinner se quita.
    - Si el servicio no falla y hay noticias estás se pintan. El spinner se quita.

__Construye tu solución en la carpeta ExerciseArquitecture__

> Note: Recuerda que puedes utilizar la arquitectura que más te guste o la que mejor veas para solucionar este ejemplo MVC, MVP, MVVM, VIP, VIPER ...

> Note: Deja las implementaciones vacias, lo importante es la definición de las clases y los modelos que consideres necesarios.
