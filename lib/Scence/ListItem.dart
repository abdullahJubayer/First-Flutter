import 'package:flutter/material.dart';

class ListItem extends StatefulWidget{

  String TitleTxt;
  ListItem(this.TitleTxt);

  @override
  State<StatefulWidget> createState() {
    return new ListItemState(TitleTxt);
  }

}

class ListItemState extends State<ListItem> {

  String title;

  ListItemState(this.title);

  static var priority={"Low","High"};
  TextEditingController titleController=TextEditingController();
  TextEditingController textController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        goToBack();
      },
      child: Scaffold(
        appBar: AppBar(
        title: Text(title),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              goToBack();
            })

      ),


      body: Padding(
          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
          child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                  items: priority.map((String downItem){
                    return DropdownMenuItem<String>(
                      value: downItem,
                      child: Text(downItem),
                    );
                  }).toList(),
                  value: 'Low',
                  onChanged: (value){
                    setState(() {
                      
                    });
                  }
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: titleController,
                  onChanged: (value){

                  },
                  decoration: InputDecoration(
                    labelText: "Title"
                    ,border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
                  ),
                ),

            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: titleController,
                  onChanged: (value){

                  },
                  decoration: InputDecoration(
                    labelText: "Description"
                    ,border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
                  ),
                ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text("Save",textScaleFactor: 1.5,),
                            onPressed: (){
                              setState(() {
                                debugPrint("Save");
                              });
                            }
                        )
                    ),
                    Container(width: 5.0,),
                    Expanded(
                        child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text("Delete",textScaleFactor: 1.5,),
                            onPressed: (){
                              setState(() {
                                debugPrint("Delete");
                              });
                            }
                        )
                    )
                  ],
                ),
            )
      ],
      ),
      ),
    ));
  }

  void goToBack() {
    Navigator.pop(context);
  }
}