#/**
# * Universidad de La Laguna
# * Escuela Superior de Ingeniería y Tecnología
# * Grado en Ingeniería Informática
# * Informática Básica 2023-2024 
# *
# * @file binary-to-decimal.cc
# * @author Sergio Rosales Calzadilla alu010635590@ull.edu.es
# * @date Oct 25 2023
# * @brief The program pass a binary to a decimal number
# * @bug There are no known bugs
#*/

##include <iostream>

#const double kPi{3.14159265358979};

#int main() {
#  std::cout << "¿Quieres saber el area y el perimetro fede un circulo dado su radio?" << std::endl;
#  std::cout << "Introduzca tu radio en centimetros: ";
#  double radio_circulo{0.0};
#  std::cin >> radio_circulo;
#  double area{kPi * (radio_circulo * radio_circulo)};
#  double perimetro{kPi * radio_circulo};
#  std::cout << "El area de tu circulo es: " << area << std::endl;
#  std::cout << "El permitro de tu circulo es: " << perimetro << std::endl;
#}

# Asignacion de variables a registros
# radio_circulo ->  $f20
# area     ->  $f22
# perimetro  ->  $f24
# kPi -> $f26

    .data

titulo:		.asciiz "¿Quieres saber el area y el perimetro fede un circulo dado su radio?\n"
pet:		.asciiz "\nIntroduzca tu radio en centimetros: "
area:		.asciiz "\nEl area de tu circulo es: "
perimetro:		.asciiz "\nEl permitro de tu circulo es(expresado en enteros): "
kPi:      .double 3.14159265358979

    .text
main:
#int main() {
#  std::cout << "¿Quieres saber el area y el perimetro fede un circulo dado su radio?" << std::endl;
    li $v0,4
    la $a0,titulo
    syscall
#  std::cout << "Introduzca tu radio en centimetros: ";
    li $v0,4
    la $a0,pet
    syscall
#  double radio_circulo{0.0};
#  std::cin >> radio_circulo;
    li $v0,7
    syscall
    mov.d $f20,$f0
#  double area{kPi * (radio_circulo * radio_circulo)};
    l.d $f26,kPi
    mul.d $f22,$f20,$f20
    mul.d $f22,$f22,$f26
#  double perimetro{kPi * radio_circulo};
    mul.d $f24,$f26,$f20
#  std::cout << "El area de tu circulo es: " << area << std::endl;
    li $v0,4
    la $a0,area
    syscall
    li $v0,3
    mov.d $f12,$f22
    syscall
#  std::cout << "El permitro de tu circulo es: " << perimetro << std::endl;
    li $v0,4
    la $a0,perimetro
    syscall
    cvt.w.d $f10,$f24
    mfc1 $s0,$f10
    li $v0,1
    li $a0,$s0
    syscall
#}
    li $v0,10
    syscall