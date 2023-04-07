import 'package:first_app/fireStore/posts.dart';
import 'package:first_app/utils/authentication.dart';
import 'package:flutter/material.dart';

import '../../../model/Post.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('新規投稿',style: TextStyle(color: Colors.black45),),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black45),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: contentController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: ()async{
              if(contentController.text.isNotEmpty){
                Post newPost = Post(
                  content: contentController.text,
                  postAccountId: Authentication.myAccount!.name
                );
                var result = await PostFirestore.addPost(newPost);
                if(result == true){
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              }
            },
                child: const Text('投稿')
            )
          ],
        ),
      ),
    );
  }
}
