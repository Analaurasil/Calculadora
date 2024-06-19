import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'memoria.dart';

class Calcular extends StatefulWidget {
  @override
  _CalcularState createState() => _CalcularState();
}
class _CalcularState extends State<Calcular> {
  late Memoria _memoria;

  @override
  void initState() {
    super.initState();
    _memoria = Memoria();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          _buildDisplay(),
          Divider(height: 1),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                _memoria.result,
                minFontSize: 20.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 80.0,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(String label,
      {int flex = 1, Color textColor = Colors.purple, Color backgroundColor = Colors.white}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color>(textColor),
        ),
        onPressed: () {
          setState(() {
            _memoria.aplicarComando(label);
          });
        },
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    return Container(
      color: Colors.white,
      height: 500.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('AC', textColor: Colors.purple),
                _buildKeyboardButton('DEL', textColor: Colors.purple),
                //  _buildKeyboardButton('%', textColor: Colors.purple),
                // _buildKeyboardButton('/', textColor: Colors.purple),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('7'),
                _buildKeyboardButton('8'),
                _buildKeyboardButton('9'),
                _buildKeyboardButton('/', textColor: Colors.purple),
                //_buildKeyboardButton('x', textColor: Colors.purple),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('4'),
                _buildKeyboardButton('5'),
                _buildKeyboardButton('6'),
                _buildKeyboardButton('*', textColor: Colors.purple),
                //_buildKeyboardButton('+', textColor: Colors.purple),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('1'),
                _buildKeyboardButton('2'),
                _buildKeyboardButton('3'),
                _buildKeyboardButton('-', textColor: Colors.purple),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('0'),
                _buildKeyboardButton('.'),
                _buildKeyboardButton('=', textColor: Colors.purple),
                _buildKeyboardButton('+', textColor: Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
