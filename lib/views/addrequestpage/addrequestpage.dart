import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:prayerful/utils/globals.dart' as globals;

class AddRequestPage extends StatefulWidget {
  const AddRequestPage({Key? key}) : super(key: key);

  @override
  State<AddRequestPage> createState() => _AddRequestPageState();
}

class _AddRequestPageState extends State<AddRequestPage> {
  late String _name;
  late String _prayerRequest;
  late String _tags;
  final profileList = FirebaseFirestore.instance.collection('UserData');

  List<Map<String, dynamic>> request = [];

  final GlobalKey<FormState> _formKey = GlobalKey();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (String? value) {
        if (value.toString().isEmpty) {
          return 'Required';
        }
        return null;
      },
      onSaved: (String? value) {
        _name = value.toString();
      },
    );
  }

  Widget _buildPrayer() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Prayer Request'),
      validator: (String? value) {
        if (value.toString().isEmpty) {
          return 'Required';
        }
        return null;
      },
      onSaved: (String? value) {
        _prayerRequest = value.toString();
      },
    );
  }

  Widget _buildTags() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Tags (Seperated by Comma)'),
      validator: (String? value) {
        if (value.toString().isEmpty) {
          return 'Required';
        }
        return null;
      },
      onSaved: (String? value) {
        _tags = value.toString();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildPrayer(),
              _buildTags(),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  _formKey.currentState!.save();

                  FirebaseFirestore.instance.collection(globals.uid).add({
                    'name': _name,
                    'request': _prayerRequest,
                    'date': DateTime.now(),
                    'tags': _tags.split(',')
                  });

                  Navigator.pop(context);
                },
                child: const Text(
                  'Sumbit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
