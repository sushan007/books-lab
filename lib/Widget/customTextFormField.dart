// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CustomTextFormField extends StatelessWidget {
//
//   final TextEditingController controller;
//   final String hintText;
//   final IconData data;
//   final bool isObscure;
//   final Function(String) onSaved, onValidate;
//
//   CustomTextFormField({
//     this.controller,
//     this.hintText,
//     this.data,
//     this.isObscure,
//     this.onSaved,
//     this.onValidate,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       margin: EdgeInsets.all(10),
//
//       child:
//       TextFormField(
//         controller: controller,
//         obscureText: isObscure,
//         // autofocus: true,
//         style: TextStyle(
//           color: Colors.deepPurpleAccent[700],
//         ),
//         maxLength: 24,
//
//         decoration: InputDecoration(
//           hintText: hintText,
//           fillColor: Colors.grey,
//           filled: true,
//           prefixIcon: Icon(
//             data,
//             color: Colors.yellow,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           ),
//
//
//       ),
//     );
//   }
// }
