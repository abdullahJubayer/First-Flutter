import 'package:flutter/material.dart';
import 'package:note_app/Scence/ListItem.dart';

class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainListContainer();
  }

}

class MainListContainer extends State<NoteList>{
  int count=2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: new Text("Note",),
      ),
      body: getListItem(),
      floatingActionButton: FloatingActionButton(
          onPressed:() {
            moveToListItemPage("Add Note");
          },
        tooltip: "Add Note",
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

 ListView getListItem() {
    TextStyle titleStyle=Theme.of(context).textTheme.subhead;
    TextStyle desStyle=Theme.of(context).textTheme.body1;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context,int position){
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                ),
                title: Text("List Title",style: titleStyle,),
                subtitle: Text("List Sub Item",style: desStyle,),
                trailing: Icon(Icons.delete,color: Colors.grey,)
                  ,
                onTap: (){
                  moveToListItemPage("Edit Note");
                },
              ),
            );
        },
    );
 }

  void moveToListItemPage(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return ListItem(title);
    }));
  }
}