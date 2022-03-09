import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../3_template/custum_colors.dart';

Column createCatalogBlock(
    {required List<Widget> children,
    required String title,
    String? importPath}) {
  return Column(
    children: [
      Row(children: [
        OutlinedButton(
            onPressed: () =>
                {Clipboard.setData(ClipboardData(text: importPath))},
            child: Text(title)),
      ], mainAxisAlignment: MainAxisAlignment.center),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      )
    ],
  );
}

Column createColorBlock(
    {required String title, required Color color, String? props}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              child: ElevatedButton(
                child: const Text(''),
                style: ElevatedButton.styleFrom(
                  primary: color,
                  shape: const CircleBorder(),
                ),
                onPressed: () =>
                    {Clipboard.setData(ClipboardData(text: props))},
              ),
              width: 50,
              height: 50,
            ),
            Text(title)
          ],
        ),
      )
    ],
  );
}
