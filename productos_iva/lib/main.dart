import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Productos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductoForm(),
    );
  }
}

class ProductoForm extends StatefulWidget {
  @override
  _ProductoFormState createState() => _ProductoFormState();
}

class _ProductoFormState extends State<ProductoForm> {
  
  final _precioController1 = TextEditingController();
  final _precioController2 = TextEditingController();
  final _precioController3 = TextEditingController();
  final _precioController4 = TextEditingController();
  final _precioController5 = TextEditingController();

  double _totalConIva = 0.0;

 
  void _calcularTotalConIva() {

    double precio1 = double.tryParse(_precioController1.text) ?? 0.0;
    double precio2 = double.tryParse(_precioController2.text) ?? 0.0;
    double precio3 = double.tryParse(_precioController3.text) ?? 0.0;
    double precio4 = double.tryParse(_precioController4.text) ?? 0.0;
    double precio5 = double.tryParse(_precioController5.text) ?? 0.0;

    double total = precio1 + precio2 + precio3 + precio4 + precio5;

    setState(() {
      _totalConIva = total * 1.19;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingreso de Productos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _precioController1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Precio del Producto 1'),
            ),
            TextField(
              controller: _precioController2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Precio del Producto 2'),
            ),
            TextField(
              controller: _precioController3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Precio del Producto 3'),
            ),
            TextField(
              controller: _precioController4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Precio del Producto 4'),
            ),
            TextField(
              controller: _precioController5,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Precio del Producto 5'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularTotalConIva,
              child: Text('Calcular Total con IVA'),
            ),
            SizedBox(height: 20),
            Text(
              'Total con IVA: \$$_totalConIva',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
