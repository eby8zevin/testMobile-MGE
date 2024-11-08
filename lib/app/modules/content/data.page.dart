import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mge_ahmadabuhasan/app/data/models/photo.model.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/content/content.controller.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  final ContentController _controller = Get.put(ContentController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.getData();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.download),
      ),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _controller.listData.length,
          itemBuilder: (context, index) {
            final item = _controller.listData[index];
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: GestureDetector(
                onTap: () {
                  _showItemDetailDialog(context, item);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.network(
                        item.thumbnailUrl,
                        scale: 1.0,
                        width: 100.0,
                        height: 100.0,
                      ),
                      const SizedBox(width: 10.0,),
                      Expanded(
                        child: Column(
                          children: [
                            Text(item.title),
                            const SizedBox(height: 8.0,),
                            Text(item.url),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      const Icon(Icons.delete),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    ));
  }

  void _showItemDetailDialog(BuildContext context, PhotoModel item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(item.title),
              const SizedBox(height: 12.0),
              Image.network(item.thumbnailUrl),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

}