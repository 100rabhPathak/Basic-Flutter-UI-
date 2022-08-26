import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

enum Gender { male, female }

class _BusinessPageState extends State<BusinessPage> {
  String dropdownvalue = 'India';
  String dropdownvalue1 = 'Andhra Pradesh';

  var items1 = [
    'India',
  ];
  var items2 = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    'Goa',
    'Gujurat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerela',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    ' Delhi',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal'
  ];
  Gender char = Gender.male;
  final GlobalKey<State> _scaffoldKey = GlobalKey<State>();
  String? _fileName;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation$e");
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      print(_paths!.first.extension);
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
    });
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result! ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => _directoryPath = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: const AssetImage("assets/hjk.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.15), BlendMode.dstATop),
              ),
            ),
            child: ListView(padding: const EdgeInsets.all(15.0), children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                  icon: Icon(Icons.person),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  icon: Icon(Icons.lock),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  hintText: 'Renter Your Password',
                  icon: Icon(Icons.lock),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Address',
                  hintText: 'Enter Your Address',
                  icon: Icon(Icons.place),
                ),
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    const Text(
                      "Select Country",
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: false,
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items1.map((String items1) {
                              return DropdownMenuItem(
                                value: items1,
                                child: Text(items1),
                              );
                            }).toList(),
                            hint: const Align(
                              child: Text(
                                "Select Country",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            onChanged: (String? selectedValue) {
                              setState(() {
                                dropdownvalue = selectedValue!;
                              });
                            })),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    const Text(
                      "Select State",
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    DropdownButtonHideUnderline(
                        child: DropdownButton(
                            isExpanded: false,
                            value: dropdownvalue1,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items2.map((String items2) {
                              return DropdownMenuItem(
                                value: items2,
                                child: Text(items2),
                              );
                            }).toList(),
                            onChanged: (String? selectedValue1) {
                              setState(() {
                                dropdownvalue1 = selectedValue1!;
                              });
                            })),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Select Your Gender",
                      style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),

                    // RadioListTile<Gender>(
                    //   title: const Text('Male'),
                    //   value: Gender.male,
                    //   groupValue: char,
                    //   onChanged: (Gender? value) {
                    //     setState(() {
                    //       char = value!;
                    //     });
                    //   },
                    // ),
                    // RadioListTile<Gender>(
                    //     title: const Text('Female'),
                    //     value: Gender.female,
                    //     groupValue: char,
                    //     onChanged: (Gender? value) {
                    //       setState(() {
                    //         char = value!;
                    //       });
                    //     })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio<Gender>(
                        value: Gender.male,
                        groupValue: char,
                        onChanged: (Gender? value) {
                          setState(() {
                            char = value!;
                          });
                        }),
                    const Text('Male'),
                    Radio<Gender>(
                        value: Gender.female,
                        groupValue: char,
                        onChanged: (Gender? value) {
                          setState(() {
                            char = value!;
                          });
                        }),
                    const Text('Female')
                  ],
                ),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: DropdownButton<FileType>(
                        hint: const Text('LOAD PATH FROM'),
                        value: _pickingType,
                        items: const <DropdownMenuItem<FileType>>[
                          DropdownMenuItem(
                            value: FileType.audio,
                            child: Text('FROM AUDIO'),
                          ),
                          DropdownMenuItem(
                            value: FileType.image,
                            child: Text('FROM IMAGE'),
                          ),
                          DropdownMenuItem(
                            value: FileType.video,
                            child: Text('FROM VIDEO'),
                          ),
                          DropdownMenuItem(
                            value: FileType.media,
                            child: Text('FROM MEDIA'),
                          ),
                          DropdownMenuItem(
                            value: FileType.any,
                            child: Text('FROM ANY'),
                          ),
                          DropdownMenuItem(
                            value: FileType.custom,
                            child: Text('CUSTOM FORMAT'),
                          ),
                        ],
                        onChanged: (value) => setState(() {
                              _pickingType = value!;
                              if (_pickingType != FileType.custom) {
                                _controller.text = _extension = '';
                              }
                            })),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 100.0),
                    child: _pickingType == FileType.custom
                        ? TextFormField(
                            maxLength: 15,
                            autovalidateMode: AutovalidateMode.always,
                            controller: _controller,
                            decoration: const InputDecoration(
                                labelText: 'File extension'),
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                          )
                        : const SizedBox(),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 200.0),
                    child: SwitchListTile.adaptive(
                      title: const Text('Pick multiple files',
                          textAlign: TextAlign.right),
                      onChanged: (bool value) =>
                          setState(() => _multiPick = value),
                      value: _multiPick,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () => _openFileExplorer(),
                          child: const Text("Open file picker"),
                        ),
                        ElevatedButton(
                          onPressed: () => _selectFolder(),
                          child: const Text("Pick folder"),
                        ),
                        ElevatedButton(
                          onPressed: () => _clearCachedFiles(),
                          child: const Text("Clear temporary files"),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (BuildContext context) => _loadingPath
                        ? const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: CircularProgressIndicator(),
                          )
                        : _directoryPath != null
                            ? ListTile(
                                title: const Text('Directory path'),
                                subtitle: Text(_directoryPath!),
                              )
                            : _paths != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.50,
                                    child: Scrollbar(
                                        child: ListView.separated(
                                      itemCount:
                                          _paths != null && _paths!.isNotEmpty
                                              ? _paths!.length
                                              : 1,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final bool isMultiPath =
                                            _paths != null &&
                                                _paths!.isNotEmpty;
                                        final String name =
                                            'File $index: ${isMultiPath ? _paths!.map((e) => e.name).toList()[index] : _fileName ?? '...'}';
                                        final path = _paths!
                                            .map((e) => e.path)
                                            .toList()[index]
                                            .toString();

                                        return ListTile(
                                          title: Text(
                                            name,
                                          ),
                                          subtitle: Text(path),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const Divider(),
                                    )),
                                  )
                                : const SizedBox(),
                  ),
                ],
              )
            ])));
  }
}
