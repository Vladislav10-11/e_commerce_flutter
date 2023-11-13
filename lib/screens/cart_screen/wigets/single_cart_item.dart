import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleCartItem extends StatefulWidget {
  const SingleCartItem({super.key});

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int qty = 0;
  late Color _rippleColor = getRandomColor();

  Color getRandomColor() =>
      Color((Random().nextDouble() * 0xffffff).toInt()).withOpacity(1.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 140,
              color: Colors.red.withOpacity(0.5),
              child: Image.network(
                  "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/imac/id-imac-24-2021.png"),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Lappi",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Price: \$200",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                if (qty >= 1) {
                                  setState(() {
                                    qty--;
                                  });
                                }
                              },
                              padding: EdgeInsets.zero,
                              child: CircleAvatar(
                                maxRadius: 13,
                                child: Icon(Icons.remove),
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Text(
                              qty.toString(),
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            InkWell(
                              splashColor: _rippleColor,
                              customBorder: CircleBorder(),
                              onTap: () {
                                setState(() {
                                  qty++;
                                });
                                setState(() {
                                  _rippleColor = getRandomColor();
                                });
                              },
                              child: CircleAvatar(
                                maxRadius: 13,
                                child: Icon(Icons.add),
                              ),
                            )
                          ],
                        ),
                        CupertinoButton(
                          onPressed: () {},
                          child: Text(
                            "Add to wishList",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red, width: 3)),
    );
  }
}
