import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fisrt Route'),
      ),
      body: const Content(),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Center(
          child: SizedBox(
          height: 200.0,
          width: 200.0,
          child: Card(
              child: Align(
                alignment: Alignment.center,
                child: Text('API TEXT'),
              ),
              elevation: 5.0,
            ),
          ),
        ),

        Align(  
          alignment: const Alignment(0.0, 0.6),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Voltar'),
          ),
        )
      ],  
    );
  }
}
