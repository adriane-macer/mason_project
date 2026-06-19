// import 'package:flutter/material.dart';
// import '../extensions/context_extension.dart';
//
// enum ToastType { success, error, info, warning }
//
// class AppToast {
//   static void show(
//     BuildContext context, {
//     required String message,
//     ToastType type = ToastType.info,
//     Duration duration = const Duration(seconds: 3),
//   }) {
//     final overlay = Overlay.of(context);
//     late OverlayEntry overlayEntry;
//
//     overlayEntry = OverlayEntry(
//       builder: (context) => _ToastWidget(
//         message: message,
//         type: type,
//         onDismiss: () => overlayEntry.remove(),
//       ),
//     );
//
//     overlay.insert(overlayEntry);
//     Future.delayed(duration, () {
//       if (overlayEntry.mounted) {
//         overlayEntry.remove();
//       }
//     });
//   }
// }
//
// class _ToastWidget extends StatelessWidget {
//   const _ToastWidget({
//     required this.message,
//     required this.type,
//     required this.onDismiss,
//   });
//
//   final String message;
//   final ToastType type;
//   final VoidCallback onDismiss;
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: MediaQuery.of(context).padding.top + context.spacing.md,
//       left: context.spacing.md,
//       right: context.spacing.md,
//       child: Material(
//         color: Colors.transparent,
//         child: GestureDetector(
//           onTap: onDismiss,
//           child: Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: context.spacing.md,
//               vertical: context.spacing.sm,
//             ),
//             decoration: BoxDecoration(
//               color: _getBackgroundColor(context),
//               borderRadius: BorderRadius.circular(context.radius.md),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withValues(alpha: 0.1),
//                   blurRadius: 10,
//                   offset: const Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   _getIcon(),
//                   color: _getForegroundColor(context),
//                   size: 20,
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     message,
//                     style: context.text.bodyMedium?.copyWith(
//                       color: _getForegroundColor(context),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Color _getBackgroundColor(BuildContext context) {
//     switch (type) {
//       case ToastType.success:
//         return context.brand.successColor;
//       case ToastType.error:
//         return context.brand.dangerColor;
//       case ToastType.warning:
//         return context.brand.warningColor;
//       case ToastType.info:
//         return context.brand.primaryColor;
//     }
//   }
//
//   Color _getForegroundColor(BuildContext context) {
//     return Colors.white;
//   }
//
//   IconData _getIcon() {
//     switch (type) {
//       case ToastType.success:
//         return Icons.check_circle_outline;
//       case ToastType.error:
//         return Icons.error_outline;
//       case ToastType.warning:
//         return Icons.warning_amber_rounded;
//       case ToastType.info:
//         return Icons.info_outline;
//     }
//   }
// }
