import 'dart:convert';

Suministro suministroFromJson(String str) =>
    Suministro.fromJson(json.decode(str));

String suministroToJson(Suministro data) => json.encode(data.toJson());

class Suministro {
  Suministro({
    this.suministro,
    this.servicio,
    this.idcategoria,
    this.ruta,
    this.idcliente,
    this.fechaAlta,
    this.idstatus,
    this.uid,
  });

  String? suministro;
  String? servicio;
  String? idcategoria;
  int? ruta;
  int? idcliente;
  DateTime? fechaAlta;
  int? idstatus;
  String? uid;

  factory Suministro.fromJson(Map<String, dynamic> json) => Suministro(
        suministro: json["suministro"],
        servicio: json["servicio"],
        idcategoria: json["idcategoria"],
        ruta: json["ruta"],
        idcliente: json["idcliente"],
        fechaAlta: DateTime.parse(json["fecha_alta"]),
        idstatus: json["idstatus"],
      );

  Map<String, dynamic> toJson() => {
        "suministro": suministro,
        "servicio": servicio,
        "idcategoria": idcategoria,
        "ruta": ruta,
        "idcliente": idcliente,
        "fecha_alta": fechaAlta!.toIso8601String(),
        "idstatus": idstatus,
      };
}
