import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostadecommerce/app/assests_paths.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/app_bar_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(AssetPaths.logoNavSvg),
        actions: [
          AppBarIconButton(ontap: (){},iconData: Icons.person,),
          AppBarIconButton(ontap: (){},iconData: Icons.call,),
          AppBarIconButton(ontap: (){},iconData: Icons.notifications_active_outlined,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            _buildSearchBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
            onSubmitted: (String? text){},
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          );
  }
}

