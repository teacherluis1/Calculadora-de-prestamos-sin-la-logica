import 'package:flutter/material.dart';

class MontoSolicitado extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const MontoSolicitado({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  _MontoSolicitadoState createState() => _MontoSolicitadoState();
}

class _MontoSolicitadoState extends State<MontoSolicitado> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText, // Accedemos a las propiedades del widget usando `widget`.
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.0),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            contentPadding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 15.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.green, width: 2.0),
            ),
          ),
          validator: widget.validator,
        ),

      ],
    );
  }
}
