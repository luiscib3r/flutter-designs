import 'package:animate_do/animate_do.dart';
import 'package:designs/src/widgets/emergency_header.dart';
import 'package:designs/src/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const items = [
  GradientButton(
      icon: FontAwesomeIcons.carCrash,
      text: 'Motor Accident',
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5)),
  GradientButton(
      icon: FontAwesomeIcons.plus,
      text: 'Medical Emergency',
      color1: Color(0xff66A9F2),
      color2: Color(0xff536CF6)),
  GradientButton(
      icon: FontAwesomeIcons.theaterMasks,
      text: 'Theft / Harrasement',
      color1: Color(0xffF2D572),
      color2: Color(0xffE06AA3)),
  GradientButton(
      icon: FontAwesomeIcons.biking,
      text: 'Awards',
      color1: Color(0xff317183),
      color2: Color(0xff46997D)),
  GradientButton(
      icon: FontAwesomeIcons.carCrash,
      text: 'Motor Accident',
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5)),
  GradientButton(
      icon: FontAwesomeIcons.plus,
      text: 'Medical Emergency',
      color1: Color(0xff66A9F2),
      color2: Color(0xff536CF6)),
  GradientButton(
      icon: FontAwesomeIcons.theaterMasks,
      text: 'Theft / Harrasement',
      color1: Color(0xffF2D572),
      color2: Color(0xffE06AA3)),
  GradientButton(
      icon: FontAwesomeIcons.biking,
      text: 'Awards',
      color1: Color(0xff317183),
      color2: Color(0xff46997D)),
  GradientButton(
      icon: FontAwesomeIcons.carCrash,
      text: 'Motor Accident',
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5)),
  GradientButton(
      icon: FontAwesomeIcons.plus,
      text: 'Medical Emergency',
      color1: Color(0xff66A9F2),
      color2: Color(0xff536CF6)),
  GradientButton(
      icon: FontAwesomeIcons.theaterMasks,
      text: 'Theft / Harrasement',
      color1: Color(0xffF2D572),
      color2: Color(0xffE06AA3)),
  GradientButton(
      icon: FontAwesomeIcons.biking,
      text: 'Awards',
      color1: Color(0xff317183),
      color2: Color(0xff46997D)),
];

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(
                items.length,
                (index) => FadeInLeft(
                  duration: const Duration(milliseconds: 300),
                  child: items[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const SizedBox.expand(child: _Header());
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 260;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            padding: const EdgeInsets.all(15),
            shape: const CircleBorder(),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
