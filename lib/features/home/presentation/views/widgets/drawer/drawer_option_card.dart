
import 'package:flutter/widgets.dart';

class DrawerOptionCard extends StatelessWidget {
  const DrawerOptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 2),
      height: MediaQuery.of(context).size.height / 2 / 6 - 2,
      color: const Color.fromARGB(52, 233, 30, 98),
    );
  }
}
