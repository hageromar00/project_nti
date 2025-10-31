import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nti_app/feature/authentication/widget/custom_app_bar.dart';
import 'package:project_nti_app/feature/authentication/widget/custom_text_field.dart';
import '../../../core/widget/button_1.dart';
import '../../home/home.dart';
import '../cubit/logic.dart';
import '../cubit/states.dart';
import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
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
            child: BlocConsumer <UserCubit,UserState>(builder: ( context ,state){
              var cubit = context.read<UserCubit>();

              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomAppBar(image: 'assets/Frame 53.png',heightValue: 0.3,),
                    SizedBox(height: height * 0.02),

                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.06,
                      ),
                    ),
                    SizedBox(height: height * 0.005),

                    Text(
                      'Login to your account',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.045,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: height * 0.02),

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
                    //const CustomAnotherAccount(),
                    SizedBox(height: height * 0.02),

                    Button1(
                      text: 'Login',
                      onTab: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.signIn(
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
                          "Don't have an account?  ",
                          style: TextStyle(fontSize: width * 0.045),
                        ),
                        GestureDetector(
                          onTap: () {


                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );

                          },
                          child: Text(
                            "Sign Up",
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
            }, listener: (context,state){
              if(state is UserSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login successful!'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(name: state.user.name),
                  ),
                );

              }
            }) ,
          ),
        ),
      ),
    );
  }
}
