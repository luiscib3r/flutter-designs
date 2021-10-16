import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  const PinterestMenu({
    Key? key,
    required this.buttons,
    this.mostrar = true,
  }) : super(key: key);

  final bool mostrar;
  final List<PinterestButton> buttons;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: mostrar ? 1 : 0,
        child: Container(
          width: 250,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: -5,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buttons,
          ),
        ),
      ),
    );
  }
}

class PinterestButton extends StatelessWidget {
  const PinterestButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.index,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_MenuModel>(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        provider.selected = index;
        onPressed();
      },
      child: Icon(
        icon,
        size: provider.selected == index ? 35 : 25,
        color: provider.selected == index ? Colors.pink : Colors.blueGrey,
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  int _selected = 0;

  int get selected => _selected;

  set selected(int index) {
    _selected = index;
    notifyListeners();
  }
}
