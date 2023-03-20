import 'dart:io';
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
  TextEditingController birthdayController = TextEditingController();
  File? image;
  ImagePicker picker = ImagePicker();

  Future<void>getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile!=null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
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
                      controller: birthdayController,
                      decoration: const InputDecoration(hintText: '誕生日 (例:19981015)'),
                    )

                ),
                const SizedBox(height: 50),
                ElevatedButton(onPressed: (){
                  if(nameController.text.isNotEmpty && birthdayController.text.isNotEmpty && image !=null){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UsersScreenPage()));
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
