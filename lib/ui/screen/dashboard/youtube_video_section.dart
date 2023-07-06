import 'package:flutter/material.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/customautosizetext.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoSection extends StatelessWidget {
  YoutubeVideoSection({super.key, required this.link});
  List link;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 190,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomAutoSizeTextMontserrat(
                  textColor: ThemeConstants.bluecolor,
                  text: 'Hear it from our students'),
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: link.length,
                    itemBuilder: (context, index) {
                      var YtId = link[index]
                          .toString()
                          .substring(32, link[index].toString().length);

                      print(YtId);
                      // var showProfile = true;
                      // if (testimonialsList[index].image == '') {
                      //   showProfile = false;
                      // }

                      // var comment = testimonialsList[index].comment!.length >
                      //         120
                      //     ? testimonialsList[index].comment!.trimToLength(120)
                      //     : testimonialsList[index].comment!;
                      return Container(
                          width: 280,
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: ThemeConstants.lightblueColor,
                              // gradient: LinearGradient(
                              //     colors: [Color(0xFF3E66DD), Color(0xFF6554CF)]),
                              // color: ThemeConstants.GreenColor,
                              border: Border.all(
                                  width: 0.8, color: ThemeConstants.bluecolor),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(30.0))),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: '$YtId',
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                ),
                              ),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.red,
                            ),
                          ));
                    })),
          ]),
    );
  }
}
