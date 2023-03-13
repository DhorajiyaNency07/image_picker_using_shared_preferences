import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_using_shared_preferences/model/first_model.dart';
import 'package:image_picker_using_shared_preferences/screens/image_picker_with_login/image_home_screen.dart';


class LoginScreen extends StatefulWidget {
  final LoginModel? item;
  const LoginScreen({Key? key, this.item}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  XFile? image;
  var isLoading = false;


  @override
  void initState() {
    if (widget.item != null) {
      emailController.text = widget.item!.emailController!;
      passwordController.text = widget.item!.passwordController!;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form Validation"),
        leading: const Icon(Icons.filter_vintage),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  getImage();
                  setState(() {});
                },
                child: Container(
                    height: 200,
                    width: 300,
                    color: Colors.blue,
                    child: image == null
                        ? const Icon(Icons.account_box_sharp,size: 80,)
                        : Image.file(
                      File(image!.path),
                      height: 100,
                      width: 200,
                    )),
              ),
              //styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
              ),
              //box styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              //text input
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Password'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {},
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                    return 'Enter a valid Password!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              ElevatedButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () {
                  submit();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ImageHomeScreen(),
        ));
  }

  getImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}
