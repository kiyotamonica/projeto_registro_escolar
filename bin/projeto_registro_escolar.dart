
import 'dart:io';

void main() {
  List <String> alunos = <String>[];
  List <List<double>> notas = []; //Uma lista que armazena itens de tipo lista tbm - um aluno pode ter mais de 1 nota

  print("Projeto de Registro Escolar !\n");
  menu(alunos, notas);
}

void registraNotasAlunos(List<String> alunos, List<List<double>> notas){
  String? nomeAluno = "";

  print("Digite o nome do aluno:");
  nomeAluno = stdin.readLineSync();
  
  if (nomeAluno != null){
    alunos.add(nomeAluno);
    
    List<double> notasAluno = [];

    while(true){
      print("Digite uma nota para o aluno $nomeAluno (ou 'fim' para encerrar):");
      String? entrada = stdin.readLineSync();

      if(entrada == 'fim' || entrada == 'Fim' || entrada == 'FIM'){
        break;
      }else if(entrada != null){
        double nota = double.parse(entrada);
        notasAluno.add(nota);
      }
    }

    notas.add(notasAluno);
  }else{
    print("Esse é um nome inválido !");
  }
}

double calculaMediaNotas(List<double> notas){
  double soma = 0;

  for(double nota in notas){
    soma += nota;
  }
  return soma/notas.length;
}

void listarAlunosENotas(List<String> alunos,List<List<double>> notas){
  print("Lista de alunos e suas respectivas médias:");
  for(int i=0; i<alunos.length;i++){
    double media = calculaMediaNotas(notas[i]);
    print("${alunos[i]}: ${media.toStringAsFixed(2)}");
  }
}

void menu(List<String> alunos, List<List<double>> notas){
  String? escolha = '';
  while(escolha != 'sair'){
    print("Escolha a opção desejada:\n -> Registrar\n -> Listar alunos e médias\n -> Sair");
    escolha = stdin.readLineSync();

    if(escolha != null){
      escolha = escolha.toLowerCase();
    }

    switch(escolha){
      case 'registrar':
        registraNotasAlunos(alunos, notas);
        break;
      
      case 'listar':
        listarAlunosENotas(alunos, notas);
        break;

      case 'sair':
        break;

      default:
        print("Opção inválida !");
    }
  }
}