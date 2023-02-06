import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  int _selectedThemeIndex = 0;
  int _number = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progressive Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: _selectedThemeIndex == 0
                      ? const AssetImage('assets/background_image_1.jpg')
                      : const AssetImage('assets/background_image_3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    const Text(
                      'Cambiar el fondo',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              if (_selectedThemeIndex == 1) {
                                _selectedThemeIndex = 0;
                              }
                              setState(() {});
                            },
                            icon: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/background_image_1.jpg'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              if (_selectedThemeIndex == 0) {
                                _selectedThemeIndex = 1;
                              }
                              setState(() {});
                            },
                            icon: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/background_image_3.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    _selectedIndex == 0
                        ? _CounterPage(
                            number: _number,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                right: 25, left: 25, top: 120),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '¿Cuanto va a incrementar?',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      _number = 1;
                                    } else {
                                      _number = int.parse(value);
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.3),
                                  child: IconButton(
                                    iconSize: 65,
                                    onPressed: () {
                                      _selectedIndex = 0;
                                      setState(() {});
                                    },
                                    icon: const Text(
                                      'Mostrar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            _selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.timer_sharp),
              label: 'Contador',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Configuración',
            ),
          ],
        ),
      ),
    );
  }
}

class _CounterPage extends StatefulWidget {
  final int number;

  const _CounterPage({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  State<_CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<_CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    _counter += widget.number;
    setState(() {});
  }

  void _decrementCounter() {
    _counter -= widget.number;
    setState(() {});
  }

  void _resetCounter() {
    _counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 120,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () => _decrementCounter(),
                    icon: const Icon(Icons.remove),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: IconButton(
                    iconSize: 65,
                    onPressed: () => _resetCounter(),
                    icon: const Text(
                      'Limpiar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () => _incrementCounter(),
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
