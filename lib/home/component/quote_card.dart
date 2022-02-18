import 'package:auto_size_text/auto_size_text.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QuoteCard extends StatefulWidget {
  final String quote;
  final String? author;
  final Color color;

  const QuoteCard(
      {Key? key, required this.quote, this.author, required this.color})
      : super(key: key);

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  // ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    Color textColor =
        widget.color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    String copyText = '${widget.quote} \n- ${widget.author}';
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.color,
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
                    widget.quote,
                    style: GoogleFonts.workSans(
                      color: textColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (widget.author != null)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: AutoSizeText(
                        '- ${widget.author}',
                        style: GoogleFonts.workSans(
                          color: textColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (widget.author != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      FlutterClipboard.copy(copyText).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: widget.color,
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
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: () {
                      Share.share(copyText);
                    },
                    child: const CircleAvatar(
                        backgroundColor: Colors.white54,
                        radius: 30,
                        child: Icon(Icons.share_rounded)),
                  ),
                ],
              ),
          ],
        ));
  }
}
