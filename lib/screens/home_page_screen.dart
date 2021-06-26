import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

import 'package:anim_search/providers/data_provider.dart';
import 'package:anim_search/widgets/home_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    final screenHeight = device.size.height;
    // final screenWidth = device.size.width;

    final homeData = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.animation,
      //     color: Theme.of(context).accentColor,
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () {},
      //     )
      //   ],
      // ),
      body: FloatingSearchAppBar(
        colorOnScroll: Colors.white,
        elevation: 0,
        hideKeyboardOnDownScroll: true,
        hint: '',
        leadingActions: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(
              Icons.animation_outlined,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
        body: Container(
          height: screenHeight,
          child: homeData.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  padding: EdgeInsets.all(15).copyWith(
                    left: 20,
                    right: 20,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5 / 2.5,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: homeData.searchList.length,
                  itemBuilder: (context, index) => HomeCard(
                        homeData: homeData.searchList[index],
                        cardIndex: index,
                      )),
        ),
      ),
    );
  }
}
