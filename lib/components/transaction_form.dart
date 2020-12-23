import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionForm  extends StatelessWidget {

  final titleController = new TextEditingController();
  final valueController = new TextEditingController();
  final void Function(String title, double value) onSubmit;

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0; //this returns a double value or 0

    if(title.isEmpty || value <=0){
      return;
    }

    this.onSubmit(title, value);
  }

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  labelText: 'Título'
              ),
            ),
            TextField(
              onSubmitted: (_) => _submitForm(), //submit com o botao do teclado
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true), //para funcionar no android e ios
              decoration: InputDecoration(
                  labelText: 'Valor'
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
                    borderRadius: BorderRadius.circular(18)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
