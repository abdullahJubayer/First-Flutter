import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple page Design",
    home: new Page(),
    theme: new ThemeData(
      primaryColor: Colors.indigo,
      brightness: Brightness.dark
    ),
  ));
}

class Page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page();
  }
}

class _Page extends State<Page>{
  var _val={"First","Second","Third"};
  var _selectItem="First";
  var _result='';
  TextEditingController numOneController=new TextEditingController();
  TextEditingController numTwoController=new TextEditingController();
  TextEditingController numThreeController=new TextEditingController();
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle=Theme.of(context).textTheme.title;

    return Scaffold(
       appBar:AppBar(
         title:  new Text("First Page"),
       ),
       body: new Container(
         padding: EdgeInsets.all(20),
         child:new ListView(
           children: <Widget>[
              getImage(),
             new Padding(
               padding: EdgeInsets.only(bottom: 10),
               child: new TextField(
                 style:textStyle ,
                 keyboardType: TextInputType.number,
                 controller: numOneController,
                 decoration: InputDecoration(
                     labelText: "Number1",
                     hintText: "Hint Text",
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(5)
                     )
                 ),
               ),
             ),
             new Padding(
               padding: EdgeInsets.only(bottom: 10),
               child:new TextField(
                 keyboardType: TextInputType.number,
                 style: textStyle,
                 controller: numTwoController,
                 decoration: InputDecoration(
                     labelText: "Number2",
                     hintText: "Hint2 Text",
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(5)
                     )
                 ),
               ),
             ),
             new Row(
               children: <Widget>[
                 new Expanded(child: new TextField(
                   style:textStyle,
                   decoration: InputDecoration(
                       labelText: "Text",
                       hintText: "Text",
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(5)
                       )
                   ),
                 )
                 ),
                 new Container(width: 20,),
                 new Expanded(child: DropdownButton(
                     items: _val.map((String name){
                       return DropdownMenuItem(
                           value: name,
                           child: new Text(name,style: textStyle,)
                       );
                     }).toList(),
                     value: _selectItem,
                     onChanged: (String s){
                       setState(() {
                         this._selectItem=s;
                       });
                     })
                 )
               ],
             ),
             new Padding(
               padding: EdgeInsets.only(top: 10,left: 10,bottom: 10),
               child:     new Row(

                 children: <Widget>[
                   new Expanded(
                       child: RaisedButton(
                         onPressed: (){
                           this._result=addTwoNumber();
                         },
                         child: Text("add"),
                       )
                   )
                   ,
                   new Expanded(
                       child: RaisedButton(
                         onPressed: (){

                         },
                         child: Text("reset"),
                       )
                   ),
                 ],
               ),
             ),
             new Container(
                 margin: EdgeInsets.only(top: 10),
               child: new Text(this._result,style: textStyle,),
             )
           ],
         ),
       ),
    );
  }

  String addTwoNumber() {
    double num1=double.parse(numOneController.text);
    double num2=double.parse(numTwoController.text);
    String result="Num One And Two is ${num1+num2}";
    return result;
  }

}

Widget getImage(){
  AssetImage assetImage=new AssetImage("images/twitter.png");
  Image image=Image(image: assetImage,width: 110.0,height: 110.0,);

  return new Container(
    child: image,
    margin: EdgeInsets.all(50),
  );
}


