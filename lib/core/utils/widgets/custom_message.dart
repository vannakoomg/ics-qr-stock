// import 'package:flutter/material.dart';

// class CustomDialog {
//   static error({
//     bool barrierDismissible = true,
//     required String title,
//     required String message,
//     String bottonTitle = "យល់ព្រម",
//     Function? ontap,
//   }) {
//     showDialog(
//       barrierDismissible: barrierDismissible,
//       context: ContextUtility.context!,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           elevation: 0.0,
//           content: IntrinsicHeight(
//             child: Container(
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 255, 182, 176),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(
//                         top: 40, left: 20, right: 20, bottom: 40),
//                     child: Column(
//                       children: [
//                         const Icon(
//                           Icons.error,
//                           size: 80,
//                         ),
//                         Text(
//                           title,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyLarge!
//                               .copyWith(
//                                   color: const Color.fromARGB(255, 128, 46, 46),
//                                   fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           message,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(
//                                 color: const Color.fromARGB(255, 128, 46, 46),
//                               ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (ontap == null) {
//                         Navigator.pop(context);
//                       } else {
//                         ontap();
//                       }
//                     },
//                     child: Container(
//                       height: 30,
//                       color: Colors.white,
//                       width: double.infinity,
//                       child: Center(
//                         child: Text(
//                           bottonTitle,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(
//                                 color: const Color.fromARGB(255, 128, 46, 46),
//                               ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   static success({
//     bool barrierDismissible = true,
//     required String title,
//     required String message,
//     String bottonTitle = "យល់ព្រម",
//     Function? ontap,
//   }) {
//     showDialog(
//       barrierDismissible: barrierDismissible,
//       context: ContextUtility.context!,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           elevation: 0.0,
//           content: IntrinsicHeight(
//             child: Container(
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 176, 234, 193),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(
//                         top: 40, left: 20, right: 20, bottom: 40),
//                     child: Column(
//                       children: [
//                         const Icon(
//                           Icons.error,
//                           size: 80,
//                         ),
//                         Text(
//                           title,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyLarge!
//                               .copyWith(
//                                   color: const Color.fromARGB(255, 0, 94, 2),
//                                   fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           message,
//                           style:
//                               Theme.of(context).textTheme.bodySmall!.copyWith(
//                                     color: const Color.fromARGB(255, 0, 94, 2),
//                                   ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (ontap == null) {
//                         Navigator.pop(context);
//                       } else {
//                         ontap();
//                       }
//                     },
//                     child: Container(
//                       height: 30,
//                       color: Colors.white,
//                       width: double.infinity,
//                       child: Center(
//                         child: Text(
//                           bottonTitle,
//                           style:
//                               Theme.of(context).textTheme.bodySmall!.copyWith(
//                                     color: const Color.fromARGB(255, 0, 94, 2),
//                                   ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   static warning({
//     bool barrierDismissible = true,
//     required String title,
//     required String message,
//     String bottonTitle = "យល់ព្រម",
//     Function? ontap,
//   }) {
//     showDialog(
//       barrierDismissible: barrierDismissible,
//       context: ContextUtility.context!,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           elevation: 0.0,
//           content: IntrinsicHeight(
//             child: Container(
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 246, 210, 110),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(
//                         top: 40, left: 20, right: 20, bottom: 40),
//                     child: Column(
//                       children: [
//                         const Icon(
//                           Icons.error,
//                           size: 80,
//                         ),
//                         Text(
//                           title,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyLarge!
//                               .copyWith(
//                                 color: const Color.fromARGB(255, 202, 115, 0),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                         ),
//                         Text(
//                           message,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(
//                                 color: const Color.fromARGB(255, 202, 115, 0),
//                               ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (ontap == null) {
//                         Navigator.pop(context);
//                       } else {
//                         ontap();
//                       }
//                     },
//                     child: Container(
//                       height: 30,
//                       color: Colors.white,
//                       width: double.infinity,
//                       child: Center(
//                         child: Text(
//                           bottonTitle,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(
//                                 color: const Color.fromARGB(255, 202, 115, 0),
//                               ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   static info({
//     bool barrierDismissible = true,
//     required String title,
//     required String message,
//     String bottonTitle = "យល់ព្រម",
//     Function? ontap,
//   }) {
//     showDialog(
//       barrierDismissible: barrierDismissible,
//       context: ContextUtility.context!,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           elevation: 0.0,
//           content: IntrinsicHeight(
//             child: Container(
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 173, 230, 250),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(
//                         top: 40, left: 20, right: 20, bottom: 40),
//                     child: Column(
//                       children: [
//                         const Icon(
//                           Icons.error,
//                           size: 80,
//                         ),
//                         Text(
//                           title,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyLarge!
//                               .copyWith(
//                                   color: const Color.fromARGB(255, 0, 88, 119),
//                                   fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           message,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(
//                                 color: const Color.fromARGB(255, 0, 88, 119),
//                               ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (ontap == null) {
//                         Navigator.pop(context);
//                       } else {
//                         ontap();
//                       }
//                     },
//                     child: Container(
//                       height: 30,
//                       color: Colors.white,
//                       width: double.infinity,
//                       child: Center(
//                         child: Text(
//                           bottonTitle,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(
//                                 color: const Color.fromARGB(255, 0, 88, 119),
//                               ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
