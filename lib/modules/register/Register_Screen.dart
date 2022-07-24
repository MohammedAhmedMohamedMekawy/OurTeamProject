import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';


class RegisterScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your name';
                            }
                          },
                          decoration: InputDecoration(
                            label: Text('User Name'),
                           prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: 'Enter Your Email',
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your password';
                            }
                            return null;
                          },

                          obscureText: RegisterCubit.get(context).isPassword,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: (){
                                RegisterCubit.get(context).changePasswordVisibility();
                              },
                              icon: Icon(
                                RegisterCubit.get(context).suffix,
                              ),
                            ),
                            labelText: 'Enter Your Password',
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your phone';
                            }
                          },

                          decoration: InputDecoration(
                            labelText: 'Please Enter Your Phone Number',
                            prefixIcon: Icon(Icons.phone)
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                    Container(
                      color: Colors.blue,
                        height: 40,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              print(emailController.text);
                              print(passwordController.text);
                              print(nameController.text);
                              print(phoneController.text);
                            }
                          },
                          child: Text(
                            'REGISTER',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                    ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}