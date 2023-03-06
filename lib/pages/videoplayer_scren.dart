import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wspapp/contracts.dart';
import 'package:wspapp/controllers/controllers.dart';

class Videoplayer extends StatefulWidget {
  const Videoplayer({Key? key}) : super(key: key);

  @override
  State<Videoplayer> createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController customVideoPlayerController;
  String videoSrc=Get.find<Varibales>().videourl!;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(
        videoSrc)
      ..initialize().then((value) => setState(() {}));
    customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
      customVideoPlayerSettings: CustomVideoPlayerSettings(
        autoFadeOutControls:true,
        controlBarAvailable: true,
        customAspectRatio:16/9 ,
        enterFullscreenOnStart: true,
        enterFullscreenButton:Icon(Icons.fullscreen,color: kWhite),
        exitFullscreenOnEnd: true,
        exitFullscreenButton: Icon(Icons.fullscreen_exit,color: kWhite,),
        placeholderWidget: CircularProgressIndicator(),
        showFullscreenButton: true,
        

        
        

        



      )
      
    );
    super.initState();
  }
  @override
  void dispose() {
    customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,

      body: SafeArea(child: Center(child: CustomVideoPlayer(customVideoPlayerController:customVideoPlayerController ,))
      
      ),
    );
  }
}
