import 'package:designs/gen/assets.gen.dart';
import 'package:designs/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: const [
              Expanded(
                child: _Slides(),
              ),
              _Dots()
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
          _Dot(index: 3),
          _Dot(index: 4),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: (page >= index - 0.5 && page <= index + 0.5) ? 18 : 12,
      height: (page >= index - 0.5 && page <= index + 0.5) ? 18 : 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (page >= index - 0.5 && page <= index + 0.5)
            ? Colors.pink
            : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(
      () {
        Provider.of<SliderModel>(context, listen: false).currentPage =
            pageViewController.page!;
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: [
        _Slide(image: Assets.images.slide1),
        _Slide(image: Assets.images.slide2),
        _Slide(image: Assets.images.slide3),
        _Slide(image: Assets.images.slide4),
        _Slide(image: Assets.images.slide5),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.image,
  }) : super(key: key);

  final SvgGenImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: image.svg(),
    );
  }
}
