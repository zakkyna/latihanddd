import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:latihanddd/application/auth/auth_bloc.dart';
import 'package:latihanddd/application/auth/login_bloc/login_bloc.dart';
import 'package:latihanddd/domain/core/theme.dart';
import 'package:latihanddd/injection.dart';
import 'package:latihanddd/presentation/core/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
  late final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            failure.map(
                              cancelledByUser: (_) => 'Cancelled',
                              serverError: (_) => 'Server error',
                              emailAlreadyInUse: (_) => 'Email already in use',
                              invalidEmailAndPasswordCombination: (_) =>
                                  'Invalid email and password combination',
                            ),
                          ),
                        ),
                        const Icon(Icons.error),
                      ],
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
            },
            (_) async {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Flexible(
                          child: Text('Login success !'),
                        ),
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              _authBloc.add(const AuthEvent.authCheckRequested());
              Get.back();
            },
          ),
        );
        if (state.isSubmitting) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
      },
      builder: (context, state) {
        return Form(
          child: ListView(
            padding: const EdgeInsets.all(defaultMargin),
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Text(
                'Log in',
                textAlign: TextAlign.center,
                style: titleLabelStyle,
              ),
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                controller: _emailController,
                style: inputStyle,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  hintText: 'E-mail / User Name',
                  hintStyle: hintStyle,
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (_) => state.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                controller: _passwordController,
                style: inputStyle,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  hintText: 'Password',
                  hintStyle: hintStyle,
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                    color: Colors.black,
                    size: 22,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () =>
                        _loginBloc.add(LoginEvent.toggleShowPasswordPressed()),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        state.showPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                obscureText: !state.showPassword,
                autocorrect: false,
                validator: (_) => state.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) => 'Short Password',
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
              BaseButton(
                text: 'Log In',
                onPressed: _onFormSubmitted,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      LoginEvent.emailChanged(_emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      LoginEvent.passwordChanged(_passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginEvent.loginPressed(),
    );
  }
}
