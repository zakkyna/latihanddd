import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanddd/application/auth/auth_bloc.dart';
import 'package:latihanddd/application/weather/weather_bloc.dart';
import 'package:latihanddd/domain/core/theme.dart';
import 'package:latihanddd/presentation/core/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class WeatherForm extends StatelessWidget {
  const WeatherForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final _authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: state.maybeMap(
              orElse: () => Container(
                padding: EdgeInsets.all(15),
                height: double.infinity,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (ctx, i) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            width: double.infinity,
                            height: 80,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              loaded: (s) {
                return s.optionFailureOrSuccess.fold(
                  () => Center(
                    child: Text("No Data"),
                  ),
                  (option) => option.fold(
                    (l) => Center(
                      child: Text("No Data"),
                    ),
                    (data) {
                      return ListView(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Center(
                            child: Image.network(
                                'http://openweathermap.org/img/wn/${data.weather.first.icon}@2x.png'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              data.cityName,
                              style: titleLabelStyle,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              '${data.weather.first.main} ${data.main.temp} °C',
                              style: weatherMainStyle,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Feels like ${data.main.feels_like} °C',
                              style: feelsLikeStyle,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: BaseButton(
                              text: 'Log Out',
                              onPressed: () =>
                                  _authBloc.add(AuthEvent.signedOut()),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
