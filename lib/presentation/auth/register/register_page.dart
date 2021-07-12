import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:latihanddd/application/auth/auth_bloc.dart';
import 'package:latihanddd/application/auth/register_bloc/register_bloc.dart';
import 'package:latihanddd/domain/core/theme.dart';
import 'package:latihanddd/injection.dart';
import 'package:latihanddd/presentation/core/widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<RegisterBloc>(
        create: (context) => getIt<RegisterBloc>(),
        child: const RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController =
      TextEditingController();

  late final RegisterBloc _registerBloc =
      BlocProvider.of<RegisterBloc>(context);
  late final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(_onFullNameChanged);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _retypePasswordController.addListener(_onRetypePasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
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
                          child: Text('Register success !'),
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
                    Text('Registering...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Form(
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Register',
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
                    controller: _fullNameController,
                    style: inputStyle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
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
                      hintText: 'Full Name',
                      hintStyle: hintStyle,
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                    keyboardType: TextInputType.name,
                    autocorrect: false,
                    validator: (_) => state.fullName.value.fold(
                      (f) => f.maybeMap(
                        shortFullName: (_) => 'Short Full Name',
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
                    controller: _emailController,
                    style: inputStyle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
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
                      hintText: 'Email',
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
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
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
                    ),
                    obscureText: true,
                    autocorrect: false,
                    validator: (_) => state.password.value.fold(
                      (f) => f.maybeMap(
                        shortPassword: (_) => 'Short password',
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
                    controller: _retypePasswordController,
                    style: inputStyle,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
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
                      hintText: 'Retype Password',
                      hintStyle: hintStyle,
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                    obscureText: true,
                    autocorrect: false,
                    validator: (_) => state.retypePassword.value.fold(
                      (f) => f.maybeMap(
                        passwordNotSame: (_) => 'Password not same',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BaseButton(text: 'Submit', onPressed: _onFormSubmitted)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onFullNameChanged() {
    _registerBloc.add(
      RegisterEvent.fullNameChanged(_fullNameController.text),
    );
  }

  void _onEmailChanged() {
    _registerBloc.add(
      RegisterEvent.emailChanged(_emailController.text),
    );
  }

  void _onPasswordChanged() {
    _registerBloc.add(
      RegisterEvent.passwordChanged(_passwordController.text),
    );
  }

  void _onRetypePasswordChanged() {
    _registerBloc.add(
      RegisterEvent.retypePasswordChanged(_retypePasswordController.text),
    );
  }

  void _onFormSubmitted() {
    _registerBloc.add(RegisterEvent.registerPressed());
  }
}
