import 'package:flutter/material.dart';
import 'package:doc2heal/widgets/common/textfield.dart';
import 'package:doc2heal/utils/app_colors.dart';

class UserInput extends StatelessWidget {
  final TextEditingController messageController;
  final VoidCallback sendMessage;
  final FocusNode myfocusNode;

  const UserInput({
    super.key,
    required this.messageController,
    required this.sendMessage,
    required this.myfocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: CustomTextfield(
              focusNode: myfocusNode,
              controller: messageController,
              hintText: 'type message',
            ),
          )),
          Container(
            decoration: const BoxDecoration(
              color: Appcolor.primaryColor,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
