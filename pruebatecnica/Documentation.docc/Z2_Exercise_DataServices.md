# Ejercicio 2: Servicios de datos

Este ejercicio sirve para valorar tu manejo de capas de datos e implementación de servicios.

## Objetivos

La implementación comienza en el método `load` de la clase `ExerciseDataServicesViewModel`. Estos son los pasos que debes tener en cuenta: 

- Si el servicio da error de algún tipo se devuelve un array sin usuarios.
- Si algún elemento del array no se puede decodificar este __será ignorado__ del array resultado.
- La especificación del servicio es la siguiente:
```
Method: GET
Url: https://hello-world.innocv.com/api/User
Response format:
[
    {
        "id": Int
        "name": "String",
        "birthdate": "yyyy-MM-dd'T'HH:mm:ssZ"
    },
    ...
]
```
- Una vez que hayas cargado los datos recuerda llamar en `ExerciseDataServicesViewModel` a `_users.send(myArrayDeUsuarios)` para que estos se pinten.

> Tip: Tienes disponible (si te es útil) el struct `Safe<Base: Decodable>` para la realización de este ejercicio.

> Nota: No tienes ninguna limitación para la realización de este ejecicio (Alamofire, UrlSession, Combine, RxSwift, async-await ...).

> Nota: De cara a la valoración, se tendrá en cuenta el manejo de threads (que no se quede bloqueado la interfaz mientras se cargar los servicios) así como que realices más de una implementación válida (por ejemplo, una con async-await y otra con Combine, por ejemplo)

## Resultado esperado

Después de llamar a tu implementación del servicio y que conectes la respuesta tal cual se ha indicado se espera un resultado como el siguiente en el ejercicio:

![resultado ejercicio 2](ej2_servicios_de_datos.png)
