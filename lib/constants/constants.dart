import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: Color(0xffe16555),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: const Text("Loading..."),
              )
            ],
          ),
        );
      },
    ),
  );

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "invalid-email":
      return "Invalid email format.";

    case "wrong-password":
      return "Wrong password.";

    case "user-not-found":
      return "User with this email address was not found.";

    case "user-disabled":
      return "This user has been disabled by an administrator.";

    case "too-many-requests":
      return "Too many requests. Please wait for some time before trying again.";

    case "operation-not-allowed":
      return "This operation is not allowed.";

    case "weak-password":
      return "The password is too weak.";

    case "email-already-in-use":
      return "This email address is already in use by another user.";

    default:
      return "Authentication error occurred: $errorCode";
  }
}

bool loginValidation(String email, String password) {
  if (password.isEmpty && email.isEmpty) {
    showMessage("Both fields are Empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is Empty");
    return false;
  } else if (password.isEmpty) {
    showMessage("Password is Empty");
    return false;
  } else {
    return true;
  }
}
