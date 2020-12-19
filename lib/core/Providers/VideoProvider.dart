
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Video.dart';
import 'package:hydroponics/core/Services/VideoServices.dart';

class VideoProvider with ChangeNotifier {
  List<Video> _videos = [];
  List<Video> _videosSearched = [];
  VideoService _videoService = VideoService();

  VideoProvider.initialize() {
    _getListVideos();
  }

//  getter
  List<Video> get videos => _videos;
  List<Video> get videosSearched => _videosSearched;

//  methods
  void _getListVideos() async {
    _videos = await _videoService.getListVideos();
    notifyListeners();
  }
  Future getListVideos() async {
    _videos = await _videoService.getListVideos();
    notifyListeners();
  }
  Future search({String videoTitle})async{
    _videosSearched = await _videoService.searchVideos(videoTitle: videoTitle);
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${_videosSearched.length}");
    notifyListeners();
  }
}