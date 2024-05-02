import 'package:crud1/service/service_crud.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController addressCtrl = TextEditingController();
    TextEditingController phoneCtrl = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              controller: nameCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'name'),
            ),
            TextFormField(
              controller: emailCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "email"),
            ),
            TextFormField(
              controller: addressCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "address"),
            ),
            TextFormField(
              controller: phoneCtrl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "phone"),
            ),
            ElevatedButton(
                onPressed: () {
                  submit(nameCtrl.text, emailCtrl.text, addressCtrl.text,
                      phoneCtrl.text);
                },
                child: Text('Submit')),
          ],
        ),
      ),
    );
  }

  Future<void> submit(
      String name, String email, String address, String phone) async {
    ApiService().postData(name, email, address, phone);
  }
 
}
