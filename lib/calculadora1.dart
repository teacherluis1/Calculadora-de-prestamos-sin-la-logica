import 'package:calculator1/montosolicitado.dart';
import 'package:flutter/material.dart';

class Calculadora1 extends StatefulWidget {
  const Calculadora1({super.key});

  @override
  State<Calculadora1> createState() => _Calculadora1State();
}

class _Calculadora1State extends State<Calculadora1> {
  String CuotaMensual = "RD\$0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        
        centerTitle: true,
        title: Text("ITLA Loans",
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.green[800],

      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              //physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
            
                  //primer container
                  Container(
                    alignment: Alignment.center,
                    
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
                      
                    ),
                    height: 50,
                    child: Text("Calculadora de Prestamos Personales",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    ),
                    ),
            
                  ),
                  SizedBox(height: 80,),
            
            
                  //segunda parte
                  Container(
                    width: 400,
                    height: 500,
            
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green[800],
                    
                    ),
             
                    child: Card(
                      
                      
                      elevation: 5.0,
                      child: Column(
                        
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                           alignment: Alignment.topLeft,
                            child: Text("Personales",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          SizedBox(height: 20,),
            
                          //monto solicitado
            
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            
                            
                            child: Column(
                              
                              children: [
            
                                //monto solicitado
            
            
                                MontoSolicitado(
                                  labelText: "Monto Solicitado (RD\$)*",
                                  hintText: "0.00",
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Este campo es requerido";
                                    }
                                    return null;
                                  },
                                ),
            
                                SizedBox(height: 45),
            
            
            
                                //Cuotas mensual
                                MontoSolicitado(
                                  labelText: "Duración*",
                                  hintText: "Cantidad de(meses)",
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Este campo es requerido";
                                    }
                                    return null;
                                  },
                                ),
            
                                SizedBox(height: 45),
            
            
                                //Interes anual
            
                                MontoSolicitado(
                                  labelText: "Tasa de Interés*",
                                  hintText: "%",
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Este campo es requerido";
                                    }
                                    return null;
                                  },
                                ),   
                                SizedBox(height: 30),

                                //limpiar y calcular
                                
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //limpiar
                                      ElevatedButton(onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[800],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      
                                      
                                      child: Text("Limpiar", style: TextStyle(
                                        fontSize: 20, 
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                        
                                      )),
                                      SizedBox(width: 20),
                                      //calcular
                                      ElevatedButton(onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[800],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      
                                      
                                      child: Text("Calcular", style: TextStyle(
                                        fontSize: 20, 
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                        
                                      )),
                                      
                                    ],
                                  )                   
            
                              ],
                            ),
            
                          ),
                    
                    
                        ],
                      ),                   
                    
                    ),           
            
                  ),
                  SizedBox(height: 20),  
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
                        Text("Cuota Menual",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: 10),
                        Text(CuotaMensual, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
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
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                    ),
            
                  )
        ],
      ),




    );
  }
}