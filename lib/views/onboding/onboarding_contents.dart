class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "¡Bienvenidos!",
    image: "assets/Backgrounds/image1.png",
    desc: "Aquí podrás encontrar agrupaciones, músicos individuales y fiestas.",
  ),
  OnboardingContents(
    title: "Publicate",
    image: "assets/Backgrounds/image2.png",
    desc:
    "Crea calendarios para tus actividades y deja que todos las vean.",
  ),
  OnboardingContents(
    title: "Empieza ahora",
    image: "assets/Backgrounds/image3.png",
    desc:
    "Crea una cuenta y empieza a buscar los que se adapte a tus necesidades.",
  ),
];