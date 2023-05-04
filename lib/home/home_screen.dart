import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_fri/home/settings/settings_tab.dart';
import 'package:flutter_todo_app_c8_fri/home/task_list/add_task_bottom_sheet.dart';
import 'package:flutter_todo_app_c8_fri/home/task_list/task_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex:selectedIndex ,
          onTap: (index){
            selectedIndex = index ;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/task_list_icon.png')
              ),
              label:'Task List'
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/images/settings_icon.png')
                ),
                label:'Settings'
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAddBottomSheet();
        },
        child: Icon(Icons.add,size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }
  List<Widget> tabs = [TaskListTab(),SettingsTab()];

  void showAddBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context){
          return AddTaskBottomSheet();
        }
    );
  }
}
