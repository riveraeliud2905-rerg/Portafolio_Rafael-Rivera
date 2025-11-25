// --- Función de Búsqueda ---
// Devuelve el índice (base 0) o -1 si no lo encuentra
Funcion indice_encontrado <- BusquedaSecuencial(vector, tamano, valor_buscado)
    Definir indice_encontrado, i Como Entero
    
    indice_encontrado = -1 // Valor por defecto (no encontrado)
    i = 1
    
    // Mientras no lleguemos al final Y no lo hayamos encontrado
    Mientras i < tamano Y indice_encontrado == -1 Hacer
        Si vector[i] == valor_buscado Entonces
            indice_encontrado = i // ¡Encontrado! Guardamos el índice
        FinSi
        i = i + 1
    FinMientras
FinFuncion

// --- Algoritmo Principal (Ejemplo de uso) ---
Proceso Principal
    // Configurar PSeInt para usar índices base 0
    Dimension numeros[4]
    numeros[1] = 10
    numeros[2] = 30
    numeros[3] = 5
    numeros[4] = 15
    
    Definir posicion Como Entero
    posicion = BusquedaSecuencial(numeros, 4, 5) // Buscar el número 5
    
    Escribir "El valor 5 se encuentra en el índice: ", posicion // Mostrará 2
FinProceso