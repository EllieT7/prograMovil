//import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:agenda_project/clases/database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../clases/tarea.dart';

class ScreenWork extends StatefulWidget {
  const ScreenWork({Key? key}) : super(key: key);

  @override
  State<ScreenWork> createState() => _ScreenWorkState();
}

class _ScreenWorkState extends State<ScreenWork> {
  TextEditingController miVar = TextEditingController();
  int _selectedIndex = 0;
  //late List<String> tareas = [];
  bool isChecked = false;
  final tareas = List<String>.generate(10000, (i) => "Tarea $i");

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda',
      home: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.white, //Color de fondo del drawer
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top:30),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,//Toma el largo horizontal
                  //color: Colors.grey[100], //Color de fondo
                  child: Column(
                    children: const [
                      Text(
                        'Bienvenid@',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(   //Espacio entre textos
                        height: 10,
                      ),
                      Text(
                        'Estas son las frases que puedes utilizar para realizar acciones en la aplicación sin necesidad de escribir :)',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text('Primera frase'),
                ),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text('Segunda frase'),
                ),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text('Tercer frase'),
                ),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text('Cuarta frase'),
                ),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text('Quinta frase'),
                ),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text('Sexta frase'),
                ),
                Container(
                  margin: const EdgeInsets.only(top:5),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Text('Septima frase'),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(226, 221, 235, 100),
        ),
        body: CustomPaint(
          painter: BluePainter(),
          child: Container(
            margin: const EdgeInsets.only(top: 25, right: 35, left: 35, bottom: 25),
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  offset: Offset(0, 0.75),
                  blurRadius: 25
                )
              ],
            ),
            child: ListView.builder(
              itemCount: tareas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    activeColor: const Color.fromRGBO(170, 218, 199, 100),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        print(index);
                        isChecked = value!;
                      });
                    },
                  ),
                  title: Text(tareas[index]),
                  trailing: IconButton(
                      onPressed: (){
                        setState(() {
                          print(index);
                        });
                      },
                      icon: const Icon(Icons.delete)
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton:
          FloatingActionButton(
            child: const Icon(Icons.add),
            splashColor: Colors.purple,
            onPressed: () {
              print('press');
              modalAddTarea(context);
            },

          ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    blurRadius: 25,
                    offset: Offset(0.0, 0.75)
                )
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Inicio'),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/tareas.png')), label: 'Tareas'),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/horario.png')), label: 'Horario'),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/alarma.png')), label: 'Alarma'),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: const Color.fromRGBO(33, 150, 243, 100),
              unselectedItemColor: const Color.fromRGBO(169, 151, 196, 100),
              unselectedFontSize: 17,
              selectedFontSize: 17,
              iconSize: 30,
              onTap: _onItemTapped,
            ),
        ),
      ),
    );
  }
  modalAddTarea(BuildContext context){
    Widget okButton = TextButton(
        onPressed: (){
          setState(() {
            Navigator.of(context).pop();
            print(miVar.text);
            funciones db = funciones();
            db.open();

            var tarea = Tarea(
                cod_tarea: 1,
                descripcion: 'esta es la tarea 1',
                fecha_inicio: '2007-01-01 10:00:00',
                fecha_final: '2007-01-02 10:00:00',
                terminada: 0
            );
            db.insertTarea(tarea);
            //db.tareas();
          });
        },child: const Text('OK', style: TextStyle(fontSize: 25, color: Colors.pink),)
    );

    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      print(args);
    }

    AlertDialog alert = AlertDialog(
      title: const Text('Valor:'),
      content:
          Column(
            children: [
              Row(
                children: <Widget>[
                  const Text('Tarea:'),
                  Expanded(
                    child: TextField(
                      controller: miVar,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Ingresa una tarea',
                          border: OutlineInputBorder()
                      ) ,
                    ),
                  ),
                ],
              ),
              /*
              SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
              )*/
            ],
          ),

      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: false, //modal
      builder: (BuildContext dialogContext){
        return alert;
      },
    );
  }

}


class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    Paint circleGrey = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color.fromRGBO(226, 221, 235, 100)
      ..strokeWidth = 2;

    Paint circlePink = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color.fromRGBO(245, 214, 199, 100)
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(width*0.05, height*0.23), 100, circleGrey);
    canvas.drawCircle(Offset(width*0.9, height*0.7), 100, circlePink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
