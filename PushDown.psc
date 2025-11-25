// En PSeInt, los arreglos tienen tamaño fijo.
// Debemos simular el "push" llevando un control
// de cuántos elementos hemos guardado.

Proceso EjemploPushDown
    // Definimos un arreglo grande (ej. 10 espacios)
    Dimension miVector[10]
    
    // Esta variable nos dice cuántos elementos REALES hay
    Definir tamano_actual Como Entero
    tamano_actual = 1
    
    // --- Hacemos "Push Down" del valor 42 --
    Si tamano_actual < 10 Entonces // Verificamos si hay espacio
        miVector[tamano_actual] = 42
        tamano_actual = tamano_actual + 1 // Incrementamos el contador
        Escribir "Elemento 42 agregado."
    SiNo
        Escribir "El arreglo está lleno."
    FinSi
    
    // --- Hacemos "Push Down" del valor 99 ---
    Si tamano_actual < 10 Entonces
        miVector[tamano_actual] = 99
        tamano_actual = tamano_actual + 1
        Escribir "Elemento 99 agregado."
    SiNo
        Escribir "El arreglo está lleno."
    FinSi
    
    // El vector ahora tiene [42, 99] y tamano_actual es 2
    Escribir "El primer elemento (índice 1) es: ", miVector[1]
    Escribir "El segundo elemento (índice 2) es: ", miVector[2]
    Escribir "Tamaño actual de elementos: ", tamano_actual
FinProceso