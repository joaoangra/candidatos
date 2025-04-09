import 'dart:io';

class Candidato {
  //Atributos
  int id = 0;
  String nome = '';
  int votos = 0;
  double? porcentagem;

  //Métodos
  //Construtor
  Candidato(this.id, this.nome, this.votos, [this.porcentagem]);

  @override
  String toString() {
    return '|$id|$nome|$votos|$porcentagem|';
  }
}

class Eleicao {
    //Atributos
    int id = 0;
    String nome = '';
    List<Candidato> candidatos = [];
   
   //Métodos
    Eleicao(this.id, this.nome);

    votosTotal() {
        int total = 0;
        for (var candidato in candidatos) {
            total += candidato.votos;
        }
        return total;
    }

    calcularPorcentagem(){
        for (var candidato in candidatos) {
            candidato.porcentagem = (candidato.votos / votosTotal()) * 100;
        }
    }

    addCandidato(Candidato candidato){
        candidatos.add(candidato);
        calcularPorcentagem();
    }

    removeCandidato(int id){
        candidatos.removeWhere((candidato) => candidato.id == id);
        calcularPorcentagem();
    }

    @override
    String toString() {
        return '{id: $id, nome: $nome, candidatos: $candidatos}';
    }
}

void main(){
    Eleicao eleicao = Eleicao(1, 'Representante de turma');
    int menu = 0;
    while (menu != 4){
        print('1 - Adicionar candidato\n2 - Remover candidato\n3 - Mostrar resultados\n4 - Sair');
        menu = int.parse(stdin.readLineSync()!);
        switch (menu) {
            case 1:
                int id = eleicao.candidatos.isEmpty ? 1 : eleicao.candidatos[eleicao.candidatos.length - 1].id + 1;
                print('Digite o nome do candidato: ');
                String nome = stdin.readLineSync()!;
                print('Digite a quantidade de votos do candidato: ');
                int votos = int.parse(stdin.readLineSync()!);
                Candidato candidato = Candidato(id, nome, votos);
                eleicao.addCandidato(candidato);
                break;
            case 2:
                print('Digite o id do candidato: ');
                int id = int.parse(stdin.readLineSync()!);
                eleicao.removeCandidato(id);
                break;
            case 3:
                for (var candidato in eleicao.candidatos) {
                    print(candidato);
                }
                break;
            case 4:
                print('Saindo...');
                break;
            default:
                print('Opção inválida!');
        }
    }
}