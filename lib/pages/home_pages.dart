import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../post.dart';
import 'creativ_pages.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({required Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio . GetX'),
      ),
      body: Obx(
            () => Stack(
          children: [
            ListView.builder(
              itemCount: _controller.items.length,
              itemBuilder: (ctx, index) {
                return itemOfPosts(context, _controller, _controller.items[index]);
              },
            ),

            _controller.isLoading() ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, CreatePage.id);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}