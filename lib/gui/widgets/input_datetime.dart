import 'package:jiffy/jiffy.dart';
import 'package:flutter/material.dart';
import 'package:app_test/gui/widgets/text_form_input.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

const String formatterDate = 'dd/MM/yyyy';

class InputDateTime extends StatefulWidget {
  const InputDateTime({
    Key? key,
    required this.hint,
    this.validator,
    this.initialDate,
    this.icon = Feather.map_pin,
    this.title = "Seleccionar",
    this.onCancel,
    this.onConfirm,
  }) : super(key: key);

  final String hint;
  final String? title;
  final IconData icon;
  final DateTime? initialDate;
  final VoidCallback? onCancel;
  final Function(DateTime)? onConfirm;
  final FormFieldValidator<String>? validator;

  @override
  State<InputDateTime> createState() => _InputDateTimeState();
}

class _InputDateTimeState extends State<InputDateTime> {
  Jiffy? dateTime;
  late TextEditingController controller;

  @override
  void initState() {
    if (widget.initialDate != null) {
      dateTime = Jiffy(widget.initialDate);
      controller = TextEditingController(
        text: Jiffy(widget.initialDate).format(formatterDate),
      );
    } else {
      controller = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showPickerDateTime,
      child: AbsorbPointer(
        child: TextFormInput(
          controller: controller,
          hintText: widget.hint,
          icon: widget.icon,
          iconColor: Theme.of(context).colorScheme.primary,
          validator: widget.validator,
        ),
      ),
    );
  }

  Future<void> showPickerDateTime() async {
    final currentDate = DateTime.now();
    final selectedDate = dateTime ?? Jiffy();
    final DateTime? picked = await showDatePicker(
      context: context,
      confirmText: "Aceptar",
      cancelText: "Cancelar",
      helpText: widget.title,
      initialDate: selectedDate.dateTime,
      firstDate: DateTime(1930),
      lastDate: DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        selectedDate.hour,
        selectedDate.minute,
      ),
    );
    if (picked != null && picked != selectedDate.dateTime) {
      controller.text = Jiffy(picked).format(formatterDate);
      dateTime = Jiffy(picked);
      widget.onConfirm?.call(Jiffy(picked).dateTime);
    }
  }
}
