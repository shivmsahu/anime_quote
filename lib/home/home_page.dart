import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/home/controller/home_controller.dart';
import 'package:quotes_app/home/provider/app_state.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppinioSwiperController controller = AppinioSwiperController();
  late AppState appState;

  List<QuoteCard> quotes = [];

  @override
  void initState() {
    appState = Provider.of<AppState>(context, listen: false);
    quoteApi();
    super.initState();
  }

  Future<void> quoteApi({bool loadCards = true}) async {
    final res = await HomeController.getRandomQuotes();
    appState.quoteList = res.data ?? [];
    if (loadCards) {
      _loadCards();
    }
  }

  void _swipe(int index) {
    appState.changeUnswipeVisability(show: true);
    appState.currentIndex++;
    print(appState.currentIndex);
    print('hello');
    print(quotes.length);

    if (quotes.length == 3) {
      quoteApi(loadCards: false);
    }
    if (quotes.isEmpty) {
      _loadCards();
    }
  }

  void _loadCards() {
    List<QuoteCard> _quotes = [];
    for (var quote in appState.quoteList) {
      _quotes.add(QuoteCard(
        quote: quote.quoteText!,
        author: quote.quoteAuthor!,
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
      ));
    }
    quotes = _quotes;
    appState.notify();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.80,
            child: quotes.isNotEmpty
                ? AppinioSwiper(
                    controller: controller,
                    cards: quotes,
                    onSwipe: _swipe,
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 50,
                      bottom: 40,
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 50,
                      bottom: 40,
                    ),
                    child: QuoteCard(
                      quote: 'Loading quotes for you',
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0),
                    ),
                  ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: appState.showUnswipe
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
                      appState.currentIndex--;
                      appState.changeUnswipeVisability(show: false);
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
  final String? author;
  final Color color;

  const QuoteCard(
      {Key? key, required this.quote, this.author, required this.color})
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
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    quote,
                    style: GoogleFonts.workSans(
                      color: textColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (author != null)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: AutoSizeText(
                        '- $author',
                        style: GoogleFonts.workSans(
                          color: textColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (author != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    FlutterClipboard.copy('$quote - $author').then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: color,
                        duration: const Duration(milliseconds: 800),
                        content: Text(
                          'Quote Copied',
                          style: GoogleFonts.workSans(color: textColor),
                        ),
                      ));
                    });
                  },
                  child: const CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 30,
                      child: Icon(Icons.copy)),
                ),
              ),
          ],
        ));
  }
}
