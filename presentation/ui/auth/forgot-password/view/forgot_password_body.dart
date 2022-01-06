import 'package:birbir/presentation/components/view/button/primary_button.dart';
import 'package:birbir/presentation/components/view/field/primary_field.dart';
import 'package:birbir/presentation/ui/auth/forgot-password/bloc/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordBody extends StatelessWidget {
  final TextEditingController? mobileController;
  const ForgotPasswordBody({
    Key? key,
    this.mobileController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forgotPasswordCubit = BlocProvider.of<ForgotPasswordCubit>(context);

    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PrimaryField(
                controller: mobileController,
                type: PrimaryFieldType.numberField,
                onChanged: forgotPasswordCubit.updateMobile,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 32.0),
              Container(
                width: double.infinity,
                child: PrimaryButton(
                  title: 'Göndər',
                  onPressed: () => forgotPasswordCubit.getSmsCode(),
                ),
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
