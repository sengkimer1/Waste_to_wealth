import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

enum RecurringPickupOption {
  oneDay,
  oneWeek,
  twoWeeks,
  oneMonth,
  oneYear,
  other,
}

class PickupScreen extends StatefulWidget {
  @override
  _PickupScreenState createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController wasteTypeController = TextEditingController();
  RecurringPickupOption? selectedRecurringOption;
  TextEditingController otherRecurringController = TextEditingController();

  List<String> selectedWasteTypes = [];
  final List<String> wasteTypes = [
    'Plastic',
    'Metal',
    'Paper',
    'Glass',
    'Electronic',
  ];

  // Function to show Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('MM/dd/yyyy').format(picked);
      });
    }
  }

  // Function to show Time Picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        timeController.text = picked.format(context);
      });
    }
  }

  // Function to handle Waste Type Selection Dialog
  Future<void> _selectWasteTypes(BuildContext context) async {
    final List<String>? selected = await showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          wasteTypes: wasteTypes,
          selectedWasteTypes: List.from(
            selectedWasteTypes,
          ), // Clone list to avoid direct mutation
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedWasteTypes = selected;
        wasteTypeController.text = selected.join(', ');
      });
    }
  }

  // Widget for recurring pickup radio buttons
  Widget _buildRadioOption(RecurringPickupOption option, String text) {
    return RadioListTile<RecurringPickupOption>(
      title: Text(text),
      value: option,
      groupValue: selectedRecurringOption,
      onChanged: (RecurringPickupOption? value) {
        setState(() {
          selectedRecurringOption = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button with Navigation
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    'assets/icons/left-chevron.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                // Title
                const Text(
                  'Schedule Pickup',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E553B),
                  ),
                ),

                // Pickup History Button
                ElevatedButton(
                  onPressed: () {
                    // Add action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF51BB20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Pickup History',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Date Picker
            const Text(
              "Select Date",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: dateController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "MM/DD/YYYY",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/calendar-alt.svg',
                    height: 20,
                  ),
                  onPressed: () => _selectDate(context),
                ),
              ),
              onTap: () => _selectDate(context),
            ),

            const SizedBox(height: 10),

            // Time Picker
            const Text(
              "Select Time",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: timeController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Time",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/time-alarm.svg',
                    width: 20,
                    height: 20,
                  ),
                  onPressed: () => _selectTime(context),
                ),
              ),
              onTap: () => _selectTime(context),
            ),

            const SizedBox(height: 10),
            const Text(
              "Estimate weight/volume",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Please put your weight/volume",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            // Waste Type Selection
            const SizedBox(height: 10),

            const Text(
              "Waste Type (Multiple Selection)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: wasteTypeController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Select Waste Types",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/down-chevron.svg',
                    width: 20,
                    height: 20,
                  ),
                  onPressed: () => _selectWasteTypes(context),
                ),
              ),
              onTap: () => _selectWasteTypes(context),
            ),

            const SizedBox(height: 10),

            // Recurring Pickup Section
            const Text(
              "Recurring Pickup",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildRadioOption(RecurringPickupOption.oneDay, "1 Day"),
            _buildRadioOption(RecurringPickupOption.oneWeek, "1 Week"),
            _buildRadioOption(RecurringPickupOption.twoWeeks, "2 Weeks"),
            _buildRadioOption(RecurringPickupOption.oneMonth, "1 Month"),
            _buildRadioOption(RecurringPickupOption.oneYear, "1 Year"),

            RadioListTile<RecurringPickupOption>(
              title: const Text("Other"),
              value: RecurringPickupOption.other,
              groupValue: selectedRecurringOption,
              onChanged: (RecurringPickupOption? value) {
                setState(() {
                  selectedRecurringOption = value;
                });
              },
            ),

            if (selectedRecurringOption == RecurringPickupOption.other)
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 10, bottom: 10),
                child: TextField(
                  controller: otherRecurringController,
                  decoration: const InputDecoration(
                    hintText: "Enter custom interval",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 350,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xF32E553B),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Schedule Pickup',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiSelectDialog extends StatefulWidget {
  final List<String> wasteTypes;
  final List<String> selectedWasteTypes;

  MultiSelectDialog({
    required this.wasteTypes,
    required this.selectedWasteTypes,
  });

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  late List<String> selectedWasteTypes = List.from(widget.selectedWasteTypes);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Waste Types'),
      content: SingleChildScrollView(
        child: Column(
          children:
              widget.wasteTypes.map((wasteType) {
                return CheckboxListTile(
                  title: Text(wasteType),
                  value: selectedWasteTypes.contains(wasteType),
                  onChanged: (bool? selected) {
                    setState(() {
                      selected!
                          ? selectedWasteTypes.add(wasteType)
                          : selectedWasteTypes.remove(wasteType);
                    });
                  },
                );
              }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, selectedWasteTypes),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
