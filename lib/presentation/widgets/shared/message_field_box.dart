import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    
    return TextFormField(
      onTapOutside: (e) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(        
        hintText: "Finaliza tu mensaje con '?'",
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final value = textController.value.text;
            textController.clear();
            focusNode.requestFocus();
            onValue(value);
          },
        ),
      ),
      onChanged: (value) {
        // print("Valor del campo: $value");
      },
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);        
      },
    );
  }
}
