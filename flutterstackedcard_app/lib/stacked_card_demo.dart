import 'package:flutter/material.dart';
import 'style_card.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class StackedCardDemo extends StatefulWidget {

  @override
  _StackedCardDemoState createState() => _StackedCardDemoState();
}

class _StackedCardDemoState extends State<StackedCardDemo> {
  final List<Widget> styleCards = [
    StyleCard(
      image: Image.asset("assets/images/logo.png"),
      title: "Team Leader",
      description: "lorem ipsum",
    ),
    StyleCard(
      image: Image.asset("assets/images/logo.png"),
      title: "Team Leader",
      description: "lorem ipsum",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Stacked Card Carousel Demo'),
      ),
      body: StackedCardCarousel(
        initialOffset: 40,
        spaceBetweenItems: 400,
        items: styleCards,
      ),
    );
  }
}