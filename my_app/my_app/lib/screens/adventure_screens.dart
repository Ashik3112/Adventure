import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Auto navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // App Title
            const Positioned(
              left: 97,
              top: 372,
              child: Text(
                'AD-venture',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontFamily: 'KyivType Sans',
                  fontWeight: FontWeight.w700,
                  height: 1.38,
                ),
              ),
            ),
            // Circular Button
            Positioned(
              left: 172,
              top: 657,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 53,
                  height: 53,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF3B9DAC),
                    shape: OvalBorder(),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            // Let's go text
            const Positioned(
              left: 152,
              top: 720,
              child: SizedBox(
                width: 108.57,
                height: 30.18,
                child: Text(
                  'Lets go!!!',
                  style: TextStyle(
                    color: Color(0xFF110C26),
                    fontSize: 24,
                    fontFamily: 'Lao Sans Pro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sign In Screen
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // This is crucial for keyboard
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // App Title
              const Positioned(
                left: 81,
                top: 91,
                child: Text(
                  'AD-venture',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontFamily: 'KyivType Sans',
                    fontWeight: FontWeight.w700,
                    height: 1.38,
                  ),
                ),
              ),
              // Welcome Text
              const Positioned(
                left: 31.11,
                top: 213.98,
                child: SizedBox(
                  width: 115.44,
                  height: 31.18,
                  child: Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Color(0xFF110C26),
                      fontSize: 24,
                      fontFamily: 'Lao Sans Pro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              // Phone Input Field
              Positioned(
                left: 31,
                top: 267.32,
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                    width: 286,
                    height: 48.68,
                    decoration: ShapeDecoration(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.19),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        hintText: 'Enter mobile number',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      onTap: () {
                        // Ensure keyboard appears
                        if (!_phoneController.selection.isValid) {
                          _phoneController.selection = TextSelection.collapsed(
                            offset: _phoneController.text.length,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              // Phone Input Label
              Positioned(
                left: 51,
                top: 256,
                child: Container(
                  width: 93,
                  height: 21.51,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Center(
                    child: Text(
                      'Mobile number',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Lao Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              // Register Button
              Positioned(
                left: 56,
                top: 708,
                child: GestureDetector(
                  onTap: () {
                    if (_phoneController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationScreen(
                            phoneNumber: _phoneController.text,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your mobile number'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 271,
                    height: 58,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3B9DAC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'REGISTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Lao Sans Pro',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}

// Verification Screen
class VerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const VerificationScreen({super.key, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  List<String> otp = ['', '', '', ''];
  int currentIndex = 0;
  int resendTimer = 20;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTimer > 0) {
        setState(() {
          resendTimer--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void onKeypadTap(String value) {
    if (value == 'backspace') {
      if (currentIndex > 0) {
        setState(() {
          currentIndex--;
          otp[currentIndex] = '';
        });
      }
    } else if (currentIndex < 4) {
      setState(() {
        otp[currentIndex] = value;
        if (currentIndex < 3) currentIndex++;
      });

      // Auto verify when all 4 digits are entered
      if (currentIndex == 3 && otp.every((digit) => digit.isNotEmpty)) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // Title
            const Positioned(
              left: 48,
              top: 95,
              child: Text(
                'Verification',
                style: TextStyle(
                  color: Color(0xFF110C26),
                  fontSize: 24,
                  fontFamily: 'Lao Sans Pro',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // Description
            Positioned(
              left: 48,
              top: 138,
              child: SizedBox(
                width: 244,
                child: Text(
                  'We know you but still We\'ve sent you the verification code on ${widget.phoneNumber}',
                  style: const TextStyle(
                    color: Color(0xFF110C26),
                    fontSize: 15,
                    fontFamily: 'Lao Sans Pro',
                    fontWeight: FontWeight.w400,
                    height: 1.67,
                  ),
                ),
              ),
            ),
            // OTP Input Fields
            Positioned(
              left: 51,
              top: 235,
              child: Row(
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 33),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: currentIndex == index
                            ? const Color(0xFF3B9DAC)
                            : Colors.black26,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        otp[index],
                        style: const TextStyle(
                          color: Color(0xFF110C26),
                          fontSize: 24,
                          fontFamily: 'Lao Sans Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            // Verify Button
            Positioned(
              left: 56,
              top: 354,
              child: GestureDetector(
                onTap: () {
                  if (otp.every((digit) => digit.isNotEmpty)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 271,
                  height: 58,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3B9DAC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'VERIFY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Lao Sans Pro',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Resend Timer
            Positioned(
              left: 122,
              top: 421,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Re-send code in ',
                      style: TextStyle(
                        color: Color(0xFF110C26),
                        fontSize: 15,
                        fontFamily: 'Lao Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.67,
                      ),
                    ),
                    TextSpan(
                      text: '0:${resendTimer.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Lao Sans Pro',
                        fontWeight: FontWeight.w700,
                        height: 1.67,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Custom Keypad
            Positioned(
              left: 0,
              top: 500,
              child: Container(
                width: 390,
                height: 344,
                decoration: const BoxDecoration(color: Color(0xE5D2D5DB)),
                child: Column(
                  children: [
                    // First Row
                    Row(
                      children: [
                        _buildKeypadButton('1', ''),
                        _buildKeypadButton('2', 'ABC'),
                        _buildKeypadButton('3', 'DEF'),
                      ],
                    ),
                    // Second Row
                    Row(
                      children: [
                        _buildKeypadButton('4', 'GHI'),
                        _buildKeypadButton('5', 'JKL'),
                        _buildKeypadButton('6', 'MNO'),
                      ],
                    ),
                    // Third Row
                    Row(
                      children: [
                        _buildKeypadButton('7', 'PQRS'),
                        _buildKeypadButton('8', 'TUV'),
                        _buildKeypadButton('9', 'WXYZ'),
                      ],
                    ),
                    // Fourth Row
                    Row(
                      children: [
                        _buildKeypadButton('', ''),
                        _buildKeypadButton('0', ''),
                        _buildKeypadButton('⌫', '', isBackspace: true),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypadButton(
    String number,
    String letters, {
    bool isBackspace = false,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (number.isNotEmpty) {
            HapticFeedback.lightImpact();
            if (isBackspace) {
              onKeypadTap('backspace');
            } else {
              onKeypadTap(number);
            }
          }
        },
        child: Container(
          height: 86,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.black12, width: 0.5),
              bottom: BorderSide(color: Colors.black12, width: 0.5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (number.isNotEmpty)
                Text(
                  number,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              if (letters.isNotEmpty)
                Text(
                  letters,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

// Sign Up Screen
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // Crucial for keyboard
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Title
              const Positioned(
                left: 30.16,
                top: 114.33,
                child: SizedBox(
                  width: 203.84,
                  height: 31.18,
                  child: Text(
                    'Enter your details',
                    style: TextStyle(
                      color: Color(0xFF110C26),
                      fontSize: 24,
                      fontFamily: 'Lao Sans Pro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              // Name Input Field
              Positioned(
                left: 30,
                top: 172.32,
                child: Container(
                  width: 286,
                  height: 48.68,
                  decoration: ShapeDecoration(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.19),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
              ),
              // Name Label
              Positioned(
                left: 50,
                top: 161,
                child: Container(
                  width: 41,
                  height: 21.51,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Center(
                    child: Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Lao Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              // Email Input Field
              Positioned(
                left: 30,
                top: 249.32,
                child: Container(
                  width: 286,
                  height: 48.68,
                  decoration: ShapeDecoration(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.19),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      hintText: 'Enter your email address',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
              ),
              // Email Label
              Positioned(
                left: 50,
                top: 238,
                child: Container(
                  width: 38,
                  height: 21.51,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Center(
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Lao Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              // Continue Button
              Positioned(
                left: 56,
                top: 708,
                child: GestureDetector(
                  onTap: () {
                    if (_nameController.text.isNotEmpty &&
                        _emailController.text.isNotEmpty) {
                      // Show success message
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Success!'),
                            content: const Text(
                              'Account created successfully!',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Navigate back to sign in or home screen
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                  },
                  child: Container(
                    width: 271,
                    height: 58,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3B9DAC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'CONTINUE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Lao Sans Pro',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
