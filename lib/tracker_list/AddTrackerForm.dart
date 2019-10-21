import 'package:flutter/material.dart';

class AddTrackerForm extends StatelessWidget {
  
  final TextEditingController _formController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final void Function(String value) _submitFunction;
  
  AddTrackerForm(this._submitFunction);


  String getTrackerIdFromForm(String url) {
    if(url == null) {
      return null;
    }
    List<String> splitAtDelimiter = url.split("/");
    if(splitAtDelimiter.length > 0) {
      return splitAtDelimiter[splitAtDelimiter.length - 1];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (getTrackerIdFromForm(value) == null) {
                  return 'Please enter valid delivery url';
                }
                return null;
              },
              controller: _formController,
            ),
          ),
          new RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _submitFunction(getTrackerIdFromForm(_formController.value.text));
              }
            },
            child: Text('Track'),
          )
        ],
      ),
    );
  }
}
