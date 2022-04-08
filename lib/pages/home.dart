import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/view_model/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) => Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                "Provider app",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SafeArea(
              child: ListView(
                children: List.generate(model.listOfUser.length, (index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            model.listOfUser[index].name[0],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(model.listOfUser[index].name),
                        subtitle: Text(model.listOfUser[index].phoneNumber),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  model.updateUser(
                                      context, model.listOfUser[index]);
                                },
                                icon: Icon(
                                  Icons.mode,
                                  color: Colors.blueAccent,
                                )),
                            IconButton(
                                onPressed: () {
                                  model.deleteUser(
                                      model.listOfUser[index], context);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        color: Colors.grey.shade200,
                        height: 3,
                      )
                    ],
                  );
                }),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  model.addUser(context);
                },
                child: Icon(Icons.add, color: Colors.white)),
          ),
          model.isLoading
              ? Container(
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
