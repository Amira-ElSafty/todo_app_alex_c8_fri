import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_fri/my_theme.dart';

class TaskWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MyThemeData.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            color: MyThemeData.primaryLight,
            height: 80,
            width: 4,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Task1',
                      style:
                      Theme.of(context).textTheme.headline1?.copyWith(color: MyThemeData.primaryLight),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Desc1',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  )
                ],
              ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21,vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: MyThemeData.primaryLight
            ),
            child: Icon(Icons.check,color: MyThemeData.whiteColor,size: 35),
          ),
        ],
      ),
    );
  }
}
