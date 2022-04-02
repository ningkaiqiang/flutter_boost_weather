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
          margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
          height: 700,
          decoration: new BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0)
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    '城市搜索',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '输入要搜索的城市吧',
                      hintStyle: new TextStyle(fontSize: 17),
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
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    child: Icon(
                      Icons.cancel,
                      size: 40,
                      color: _myColor,
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
              ]),
        ));
  }
}
