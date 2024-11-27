

import 'package:flutter/cupertino.dart';

fadeInNetworkImage({required String ImageName}){
  return
    FadeInImage(
      placeholder: AssetImage("assets/flight_loader.gif"),
      image: NetworkImage(ImageName,
      ),
      fit: BoxFit.fill,
      fadeInDuration: Duration(milliseconds: 300),
      fadeOutDuration: Duration(milliseconds: 100),
    );
}