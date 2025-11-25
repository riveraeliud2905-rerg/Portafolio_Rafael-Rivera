Algoritmo VentasRefrescos_Simple
    // Variables para cada producto
    Definir cant_cola, cant_naranja, cant_limon Como Entero
    Definir precio_cola, precio_naranja, precio_limon Como Real
    Definir total_cola, total_naranja, total_limon, total_general Como Real
    Definir continuar Como Cadena
    
    Escribir "=== SISTEMA DE VENTAS DE REFRESCOS ==="
    Escribir ""
    
    Repetir
        // PASO 1: Recoger datos de COLA
        Escribir "PRODUCTO: COLA"
        Escribir "---------------"
        Escribir Sin Saltar "Cantidad vendida: "
        Leer cant_cola
        
        // Validar máximo 5,000,000
        Si cant_cola > 5000000 Entonces
            Escribir "Error: Máximo 5,000,000 unidades"
            cant_cola <- 5000000
        FinSi
        
        Escribir Sin Saltar "Precio en Balboas: "
        Leer precio_cola
        
        // PASO 2: Recoger datos de NARANJA
        Escribir ""
        Escribir "PRODUCTO: NARANJA"
        Escribir "------------------"
        Escribir Sin Saltar "Cantidad vendida: "
        Leer cant_naranja
        
        Si cant_naranja > 5000000 Entonces
            Escribir "Error: Máximo 5,000,000 unidades"
            cant_naranja <- 5000000
        FinSi
        
        Escribir Sin Saltar "Precio en Balboas: "
        Leer precio_naranja
        
        // PASO 3: Recoger datos de LIMÓN
        Escribir ""
        Escribir "PRODUCTO: LIMÓN"
        Escribir "----------------"
        Escribir Sin Saltar "Cantidad vendida: "
        Leer cant_limon
        
        Si cant_limon > 5000000 Entonces
            Escribir "Error: Máximo 5,000,000 unidades"
            cant_limon <- 5000000
        FinSi
        
        Escribir Sin Saltar "Precio en Balboas: "
        Leer precio_limon
        
        // PASO 4: Calcular totales (con 2 decimales)
        total_cola <- cant_cola * precio_cola
        total_naranja <- cant_naranja * precio_naranja
        total_limon <- cant_limon * precio_limon
        total_general <- total_cola + total_naranja + total_limon
        
        // PASO 5: Mostrar informe de ventas
        Escribir ""
        Escribir "========================================"
        Escribir "          INFORME DE VENTAS"
        Escribir "========================================"
        Escribir "Producto    Ventas     Precio    Total"
        Escribir "----------------------------------------"
        
        // Mostrar cada producto con formato
        Escribir "Cola        ", cant_cola, "      ", precio_cola, "     ", total_cola
        Escribir "Naranja     ", cant_naranja, "      ", precio_naranja, "     ", total_naranja
        Escribir "Limón       ", cant_limon, "      ", precio_limon, "     ", total_limon
        Escribir "----------------------------------------"
        Escribir "TOTAL                          ", total_general
        Escribir "========================================"
        
        // PASO 6: Mostrar resumen detallado
        Escribir ""
        Escribir "RESUMEN DETALLADO:"
        Escribir "Cola: ", cant_cola, " x ", precio_cola, " = ", total_cola
        Escribir "Naranja: ", cant_naranja, " x ", precio_naranja, " = ", total_naranja
        Escribir "Limón: ", cant_limon, " x ", precio_limon, " = ", total_limon
        Escribir "TOTAL GENERAL: B/. ", total_general
        
        // Preguntar si continuar
        Escribir ""
        Escribir Sin Saltar "¿Realizar otro cálculo? (s/n): "
        Leer continuar
        
    Hasta Que continuar <> "s" Y continuar <> "S"
    
    Escribir "¡Gracias por usar el sistema de ventas!"
    
FinAlgoritmo