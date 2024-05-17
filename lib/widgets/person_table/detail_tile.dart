import 'package:doc2heal/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTile extends StatelessWidget {
  const DetailTile(
      {super.key,
      required this.sub,
      required this.hittext,
      this.suffixicon,
      this.controllers,
      this.validator,
      this.keyboardType});

  final String sub;
  final String hittext;
  final Widget? suffixicon;
  final TextEditingController? controllers;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          // height: Get.height * .052,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      sub,
                      style: GoogleFonts.urbanist(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                        child: TextFormField(
                      keyboardType: keyboardType,
                      validator: validator,
                      controller: controllers,
                      readOnly: suffixicon == null ? false : true,
                      cursorColor: Appcolor.primaryColor,
                      decoration: InputDecoration(
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedErrorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          suffixIcon: suffixicon,
                          hintText: hittext,
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Appcolor.primaryColor),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: suffixicon == null
                              ? const EdgeInsets.only(
                                  left: 50,
                                )
                              : const EdgeInsets.only(left: 50, top: 10)),
                    )))
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
          thickness: 0.5,
          indent: 12,
          endIndent: 12,
          color: Color.fromARGB(255, 170, 170, 170),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
