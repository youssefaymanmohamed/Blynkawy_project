import 'package:flutter/material.dart';
import '../widgets/smart_device_box.dart';
import 'nav_bar.dart';
import 'add_manuallyPage.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({Key? key});

  @override
  _KitchenState createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  // List of smart devices
  List mySmartDevices = [
    ["Smart Light", "assets/icons/off_bulb.png", true],
    ["Smart Refrigerator", "assets/icons/fridge_off.png", false],
  ];

  // Power button switch handler
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold with background color
      backgroundColor: const Color(0xFFFFF5E0),
      bottomNavigationBar: CustomBottomNavigationBar(context: context, selectedIndex: 0),
      appBar: AppBar(
        // App bar with custom styling
        automaticallyImplyLeading: false,
        title: const Text(
          'My Home',
          style: TextStyle(color: Color(0xFF41B06E), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.mic, color: Color.fromRGBO(65, 176, 110, 1)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_circle, color: Color.fromRGBO(65, 176, 110, 1)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddManuallyPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: _buildFilterChip('All'),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/bedroom');
                    },
                    child: _buildFilterChip('Bedroom'),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/bathroom');
                    },
                    child: _buildFilterChip('Bathroom'),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/livingroom');
                    },
                    child: _buildFilterChip('Livingroom'),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/kitchen');
                    },
                    child: _buildFilterChip('Kitchen'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF41B06E),
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoColumn(Icons.thermostat, '23 C', 'Temperature'),
                      _buildInfoColumn(Icons.water_drop, '40%', 'Humidity'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoColumn(Icons.electrical_services, '100 k', 'Energy Usage'),
                      _buildInfoColumn(Icons.lightbulb, '0%', 'Light intensity'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget for building each filter chip
  Widget _buildFilterChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFF41B06E),
    );
  }

  // Widget for building each info column
  Widget _buildInfoColumn(IconData icon, String value, String description) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF8DECB4), size: 25.0),
        const SizedBox(height: 8.0),
        Text(
          value,
          style: const TextStyle(color: Color(0xFF8DECB4), fontSize: 18.0),
        ),
        Text(
          description,
          style: const TextStyle(color: Color(0xFF8DECB4), fontSize: 18.0),
        ),
      ],
    );
  }
}
