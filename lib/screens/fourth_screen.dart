import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mygarageadmin/models/mechanics_model.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: dataModel.length,
            itemBuilder: (context, index) {
              var result = dataModel[index];
              return ExpansionTile(
                title: Text(result.name),
                subtitle: Text(result.phoneNumber),
                children: <Widget>[
                  ListTile(title: Text('Email : ' + result.eMail)),
                  ListTile(
                      title: Text('aadhar number : ' + result.aadharNumber)),
                ],
              );
            }),
      ),
    );
  }
}
