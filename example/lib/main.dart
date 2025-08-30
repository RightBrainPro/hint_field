import 'package:flutter/material.dart';
import 'package:hint_field/hint_field.dart';


void main()
{
  runApp(const MainApp());
}

class MainApp extends StatelessWidget
{
  const MainApp({super.key});

  @override
  Widget build(final BuildContext context)
  {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Content(),
          ),
        ),
      ),
    );
  }
}


class Content extends StatefulWidget
{
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content>
{
  @override
  Widget build(final BuildContext context)
  {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Sample text field',
                  errorText: _text,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputDecorator(
                    decoration: InputDecoration(
                      hintText: 'Sample text field',
                      enabledBorder: _text == null ? null : UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                    isEmpty: true,
                  ),
                  HintField(
                    height: 20,
                    text: _text,
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () => setState(() {
            _text = _text == null ? 'Hello' : null;
          }),
          child: Text('Toggle spawned text'),
        ),
      ],
    );
  }

  String? _text;
}
