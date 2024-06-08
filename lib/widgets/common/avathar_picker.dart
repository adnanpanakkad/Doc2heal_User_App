// ignore_for_file: use_build_context_synchronously

import 'package:doc2heal/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvathar extends StatelessWidget {
  const ProfileAvathar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: double.maxFinite,
        height: MediaQuery.sizeOf(context).height * .15,
        child: Center(
          child: Stack(
            children: [
              SizedBox(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 189, 189, 189),
                        blurRadius: 6.0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is SucessfullyPicimageEvent) {
                        return CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(state.profilepath),
                        );
                      }
                      return const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          'assets/Ellipse 1.png',
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 207, 195, 161),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Appcolor.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          context
                              .read<ProfileBloc>()
                              .add(PicUserImgEvent(profilepath: image.path));
                        } else {}
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}