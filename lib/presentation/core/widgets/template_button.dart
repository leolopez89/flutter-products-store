import 'package:flutter/material.dart';
import 'package:flutter_products_store/presentation/core/utils/decorations.dart';

class TemplateButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? prefix;
  final String title;
  final bool inverted;
  final bool loading;

  const TemplateButton({
    required this.title,
    Key? key,
    this.onPressed,
    this.prefix,
    this.inverted = false,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : TextButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: AppColors.mainColor,
              ),
              onPressed: onPressed,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (prefix != null) ...[prefix!, const SizedBox(width: 10)],
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700))
              ])),
    );
  }
}
