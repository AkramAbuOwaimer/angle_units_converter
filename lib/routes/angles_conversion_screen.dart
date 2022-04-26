import 'package:flutter/material.dart';

class AnglesConversionScreen extends StatefulWidget {
  AnglesConversionScreen({Key? key}) : super(key: key);

  @override
  State<AnglesConversionScreen> createState() => _AnglesConversionScreenState();
}

class _AnglesConversionScreenState extends State<AnglesConversionScreen> {
  String selectedFromUnit = 'Degrees';
  String selectedToUnit = 'Mills (NATO)';

  bool isFromDMS = false;
  bool isToDMS = false;

  late TextEditingController _fromValueController;
  late TextEditingController _toValueController;
  late TextEditingController _fromDegreesController;
  late TextEditingController _fromMinutesController;
  late TextEditingController _fromSecondsController;
  late TextEditingController _toDegreesController;
  late TextEditingController _toMinutesController;
  late TextEditingController _toSecondsController;

  late FocusNode _fromDegreesFocusNode;
  late FocusNode _fromMinutesFocusNode;
  late FocusNode _fromSecondsFocusNode;

  @override
  void initState() {
    _fromValueController = TextEditingController();
    _toValueController = TextEditingController();
    _fromDegreesController = TextEditingController();
    _fromMinutesController = TextEditingController();
    _fromSecondsController = TextEditingController();
    _toDegreesController = TextEditingController();
    _toMinutesController = TextEditingController();
    _toSecondsController = TextEditingController();

    _fromDegreesFocusNode = FocusNode();
    _fromMinutesFocusNode = FocusNode();
    _fromSecondsFocusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Angles Converter'),
        ),
        backgroundColor: Colors.blue.shade500,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.36,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue.shade600,
                      Colors.blue.shade800,
                    ],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Select the unit you want to convert',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25.0,
                            vertical: 8.0,
                          ),
                          child: DropdownButton<String>(
                            iconEnabledColor: Colors.white,
                            alignment: Alignment.center,
                            dropdownColor: Colors.blue.shade900,
                            value: selectedFromUnit,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 16,
                            style: const TextStyle(color: Colors.white),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedFromUnit = newValue!;
                                isFromDMS = selectedFromUnit ==
                                    'Degrees Minutes Seconds';
                                onInputChanged();
                              });
                            },
                            items: <String>[
                              'Degrees',
                              'Mills (NATO)',
                              'Mills (EAST)',
                              'Degrees Minutes Seconds',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20,
                            18,
                            20,
                            5,
                          ),
                          child: isFromDMS
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        child: TextField(
                                          focusNode: _fromDegreesFocusNode,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          onSubmitted: (value) {
                                            _fromMinutesFocusNode
                                                .requestFocus();
                                          },
                                          onChanged: (value) =>
                                              onInputChanged(),
                                          controller: _fromDegreesController,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            labelText: 'Degrees',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        child: TextField(
                                          focusNode: _fromMinutesFocusNode,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          onSubmitted: (value) {
                                            _fromSecondsFocusNode
                                                .requestFocus();
                                          },
                                          onChanged: (value) =>
                                              onInputChanged(),
                                          controller: _fromMinutesController,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelText: 'Minutes',
                                            labelStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        child: TextField(
                                          focusNode: _fromSecondsFocusNode,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          onSubmitted: (value) {},
                                          onChanged: (value) =>
                                              onInputChanged(),
                                          controller: _fromSecondsController,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelText: 'Seconds',
                                            labelStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => onInputChanged(),
                                  controller: _fromValueController,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Enter the value to convert',
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
              child: IconButton(
                icon: Icon(
                  Icons.swap_vert,
                  size: screenHeight * 0.1,
                ),
                onPressed: () {
                  var temp = selectedFromUnit;
                  setState(() {
                    selectedFromUnit = selectedToUnit;
                    selectedToUnit = temp;
                    isFromDMS = selectedFromUnit == 'Degrees Minutes Seconds';
                    isToDMS = selectedToUnit == 'Degrees Minutes Seconds';
                    onInputChanged();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.36,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue.shade800,
                      Colors.blue.shade800,
                    ],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Select the result unit',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25.0,
                            vertical: 8.0,
                          ),
                          child: DropdownButton<String>(
                            iconEnabledColor: Colors.white,
                            alignment: Alignment.center,
                            dropdownColor: Colors.blue.shade900,
                            value: selectedToUnit,
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            elevation: 16,
                            style: const TextStyle(color: Colors.white),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedToUnit = newValue!;
                                isToDMS =
                                    selectedToUnit == 'Degrees Minutes Seconds';
                                onInputChanged();
                              });
                            },
                            items: <String>[
                              'Degrees',
                              'Mills (NATO)',
                              'Mills (EAST)',
                              'Degrees Minutes Seconds',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20,
                            18,
                            20,
                            5,
                          ),
                          child: isToDMS
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          enabled: false,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) =>
                                              onInputChanged(),
                                          controller: _toDegreesController,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            focusColor: Colors.blueAccent,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            labelText: 'Degrees',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          enabled: false,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) =>
                                              onInputChanged(),
                                          controller: _toMinutesController,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelText: 'Minutes',
                                            labelStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          enabled: false,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) =>
                                              onInputChanged(),
                                          controller: _toSecondsController,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelText: 'Seconds',
                                            labelStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : TextField(
                                  controller: _toValueController,
                                  textAlign: TextAlign.center,
                                  enabled: false,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Result',
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onInputChanged() {
    if (selectedFromUnit == 'Degrees' && selectedToUnit == 'Degrees') {
      _toValueController.text = _fromValueController.text;
    } else if (selectedFromUnit == 'Degrees' &&
        selectedToUnit == 'Mills (NATO)') {
      double degrees = double.parse(
          _fromValueController.text.isEmpty ? '0' : _fromValueController.text);
      _toValueController.text =
          (degrees * 17.77777777777778).toStringAsFixed(4);
    } else if (selectedFromUnit == 'Degrees' &&
        selectedToUnit == 'Mills (EAST)') {
      double degrees = double.parse(
          _fromValueController.text.isEmpty ? '0' : _fromValueController.text);
      _toValueController.text =
          (degrees * 16.66666666666667).toStringAsFixed(4);
    } else if (selectedFromUnit == 'Degrees' &&
        selectedToUnit == 'Degrees Minutes Seconds') {
      double degrees = double.parse(
          _fromValueController.text.isEmpty ? '0' : _fromValueController.text);
      int degreesInt = degrees.toInt();
      double minutes = (degrees - degreesInt) * 60;
      int minutesInt = minutes.toInt();
      double seconds = (minutes - minutesInt) * 60;
      _toDegreesController.text = degreesInt.toString();
      _toMinutesController.text = minutesInt.toString();
      _toSecondsController.text = seconds.toStringAsFixed(4);
    } else if (selectedFromUnit == 'Mills (NATO)' &&
        selectedToUnit == 'Degrees') {
      double mills = double.parse(
          _fromValueController.text.isEmpty ? '0' : _fromValueController.text);
      _toValueController.text = (mills / 17.77777777777778).toStringAsFixed(4);
    } else if (selectedFromUnit == 'Mills (NATO)' &&
        selectedToUnit == 'Mills (NATO)') {
      _toValueController.text = _fromValueController.text;
    } else if (selectedFromUnit == 'Mills (NATO)' &&
        selectedToUnit == 'Mills (EAST)') {
      double mills = double.parse(
          _fromValueController.text.isEmpty ? '0' : _fromValueController.text);
      _toValueController.text = (mills * (6000 / 6400)).toStringAsFixed(4);
    } else if (selectedFromUnit == 'Mills (NATO)' &&
        selectedToUnit == 'Degrees Minutes Seconds') {
      double mills = double.parse(
          _fromValueController.text.isEmpty ? '0' : _fromValueController.text);
      double degrees = mills / 17.77777777777778;
      int degreesInt = degrees.toInt();
      double minutes = (degrees - degreesInt) * 60;
      int minutesInt = minutes.toInt();
      double seconds = (minutes - minutesInt) * 60;
      _toDegreesController.text = degreesInt.toString();
      _toMinutesController.text = minutesInt.toString();
      _toSecondsController.text = seconds.toStringAsFixed(4);
    } else if (selectedFromUnit == 'Mills (EAST)' &&
        selectedToUnit == 'Degrees') {
      double mills = double.parse(
          _fromValueController.text.isEmpty ? '0' : _fromValueController.text);
      _toValueController.text = (mills / 16.66666666666667).toStringAsFixed(4);
    } else if (selectedFromUnit == 'Mills (EAST)' &&
        selectedToUnit == 'Mills (NATO)') {
      double mills = double.parse(
          _fromValueController.text.isEmpty ? '0' : _fromValueController.text);
      _toValueController.text = (mills * (6400 / 6000)).toStringAsFixed(4);
    } else if (selectedFromUnit == 'Mills (EAST)' &&
        selectedToUnit == 'Mills (EAST)') {
      _toValueController.text = _fromValueController.text;
    } else if (selectedFromUnit == 'Mills (EAST)' &&
        selectedToUnit == 'Degrees Minutes Seconds') {
      double mills = double.parse(
          _fromValueController.text.isEmpty ? '0' : _fromValueController.text);
      double degrees = mills / 16.66666666666667;
      int degreesInt = degrees.toInt();
      double minutes = (degrees - degreesInt) * 60;
      int minutesInt = minutes.toInt();
      double seconds = (minutes - minutesInt) * 60;
      _toDegreesController.text = degreesInt.toString();
      _toMinutesController.text = minutesInt.toString();
      _toSecondsController.text = seconds.toStringAsFixed(4);
    } else if (selectedFromUnit == 'Degrees Minutes Seconds' &&
        selectedToUnit == 'Degrees') {
      double degreesInt = double.parse(_fromDegreesController.text.isEmpty
          ? '0'
          : _fromDegreesController.text);
      double minutesInt = double.parse(_fromMinutesController.text.isEmpty
          ? '0'
          : _fromMinutesController.text);
      double seconds = double.parse(_fromSecondsController.text.isEmpty
          ? '0'
          : _fromSecondsController.text);
      double degrees = degreesInt + (minutesInt / 60) + (seconds / 3600);
      _toValueController.text = degrees.toStringAsFixed(4);
    } else if (selectedFromUnit == 'Degrees Minutes Seconds' &&
        selectedToUnit == 'Mills (NATO)') {
      double degreesInt = double.parse(_fromDegreesController.text.isEmpty
          ? '0'
          : _fromDegreesController.text);
      double minutesInt = double.parse(_fromMinutesController.text.isEmpty
          ? '0'
          : _fromMinutesController.text);
      double seconds = double.parse(_fromSecondsController.text.isEmpty
          ? '0'
          : _fromSecondsController.text);
      double degrees = degreesInt + (minutesInt / 60) + (seconds / 3600);
      _toValueController.text =
          (degrees * 17.77777777777778).toStringAsFixed(4);
    } else if (selectedFromUnit == 'Degrees Minutes Seconds' &&
        selectedToUnit == 'Mills (EAST)') {
      double degreesInt = double.parse(_fromDegreesController.text.isEmpty
          ? '0'
          : _fromDegreesController.text);
      double minutesInt = double.parse(_fromMinutesController.text.isEmpty
          ? '0'
          : _fromMinutesController.text);
      double seconds = double.parse(_fromSecondsController.text.isEmpty
          ? '0'
          : _fromSecondsController.text);
      double degrees = degreesInt + (minutesInt / 60) + (seconds / 3600);
      _toValueController.text =
          (degrees * 16.66666666666666667).toStringAsFixed(4);
    } else if (selectedFromUnit == 'Degrees Minutes Seconds' &&
        selectedToUnit == 'Degrees Minutes Seconds') {
      _toDegreesController.text = _fromDegreesController.text;
      _toMinutesController.text = _fromMinutesController.text;
      _toSecondsController.text = _fromSecondsController.text;
    }
  }
}
