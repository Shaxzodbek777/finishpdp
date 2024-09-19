
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model.dart';

class UpdatePage extends StatefulWidget {
  static const String id = 'update_page';

  Post post;
  UpdatePage({required this.post, required Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _controller = Get.put(UpdateController());

  @override
  void initState() {
    super.initState();

    _controller.titleTextEditingController().text = widget.post.title;
    _controller.bodyTextEditingController().text = widget.post.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new post'),
      ),
      body: Obx(
            () => Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Title
                  Container(
                    height: 75,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        controller: _controller.titleTextEditingController(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  // Body
                  Container(
                    height: 475,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _controller.bodyTextEditingController(),
                      style: const TextStyle(fontSize: 18),
                      maxLines: 30,
                      decoration: const InputDecoration(
                        labelText: 'Body',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            _controller.isLoading() ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          _controller.apiPostUpdate(context, widget.post);
        },
        child: const Icon(Icons.file_upload),
      ),
    );
  }
}