import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracker/constants.dart';
import 'package:intl/intl.dart';
import 'package:tracker/enums/board_type.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  BoardType? _selectedBoard;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectStartTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _endTime) {
      setState(() {
        _endTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Center(
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: grey5,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(99),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 14,
                color: secondaryColor,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        title: const Text('Add Task'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Task Name'),
              const SizedBox(height: defaultPadding / 2),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your task name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: defaultPadding * 2),
              const Text('Date'),
              const SizedBox(height: defaultPadding / 2),
              InkWell(
                onTap: _selectDate,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    hintText: 'Select date',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    _selectedDate != null
                        ? DateFormat('MMM dd, yyyy').format(_selectedDate!)
                        : 'Select date',
                    style: TextStyle(
                      color: _selectedDate != null ? Colors.black : grey2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding * 2),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Start Time'),
                        const SizedBox(height: defaultPadding / 2),
                        InkWell(
                          onTap: _selectStartTime,
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              hintText: 'Start',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.access_time),
                            ),
                            child: Text(
                              _startTime != null
                                  ? _startTime!.format(context)
                                  : 'Start',
                              style: TextStyle(
                                color:
                                    _startTime != null ? Colors.black : grey2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('End Time'),
                        const SizedBox(height: defaultPadding / 2),
                        InkWell(
                          onTap: _selectEndTime,
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              hintText: 'End',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.access_time),
                            ),
                            child: Text(
                              _endTime != null
                                  ? _endTime!.format(context)
                                  : 'End',
                              style: TextStyle(
                                color: _endTime != null ? Colors.black : grey2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
              const Text('Board'),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: BoardType.values.map((boardType) {
                  final isSelected = _selectedBoard == boardType;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: boardType != BoardType.values.last
                            ? defaultPadding / 2
                            : 0,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedBoard = boardType;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected ? primaryColor : grey3,
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              boardType.displayName,
                              style: TextStyle(
                                color: isSelected ? primaryColor : Colors.black,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: defaultPadding * 4),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
