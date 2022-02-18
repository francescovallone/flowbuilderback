import 'package:equatable/equatable.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flowbuilderback/main.dart';
import 'package:flowbuilderback/testpage.dart';
import 'package:flutter/material.dart';

class AppRouters extends Equatable{
  const AppRouters({this.uri, this.arguments});

  final String? uri;
  final String? arguments;

  AppRouters copyWith({String? uri, String? arguments}) => 
    AppRouters(uri: uri ?? this.uri, arguments: arguments ?? this.arguments);

  @override
  List<Object?> get props => [uri, props];
}

class AppRouter extends StatelessWidget{
  const AppRouter({Key? key}) : super(key: key);


  static Page page() => const MaterialPage<void>(child: AppRouter());
  
  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AppRouters>(
      state: const AppRouters(),
      onGeneratePages: (state, pages) {
        switch(state.uri){
          case '/test':
            return [
              TestPage.page(),
            ];
          default:
            return [
              MyHomePage.page(),
            ];
        }
      }
    );
  }
  
}