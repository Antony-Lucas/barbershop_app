import 'package:barbershop_app/routes/admin/admin_new_schedule.dart';
import 'package:flutter/material.dart';
import 'package:barbershop_app/widgets/default_textfield.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final serviceNameController = TextEditingController();
  final servicePriceController = TextEditingController();
  final serviceDurationController = TextEditingController();
  List<NewService> addServices = [];
  List<Map> mySelectedServices = [];
  
  @override
  void dispose() {
    serviceNameController.dispose();
    servicePriceController.dispose();
    serviceDurationController.dispose();
    super.dispose();
  }
  final bool _checkValue = false;

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
            child: Column(
              children: <Widget>[
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
                      controller: servicePriceController, 
                      hint: "Preço"),
                    const SizedBox(height: 5.0),
                    buildTextField(
                      controller: serviceDurationController, 
                      hint: "Duração em MIN"),
                    const SizedBox(height: 5.0),
                  ]),
                ),
                ...addServices.map((services) => CheckboxListTile(
                    title: Text(services.title),
                    subtitle: Text(services.price.toString()),
                    value: services.check,
                    onChanged: (newvalue) {
                      setState(() {
                        services.check = newvalue!;
                      });
                    }
                  )
                ),
                Wrap(
                  children: [
                    ...addServices.map((e){
                        if(e.check == true){
                          return Card(
                            elevation: 3,
                            color: AppColors.babyPowder,
                            child: Text(e.title),
                          );
                        }
                        return Container();
                      }
                    ).toList(),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      addServices.add(NewService(
                        id: 0,
                        min: int.parse(serviceDurationController.text),
                        title: serviceNameController.text,
                        price: double.parse(servicePriceController.text),
                        check: _checkValue,
                        )
                      );
                    });
                  },
                  child: const Text("Salvar")),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NewService {
  final int id, min;
  final String title;
  final double price;
  late bool check;
  NewService(
      {
      required this.id,
      required this.title,
      required this.min,
      required this.price,
      required this.check,
      }
  );
}
