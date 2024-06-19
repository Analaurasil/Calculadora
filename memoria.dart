class Memoria {
  static const operacoes = const ['/', '+', '-', 'x', '='];
  String _op = '';
  bool _opUsada = false;
  final List<double> _buffer = [0.0, 0.0];
  int _bufferIndex = 0;

  String result = '0';

  Memoria() {
    _limpar();
  }

  void _limpar() {
    result = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _op = '';
    _opUsada = false;
  }

  void aplicarComando(String comando) {
    if (comando == 'AC') {
      _limpar();
    } else if (comando == 'DEL') {
      deletarDigito();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _addDigito(comando);
    }
  }

  void deletarDigito() {
    result = result.length > 1 ? result.substring(0, result.length - 1) : '0';
  }

  void _addDigito(String digito) {
    if (_opUsada) result = '0';

    if (result.contains('.') && digito == '.') digito = '';
    if (result == '0' && digito != '.') {
      result = digito; // Reinicia com o novo dígito se for diferente de '.'
    } else {
      result += digito; // Adiciona o dígito ao resultado atual
    }

    _buffer[_bufferIndex] = double.tryParse(result) ?? 0.0;
    _opUsada = false;
  }

  void _setOperacao(String op) {
    if (_opUsada && op == _op) return;

    if (_bufferIndex == 0) {
      _bufferIndex = 1;
    } else {
      _buffer[0] = _calcular();
    }

    if (op != '=') _op = op;

    result = _buffer[0].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;

    _opUsada = true;
  }

  double _calcular() {
    switch (_op) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      default:
        return 0.0;
    }
  }
}
