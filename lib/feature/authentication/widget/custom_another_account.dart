import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nti_app/feature/authentication/cubit/logic.dart';
import '../cubit/states.dart';
import 'custom_container_image.dart';

class CustomAnotherAccount extends StatelessWidget {
  const CustomAnotherAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <UserCubit,UserState>(builder: ( context,state){
      var cubit = context.read<UserCubit>();
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(onTap: (){
           // cubit.signInWithGoogle();
          },child: const CustomContainerImage(image: 'assets/gmail.png')),
          const SizedBox(width: 15),
          GestureDetector(onTap: (){
            //cubit.signInWithFacebook();
          },child: const CustomContainerImage(image: 'assets/faceboook.png')),

          const SizedBox(width: 15),

        ],
      );
    }, listener: (context,state){

    });
  }
}
