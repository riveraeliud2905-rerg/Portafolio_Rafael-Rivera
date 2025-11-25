Algoritmo ConvertirHoras_Simple
    // Variables principales
    Definir hora_entrada Como Cadena
    Definir horas, minutos, hora_12 Como Entero
    Definir periodo Como Cadena
    Definir seguir Como Cadena
    
    // Mensaje de bienvenida
    Escribir "=== CONVERSOR DE HORAS 24H A 12H ==="
    Escribir "Formato: HH:MM (ejemplo: 13:45)"
    Escribir ""
    
    Repetir
        // PASO 1: Pedir la hora al usuario
        Escribir Sin Saltar "Ingrese la hora (HH:MM): "
        Leer hora_entrada
        
        // PASO 2: Verificar que tenga exactamente 5 caracteres
        Si Longitud(hora_entrada) = 5 Entonces
            
            // PASO 3: Verificar que tenga ":" en la posición 3
            Si Subcadena(hora_entrada, 3, 3) = ":" Entonces
                
                // PASO 4: Extraer las horas y minutos
                horas <- ConvertirANumero(Subcadena(hora_entrada, 1, 2))
                minutos <- ConvertirANumero(Subcadena(hora_entrada, 4, 5))
                
                // PASO 5: Verificar que estén en rango válido
                Si (horas >= 0 Y horas <= 23) Y (minutos >= 0 Y minutos <= 59) Entonces
                    
                    // PASO 6: Convertir a formato 12 horas
                    Si horas = 0 Entonces
                        // Medianoche: 00:XX = 12:XX am
                        hora_12 <- 12
                        periodo <- "am"
                    SiNo
                        Si horas < 12 Entonces
                            // Mañana: 01:XX a 11:XX = misma hora am
                            hora_12 <- horas
                            periodo <- "am"
                        SiNo
                            Si horas = 12 Entonces
                                // Mediodía: 12:XX = 12:XX pm
                                hora_12 <- 12
                                periodo <- "pm"
                            SiNo
                                // Tarde/Noche: 13:XX a 23:XX = hora-12 pm
                                hora_12 <- horas - 12
                                periodo <- "pm"
                            FinSi
                        FinSi
                    FinSi
                    
                    // PASO 7: Mostrar el resultado
                    Escribir ""
                    Escribir "Entrada: ", hora_entrada
                    Escribir "Salida: ", hora_12, ":", minutos, " ", periodo
                    
                SiNo
                    Escribir "Error: Horas deben ser 00-23 y minutos 00-59"
                FinSi
            SiNo
                Escribir "Error: Use el formato HH:MM (con dos puntos)"
            FinSi
        SiNo
            Escribir "Error: Debe ingresar exactamente 5 caracteres"
        FinSi
        
        // Preguntar si continuar
        Escribir ""
        Escribir Sin Saltar "¿Convertir otra hora? (s/n): "
        Leer seguir
        
    Hasta Que seguir <> "s" Y seguir <> "S"
    
    Escribir "¡Gracias por usar el conversor!"
    
FinAlgoritmo