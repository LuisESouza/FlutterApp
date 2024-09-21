import 'package:flutter/material.dart';
import 'onboarding_contents.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  int currentPage = 0;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: contents.length,
              itemBuilder: (_, index) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        contents[index].bgimage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Container(
                        color: index == 0 ? Colors.transparent : const Color(0xFFB3A0FF),
                        height: index == 0 ? 600 : 190,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              contents[index].image,
                              height: index == 0 ? 200 : 50,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              contents[index].desc,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  if (currentPage != 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length - 1,
                        (index) => buildDot(index + 1, context),
                      ),
                    ),
                  const SizedBox(height: 60),
                  currentPage == contents.length - 1
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/');
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(78, 255, 255, 255)),
                          ),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : (currentPage == 10
                          ? SizedBox.shrink()
                          : ElevatedButton(
                              onPressed: () {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeIn,
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(78, 255, 255, 255)),
                              ),
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold, 
                                ),
                              ),
                            )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 5,
      width: currentPage == index ? 30 : 30,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentPage == index ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 137, 108, 254),
      ),
    );
  }
}