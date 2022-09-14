import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  // void checkBoxCallBack(bool checkBoxState) {
  //   setState(() {
  //     isChecked = checkBoxState;
  //   });
  // }

  void checkBoxCallBack(bool? checkBoxState) {
    if (checkBoxState != null) {
      setState(() {
        isChecked = checkBoxState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'this is text',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckBox(
        checkBoxState: isChecked,
        // ToggleCheckBoxState: (bool checkboxState) {
        //   setState(() {
        //     isChecked = checkboxState;
        //   });
        // },
        ToggleCheckBoxState: checkBoxCallBack,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final void Function(bool?)? ToggleCheckBoxState;
  TaskCheckBox(
      {required this.checkBoxState, required this.ToggleCheckBoxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: ToggleCheckBoxState,
    );
  }
}
