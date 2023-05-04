import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Add Task',
          style: Theme.of(context).textTheme.subtitle1,),
          Form(child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Task Title'
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter Task description'
                ),
                maxLines: 4,
                minLines: 4,
              ),
              SizedBox(height: 12,),
              Text('Select Date',
              style: Theme.of(context).textTheme.subtitle1,),
              InkWell(
                onTap: (){

                },
                child: Text('28/4/2023',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 12,),

              ElevatedButton(
                  onPressed: (){},
                  child: Text('Add',
                  style: Theme.of(context).textTheme.headline1,)
              )
            ],
          ))
        ],
      ),
    );
  }
}
