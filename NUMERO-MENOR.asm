.data

    msg2: .asciiz "Ingrese el siguiente número (0 para terminar): "
    msg3: .asciiz "El número menor es: "

.text
.globl main

main:
    # Pedir el primer número
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el primer número en $t0

    # $t0 almacenará el número menor
    # $t1 será el contador de números ingresados

loop:
    li $t1, 1  # Inicializar el contador a 1 (ya se ingresó el primer número)

    # Pedir el siguiente número
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    beq $v0, $zero, exit  # Si el usuario ingresa 0, terminar

    move $t2, $v0  # Mover el número ingresado a $t2

    blt $t2, $t0, menor  # Si $t2 < $t0, ir a menor
    j loop  # De lo contrario, continuar loop

menor:
    move $t0, $t2  # Actualizar $t0 con el nuevo menor
    addi $t1, $t1, 1  # Incrementar el contador de números ingresados
    j loop

exit:
    # Imprimir el mensaje y el número menor
    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 10
    syscall