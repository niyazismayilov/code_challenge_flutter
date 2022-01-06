import 'package:birbir/presentation/components/view/dialog/alert.dart';
import 'package:birbir/presentation/components/view/indicator/indicator.dart';
import 'package:birbir/presentation/ui/auth/forgot-password/bloc/forgot_password_cubit.dart';
import 'package:birbir/presentation/ui/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forgot_password_body.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final forgotPasswordCubit = ForgotPasswordCubit();

  final mobileController = TextEditingController();

  @override
  void dispose() {
    forgotPasswordCubit.close();

    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ŞİFRƏNİ UNUTDUN?'),
      ),
      body: BlocProvider(
        create: (context) => forgotPasswordCubit,
        child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) async {
            if (state is ForgotPasswordFailure) {
              Alert.showInfo(context, content: state.message);
            } else if (state is ForgotPasswordSuccess) {
              await Alert.showAlert(context, message: state.message);

              Navigator.of(context).pushNamed(RouteName.smsConfirmation, arguments: [
                state.mobile,
                state.smsCode,
                RouteName.changePassword,
              ]);
            }
          },
          builder: (context, state) {
            if (state is ForgotPasswordInProgress) {
              return LoadingIndicator();
            }

            return ForgotPasswordBody(
              mobileController: mobileController,
            );
          },
        ),
      ),
    );
  }
}
