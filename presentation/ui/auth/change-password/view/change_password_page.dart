import 'package:birbir/presentation/components/view/dialog/alert.dart';
import 'package:birbir/presentation/components/view/indicator/indicator.dart';
import 'package:birbir/presentation/ui/auth/change-password/bloc/change_password_cubit.dart';
import 'package:birbir/presentation/ui/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_password_body.dart';

class ChangePasswordPage extends StatefulWidget {
  final String mobile;

  const ChangePasswordPage({
    Key? key,
    required this.mobile,
  }) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final changePasswordCubit = ChangePasswordCubit();

  @override
  void dispose() {
    changePasswordCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ŞİFRƏNİ DƏYİŞ'),
      ),
      body: BlocProvider(
        create: (context) => changePasswordCubit..setMobile(widget.mobile),
        child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) async {
            if (state is ChangePasswordFailure) {
              Alert.showInfo(context, content: state.message);
            } else if (state is ChangePasswordSuccess) {
              await Alert.showAlert(context, message: state.message);

              Navigator.of(context).pushNamedAndRemoveUntil(RouteName.login, (route) => false);
            }
          },
          builder: (context, state) {
            if (state is ChangePasswordInProgress) {
              return LoadingIndicator();
            }

            return ChangePasswordBody();
          },
        ),
      ),
    );
  }
}
