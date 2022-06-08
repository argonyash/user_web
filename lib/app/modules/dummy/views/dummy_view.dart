import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dummy_controller.dart';

class DummyView extends GetView<DummyController> {
  const DummyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DummyView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DummyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
