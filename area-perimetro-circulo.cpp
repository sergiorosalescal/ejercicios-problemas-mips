/**
 * Universidad de La Laguna
 * Escuela Superior de Ingeniería y Tecnología
 * Grado en Ingeniería Informática
 * Informática Básica 2023-2024 
 *
 * @file binary-to-decimal.cc
 * @author Sergio Rosales Calzadilla alu010635590@ull.edu.es
 * @date Oct 25 2023
 * @brief The program pass a binary to a decimal number
 * @bug There are no known bugs
*/

#include <iostream>

const double kPi{3.14159265358979};

int main() {
  std::cout << "¿Quieres saber el area y el perimetro fede un circulo dado su radio?" << std::endl;
  std::cout << "Introduzca tu radio en centimetros: ";
  double radio_circulo{0.0};
  std::cin >> radio_circulo;
  double area{kPi * (radio_circulo * radio_circulo)};
  double perimetro{kPi * radio_circulo};
  std::cout << "El area de tu circulo es: " << area << std::endl;
  std::cout << "El permitro de tu circulo es: " << perimetro << std::endl;
}