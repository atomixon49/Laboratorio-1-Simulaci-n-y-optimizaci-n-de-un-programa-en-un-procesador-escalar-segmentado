.data
    prompt1: .asciiz "Digite el primer número: "
    prompt2: .asciiz "Digite el segundo número: "
    prompt3: .asciiz "Digite el tercer número: "
    mayor_msg: .asciiz "El número mayor es: "

.text
.globl main

main:
    # Pedir el primer número
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el primer número en $t0

    # Pedir el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # Guardar el segundo número en $t1

    # Pedir el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0  # Guardar el tercer número en $t2

    # Encontrar el número mayor
    move $t3, $t0  # Inicialmente, $t3 contiene el primer número
    bgt $t1, $t3, mayor_es_t1  # Si $t1 es mayor que $t3, ir a mayor_es_t1
    bgt $t2, $t3, mayor_es_t2  # Si $t2 es mayor que $t3, ir a mayor_es_t2
    j imprimir_mayor  # Si llegamos aquí, $t3 contiene el mayor

mayor_es_t1:
    move $t3, $t1  # $t3 contiene el segundo número ($t1)
    bgt $t2, $t3, mayor_es_t2  # Si $t2 es mayor que $t3, ir a mayor_es_t2
    j imprimir_mayor  # Si llegamos aquí, $t3 contiene el mayor

mayor_es_t2:
    move $t3, $t2  # $t3 contiene el tercer número ($t2)

imprimir_mayor:
    li $v0, 4
    la $a0, mayor_msg
    syscall
    li $v0, 1
    move $a0, $t3
    syscall
    li $v0, 10
    syscall