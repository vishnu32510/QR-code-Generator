//ios platform
import 'package:flutter/cupertino.dart';
//main library
import 'package:flutter/material.dart';
//international phone number library
import 'package:intl_phone_field/intl_phone_field.dart';
//about page
import 'about.dart';
//qr generator
import 'generate.dart';

void main() {runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
));
}

// TextEditingController name=TextEditingController();
// TextEditingController phone=TextEditingController();
// TextEditingController address=TextEditingController();
// TextEditingController customer=TextEditingController();
final _formKey = GlobalKey<FormState>();
class Home extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    void _vali(){
      if (_formKey.currentState.validate()) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Generator'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(
              Icons.info_outline
          ),
              onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => info()),
            );
          })
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0), //20 pixel gap around the box
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Text(DateFormat("dd/MM/yyyy-hh:mm:ss").format(now),),
                  TextFormField(
                    obscureText: false,
                    autocorrect: true,
                    controller: name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Valid Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Name',
                      prefixIcon: Icon(
                        Icons.perm_identity,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0, //20 pixel gap
                  ),
                  IntlPhoneField(
                    controller: phone,
                    obscureText: false,
                    // validator: (value) {
                    //   if (value.trim().length != 10) {
                    //     return 'Enter 10 Digit Mobile Number';
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    autocorrect: true,
                    obscureText: false,
                    controller: address,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Valid Address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                      hintText: 'Address',
                      prefixIcon: Icon(
                        Icons.home
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: false,
                    autocorrect: true,
                    controller: customer,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Valid Value';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: false,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No. of Customers',
                      hintText: 'No. of Customers',
                      prefixIcon: Icon(
                          Icons.people
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton.icon(
                    color: Colors.blue[400],
                    icon: Icon(
                      Icons.create
                    ),
                    label: Text('Generate'),
                    onPressed: () {
                      _vali();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



