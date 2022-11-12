import 'package:cached_network_image/cached_network_image.dart';
import 'package:dongnae/components/feed_widget.dart';
import 'package:flutter/material.dart';
import 'package:dongnae/components/Avartar_widget.dart';

class story_home extends StatelessWidget {
  const story_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0,5,0,0),
        scrollDirection: Axis.horizontal,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(10, (index) => Avatar(
            type:AvatarType.Type1,
            thumbpath:'https://lh3.googleusercontent.com/a/ALm5wu2Vx_8PP2AHCL-bMvjTDPlznhAiuDzvv8Fv4C2W=s288-p-rw-no' ,
              ),
            ),
          ),

        ),]);
  } 
}

class feed_home extends StatelessWidget {
  const feed_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0,5,0,0),
            scrollDirection: Axis.vertical,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(10, (index) => FeedWidget(

              ),
              ),
            ),

          ),]);
  }
}

