
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Video.dart';
import 'package:hydroponics/core/Services/VideoServices.dart';

class VideoProvider with ChangeNotifier {
  List<Video> _videos = [];
  VideoService _videoService = VideoService();

  VideoProvider.initialize() {
    _getListVideos();
  }

//  getter
  List<Video> get videos => _videos;

//  methods
  void _getListVideos() async {
    _videos = await _videoService.getListVideos();
    notifyListeners();
  }
}