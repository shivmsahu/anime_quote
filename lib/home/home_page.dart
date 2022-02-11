import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  bool showUnswipe = false;
  final AppinioSwiperController controller = AppinioSwiperController();

  List<QuoteCard> quotes = [];
  List<String> text = [
    'assets/humaaans_2.jpg',
    'assets/humaaans_3.jpg',
    'assets/humaaans_6.jpg',
    'assets/humaaans_5.jpg',
    'assets/humaaans_8.jpg',
    'assets/humaaans_10.jpg',
    'assets/humaaans_11.jpg',
    'assets/humaaans_3.jpg',
    'assets/humaaans_6.jpg',
    'assets/humaaans_5.jpg',
    'assets/humaaans_8.jpg',
    'assets/humaaans_10.jpg',
    'assets/humaaans_11.jpg',
    'assets/humaaans_3.jpg',
    'assets/humaaans_6.jpg',
    'assets/humaaans_5.jpg',
    'assets/humaaans_8.jpg',
    'assets/humaaans_10.jpg',
    'assets/humaaans_11.jpg',
    'assets/humaaans_3.jpg',
    'assets/humaaans_6.jpg',
    'assets/humaaans_5.jpg',
    'assets/humaaans_8.jpg',
    'assets/humaaans_10.jpg',
    'assets/humaaans_11.jpg',
    'assets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpgassets/humaaans_4.jpg',
    'assets/humaaans_12.jpg',
    'assets/humaaans_1.jpg',
  ];

  @override
  void initState() {
    _loadCards();
    super.initState();
  }

  void _swipe(int index) {
    setState(() {
      showUnswipe = true;
    });
    currentIndex++;
    print(currentIndex);
  }

  void _loadCards() {
    for (String text in text) {
      quotes.add(QuoteCard(
        quote: text,
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.80,
            child: AppinioSwiper(
              controller: controller,
              cards: quotes,
              onSwipe: _swipe,
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 50,
                bottom: 40,
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: showUnswipe
                ? GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh_rounded,
                          color: Colors.grey[300],
                        ),
                        Text(
                          "Last Quote",
                          style: GoogleFonts.workSans(
                            color: Colors.grey[300],
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      controller.unswipe();
                      currentIndex--;
                      setState(() {
                        showUnswipe = false;
                      });
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final String quote;
  final Color color;

  const QuoteCard({Key? key, required this.quote, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor =
        color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  spreadRadius: 1,
                  blurRadius: 15)
            ]),
        child: Center(
          child: AutoSizeText(
            quote,
            style: GoogleFonts.workSans(
              color: textColor,
              fontSize: 24,
            ),
          ),
        ));
  }
}
