import 'package:designs/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            const PinterestGrid(),
            Positioned(
              bottom: 30,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Align(
                  child: _Menu(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    return PinterestMenu(
      mostrar: mostrar,
      buttons: [
        PinterestButton(
          index: 0,
          icon: Icons.pie_chart,
          onPressed: () {},
        ),
        PinterestButton(
          index: 1,
          icon: Icons.search,
          onPressed: () {},
        ),
        PinterestButton(
          index: 2,
          icon: Icons.notifications,
          onPressed: () {},
        ),
        PinterestButton(
          index: 3,
          icon: Icons.pages,
          onPressed: () {},
        ),
      ],
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final scrollController = ScrollController();

  double prevOffset = 0;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(
      () {
        if (scrollController.offset > prevOffset) {
          Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        } else {
          Provider.of<_MenuModel>(context, listen: false).mostrar = true;
        }

        prevOffset = scrollController.offset;
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: 200,
      itemBuilder: (BuildContext context, int index) => Item(index: index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool m) {
    _mostrar = m;
    notifyListeners();
  }
}
