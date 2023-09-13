enum Method {
  apple(name: 'Apple', isAdaptive: true),
  custom(name: 'Custom', isAdaptive: false),
  discord(name: 'Discord', isAdaptive: false),
  dribbble(name: 'Dribbble', isAdaptive: false),
  facebook(name: 'Facebook', isAdaptive: false),
  github(name: 'Github', isAdaptive: true),
  google(name: 'Google', isAdaptive: false),
  linkedin(name: 'Linkedin', isAdaptive: false),
  medium(name: 'Medium', isAdaptive: false),
  microsoft(name: 'Microsoft', isAdaptive: false),
  pinterest(name: 'Pinterest', isAdaptive: false),
  reddit(name: 'Reddit', isAdaptive: false),
  spotify(name: 'Spotify', isAdaptive: false),
  tiktok(name: 'Tiktok', isAdaptive: true),
  twitter(name: 'Twitter', isAdaptive: true);

  final String name;
  final bool isAdaptive;
  const Method({required this.name, required this.isAdaptive});
}

enum Centering {
  relative,
  independent;

  const Centering();
}
