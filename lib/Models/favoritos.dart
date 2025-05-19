class Favoritos {
  int? cod_fav;
  int? cod_consumidor;
  int? cod_provedor;
  int? star;

  Favoritos({
    this.cod_fav,
    this.cod_consumidor,
    this.cod_provedor,
    this.star,
  });

  Favoritos.fromJson(Map<String, dynamic> json) {
    cod_fav = json['cod_fav'] as int?;
    cod_consumidor = json['cod_consumidor'] as int?;
    cod_provedor = json['cod_provedor'] as int?;
    star = json['star'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod_fav'] = this.cod_fav != null ? this.cod_fav : 0;
    data['cod_consumidor'] =
        this.cod_consumidor != null ? this.cod_consumidor : 0;
    data['cod_provedor'] = this.cod_provedor != null ? this.cod_provedor : 0;
    data['star'] = this.star != null ? this.star : 0;
    return data;
  }
}
