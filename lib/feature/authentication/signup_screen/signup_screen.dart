import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nti_app/feature/authentication/login_screen/login_screen.dart';
import 'package:project_nti_app/feature/authentication/widget/custom_app_bar.dart';
import 'package:project_nti_app/feature/authentication/widget/custom_text_field.dart';
import 'package:project_nti_app/feature/authentication/widget/custom_another_account.dart';
import 'package:project_nti_app/feature/home/home.dart';
import '../../../core/widget/button_1.dart';
import '../cubit/logic.dart';
import '../cubit/states.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.02,
            ),
            child: BlocConsumer <UserCubit,UserState>(builder: ( context,state){
              var cubit = context.read<UserCubit>();
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomAppBar(image: 'assets/Mobile login-bro 1.png',heightValue: 0.3,),
                    SizedBox(height: height * 0.02),

                    Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.06,
                      ),
                    ),
                    SizedBox(height: height * 0.005),

                    Text(
                      'Create your new account',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.045,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: height * 0.02),
                    CustomTextField(
                        hintText: 'Full Name',
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter your name';
                          return null;
                        },
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        prefixIcon: Icons.person_2_outlined),
                    CustomTextField(
                      hintText: 'Mobile or Email',
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter your email';
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                    ),

                    CustomTextField(
                      hintText: 'Password',
                      validator: (value) {
                        if (value!.isEmpty) return 'Please enter your password';
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      controller: passwordController,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.password_outlined,
                      isPassword: true,
                    ),

                    SizedBox(height: height * 0.01),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Row(
                        children: [
                          Image.asset('assets/right.png', width: 20),
                          SizedBox(width: 5),
                          Text(
                            "Remember Me",
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.02),
                    const CustomAnotherAccount(),
                    SizedBox(height: height * 0.02),

                    Button1(
                      text: 'Sign in',
                      onTab: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.signUp(
                            nameController.text,
                            emailController.text,
                            passwordController.text,
                          );

                        }
                      },
                    ),

                    SizedBox(height: height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: TextStyle(fontSize: width * 0.045),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              fontSize: width * 0.045,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              );
            }, listener: ( context,state){

              if(state is UserSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registration successful!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              }
              if (state is UserError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.red,
                  )

                );
              }
            })
          ),
        ),
      ),
    );
  }
}
