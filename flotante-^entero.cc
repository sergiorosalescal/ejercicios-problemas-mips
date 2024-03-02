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

int main() {
  double base_potencia;
  int exponente_potencia;
  std::cout << "Introduzca la base de su potencia (numero flotante): ";
  std::cin >> base_potencia;
  std::cout << "Introduzca el exponente de su potencia (numero entero): ";
  std::cin >> exponente_potencia;
  while (exponente_potencia < 0) {
    std::cout << "El exponente de su pootencia no puede ser negativo, repita.";
    std::cout << "Introduzca el exponente de su potencia (numero entero): ";
    std::cin >> exponente_potencia;
  }
  double potencia_final{1};
  if (exponente_potencia == 0) {
    potencia_final = 1;
  }
  while (exponente_potencia > 0) {
    potencia_final *= base_potencia;
    --exponente_potencia;
  }
  std::cout << "La potencia de " << base_potencia << " es igual a " <<
potencia_final << std::endl;
}
