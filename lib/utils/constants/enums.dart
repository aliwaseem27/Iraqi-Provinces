enum Province {
  empty(
    title: "",
    area: "",
    population: "",
    capitalCity: "",
    interestingFact: "",
  ),
  baghdad(
    title: "Baghdad",
    area: "529",
    population: "8,126,755",
    capitalCity: "Baghdad",
    interestingFact: "baghdadInterestingFact",
  ),
  duhok(
    title: "Duhok",
    area: "6,553",
    population: "1,292,535",
    capitalCity: "Dihok",
    interestingFact: "duhokInterestingFact",
  ),
  erbil(
    title: "Erbil",
    area: "15,074",
    population: "1,854,778",
    capitalCity: "Hewlêr",
    interestingFact: "erbilInterestingFact",
  ),
  basra(
    title: "Basra",
    area: "19,070",
    population: "2,908,491",
    capitalCity: "Basra",
    interestingFact: "basraInterestingFact",
  ),
  muthanna(
    title: "Muthanna",
    area: "51,740",
    population: "814,371",
    capitalCity: "Samawah",
    interestingFact: "muthannaInterestingFact",
  ),
  sulaymaniyah(
    title: "Sulaymaniyah",
    area: "17,023",
    population: "2,053,305",
    capitalCity: "Silêmanî",
    interestingFact: "sulaymaniyahInterestingFact",
  ),
  diyala(
    title: "Diyala",
    area: "17,685",
    population: "1,637,226",
    capitalCity: "Baqubah",
    interestingFact: "diyalaInterestingFact",
  ),
  wasit(
    title: "Wasit",
    area: "17,153",
    population: "1,378,723",
    capitalCity: "Kut",
    interestingFact: "wasitInterestingFact",
  ),
  maysan(
    title: "Maysan",
    area: "16,072",
    population: "1,112,673",
    capitalCity: "Amarah",
    interestingFact: "maysanInterestingFact",
  ),
  alAnbar(
    title: "Al-Anbar",
    area: "138,501",
    population: "1,771,656",
    capitalCity: "Ramadi",
    interestingFact: "alAnbarInterestingFact",
  ),
  najaf(
    title: "Najaf",
    area: "28,824",
    population: "1,471,592",
    capitalCity: "Najaf",
    interestingFact: "najafInterestingFact",
  ),
  ninawa(
    title: "Ninawa",
    area: "37,323",
    population: "3,729,998",
    capitalCity: "Mosul",
    interestingFact: "ninawaInterestingFact",
  ),
  salahAlDin(
    title: "Salah Al-Din",
    area: "24,751",
    population: "1,595,235",
    capitalCity: "Tikrit",
    interestingFact: "salahAlDinInterestingFact",
  ),
  kirkuk(
    title: "Kirkuk",
    area: "9,679",
    population: "1,597,876",
    capitalCity: "Kerkûk",
    interestingFact: "kirkukInterestingFact",
  ),
  babil(
    title: "Babil",
    area: "5,603",
    population: "2,065,042",
    capitalCity: "Hillah",
    interestingFact: "babilInterestingFact",
  ),
  alQadisiyyah(
    title: "Al-Qadisiyyah",
    area: "8,153",
    population: "1,291,048",
    capitalCity: "Al Diwaniyah",
    interestingFact: "alQadisiyyahInterestingFact",
  ),
  dhiQar(
    title: "Dhi Qar",
    area: "12,900",
    population: "2,095,172",
    capitalCity: "Nasiriyah",
    interestingFact: "dhiQarInterestingFact",
  ),
  karbala(
    title: "Karbala",
    area: "5,034",
    population: "1,218,732",
    capitalCity: "Karbala",
    interestingFact: "karbalaInterestingFact",
  );

  final String title;
  final String area;
  final String population;
  final String capitalCity;
  final String interestingFact;

  const Province({
    required this.title,
    required this.area,
    required this.population,
    required this.capitalCity,
    required this.interestingFact,
  });

  factory Province.fromString(String countryName) {
    switch (countryName) {
      case "Baghdad":
        return Province.baghdad;
      case "Duhok":
        return Province.duhok;
      case "Erbil":
        return Province.erbil;
      case "Basra":
        return Province.basra;
      case "Muthanna":
        return Province.muthanna;
      case "Sulaymaniyah":
        return Province.sulaymaniyah;
      case "Diyala":
        return Province.diyala;
      case "Wasit":
        return Province.wasit;
      case "Maysan":
        return Province.maysan;
      case "Al-Anbar":
        return Province.alAnbar;
      case "Najaf":
        return Province.najaf;
      case "Ninawa":
        return Province.ninawa;
      case "Salah Al-Din":
        return Province.salahAlDin;
      case "Kirkuk":
        return Province.kirkuk;
      case "Babil":
        return Province.babil;
      case "Al-Qadisiyyah":
        return Province.alQadisiyyah;
      case "Dhi Qar":
        return Province.dhiQar;
      case "Karbala":
        return Province.karbala;
      default:
        return Province.empty;
    }
  }
}
