import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransparentWidget extends StatefulWidget {
  @override
  TransparentWidgetState createState() => TransparentWidgetState();
}

class TransparentWidgetState extends State<TransparentWidget> {
  Color _myColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 50),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(color: _myColor, width: 1.0)),
            height: 700,
            width: 350,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      '城市搜索',
                      style: TextStyle(
                          fontSize: 20, color: Colors.black
                      )
                  ),
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            border: Border.all(color: _myColor, width: 1.0)),
                        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          controller: _controller,
                          decoration: new InputDecoration(
                            hintText: '输入要搜索的城市吧',
                            hintStyle: new TextStyle(
                              fontSize: 17
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            contentPadding: EdgeInsets.only(
                              top: 0,
                              bottom: 0,
                            ),
                            prefixIcon: Icon(Icons.saved_search_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            child: Container(
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.all(8.0),
                                color: const Color(0xfff36091),
                                child: Text(
                                  'Go Back',
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.black),
                                )),
                            onTap: () => Navigator.of(context).pop(),
                          ),
                        ]),
                  ),
                ]),
          ),
        ));
  }
}