// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:velocity_x/velocity_x.dart';

// class ChatMessage extends StatelessWidget {
//   final String text;
//   final String sender;
//   final bool isImage;
//   const ChatMessage({
//     Key? key,
//     required this.text,
//     required this.sender,
//     this.isImage = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(sender)
//             .text
//             .subtitle1(context)
//             .make()
//             .box
//             .color(sender == "user" ? Vx.red200 : Vx.green200)
//             .p16
//             .rounded
//             .alignCenter
//             .makeCentered(),
//         Expanded(
//           child: isImage
//               ? AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: Image.network(
//                     text,
//                     loadingBuilder: (context, child, loadingProgress) =>
//                         loadingProgress == null
//                             ? child
//                             : const CircularProgressIndicator.adaptive(),
//                   ),
//                 )
//               : text.trim().text.bodyText1(context).make().px8(),
//         )
//       ],
//     );
//   }
// }
