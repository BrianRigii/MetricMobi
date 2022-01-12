import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends ChangeNotifier {
  WebSocketChannel channel; //initialize a websocket channel
  bool isWebsocketRunning = false; //status of a websocket
  int retryLimit = 3;
  List data = [];

  void _setData(List _data) {
    print('here');
    (_data).forEach(
      (_singularData) =>
          data.add(_singularData), //copies the json data to RxList
    );

    print('$data');
  }

  void startStream() async {
    print('Start stream');
    if (isWebsocketRunning) return; //chaech if its already running
    final url = 'wss://metric.co.ke:6001';
    this.channel = WebSocketChannel.connect(
      Uri.parse(url), //connect to a websocket
    );

    channel.stream.listen(
      (event) {
        print('Event received');
        _setData(json.decode(
            event)); //pass a function to use the recieved JSON data and parse it
      },
      onDone: () {
        isWebsocketRunning = false;
      },
      onError: (err) {
        isWebsocketRunning = false;
        if (retryLimit > 0) {
          retryLimit--;
          startStream();
        }
      },
    );

    void sendData() {
      channel.sink.add('Hello');
    }
  }

  void closeFoodStream() {
    //disposes of the stream
    channel.sink.close();
    isWebsocketRunning = false;
  }
}

WebSocket webSocket = WebSocket();
