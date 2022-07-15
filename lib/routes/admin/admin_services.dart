import 'package:barbershop_app/routes/admin/admin_schedule.dart';
import 'package:flutter/material.dart';
import 'package:barbershop_app/widgets/default_textfield.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final serviceNameController = TextEditingController();
  final priceController = TextEditingController();
  final durationController = TextEditingController();
  bool value = true;
  late Map<List<NewService>, bool> mySelectedServices;
  @override
  void dispose() {
    serviceNameController.dispose();
    priceController.dispose();
    durationController.dispose();
    super.dispose();
  }
  List<bool> testcheck = [];
  List<NewService> addServices = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 104, 104, 104),
            elevation: 0,
            actions: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text("Serviços"),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: const <Widget>[
                    Text("Serviços"),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(children: <Widget>[
                  const Text("Criar um novo serviço"),
                  const SizedBox(height: 5.0),
                  buildTextField(
                      controller: serviceNameController,
                      hint: "Nome do serviço"),
                  const SizedBox(height: 5.0),
                  buildTextField(
                      controller: durationController, hint: "Duração em MIN"),
                  const SizedBox(height: 5.0),
                  buildTextField(controller: priceController, hint: "Preço"),
                  const SizedBox(height: 5.0),
                ]),
              ),
              ...addServices.map((services) => CheckboxListTile(
                  title: Text(services.title),
                  value: testcheck.contains(false),
                  onChanged: (value) {
                  setState(() {
                    testcheck.add(false);
                  });
                  }
                )
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    addServices.add(
                      NewService(
                        id: 5,
                        min: 30,
                        title: serviceNameController.text,
                        price: 5.50
                      )
                    );
                  }
                );
              },
              child: const Text("Salvar")),
            ],
          ),
        ),),
      ],
    );
  }
}

class NewService {
  final int id, min;
  final String title;
  final double price;

  NewService({required this.id, required this.title, required this.min, required this.price});
}
