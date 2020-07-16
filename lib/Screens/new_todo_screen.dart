import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:notes/components/bottom_floater.dart';
import 'package:notes/components/footer_actions.dart';
import 'package:notes/configs/colors.dart';
import 'package:notes/providers/flag_provider.dart';
import 'package:provider/provider.dart';

class NewTodoScreen extends StatefulWidget {
  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  FocusNode _addTaskFocusNode;

  @override
  Widget build(BuildContext context) {
    var _flavour = Provider.of<FlagProvider>(context).flavour;
    var _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.gunMetal,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: AppColor.charlestonGreen,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                scrollPhysics: BouncingScrollPhysics(),
                // onSubmitted: (String value) {
                //   FocusScope.of(context)
                //       .requestFocus(_addTaskFocusNode);
                // },
                // focusNode: _titleFocusNode,
                //controller: _searchController,
                keyboardType: TextInputType.text,
                cursorColor: _flavour,
                maxLines: 1,
                style: TextStyle(
                  color: _flavour,
                  fontSize: 30.0,
                  fontFamily: 'Merriweather',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: _flavour.withAlpha(100),
                    fontSize: 30.0,
                    fontFamily: 'Merriweather',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            // Todo ListView Builder >>>----------------------->#
            Container(
              color: Colors.transparent,
              height: _height - 240.0,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: AppColor.gunMetal,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(0.0, 0.0),
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Todo item ${index+1}',
                          style: TextStyle(
                            color: AppColor.isabelline,
                            fontSize: 22.0,
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('tapped checkbox');
                            //TODO checkbox
                          },
                          child: Icon(
                            MaterialIcons.check_box_outline_blank,
                            color: _flavour,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Todo Adder >>>------------------------>#
            Padding(
              padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
              child: Container(
                color: Colors.transparent,
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      width: _width - 110.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: AppColor.charlestonGreen,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0.0, 3.0),
                            blurRadius: 5.0,
                          )
                        ],
                      ),
                      child: TextField(
                        scrollPhysics: BouncingScrollPhysics(),
                        // onSubmitted: (String value) {
                        //   FocusScope.of(context)
                        //       .requestFocus(_bodyFocusNode);
                        // },
                        focusNode: _addTaskFocusNode,
                        //controller: _searchController,
                        keyboardType: TextInputType.text,
                        cursorColor: AppColor.isabelline,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColor.isabelline,
                          fontSize: 25.0,
                          fontFamily: 'SourceSansPro',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Task to perform...',
                          hintStyle: TextStyle(
                            color: AppColor.isabelline.withAlpha(100),
                            fontSize: 25.0,
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO add task to list
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 80.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: AppColor.charlestonGreen,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 5.0,
                            )
                          ],
                        ),
                        child: Text(
                          'ADD',
                          style: TextStyle(
                            color: _flavour,
                            fontSize: 25.0,
                            fontFamily: 'Righteous',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0),
        child: FooterActions(),
      ),
    );
  }
}
