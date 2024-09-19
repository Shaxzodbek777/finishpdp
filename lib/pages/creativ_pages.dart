import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/create_controller.dart';

class CreatePage extends StatefulWidget {
  static const String id = 'create_page';

  const CreatePage({required Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _controller = Get.put(CreateController());

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
          _controller.apiPostCreate(context);
        },
        child: const Icon(Icons.file_upload),
      ),
    );
  }
}