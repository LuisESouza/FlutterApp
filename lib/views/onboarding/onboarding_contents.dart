import 'package:flutter_svg/flutter_svg.dart';

class OnboardingContents {
  final String bgimage;
  final String image;
  final String desc;

  OnboardingContents({
    required this.image,
    required this.desc,
    required this.bgimage,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    bgimage:"assets/images/imageA.png",
    image: "assets/images/app-icon.png",
    desc: '',
  ),
  OnboardingContents(
    bgimage:"assets/images/imageB.png",
    image: "assets/images/imgOnboarding/workout_onBoard.png",
    desc: "Start your journey towards a more active lifestyle",
  ),
  OnboardingContents(
    bgimage:"assets/images/imageC.png",
    image: "assets/images/imgOnboarding/nutrition_onBoard.png",
    desc: "Find nutrition tips that fit your lifestyle",
  ),
  OnboardingContents(
    bgimage:"assets/images/imageD.png",
    image: "assets/images/imgOnboarding/Community_onBoard.png",
    desc: "A community for you, challenge yourself",
  ),
];