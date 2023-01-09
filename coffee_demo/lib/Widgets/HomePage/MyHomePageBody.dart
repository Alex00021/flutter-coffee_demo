import 'package:flutter/material.dart';
import '../../Screens/DetailsPage.dart';

class MyHomePageBody extends StatelessWidget {
  const MyHomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HeadingTopBar(),
        BottomBodyContainer()],
    );
  }
}

class BottomBodyContainer extends StatelessWidget {
  const BottomBodyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              HeadingText(),
              MyCandelsList(),
              SizedBox(
                height: 20,
              ),
              LineBar(),
              BottomBodyItems(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBodyItems extends StatelessWidget {
  const BottomBodyItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: const [
              Text(
                "Holiday Special",
                style: TextStyle(fontSize: 24),
              ),
              Spacer(),
              Text(
                "View All",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildbottomContainer(),
              buildbottomContainer(),
              buildbottomContainer(),
              buildbottomContainer(),
            ],
          ),
        )
      ],
    );
  }

  Container buildbottomContainer() {
    return Container(
      height: 150,
      width: 230,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                  height: 120,
                  width: 100,
                  child: Image.asset(
                    "assets/images/candel3.jpg",
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Coconut Milk Bath"),
                Text(
                  "16 oz",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Spacer(),
                Text(
                  "\$ 28",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildColumnAtTop("Candels", isSelected: true),
            buildColumnAtTop("vases"),
            buildColumnAtTop("bins"),
            buildColumnAtTop("Floral"),
            buildColumnAtTop("Decor"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column buildColumnAtTop(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if (isSelected)
          Container(
            height: 5,
            width: 5,
            decoration:
                const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          )
      ],
    );
  }
}

class HeadingTopBar extends StatelessWidget {
  const HeadingTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            SizedBox(
              width: 15,
            ),
            Text(
              "Shop ",
              style: TextStyle(fontSize: 32, letterSpacing: 1),
            ),
            Text(
              "Luckin Coffee",
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildFlatButton("Classic Latte", isSelected: true),
              buildFlatButton("Velvet Latte"),
              buildFlatButton("cheese latte"),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }


  /// 封装FlatButton属性的按钮
  FlatButton buildFlatButton(String text, {bool isSelected = false}) {
    return FlatButton(
      onPressed: () {
        print("Button pressed");
      },
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 18,
        ),
      ),
      shape: const StadiumBorder(),
      color: isSelected ? Colors.pink[100] : Colors.grey[300],
    );
  }
}

class MyCandelsList extends StatelessWidget {
  const MyCandelsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          buildColumnWithRow("1", "Elemental Tin Candel", "29", context),
          buildColumnWithRow("2", "Summer Candel", "23", context),
          buildColumnWithRow("3", "Winter candel", "40", context),
          buildColumnWithRow("4", "dummy candel", "60", context),
        ],
      ),
    );
  }

  GestureDetector buildColumnWithRow(
      String img, String title, String price, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsPage(
            title: title,
            img: img,
            context: context,
            price: price,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 220,
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/candel$img.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\$ $price",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class LineBar extends StatelessWidget {
  const LineBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Container(
        height: 5,
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
