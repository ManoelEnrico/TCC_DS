class Consumidor{
  int? cod_consumidor;
  String? email_consumidor;
  String? nome_consumidor;
  String? senha_consumidor;
  String? cpf_consumidor;

  Consumidor({
    this.cod_consumidor,
    this.email_consumidor,
    this.nome_consumidor,
    this.senha_consumidor,
    this.cpf_consumidor,
  });

  Consumidor.fromJson(Map<String,dynamic>json){
    cod_consumidor = json['cod_consumidor'] as int?;
    email_consumidor = json['email_consumidor'];
    nome_consumidor = json['nome_consumidor'];
    senha_consumidor = json['senha_consumidor'];
    cpf_consumidor = json['cpf_consumidor'];
  }

  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['cod_consumidor'] = this.cod_consumidor != null ? this.cod_consumidor:0;
    data['email_consumidor'] = this.email_consumidor;
    data['nome_consumidor'] = this.nome_consumidor;
    data['senha_consumidor'] = this.senha_consumidor;
    data['cpf_consumidor'] = this.cpf_consumidor;
    return data;
  }
}
