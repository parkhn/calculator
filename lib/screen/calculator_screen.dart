import 'package:calculator/riverpod/state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  static const List<ButtonConfig> _buttons = [
    ButtonConfig(
      text: 'AC',
      backgroundColor: CupertinoColors.systemGrey3,
      textColor: CupertinoColors.black,
    ),
    ButtonConfig(
      text: '+/-',
      backgroundColor: CupertinoColors.systemGrey3,
      textColor: CupertinoColors.black,
    ),
    ButtonConfig(
      text: '%',
      backgroundColor: CupertinoColors.systemGrey3,
      textColor: CupertinoColors.black,
    ),
    ButtonConfig(
      text: '÷',
      backgroundColor: CupertinoColors.systemOrange,
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '7',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '8',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '9',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: 'x',
      backgroundColor: CupertinoColors.systemOrange,
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '4',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '5',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '6',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '-',
      backgroundColor: CupertinoColors.systemOrange,
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '1',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '2',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '3',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '+',
      backgroundColor: CupertinoColors.systemOrange,
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '0',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '.',
      backgroundColor: Color(0xff333333),
      textColor: CupertinoColors.white,
    ),
    ButtonConfig(
      text: '=',
      backgroundColor: CupertinoColors.systemOrange,
      textColor: CupertinoColors.white,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNumber = ref.watch(firstNumberProvider);
    final secondNumber = ref.watch(secondNumberProvider);

    // 숫자입력
    void numberFunction(number) {

    }

    // 리셋
    void ac() {
      ref.read(firstNumberProvider.notifier).state = '0';
      ref.read(secondNumberProvider.notifier).state = 0;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final int width = constraints.biggest.width.toInt();
          final int height = constraints.biggest.height.toInt();
          return Column(
            children: [
              Expanded(
                flex: height - (width * 1.25).toInt(),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 90,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: (width * 1.25).toInt(),
                child: Column(
                  children: [
                    Expanded(
                      flex: (width * 1).toInt(),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GridView.builder(
                          itemCount: _buttons.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (context, index) {
                            return CalculatorButton(
                              buttonConfig: _buttons[index],
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: (width * 0.25).toInt(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 2,
                            child: CalculatorButton(
                              buttonConfig: _buttons[_buttons.length - 3],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CalculatorButton(
                              buttonConfig: _buttons[_buttons.length - 2],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CalculatorButton(
                              buttonConfig: _buttons[_buttons.length - 1],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ButtonConfig {
  const ButtonConfig({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
}

class CalculatorButton extends StatelessWidget {
  final ButtonConfig buttonConfig;

  const CalculatorButton({
    required this.buttonConfig,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(50);
    return Padding(
      padding: const EdgeInsets.all(6.5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: CupertinoColors.separator,
            width: 0.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            pressedOpacity: 0.8,
            onPressed: () {},
            color: buttonConfig.backgroundColor,
            child: Text(
              buttonConfig.text,
              style: TextStyle(
                fontSize: 36,
                color: buttonConfig.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
