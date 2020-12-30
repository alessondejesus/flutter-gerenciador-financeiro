import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
//tem que ser statefull para o modal funcionar
//quando usar statefull tem que instanciar os atributos pelo this.widget
  final void Function(String title, double value, DateTime date) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = new TextEditingController();
  final valueController = new TextEditingController();
  DateTime _selectedDate;

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(valueController.text) ??
        0; //this returns a double value or 0
    final date = _selectedDate;

    if (title.isEmpty || value <= 0) {
      return;
    }

    if(_selectedDate == null){
      return;
    }

    this.widget.onSubmit(title, value, date);
  }

  _showDatePicker (){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()
    ).then((value){
      if(value == null){
        return;
      }
      _selectedDate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              onSubmitted: (_) => _submitForm(),
              //submit com o botao do teclado
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              //para funcionar no android e ios
              decoration: InputDecoration(labelText: 'Valor'),
            ),
            Container(
              height: 60,
              child: Row(
                children: [
                  _selectedDate == null
                      ? Text('Nenhuma data selecionada')
                      : Text(DateFormat('d MMM y').format(_selectedDate)),
                  FlatButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: FlatButton(
                onPressed: () => _submitForm(),
                child: Text('Nova Transação'),
                color: Colors.deepPurple,
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
