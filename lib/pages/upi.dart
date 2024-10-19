import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'success.dart';

class UPI extends StatefulWidget {
  const UPI({super.key});

  @override
  Upi createState() => Upi();
}

class Upi extends State<UPI> {
  final FocusNode _focusNode = FocusNode();
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _submitPin() {
    String pin = _controllers.map((controller) => controller.text).join();
    if (pin.length < 4) {
      return;
    }
    Navigator.push(context, 
    MaterialPageRoute(builder: (context) => Success(pin:pin)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toplayer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: Colors.grey[200],
            height: 50,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Check Balance",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "ENTER 4-DIGIT UPI PIN",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildPinInput(),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          const Warning(),
        ],
      ),
    );
  }

  Widget _buildPinInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 50,
          child: TextField(
            controller: _controllers[index],
            focusNode: index == 0 ? _focusNode : null,
            keyboardType: TextInputType.number,
            obscureText: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
            ),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.length == 1 && index < 3) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              } else if (index == 3 && value.length > 1) {
                _controllers[3].text = value;
                _controllers[3].selection = TextSelection.fromPosition(
                  TextPosition(offset: _controllers[3].text.length),
                );
              }
            },
            onSubmitted: (value) {
                _submitPin();
            },
          ),
        );
      }),
    );
  }

  AppBar toplayer() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ICICI Bank",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Text(
                "XXXXXX83",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 10),
            child: Image.asset(
              "assets/icons/upi-logo.webp",
              height: 80,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}

class Warning extends StatelessWidget {
  const Warning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber[200],
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/icons/warning.jpeg"),
                fit: BoxFit.fitHeight,
              ),
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "UPI PIN will keep your account \nsecure from unauthorized \naccess. Do not share this PIN \nwith anyone.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}