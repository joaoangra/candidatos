import 'dart:io';

class Candidato {
  String nome;
  int votos;

  Candidato(this.nome, this.votos);

  @override
  String toString() {
    return '$nome\t$votos';
  }
}

void main() {
  final List<Candidato> candidatos = [];
  
  while (true) {
    print('1 - Adicionar candidato');
    print('2 - Excluir candidato');
    print('3 - Mostrar porcentagem de votos');
    print('4 - Sair');
    
    final opcao = stdin.readLineSync();
    
    switch (opcao) {
      case '1':
        print('Digite o nome do candidato:');
        final nome = stdin.readLineSync() ?? '';
        
        print('Digite a quantidade de votos:');
        final votos = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        
        candidatos.add(Candidato(nome, votos));
        break;
        
      case '2':
        if (candidatos.isEmpty) {
          print('Nenhum candidato cadastrado');
          break;
        }
        
        print('Candidatos disponíveis:');
        for (int i = 0; i < candidatos.length; i++) {
          print('${i + 1} - ${candidatos[i].nome}');
        }
        
        print('Digite o número do candidato a excluir:');
        final index = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        
        if (index > 0 && index <= candidatos.length) {
          candidatos.removeAt(index - 1);
          print('Candidato removido com sucesso');
        } else {
          print('Nenhum candidato excluído');
        }
        break;
        
      case '3':
        if (candidatos.isEmpty) {
          print('Nenhum candidato cadastrado');
          break;
        }
        
        final totalVotos = candidatos.fold(0, (sum, c) => sum + c.votos);
        print('Candidatos\tVotos\tPorcentagem');
        
        bool primeiroTurno = true;
        for (final c in candidatos) {
          final porcentagem = (c.votos / totalVotos * 100);
          print('${c.nome}\t${c.votos}\t${porcentagem.toStringAsFixed(2)}%');
          
          if (porcentagem > 50) {
            print('\nCandidato ${c.nome} ganhou no primeiro turno!');
            primeiroTurno = false;
          }
        }
        
        if (primeiroTurno) {
          print('\n5 - Segundo Turno');
        }
        break;
        
      case '4':
        exit(0);
        
      case '5':
        if (candidatos.length >= 2) {
          print('\n--- SEGUNDO TURNO ---');
          print('O segundo turno será implementada aqui');
        } else {
          print('Número insuficiente de candidatos para segundo turno');
        }
        break;
        
      default:
        print('Opção inválida');
    }
  }
}
