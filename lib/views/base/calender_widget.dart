import 'package:flutter/material.dart';
import 'package:project_template/views/base/calender_cell.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final List<int> _years = List.generate(50, (index) => 2000 + index);
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;

  final Map<DateTime, List<String>> _events = {
    DateTime(2025, 1, 4): ['Meeting with Team', 'Lunch with Friends'],
    DateTime(2023, 12, 17): ['Project Deadline'],
    DateTime(2023, 12, 30): ['Holiday Party'],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  List<Widget> _buildCalendarDays(DateTime month) {
    final List<Widget> days = [];
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    final firstDayOfWeek = firstDayOfMonth.weekday;
    final totalDays = lastDayOfMonth.day;

    // Add empty cells for the first week
    for (int i = 1; i < firstDayOfWeek; i++) {
      days.add(const SizedBox());
    }

    // Add days of the month
    for (int day = 1; day <= totalDays; day++) {
      final currentDay = DateTime(month.year, month.month, day);
      if (day == 2) {
        days.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = currentDay;
              });
            },
            child: CalendarCell(
              status: BookingStatus.none,
              showBorder: true,
              dayNumber: day,
            ),
          ),
        );
      } else if (day == 4) {
        days.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = currentDay;
              });
            },
            child: CalendarCell(
              status: BookingStatus.pastStart,
              showBorder: true,
              dayNumber: day,
            ),
          ),
        );
      } else if (day == 5) {
        days.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = currentDay;
              });
            },
            child: CalendarCell(
              status: BookingStatus.past,
              showBorder: true,
              dayNumber: day,
            ),
          ),
        );
      } else if (day == 6) {
        days.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = currentDay;
              });
            },
            child: CalendarCell(
              status: BookingStatus.past,
              showBorder: true,
              dayNumber: day,
            ),
          ),
        );
      } else if (day == 7) {
        days.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = currentDay;
              });
            },
            child: CalendarCell(
              status: BookingStatus.pastEnd,
              showBorder: true,
              dayNumber: day,
            ),
          ),
        );
      } else {
        days.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = currentDay;
              });
            },
            child: CalendarCell(
              status: BookingStatus.none,
              dayNumber: day,
            ),
          ),
        );
      }
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    final firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Custom Calendar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Year, Month Dropdowns, and Today Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Today Button
                InkWell(
                  onTap: () {
                    setState(() {
                      _focusedDay = DateTime.now();
                      _selectedYear = _focusedDay.year;
                      _selectedMonth = _focusedDay.month;
                      _selectedDay = _focusedDay;
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 60,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF333333)),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Center(child: Text("Today")),
                  ),
                ),

                // Year Dropdown
                Container(
                  height: 35,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF333333)),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: DropdownButton<int>(
                    value: _selectedYear,
                    items: _years.map((year) {
                      return DropdownMenuItem(
                        value: year,
                        child: Text(year.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedYear = value!;
                        _focusedDay = DateTime(_selectedYear, _selectedMonth);
                      });
                    },
                    underline: SizedBox(),
                  ),
                ),

                // Month Dropdown
                Container(
                  height: 35,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF333333)),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: DropdownButton<int>(
                    value: _selectedMonth,
                    items: List.generate(_months.length, (index) {
                      return DropdownMenuItem(
                        value: index + 1,
                        child: Text(_months[index]),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        _selectedMonth = value!;
                        _focusedDay = DateTime(_selectedYear, _selectedMonth);
                      });
                    },
                    underline: SizedBox(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Days of the week row
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xffF2F5F7),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Mon',
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('Tue',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold)),
                  Text('Wed',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold)),
                  Text('Thu',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold)),
                  Text('Fri',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold)),
                  Text('Sat',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.bold)),
                  Text('Sun',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Calendar Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: GridView.count(
                    crossAxisSpacing: 4.0,
                    crossAxisCount: 7,
                    children: _buildCalendarDays(firstDayOfMonth),
                  ),
                ),
              ),
            ),

            // Events Section
            const SizedBox(height: 8.0),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Events for ${_selectedDay != null ? '${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}' : 'None'}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    if (_selectedDay != null &&
                        _getEventsForDay(_selectedDay!).isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          itemCount: _getEventsForDay(_selectedDay!).length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                _getEventsForDay(_selectedDay!)[index],
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    else
                      const Text('No events for this date.',
                          style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
