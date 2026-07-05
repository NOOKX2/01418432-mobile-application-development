import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLogin = true;

  Future _submit() async {
    try {
      if (isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message ?? 'Error login')));
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();

      final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

      if (googleUser != null) {
        // 1. ดึง idToken จาก authentication (ตัวนี้ยังมี idToken อยู่)
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final String? idToken = googleAuth.idToken;

        // 2. ดึง accessToken ผ่าน authorizationClient (ต้องระบุ scopes)
        // หมายเหตุ: ต้องระบุสิทธิ์ที่ต้องการใช้ใน list
        final authorization = await googleUser.authorizationClient
            .authorizeScopes(['email', 'profile', 'openid']);

        final String? accessToken = authorization.accessToken;

        // 3. นำค่าที่ได้มาสร้าง Credential
        final credential = GoogleAuthProvider.credential(
          accessToken: accessToken,
          idToken: idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Google login failed: $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? 'Login' : 'Register')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
              ),
              child: Text(isLogin ? 'login' : 'create account'),
            ),
            const SizedBox(height: 10), // เว้นระยะห่างเล็กน้อย
            SignInButton(
              Buttons.google,
              text: isLogin ? "Sign in with Google" : "Sign up with Google",
              onPressed: _signInWithGoogle,
              padding: const EdgeInsets.all(0), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
            ),
            TextButton(
              onPressed: () => setState(() => isLogin = !isLogin),
              child: Text(
                isLogin
                    ? 'Not have an account. Register here'
                    : 'Already have an account. Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
