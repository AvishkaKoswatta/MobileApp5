import 'package:flutter/material.dart';


class MyProfileform extends StatefulWidget {
  const MyProfileform({super.key});

  @override
  State<MyProfileform> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfileform> {
 
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isMale = false;
  bool _isFemale = false;
  final TextEditingController _telephoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Profile'),
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16.0),
              CheckboxListTile(
                title: Text('Male'),
                value: _isMale,
                onChanged: (bool? value) {
                  setState(() {
                    _isMale = value!;
                    _isFemale = !value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Female'),
                value: _isFemale,
                onChanged: (bool? value) {
                  setState(() {
                    _isFemale = value!;
                    _isMale = !value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _telephoneController,
                decoration: InputDecoration(labelText: 'Telephone Number'),
                keyboardType: TextInputType.phone,
              ),
               SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add sign-up logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 65, 114),
                      fixedSize: Size(350, 50),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
      
    );
  }

  
}

void main() {
  runApp(
    MaterialApp(
      home: MyProfileform(),
    ),
  );
}
