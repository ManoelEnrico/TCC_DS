/*
Expansion card
https://www.geeksforgeeks.org/flutter-expansion-card/
*/ 
class Provedor{
  int? cod_provedor;
  String? email_provedor;
  String? nome_provedor;
  String? senha_provedor;
  String? cidade_provedor;
  String? cpf_provedor;
  String? bairro;
  String? servico;
  String? descricao;
  String? preco;
  String? data_hora;
  String? telefone;

  Provedor({
    this.cod_provedor,
    this.email_provedor,
    this.nome_provedor,
    this.senha_provedor,
    this.cidade_provedor,
    this.cpf_provedor,
    this.bairro,
    this.servico,
    this.descricao,
    this.preco,
    this.data_hora,
    this.telefone
  });

  Provedor.fromJson(Map<String,dynamic>json){
    cod_provedor = json['cod_provedor'] as int?;
    email_provedor = json['email_provedor'];
    nome_provedor = json['nome_provedor'];
    senha_provedor = json['senha_provedor'];
    cidade_provedor = json['cidade_provedor'];
    cpf_provedor = json['cpf_provedor'];
    bairro = json['bairro'];
    servico = json['servico'];
    descricao = json['descricao'];
    preco = json['preco'];
    data_hora = json['data_hora'];
    telefone = json['telefone'];
  }

  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['cod_provedor'] = this.cod_provedor != null ? this.cod_provedor:0;
    data['email_provedor'] = this.email_provedor;
    data['nome_provedor'] = this.nome_provedor;
    data['senha_provedor'] = this.senha_provedor;
    data['cidade_provedor'] = this.cidade_provedor;
    data['cpf_provedor'] = this.cpf_provedor;
    data['bairro'] = this.bairro;
    data['servico'] = this.servico;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['data_hora'] = this.data_hora;
    data['telefone'] = this.telefone;
    return data;
  }
}