import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';


import 'models/produto.dart';
import 'others/decimalTextInputFormatter.dart';

void main() {
  runApp(MercadoApp());
}

class MercadoApp extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  var maskPhone = MaskTextInputFormatter(
      mask: '(##) 9####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  var maskValor = MaskTextInputFormatter(
      mask: '#.###.###,##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  MercadoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrando Produto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                //inputFormatters: [maskPhone],
                controller: _controladorNome,
                maxLength: 40,
                textCapitalization: TextCapitalization.characters,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _controladorValor,
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.number,
                //inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
                inputFormatters: [CurrencyTextInputFormatter(
                  locale: 'pt_BR',
                  symbol: '',
                )],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                  icon: Icon(Icons.monetization_on),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _controladorQuantidade,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                /*inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]'),
                  ),
                ],*/
                style: TextStyle(fontSize: 25),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Estoque',
                  icon: Icon(Icons.assessment_rounded),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final nome = _controladorNome.text;
                  final int? quantidade =
                      int.tryParse(_controladorQuantidade.text);
                  final valor = _controladorValor.text;

                  final Produto produtoNovo = Produto(nome, valor, quantidade);
                  if (kDebugMode) {
                    print(produtoNovo);
                  }
                },
                child: const Text('Confirmar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
