.data
    msg1: .asciiz "Ingrese el número de términos de la serie de Fibonacci: "
    msg2: .asciiz "La serie de Fibonacci es: "
    newline: .asciiz "\n"

.text
.globl main

main:
    # Pedir el número de términos
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el número de términos en $t0

    # Imprimir el mensaje
    li $v0, 4
    la $a0, msg2
    syscall

    li $t1, 0  # Inicializar el primer término a 0
    li $t2, 1  # Inicializar el segundo término a 1

    # Imprimir los dos primeros términos
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    addi $t0, $t0, -2  # Restar 2 al número de términos (ya se imprimieron los primeros dos)
    ble $t0, $zero, exit  # Si no quedan más términos, terminar

loop:
    move $t3, $t2  # $t3 = $t2 (el siguiente término es la suma de los dos anteriores)
    add $t3, $t3, $t1  # $t3 = $t2 + $t1

    # Imprimir el siguiente término
    li $v0, 1
    move $a0, $t3
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    move $t1, $t2  # Actualizar $t1 con el valor anterior de $t2
    move $t2, $t3  # Actualizar $t2 con el valor de $t3

    addi $t0, $t0, -1  # Decrementar el contador de términos
    bgt $t0, $zero, loop  # Si quedan más términos, continuar loop

exit:
    li $v0, 10
    syscall