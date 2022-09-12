import 'package:flutter/material.dart';

import '../blocs/bloc.export.dart';

class AppDrawer extends StatelessWidget {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Text("Dark Mode"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: state.switchValue,
                      onChanged: (newValue) {
                        newValue
                            ? context.read<SwitchBloc>().add(SwitchOnEvent())
                            : context.read<SwitchBloc>().add(SwitchOffEvent());
                      },
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
