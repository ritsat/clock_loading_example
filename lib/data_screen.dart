import 'package:clock_loader/clock_loader.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Data Screen"),
        ),
        body: Center(
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return SizedBox(
                  width: 300,
                  height: 300,
                  child: ClockLoader(
                      clockLoaderModel: ClockLoaderModel(
                          particlesColor: Colors.red,
                          mainHandleColor: Colors.red,
                          shapeOfParticles: ShapeOfParticlesEnum.circle)),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      String course = snapshot.data[index];
                      return ListTile(
                        title: Text(course),
                      );
                    });
              }
            },
            future: getCourseList(),
          ),
        ));
  }

  Future getCourseList() async {
    await Future.delayed(const Duration(seconds: 10));
    return ['Dart', 'Flutter', 'React Native'];
  }
}
