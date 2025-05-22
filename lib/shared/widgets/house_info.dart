// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:orphans/core/extensions/context_extension.dart';
//
// import '../../core/resources/icons.dart';
//
// class HouseInfo extends StatelessWidget {
//   const HouseInfo(
//       {super.key,
//       required this.laddar,
//       required this.bathroom,
//       required this.square,
//       required this.bedroom});
//   final int laddar;
//   final int bathroom;
//   final int square;
//   final int bedroom;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SvgPicture.asset(AppIcons.square,
//             colorFilter: Theme.of(context).primaryColor.toColorFilter),
//         const SizedBox(width: 5),
//         Text('$square sqFt.'),
//         const SizedBox(width: 15),
//         SvgPicture.asset(AppIcons.laddar,
//             colorFilter: Theme.of(context).primaryColor.toColorFilter),
//         const SizedBox(width: 5),
//         Text('$laddar'),
//         const SizedBox(width: 15),
//         ~SvgPicture.asset(
//           AppIcons.bedroom,
//           colorFilter: Theme.of(context).primaryColor.toColorFilter,
//         ),
//         const SizedBox(width: 5),
//         Text('$bedroom'),
//         const SizedBox(width: 15),
//         SvgPicture.asset(AppIcons.bathroom,
//             colorFilter: Theme.of(context).primaryColor.toColorFilter),
//         const SizedBox(width: 5),
//         Text('$bathroom'),
//       ],
//     );
//   }
// }
