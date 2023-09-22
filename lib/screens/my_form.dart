import 'package:flutter/material.dart';

// enum Gender { male, female, other }
// если недостаточно стандартного разделения, можно создать перечисление
// Gender с помощью типа enum.

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  var _gender = 0;

  // Gender? _gender;
  final _formKey = GlobalKey<FormState>();
  bool _agreement = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      //параметр key со значением _formKey — константа позволит
      // обращаться из дочерних элементов к функционалу формы
      // для проверки данных,сохранения или сброса значений.
      child: Column(
        children: [
          const SizedBox(height: 50),
          const Text("name and surname", style: TextStyle(fontSize: 15)),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) return 'name';
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "email",
            style: TextStyle(fontSize: 15),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) return 'email';
                if (!value.contains('@')) return 'email is not correct';
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          RadioListTile(
              title: const Text("male"),
              value: 0,
              // value: Gender.male,
              groupValue: _gender,
              onChanged: (int? value) {
                setState(() {
                  if (value != null) _gender = value;
                });
              }),
          RadioListTile(
              title: const Text("female"),
              value: 1,
              // value: Gender.female,
              groupValue: _gender,
              onChanged: (int? value) {
                setState(() {
                  if (value != null) _gender = value;
                });
              }),
          CheckboxListTile(
              value: _agreement,
              title: const Text(
                  "By ticking this box you agree to our data usage conditions and privacy policy."),
              // Text('Я ознакомлен' + (_gender == Gender.male ? '' : 'а') + 'с ...'
              // можем менять текст сообщения в зависимости от выбранного пола с помощью тернарного оператора.
              onChanged: (bool? value) => setState(() => _agreement = value!)),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate())
                // проверяем, проходят ли проверку поля ввода, если у полей ввода
                // есть функции проверки в параметре validator.
                // Чтобы _formKey.currentState.validate() вернул значение true (т.е. в полях нет ошибок),
                // все функции должны вернуть значение null (т.е. ничего не возвращать или return null)
                {
                  Color color = Colors.red;
                  String text;

                  if (_gender == null) {
                    text = 'choose the gender';
                  } else if (_agreement == false) {
                    text = 'accept the terms of the agreement';
                  } else {
                    text = 'successful';
                    color = Colors.green;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(text),
                      backgroundColor: color,
                    ),
                    // Если все поля прошли проверку, вызываем:
                    //**`Scaffold.of(context).showSnackBar(SnackBar(content: Text(...) — всплывающее уведомление внизу экрана.
                  );
                }
              },
              child: const Text("Check"))
        ],
      ),
    );
  }
}
