import 'dart:io';

void main() {
  final pacientes = [];
  
  print(' Sistema de Classificação para Vacina da Dengue ');
  print('Digite os dados dos pacientes (deixe nome vazio para encerrar)\n');

  while (true) {
    stdout.write('Nome do paciente: ');
    final nome = stdin.readLineSync()?.trim();
    if (nome == null || nome.isEmpty) break;

    int? idade;
    while (idade == null) {
      stdout.write('Idade: ');
      try {
        final input = stdin.readLineSync();
        if (input == null || input.isEmpty) continue;
        idade = int.parse(input);
        if (idade <= 0) {
          print('Idade deve ser positiva');
          idade = null;
        }
      } catch (e) {
        print('Digite uma idade válida');
      }
    }

    String? sexo;
    while (sexo == null) {
      stdout.write('Sexo (M/F): ');
      final input = stdin.readLineSync()?.toUpperCase();
      if (input == 'M' || input == 'F') {
        sexo = input;
      } else {
        print('Digite M para masculino ou F para feminino');
      }
    }

    final apto = (sexo == 'M' && idade >= 14 && idade <= 50) ||
                 (sexo == 'F' && idade >= 20 && idade <= 40);

    pacientes.add({
      'nome': nome,
      'idade': idade,
      'sexo': sexo,
      'apto': apto,
    });

    print('Paciente adicionado!\n');
  }

  print('\n=== Resultados ===');
  for (final paciente in pacientes) {
    print('Nome: ${paciente['nome']}');
    print('Idade: ${paciente['idade']}');
    print('Sexo: ${paciente['sexo'] == 'M' ? 'Masculino' : 'Feminino'}');
    print('Status: ${paciente['apto'] ? 'APTÓ' : 'NÃO APTÓ'}');
    print('---');
  }
}
