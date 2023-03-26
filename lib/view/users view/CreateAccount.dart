import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/utils/authentication.dart';
import 'package:first_app/view/users%20view/ScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  File? image;
  ImagePicker picker = ImagePicker();

  Future<void>getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }
  Future<void>uploadImage()async{
    final FirebaseStorage storageInstance = FirebaseStorage.instance;
    final Reference ref = storageInstance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black45),
        title: const Text('新規登録',
            style: TextStyle(
              color: Colors.black45,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children:  [
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: (){
                    getImageFromGallery();
                  },
                  child:  CircleAvatar(
                    foregroundImage: image == null ? null : FileImage(image!),
                    radius: 40,
                    child: const Icon(Icons.add),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(hintText: '名前'),
                    ),
                  ),
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(hintText: 'email'),
                    )

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: passController,
                      decoration: const InputDecoration(hintText: 'password'),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(onPressed: () async{
                  if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && passController.text.isNotEmpty && image !=null){
                  var result = await Authentication.signUp(name: nameController.text, email: emailController.text, password: passController.text);
                  if(result == true) {
                      Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => const UsersScreenPage()));
                  }
                  }
                }, child: const Text('作成')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
