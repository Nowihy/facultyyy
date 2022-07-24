import 'package:flutter/material.dart';

bool isValidEmail(String email){
return RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

void showMessage(String message,BuildContext context){
  showDialog(context: context, builder: (buildContext){
    return AlertDialog(
      content: Text(message),
      actions: [
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text('ok'))
      ],
    );
  });
}

void showLoading(BuildContext context){
  showDialog(context: context, builder: (buildContext){
    return AlertDialog(
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(width: 12),
          Text('Loading..')
        ],
      ),
      actions: [
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text('ok'))
      ],
    );
  },
    barrierDismissible: false
  );
}

void hideLoading(BuildContext context){
  Navigator.pop(context);
}
