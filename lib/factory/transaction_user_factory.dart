class TransactionUserFactory {
  String _id;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String _title;
  double _value;
  DateTime _date;

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  double get value => _value;

  set value(double value) {
    _value = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

   generate() {
    return [
      {
        'id': this._id,
        'title': this._title,
        'value': this._value,
        'date': this._date,
      }
    ];
  }
}