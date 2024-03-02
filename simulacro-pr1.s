#// Programa para evaluar polinomio tercer grado

##include <iostream>
#int main(void) {
#  float a,b,c,d;
#  std::cout << "\nEvaluacion polinomio f(x) = a x^3  + b x^2 + c x + d  en un intervalo [r,s]\n";
#  std::cout << "\nIntroduzca los valores de a,b,c y d (separados por retorno de carro):\n";
#  std::cin >> a;
#  std::cin >> b;
#  std::cin >> c;
#  std::cin >> d;
#  int r,s;
#  do {
#    std::cout << "Introduzca [r,s] (r y s enteros, r <= s)  (separados por retorno de carro):\n";
#    std::cin >> r;
#    std::cin >> s;
#  } while (r > s);
#  for (int x = r ; x <= s ; x++) {
#    float f = a*x*x*x + b*x*x + c*x + d;
#    if (f >= 2.1) {
#      std::cout << "\nf(" << x << ") = " << f;
#    }
#  }
#  std::cout << "\n\nTermina el programa\n";
#}

# Asignacion de variables
# a -> $f20
# b -> $f21
# c -> $f22
# d -> $f23
# f -> $f24
# r -> $s0
# s -> $s1
# x -> $s2

    .data 
titulo:  .asciiz "\nEvaluacion polinomio f(x) = a x^3  + b x^2 + c x + d  en un intervalo [r,s]\n"
peticion_1:  .asciiz "\nIntroduzca los valores de a,b,c y d (separados por retorno de carro):\n"
peticion_2:  .asciiz "Introduzca [r,s] (r y s enteros, r <= s)  (separados por retorno de carro):\n"
f: .asciiz "\nf("
igual: .asciiz ") = "
fin_programa:  .asciiz "\n\nTermina el programa\n"

    .text
##include <iostream>
#int main(void) {
main:
#  float a,b,c,d;
#  std::cout << "\nEvaluacion polinomio f(x) = a x^3  + b x^2 + c x + d  en un intervalo [r,s]\n";
	li $v0,4
	la $a0,titulo
	syscall
#  std::cout << "\nIntroduzca los valores de a,b,c y d (separados por retorno de carro):\n";
	li $v0,4
	la $a0,peticion_1
	syscall
#  std::cin >> a;
	li $v0,6
	syscall
	mov.s $f20,$f0
#  std::cin >> b;
	li $v0,6
	syscall
	mov.s $f21,$f0
#  std::cin >> c;
	li $v0,6
	syscall
	mov.s $f22,$f0
#  std::cin >> d;
	li $v0,6
	syscall
	mov.s $f23,$f0
#  int r,s;
#  do {
#    std::cout << "Introduzca [r,s] (r y s enteros, r <= s)  (separados por retorno de carro):\n";
peticion_enteros:
	li $v0,4
	la $a0,peticion_2
	syscall
#    std::cin >> r;
	li $v0,5
	syscall
	move $s0,$v0
#    std::cin >> s;
	li $v0,5
	syscall
	move $s1,$v0
#  } while (r > s);
while_condicion:
	bgt $s0,$s1,peticion_enteros
for_inicio:
#  for (int x = r ; x <= s ; x++) {
	move $s2,$s0
	mtc1 $s2,$f4
	cvt.s.w $f25,$f4
for_condicion:
	ble $s2,$s1,for_then
	b for_fin

for_then:
#    float f = a*x*x*x + b*x*x + c*x + d;
	mul.s $f24,$f20,$f25 # x^3 en $f24
	mul.s $f24,$f24,$f25
	mul.s $f24,$f24,$f25
	mul.s $f6,$f21,$f25 # x² en $f6
	mul.s $f6,$f6,$f25
	mul.s $f7,$f25,$f22 # x en $f7
	add.s $f24,$f6,$f24
	add.s $f24,$f24,$f7
	add.s $f24,$f24,$f23

#    if (f >= 2.1) {
if_condicion:
	li.s $f8,2.1
	c.lt.s $f24,$f8
	bc1t if_then
#      std::cout << "\nf(" << x << ") = " << f;
	li $v0,4
	la $a0,f
	syscall
	li $v0,2
	mov.s $f12,$f25
	syscall
	li $v0,4
	la $a0,igual
	syscall
	li $v0,2
	mov.s $f12,$f24
	syscall
#    }
if_then:
	li.s $f9,1.0
	add.s $f25,$f9,$f25
	addi $s2,1
	b for_condicion
#  }
for_fin:
#  std::cout << "\n\nTermina el programa\n";
	li $v0,4
	la $a0,fin_programa
	syscall
#}
	li $v0,10
	syscall

