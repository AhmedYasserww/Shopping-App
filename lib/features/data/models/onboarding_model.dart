class OnboardingContent {
  final String image;

  final String title;

  final String desc;

  OnboardingContent(
      {required this.image, required this.title, required this.desc});
}

List<OnboardingContent> content = [
  OnboardingContent(
      image: "assets/images/shopping1.jpg",
      title: "Shop Online Products",
      desc: "Amet minim mollit non deserunt ullamco est sit"
          " aliqua dolor do amet sint. Velit officia consequat"
          " duis enim velit mollit. Exercitation veniam consequat"
          " sunt nostrud amet."
  ),
  OnboardingContent(
      image: "assets/images/shopping2.jpg",
      title: "Fastest Delivery",
      desc:"Amet minim mollit non deserunt ullamco est sit aliqua"
          " dolor do amet sint. Velit officia "
          "consequat duis enim velit mollit. Exercitation veniam "
          "consequat sunt nostrud amet."
          ),
  OnboardingContent(
      image: "assets/images/shopping3.jpg",
      title: "Contactless Delivery",
      desc: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint"
          ". Velit officia consequat duis enim velit mollit. Exercitation"
          " veniam consequat sunt nostrud amet."
  )
];
