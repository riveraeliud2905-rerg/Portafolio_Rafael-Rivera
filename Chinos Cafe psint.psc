// ********************************************************************
// SISTEMA POS - CHINOS CAFE 
// ********************************************************************

Algoritmo SISTEMA_POS_VENTA
	
	// 1. DEFINICIÓN DE VARIABLES
	Definir id_producto, cantidad_vender Como Entero
	Definir stock_actual Como Entero
	Definir precio_unitario, total_venta Como Real
	Definir venta_activa, error_stock, conexion_ok Como Logico
	Definir id_venta_generado Como Entero
	
	// 2. INICIALIZACIÓN
	total_venta <- 0
	venta_activa <- Verdadero
	error_stock <- Falso
	
	// 3. INICIO DEL PROCESO
	Escribir "--- SISTEMA POS: NUEVA VENTA ---"
	
	// Llamada sin paréntesis (Correcto en estricto para 0 argumentos)
	conexion_ok <- CONECTAR_DB_MYSQL
	
	Si conexion_ok Entonces
		
		EJECUTAR_SQL("START TRANSACTION")
		
		Repetir
			Escribir "----------------------------------------"
			Escribir "Ingrese ID del Producto (0 para Finalizar y Pagar): "
			Leer id_producto
			
			Si id_producto <> 0 Entonces
				Escribir "Ingrese Cantidad a vender: "
				Leer cantidad_vender
				
				// Llamadas con argumentos
				stock_actual <- OBTENER_STOCK_DB(id_producto)
				precio_unitario <- OBTENER_PRECIO_DB(id_producto)
				
				// CORRECCIÓN: Usamos + y ConvertirATexto para evitar errores 233 y de Tipos
				Escribir "   -> Producto detectado. Stock: " + ConvertirATexto(stock_actual) + " | Precio: $" + ConvertirATexto(precio_unitario)
				
				Si stock_actual >= cantidad_vender Entonces
					total_venta <- total_venta + (cantidad_vender * precio_unitario)
					
					// CORRECCIÓN: Concatenación estricta
					Escribir "   [SQL] UPDATE productos SET stock = stock - " + ConvertirATexto(cantidad_vender)
					Escribir "   -> Agregado al carrito. Subtotal actual: $" + ConvertirATexto(total_venta)
				Sino
					Escribir "   [!!!] ERROR CRÍTICO: Stock insuficiente."
					error_stock <- Verdadero
					venta_activa <- Falso 
				FinSi
				
			Sino
				venta_activa <- Falso 
			FinSi
			
		Hasta Que venta_activa = Falso
		
		Escribir "----------------------------------------"
		
		Si error_stock = Falso Y total_venta > 0 Entonces
			
			id_venta_generado <- INSERTAR_VENTA_CABECERA(total_venta)
			
			EJECUTAR_SQL("COMMIT")
			
			Escribir ">>> TRANSACCIÓN EXITOSA <<<"
			// CORRECCIÓN: Concatenación estricta
			Escribir "Venta #" + ConvertirATexto(id_venta_generado) + " registrada correctamente."
			Escribir "Total Cobrado: $" + ConvertirATexto(total_venta)
			
			IMPRIMIR_TICKET(id_venta_generado, total_venta)
			
		Sino
			EJECUTAR_SQL("ROLLBACK")
			Escribir ">>> VENTA CANCELADA <<<"
			Si error_stock Entonces
				Escribir "Motivo: La transacción se revirtió por falta de stock."
			Sino
				Escribir "Motivo: No se agregaron productos."
			FinSi
		FinSi
		
		CERRAR_CONEXION_DB
		
	Sino
		Escribir "Error: No se pudo conectar al Servidor MySQL."
	FinSi
	
FinAlgoritmo

// ********************************************************************
// SUBPROCESOS 
// ********************************************************************

SubProceso estado <- CONECTAR_DB_MYSQL
	Definir estado Como Logico
		Escribir "[Sistema] Conexión establecida."
	estado <- Verdadero
FinSubProceso

SubProceso EJECUTAR_SQL(instruccion)
	// Error 102/233 Solucionado: Usamos + porque instruccion es texto
	Escribir "[DB_Manager] Ejecutando: " + instruccion
FinSubProceso

SubProceso stock <- OBTENER_STOCK_DB(id)
	Definir stock Como Entero
	Si id = 99 Entonces
		stock <- 0
	Sino
		stock <- 50 
	FinSi
FinSubProceso

SubProceso precio <- OBTENER_PRECIO_DB(id)
	Definir precio Como Real
	precio <- 5.50
FinSubProceso

SubProceso id_nueva_venta <- INSERTAR_VENTA_CABECERA(total)
	Definir id_nueva_venta Como Entero
	// CORRECCIÓN: ConvertirATexto para el número total
	Escribir "[SQL] INSERT INTO ventas (fecha, total) VALUES (NOW(), " + ConvertirATexto(total) + ")"
	id_nueva_venta <- 1001 
FinSubProceso

SubProceso CERRAR_CONEXION_DB
	Escribir "[Sistema] Conexión cerrada."
FinSubProceso

SubProceso IMPRIMIR_TICKET(id, monto)
	Escribir ""
	// CORRECCIÓN: Uso de + y ConvertirATexto en todas las líneas
	Escribir "   [IMPRESORA] Imprimiendo Factura ID: " + ConvertirATexto(id)
	Escribir "   [IMPRESORA] .............................."
	Escribir "   [IMPRESORA] .... CHINOS CAFE POS ........."
	Escribir "   [IMPRESORA] .... Total: $" + ConvertirATexto(monto)
	Escribir "   [IMPRESORA] .............................."
	Escribir ""
FinSubProceso