// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:studentpanel/ui/screen/dashboard/models/youtubevideoModel.dart';
// import 'package:studentpanel/utils/constants.dart';
// import 'package:studentpanel/utils/theme.dart';
// import 'package:studentpanel/widgets/customautosizetext.dart';
// import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
// import 'package:studentpanel/widgets/youtube/customyoutube.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YoutubeVideoSection extends StatelessWidget {
//   List<YoutubeVideoModel> youtubeVideoModel = [];
//    bool isLoading;
//   YoutubeVideoSection({Key? key, required this.youtubeVideoModel ,required this.isLoading} )
//       : super(key: key);
//   // List link;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       height: 190,
//       child: isLoading == false ?  Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 15),
//               child: CustomAutoSizeTextMontserrat(
//                   textColor: ThemeConstants.bluecolor,
//                   text: 'Hear it from our students'),
//             ),
//             Expanded(
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: youtubeVideoModel.length,
//                     itemBuilder: (context, index) {
//                       // var YtId = link[index]
//                       //     .toString()
//                       //     .substring(32, link[index].toString().length);

//                       return Container(
//                           width: 280,
//                           margin: const EdgeInsets.all(10.0),
//                           decoration: BoxDecoration(
//                               color: ThemeConstants.lightblueColor,
//                               // gradient: LinearGradient(
//                               //     colors: [Color(0xFF3E66DD), Color(0xFF6554CF)]),
//                               // color: ThemeConstants.GreenColor,
//                               border: Border.all(
//                                   width: 0.8, color: ThemeConstants.bluecolor),
//                               borderRadius: const BorderRadius.all(
//                                   Radius.circular(30.0))),
//                           child: ClipRRect(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(30.0)),
//                             child: StatefulBuilder(builder:
//                                 (BuildContext context, StateSetter setState) {
//                               bool videoPlay = false;
//                               if (videoPlay == true) {
//                                 return SizedBox(
//                                   width: 280,
//                                   child: YouTubeVideoPlayer(
//                                     videoUrl:
//                                         youtubeVideoModel[index].video ?? "",
//                                   ),
//                                 );
//                               } else {
//                                 return InkWell(
//                                   onTap: () {
//                                     Get.to(YouTubeVideoPlayer(
//                                       videoUrl:
//                                           youtubeVideoModel[index].video ?? "",
//                                     ));
//                                   },
//                                   child: Stack(
//                                     fit: StackFit.expand,
//                                     children: [
//                                       Image.network(
//                                         youtubeVideoModel[index].thumbnail ??
//                                             "",
//                                         fit: BoxFit.cover,
//                                       ),
//                                       Center(
//                                         child: Icon(
//                                           Icons.play_arrow,
//                                           color: ThemeConstants.whitecolor,
//                                           size: 50,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               }
//                             }),

//                             // YoutubePlayer(
//                             //   controller: YoutubePlayerController(
//                             //     initialVideoId: '$YtId',
//                             //     flags: const YoutubePlayerFlags(
//                             //       autoPlay: false,
//                             //       mute: false,
//                             //     ),
//                             //   ),
//                             //   showVideoProgressIndicator: true,
//                             //   progressIndicatorColor: Colors.red,
//                             // ),
//                           ));
//                     })),
//           ]) : getLoading(context),
//     );
//   }
// }
