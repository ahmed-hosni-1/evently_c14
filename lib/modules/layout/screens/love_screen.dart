import 'package:evently_c14/modules/layout/manager/layout_provider.dart';
import 'package:evently_c14/modules/layout/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoveScreen extends StatefulWidget {
  const LoveScreen({super.key});

  @override
  State<LoveScreen> createState() => _LoveScreenState();
}

class _LoveScreenState extends State<LoveScreen> {
  late LayoutProvider provider;

  @override
  void initState() {
    provider = Provider.of<LayoutProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        provider.getFav();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Love"),
        ),
        body: Consumer<LayoutProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return CardWidget(
                      theme: theme, event: provider.favEvents[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: provider.favEvents.length);
          },
        ));
  }
}
