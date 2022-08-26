import 'package:flutter/material.dart';
import 'package:help/dashbord_page.dart';
import 'package:help/model.dart';

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
  List<Model> user = [
    Model("1", "Ram", "Doctor", "Actor"),
    Model("2", "Shyam", "Enginerr", "Actor"),
    Model("3", "Dham", "Student", "Actor"),
    Model("4", "Jai ho", "Hello", "Actor"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: const AssetImage("assets/mark.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
            )),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
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

            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: user.length,
              itemBuilder: (context, index) {
                final particularUser = user[index];
                return DataWidget(
                  id: particularUser.id,
                  name: particularUser.name,
                  photo: particularUser.photo,
                  profession: particularUser.profession,
                );
              },
            ),
            // DataTable(
            //   columns: const [
            //     DataColumn(
            //         label: Text('ID',
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold))),
            //     DataColumn(
            //         label: Text('Name',
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold))),
            //     DataColumn(
            //         label: Text('Profession',
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold))),
            //     DataColumn(
            //         label: Text('Photo',
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold))),
            //   ],
            //   rows: [
            //     DataRow(cells: [
            //       const DataCell(Text('1')),
            //       const DataCell(Text('Stephen')),
            //       const DataCell(Text('Actor')),
            //       DataCell(
            //         dropdownmethod(),
            //       ),
            //     ]),
            //     DataRow(cells: [
            //       const DataCell(Text('5')),
            //       const DataCell(Text('John')),
            //       const DataCell(Text('Student')),
            //       DataCell(
            //         dropdownmethod(),
            //       ),
            //     ]),
            //     DataRow(cells: [
            //       const DataCell(Text('10')),
            //       const DataCell(Text('Harry')),
            //       const DataCell(Text('Leader')),
            //       DataCell(
            //         dropdownmethod(),
            //       ),
            //     ]),
            //     DataRow(cells: [
            //       const DataCell(Text('15')),
            //       const DataCell(Text('Peter')),
            //       const DataCell(Text('Scientist')),
            //       DataCell(
            //         dropdownmethod(),
            //       ),
            //     ]),
            //   ],
            // ),
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

class DataWidget extends StatelessWidget {
  const DataWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.profession,
    required this.photo,
  }) : super(key: key);
  final String id;
  final String name;
  final String profession;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.zero,
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black,
          width: 1,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(id),
            const SizedBox(
              height: 20,
              width: 15,
              child: VerticalDivider(
                thickness: 2,
                width: 3,
                color: Colors.black,
              ),
            ),
            Text(name),
            const SizedBox(
              height: 20,
              width: 15,
              child: VerticalDivider(
                thickness: 2,
                width: 3,
                color: Colors.black,
              ),
            ),
            Text(profession),
            const SizedBox(
              height: 20,
              width: 15,
              child: VerticalDivider(
                thickness: 2,
                width: 3,
                color: Colors.black,
              ),
            ),
            Text(photo),
          ],
        ),
      ),
    );
  }
}
