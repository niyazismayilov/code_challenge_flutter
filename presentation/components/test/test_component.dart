import 'package:birbir/presentation/components/view/bars/rounded-bottom-nav-bar/rounded_bottom_nav_bar.dart';
import 'package:birbir/presentation/components/view/bars/rounded-bottom-nav-bar/rounded_bottom_nav_bar_item.dart';
import 'package:birbir/presentation/components/view/button/primary_button.dart';
import 'package:birbir/presentation/components/view/button/shortcut_button.dart';
import 'package:birbir/presentation/components/view/dialog/center_alert.dart';
import 'package:birbir/presentation/components/view/field/primary_field.dart';
import 'package:birbir/presentation/ui/route/route_name.dart';
import 'package:flutter/material.dart';

class TestComponentsPage extends StatelessWidget {
  const TestComponentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            PrimaryButton(
              title: "Primary button",
              onPressed: () {
                Navigator.of(context).pushNamed(RouteName.login);
              },
            ),
            SizedBox(height: 16),
            PrimaryField(
              type: PrimaryFieldType.lightTextField,
              placeholder: 'dsjdsd',
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RoundedBottomNavBar(
                items: [
                  RoundedBottomNavBarItem(
                      title: "Favorites", icon: Icons.favorite_border),
                  RoundedBottomNavBarItem(
                      title: "Search", icon: Icons.search_rounded),
                  RoundedBottomNavBarItem(
                    title: "Favorites",
                    icon: Icons.favorite,
                    type: RoundedBottomNavBarItemType.image,
                    imagePath: "assets/images/logo.png",
                  ),
                  RoundedBottomNavBarItem(
                      title: "Plan", icon: Icons.calendar_today_outlined),
                  RoundedBottomNavBarItem(
                      title: "Profile", icon: Icons.account_circle_outlined),
                ],
                didTap: (index) {
                  print(index);
                },
              ),
            ),
            Container(
              height: 30,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                ShortcutButton(title: 'nəsimi rayonu'),
                ShortcutButton(title: '20 yanvar metrosu'),
                ShortcutButton(title: '20 yanvar metrosu'),
                ShortcutButton(title: 'nəsimi rayonu'),
                ShortcutButton(title: 'nəsimi rayonu'),
              ],
            ),
            SizedBox(height: 30.0),
            PrimaryButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => CenterAlert(
                  dialogTitle: 'Növbədən imtina etmək istəyirsiniz?',
                ),
                barrierDismissible: false,
              ),
              title: 'Show Alert',
            ),
            SizedBox(height: 30.0),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RouteName.employeeVendorRegistration);
              },
              child: Text('Employee Profile'),
            ),
            SizedBox(height: 30.0),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteName.vendorRegistration);
              },
              child: Text('Vendor Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
