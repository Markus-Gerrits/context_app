import 'package:context_app/constants/dimensions.dart';
import 'package:context_app/constants/strings.dart';
import 'package:flutter/material.dart';

class FaqText extends StatelessWidget {
  const FaqText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
          padding: Dimensions.defaultPadding,
          child: Column(
            children: [
              // Title
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.help_center_outlined),
                    ),
                    Text(
                      'FAQ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                title: Text(
                  Strings.faq1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                children: <Widget>[
                  ListTile(
                      title: Text(
                    Strings.faq1Answer,
                    style: TextStyle(fontSize: 12),
                  )),
                ],
              ),
              ExpansionTile(
                title: Text(
                  Strings.faq2,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                children: <Widget>[
                  ListTile(
                      title: Text(
                    Strings.faq2answer,
                    style: TextStyle(fontSize: 12),
                  )),
                ],
              ),
            ],
          ),
        );
  }
}