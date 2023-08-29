import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final CarouselController _controller = CarouselController();
  int currentIndex = 0;
  List items = [0, 1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
        ),
       
      ),
      backgroundColor: Colors.green,
      body: _buildBody(),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Column(
          children: [
            if (currentIndex == 0)
              _buildBottomNavigationBar1()
            else if (currentIndex == 1)
              _buildBottomNavigationBar2()
            else if (currentIndex == 2)
                _buildBottomNavigationBar3()
              else if (currentIndex == 3)
                  _buildBottomNavigationBar4()
                else if (currentIndex == 4)
                    _buildBottomNavigationBar5()
          ],
        ),
      ),
    );
  }



  Widget _buildBody() {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
        height: double.infinity,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      carouselController: _controller,
      items: items.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  if (i == 0)
                    _buildSlide1(context)
                  else if (i == 1)
                    _buildSlide2(context)
                  else if (i == 2)
                      _buildSlide3(context)
                    else if (i == 3)
                        _buildSlide4(context)
                      else if (i == 4)
                          _buildSlide5(context),
                  _buildDots()
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildSlide1(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/sliders/1.png',
                ),
                fit: BoxFit.contain),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Find Nearby !',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'bold',
                    color: Colors.green,
                    fontSize: 17),
              ),
            ),
            Text(
              'Lets travel',
              textAlign: TextAlign.center,
              style:
              const TextStyle(color: Colors.green, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSlide2(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/sliders/2.png',
                ),
                fit: BoxFit.contain),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Read best travelogs',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'bold',
                    color: Colors.green,
                    fontSize: 17),
              ),
            ),
            Text(
              'world class'
                  ,
              textAlign: TextAlign.center,
              style:
              const TextStyle(color: Colors.green, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSlide3(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/sliders/3.png',
                ),
                fit: BoxFit.contain),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Professional tour guid',
                style: const TextStyle(
                    fontFamily: 'bold',
                    color: Colors.green,
                    fontSize: 17),
              ),
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing \n and typesetting industry'
                  ,
              textAlign: TextAlign.center,
              style:
              const TextStyle(color: Colors.green, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSlide4(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/sliders/4.png',
                ),
                fit: BoxFit.contain),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Get Specialist at your door steps !'"",
                style: const TextStyle(
                    fontFamily: 'bold',
                    color: Colors.black,
                    fontSize: 17),
              ),
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing \n and typesetting industry'
                  "",
              textAlign: TextAlign.center,
              style:
              const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSlide5(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/sliders/5.png',
                ),
                fit: BoxFit.contain),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Buy from trusted professional !'"",
                style: const TextStyle(
                    fontFamily: 'bold',
                    color: Colors.black,
                    fontSize: 17),
              ),
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing \n and typesetting industry'
                  "",
              textAlign: TextAlign.center,
              style:
              const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDots() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(currentIndex == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar1() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {


              },
              child: Center(
                child: Text(
                  'Skip'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                _controller.nextPage();
              },
              child: Center(
                child: Text(
                  'Next'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar2() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                _controller.previousPage();
              },
              child: Center(
                child: Text(
                  'Previous'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                _controller.nextPage();
              },
              child: Center(
                child: Text(
                  'Next'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar3() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                _controller.previousPage();
              },
              child: Center(
                child: Text(
                  'Previous'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                _controller.nextPage();
              },
              child: Center(
                child: Text(
                  'Next'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar4() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                _controller.previousPage();
              },
              child: Center(
                child: Text(
                  'Previous'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                _controller.nextPage();
              },
              child: Center(
                child: Text(
                  'Next'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color:Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar5() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                _controller.previousPage();
              },
              child: Center(
                child: Text(
                  'Previous'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
               // Get.toNamed(AppRouter.chooseLocationRoutes);
              },
              child: Center(
                child: Text(
                  'Get Started'"",
                  style: const TextStyle(
                      fontFamily: 'bold', color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

contentButtonStyle1() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
    color:Colors.green,
  );
}

contentButtonStyle2() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
    color: Colors.green,
  );
}

contentButtonStyle3() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
    color: Colors.green,
  );
}
