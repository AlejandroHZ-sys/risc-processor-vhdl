# risc-processor-vhdl
Educational RISC processor implemented in VHDL with Harvard architecture and basic instruction set

## 📌 Descripción
Diseño e implementación de un procesador RISC educativo en VHDL,
desarrollado como proyecto final de la materia Arquitectura de Computadoras.
El objetivo del proyecto fue comprender el funcionamiento interno de un CPU
a nivel de hardware, incluyendo control, datapath, pila y control de flujo.

## 🧠 Arquitectura
- Tipo: RISC
- Inspiración: AVR (arquitectura educativa)
- Memoria: Harvard
- Control: Cableado (no microprogramado)
- Ejecución: Monociclo
- Tamaño de instrucción: 16 bits
- Tamaño de datos: 8 bits
- Banco de registros: 32 registros

## ⚙️ Componentes Principales
- Program Counter (PC)
- Memoria de instrucciones (ROM)
- Banco de registros
- Unidad Aritmético-Lógica (ALU)
- Registro de estado (SREG)
- Stack Pointer
- Memoria RAM para pila
- Unidad de control (decodificador)
- Extensión de signo para saltos
- Puertos de salida PORTB y PORTD

## 🧾 Conjunto de Instrucciones Implementadas

### Aritméticas y Lógicas
ADD, SUB, CP, AND, OR, EOR, COM, INC, DEC

### Desplazamiento
LSL, LSR

### Transferencia de Datos
MOV, LDI

### Control de Flujo
RJMP, RCALL, RET, BREQ, BRNE

### Entrada / Salida
OUT PORTB, OUT PORTD

## 🧩 Organización Interna
El diseño separa claramente el datapath y la unidad de control.
Las señales de control se generan directamente a partir del opcode
mediante un decodificador cableado.

Se implementa soporte para llamadas a subrutinas utilizando
un Stack Pointer y memoria RAM.

## 🛠 Tecnologías
- VHDL
- Quartus
- Simulación digital

## 📌 Alcance
Este procesador fue diseñado con fines educativos.
No implementa pipeline, interrupciones ni microprogramación.

## 📌 Estado del Proyecto
Finalizado (proyecto académico)
