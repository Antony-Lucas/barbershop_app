import 'package:barbershop_app/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class NewEvent extends StatelessWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          Text("Novo Agendamento")
        ]
      ),
      body: const EventBody(),
    );
  }
}

class EventBody extends StatefulWidget {
  const EventBody({Key? key}) : super(key: key);

  @override
  State<EventBody> createState() => _EventBodyState();
}

class _EventBodyState extends State<EventBody> {
  final ValueNotifier<DateTime?> dateSub = ValueNotifier(null);
  final ValueNotifier<DateTime?> longDateSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeSub = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> shortTimeSub = ValueNotifier(null);
  final TextEditingController name = TextEditingController();
  final TextEditingController tell = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text("Teste", textAlign: TextAlign.center, style: TextStyle(fontSize: 24.0),),
            
            const SizedBox(
              height: 20,
            ),

            TextField(
              controller: name,
              decoration: const InputDecoration(
                hintText: "Nome do Cliente"
              ) 
            ),
            const SizedBox(
              height: 20,
            ),

            TextField(
              controller: tell,
              decoration: const InputDecoration(
                hintText: "Telefone"
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            const Text("Data", textAlign: TextAlign.left,),

            ValueListenableBuilder<DateTime?>(
              valueListenable: dateSub, 
              builder: (context, dateVal, child){
                return InkWell(
                  onTap: () async{
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                      currentDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendar,
                      initialDatePickerMode: DatePickerMode.day,
                      builder: (context, child){
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Colors.blueGrey,
                              onSurface: Colors.black45,
                            )
                          ), 
                          child: child!,
                        );
                      },
                    );
                    dateSub.value = date;
                  },
                  child: buildDateTimePicker(
                    dateVal != null ? convertDate(dateVal) : ''
                  )
                );
              },
            ),

            const SizedBox(
              height: 20,
            ),

            const Text("hora", textAlign: TextAlign.left,),

            ValueListenableBuilder<TimeOfDay?>(
              valueListenable: shortTimeSub, 
              builder: (context, timeVal, child){
                return InkWell(
                  onTap: () async{
                    TimeOfDay? time = await showTimePicker(
                      context: context, 
                      initialTime: TimeOfDay.now(),
                      builder: (context, child){
                        return Theme(
                          data: Theme.of(context),
                          child: child!,
                        );
                      }
                    );
                    shortTimeSub.value = time;
                  },
                  child: buildDateTimePicker(
                    timeVal != null ? convertTime(timeVal) : ''
                  ),
                );
              },
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed:(){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("criado com sucesso"),
                    duration: Duration(seconds: 5),
                  )
                );
              }, 
              child: const Text("Agendar"),
            ),
          ],
        ),
      ),
    );
  }

  String convertDate(DateTime datetime){
    return DateFormat('EEE, MMM d, yyy').format(datetime);
  }

  String convertTime(TimeOfDay timeofday){
    DateTime tempDate = DateFormat('hh:mm').parse(
      timeofday.hour.toString() + ':' + timeofday.minute.toString()
    );

    var dateFormat = DateFormat("h:mm a");
    return dateFormat.format(tempDate);
  }

  Widget buildDateTimePicker(String data){
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: AppColors.eggPlant, width: 1.5),
      ),
      title: Text(data),
      trailing: const Icon(
        Icons.calendar_today,
        color: AppColors.eggPlant,
      ),
    );
  }

  Widget buildTextFile({String? hint, required TextEditingController controller}){
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.eggPlant, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class AppColors {
  AppColors._();

  static const Color blackCoffee = Color(0xFF352d39);
  static const Color eggPlant = Color(0xFF6d435a);
  static const Color celeste = Color(0xFFb1ede8);
  static const Color babyPowder = Color(0xFFFFFcF9);
  static const Color ultraRed = Color(0xFFFF6978);
}