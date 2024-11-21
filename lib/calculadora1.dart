import 'package:calculator1/montosolicitado.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Calculadora1 extends StatefulWidget {
  const Calculadora1({super.key});

  @override
  State<Calculadora1> createState() => _Calculadora1State();
}

class _Calculadora1State extends State<Calculadora1> {
  String CuotaMensual = "RD\$0.00";

  TextEditingController montoController = TextEditingController();
  TextEditingController duracionController = TextEditingController();
  TextEditingController tasaInteresController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void limpiarCampos() {
    montoController.clear();
    duracionController.clear();
    tasaInteresController.clear();
    setState(() {
      CuotaMensual = "RD\$0.00";
    });
  }

  void calcularCuota() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    double monto = double.tryParse(montoController.text) ?? 0.0;
    int duracion = int.tryParse(duracionController.text) ?? 0;
    double tasaInteresAnual = double.tryParse(tasaInteresController.text) ?? 0.0;

    if (monto <= 0 || duracion <= 0 || tasaInteresAnual <= 0) {
      setState(() {
        CuotaMensual = "Datos inválidos";
      });
      return;
    }

    // Convertir tasa de interés anual a mensual
    double tasaInteresMensual = tasaInteresAnual / 12 / 100;

    // Cálculo de la cuota mensual usando la fórmula de préstamos
    double cuota = monto *
        tasaInteresMensual *
        pow(1 + tasaInteresMensual, duracion) /
        (pow(1 + tasaInteresMensual, duracion) - 1);

    setState(() {
      CuotaMensual = "RD\$${cuota.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ITLA Loans",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Primer container
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    height: 50,
                    child: Text(
                      "Calculadora de Prestamos Personales",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 80),

                  // Segunda parte
                  Container(
                    width: 400,
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green[800],
                    ),
                    child: Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Monto solicitado
                              MontoSolicitado(
                                labelText: "Monto Solicitado (RD\$)*",
                                hintText: "0.00",
                                keyboardType: TextInputType.number,
                                controller: montoController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Este campo es requerido";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 45),

                              // Duración
                              MontoSolicitado(
                                labelText: "Duración*",
                                hintText: "Cantidad de(meses)",
                                keyboardType: TextInputType.number,
                                controller: duracionController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Este campo es requerido";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 45),

                              // Tasa de interés
                              MontoSolicitado(
                                labelText: "Tasa de Interés*",
                                hintText: "%",
                                keyboardType: TextInputType.number,
                                controller: tasaInteresController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Este campo es requerido";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 30),

                              // Botones
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: limpiarCampos,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[800],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    child: Text(
                                      "Limpiar",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: calcularCuota,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[800],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    child: Text(
                                      "Calcular",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Cuota mensual
                  Container(
                    width: 300,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cuota Mensual",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          CuotaMensual,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
