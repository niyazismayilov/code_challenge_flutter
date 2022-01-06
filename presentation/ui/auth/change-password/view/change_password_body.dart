import 'package:birbir/presentation/components/view/button/primary_button.dart';
import 'package:birbir/presentation/components/view/field/primary_field.dart';
import 'package:birbir/presentation/shared/validators/validation_state.dart';
import 'package:birbir/presentation/ui/auth/change-password/bloc/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changePasswordCubit = BlocProvider.of<ChangePasswordCubit>(context);

    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StreamBuilder<ValidationState>(
                stream: changePasswordCubit.passwordValidationStream,
                builder: (context, snapshot) {
                  return PrimaryField(
                    onChanged: changePasswordCubit.updatePassword,
                    type: PrimaryFieldType.changePassword,
                    placeholder: 'Yeni şifrə',
                    validationState: snapshot.data ?? ValidationState.unknown,
                    isPassword: true,
                  );
                },
              ),
              SizedBox(height: 16.0),
              StreamBuilder<ValidationState>(
                stream: changePasswordCubit.combinedValidationStream,
                builder: (context, snapshot) {
                  print("DATA: ${snapshot.data}");
                  return PrimaryField(
                    onChanged: changePasswordCubit.updatePasswordConfirm,
                    type: PrimaryFieldType.changePassword,
                    placeholder: 'Şifrəni təkrarla',
                    validationState: snapshot.data ?? ValidationState.unknown,
                    isPassword: true,
                  );
                },
              ),
              SizedBox(height: 24.0),
              Container(
                width: double.infinity,
                child: PrimaryButton(
                  title: 'Təsdiq et',
                  onPressed: () => changePasswordCubit.changePassword(),
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
