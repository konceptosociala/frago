import 'package:flutter/material.dart';
import 'package:frago/widgets/bg_body.dart';
import 'package:frago/widgets/gaps.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:simplegit/simplegit.dart';

class ProfileScreen extends StatefulWidget {
  final LoggedUser user;
  final VoidCallback onLogout;

  const ProfileScreen({
    super.key,
    required this.user,
    required this.onLogout,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBody(
      svgPath: 'assets/svg/bg.svg',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Login: ${widget.user.name}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Token: ${_shortenToken(widget.user.token)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            
            GapV(20),
            
            LoginButton(label: 'Log Out', onPressed: widget.onLogout)
          ],
        ),
      )
    );
  }
  
  String _shortenToken(String token) {
    if (token.length <= 10) return token;
    final start = token.substring(0, 6);
    final end = token.substring(token.length - 4);
    return '$start*******$end';
  }
}