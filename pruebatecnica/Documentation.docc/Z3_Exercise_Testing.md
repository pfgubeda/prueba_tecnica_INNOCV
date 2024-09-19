# Ejercicio 3: Testing unitario

En este ejercicio vamos a trabajar con XCTest aplicando testing unitario

## Objetivos

En este ejercicio tendrás que realizar rellenar dos implementaciones:
- Completar la implementación de la clase _Exercise3InteractorDefault_
- Completar la implementación del test _Exercise3InteractorTest_
- Realizar una cobertura de testing del 100% (sin contar el _init_ de la clase) para validar que el código cumple con las siguientes características:

    - Si el repositorio genera un error Exercise3RepositoryError.httpError(code) => el interactor debe devolver un error Exercise3Result con el mensaje "Error http <El_código_http_recibido_del_repositorio>"
    - Si el repositorio genera cualquier otro tipo de error => el interactor genera un error con el mensaje "Ha ocurrido un error inesperado".
    - Si el repositorio devuelve usuarios => el interactor debe devolver un array de String con los nombres de los mismos. 

> Tip: Te dejamos implementadas en el bundle de test (por si te son de ayuda) tres implementaciones "fake" con los tres casos arriba indicados:
    - __`Exercise3RepositoryUsers`__ que devuelve una lista de usuarios;
    - __`Exercise3RepositoryNoUsersError`__ que devuelve el error de que no hay usuarios;
    - __`Exercise3RepositoryHttpError`__ que devuelve un error http.

> Tip: Adicionalmente dispones de una extension de `XCTest` con el método `runAsyncTest` que te puede facilitar la implementación de los test unitarios. La definición y ejemplos del mismo se encuentran en el código.
