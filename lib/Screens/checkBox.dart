import 'package:flutter/material.dart';

class TesteBox extends StatefulWidget {
  const TesteBox({super.key});

  @override
  State<TesteBox> createState() => _TesteBoxState();
}

class _TesteBoxState extends State<TesteBox> {
  bool encanador = false, //
      eletricista = false, //
      faxineira = false, //
      pedreiro = false, //
      jardineiro = false, //
      cuidador_dog = false, //
      baba = false, //
      pintor = false, //
      servente_pedreiro = false, //
      cuidador_idoso = false; //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: showServicos,
            child: Text("Show serviços"),
          ),
        ),
      ),
    );
  }

  showServicos() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Selecione os seus Serviços"),
              content: Text(
                  "Selecione os serviços que deseja adicionar e manter em seu perfil."),
              actions: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 150,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Encanador",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: encanador,
                                  value: encanador,
                                  onChanged: (bool? value) {
                                    Navigator.pop(context);
                                    showServicos();
                                    //setState(() {
                                      encanador = value!;
                                      print("Checkbox1 state: $encanador");
                                   // });
                                  }),
                            ),
                            SizedBox(
                              width: 155,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Faxineira(o)",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: faxineira,
                                  value: faxineira,
                                  onChanged: (bool? value) {
                                    Navigator.pop(context);
                                    showServicos();
                                    setState(() {
                                      faxineira = value!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 150,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Pintor",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: pintor,
                                  value: pintor,
                                  onChanged: (bool? value) {
                                    Navigator.pop(context);
                                    showServicos();
                                    setState(() {
                                      pintor = value!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 150,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Cuidador de Idosos",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: cuidador_idoso,
                                  value: cuidador_idoso,
                                  onChanged: (bool? value) {
                                    
                                    setState(() {
                                      cuidador_idoso = value!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 150,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Servente de pedreiro",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: servente_pedreiro,
                                  value: servente_pedreiro,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      servente_pedreiro = value!;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        Column(children: [
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Eletricista",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: eletricista,
                                value: eletricista,
                                onChanged: (bool? value) {
                                  setState(() {
                                    eletricista = value!;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Babá",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: baba,
                                value: baba,
                                onChanged: (bool? value) {
                                  setState(() {
                                    baba = value!;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Cuidador de pet",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: cuidador_dog,
                                value: cuidador_dog,
                                onChanged: (bool? value) {
                                  setState(() {
                                    cuidador_dog = value!;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Pedreiro",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: pedreiro,
                                value: pedreiro,
                                onChanged: (bool? value) {
                                  setState(() {
                                    pedreiro = value!;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Jardineiro",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: jardineiro,
                                value: jardineiro,
                                onChanged: (bool? value) {
                                  setState(() {
                                    jardineiro = value!;
                                  });
                                }),
                          ),
                        ]),
                      ]),
                ),
                TextButton(
                    child: Text("Pronto"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }
}
