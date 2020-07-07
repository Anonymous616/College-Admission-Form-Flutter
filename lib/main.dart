import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Admission',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//Drop Down Box
  List programs = [
    "Bachelor of Arts (BA degree)",
    "Bachelor of Science (BS degree)",
    "Bachelor of Fine Arts (BFA degree)"
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String currentProgram;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    currentProgram = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String program in programs) {
      items.add(new DropdownMenuItem(value: program, child: new Text(program)));
    }
    return items;
  }

  void changedDropDownItem(String selectedProgram) {
    setState(() {
      currentProgram = selectedProgram;
    });
  }

// For Saving the Form Values
  final _formKey = GlobalKey<FormState>();
  Model model = Model();

// Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidate: true,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                    width: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      return RegExp(r'^[0-9]').hasMatch(value)
                          ? null
                          : 'Invlaid Aadhar';
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Aadhar Card No.',
                      labelText: 'Aadhar Card No.',
                    ),
                    onSaved: (String value) {
                      model.aadhar = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      return RegExp(r'^[a-zA-Z]').hasMatch(value)
                          ? null
                          : 'Do not use Special Character or Numbers';
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'First Name',
                      labelText: 'First Name',
                    ),
                    onSaved: (String value) {
                      model.firstName = value;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      return RegExp(r'^[a-zA-Z]').hasMatch(value)
                          ? null
                          : 'Do not use Special Character or Numbers';
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                    ),
                    onSaved: (String value) {
                      model.lastName = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      return value.contains('@') && value.contains('.')
                          ? null
                          : 'Invalid Email';
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                    onSaved: (String value) {
                      model.email = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      return RegExp(r'^[a-zA-Z]').hasMatch(value)
                          ? null
                          : 'Invalid City/Town';
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'City/Town',
                      labelText: 'City/Town',
                    ),
                    onSaved: (String value) {
                      model.cityOrTown = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      return RegExp(r'^[0-9]').hasMatch(value)
                          ? null
                          : 'Invalid Mobile Number';
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Mobile Number',
                      labelText: 'Mobile Number',
                    ),
                    onSaved: (String value) {
                      model.mobile = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 20,
                  ),
                  new DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Programs',
                    ),
                    value: currentProgram,
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem,
                    onSaved: (String value) {
                      model.program = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    child: FlatButton(
                      child: Text('Submit'),
                      textColor: Colors.white,
                      color: Colors.indigo,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          setState(() {
                            Alert(
                              context: context,
                              type: AlertType.success,
                              title: "Finished",
                              desc: "Form Submitted",
                              buttons: [
                                DialogButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ).show();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
