import 'package:flutter/material.dart';
import 'package:help/dashbord_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = "One";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: const AssetImage("assets/mark.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Saurabh Pathak',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Card(
                color: Colors.redAccent.withOpacity(0),
                //color: Color.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.album, size: 50),
                      title: Text(
                        'About me:',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        ' Kanpur or Cawnpore pronunciation unded in 1803, . l centre of North India and also the ninth-largest urban economy in India.Today it is famous for its colonial architecture, gardens, parks and fine quality leather and textile products which are exported mainly to the West.[12][13] .',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 10,
                color: Colors.lightGreenAccent,
                child: SizedBox(
                  width: 400,
                  height: 300,
                  child: Image.asset(
                    "assets/tree.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Center(
                  child: Text(
                'People-Chart',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
              DataTable(
                columns: const [
                  DataColumn(
                      label: Text('ID',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Profession',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Photo',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(Text('1')),
                    const DataCell(Text('Stephen')),
                    const DataCell(Text('Actor')),
                    DataCell(
                      dropdownmethod(),
                    ),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('5')),
                    const DataCell(Text('John')),
                    const DataCell(Text('Student')),
                    DataCell(
                      dropdownmethod(),
                    ),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('10')),
                    const DataCell(Text('Harry')),
                    const DataCell(Text('Leader')),
                    DataCell(
                      dropdownmethod(),
                    ),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('15')),
                    const DataCell(Text('Peter')),
                    const DataCell(Text('Scientist')),
                    DataCell(
                      dropdownmethod(),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                  ),
                  child: const Text("Thankyou"),
                ),
              ),
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  DropdownButton<String> dropdownmethod() {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Three', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
