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
    interestingFact: "The capital city and province of Iraq, Baghdad has a rich history dating back to the 8th century and was once one of the largest cities in the world during the Islamic Golden Age.",
  ),
  duhok(
    title: "Duhok",
    area: "6,553",
    population: "1,292,535",
    capitalCity: "Dihok",
    interestingFact: "Dohuk is known for its beautiful landscapes, including mountains, and is a popular destination for tourists.",
  ),
  erbil(
    title: "Erbil",
    area: "15,074",
    population: "1,854,778",
    capitalCity: "Hewlêr",
    interestingFact: "Erbil's citadel is one of the oldest continuously inhabited sites in the world, with evidence of habitation dating back at least 6,000 years.",
  ),
  basra(
    title: "Basra",
    area: "19,070",
    population: "2,908,491",
    capitalCity: "Basra",
    interestingFact: "Located in the southern part of Iraq, Basra is known as the 'Venice of the East' due to its extensive network of canals and its significant role in the global oil industry.",
  ),
  muthanna(
    title: "Muthanna",
    area: "51,740",
    population: "814,371",
    capitalCity: "Samawah",
    interestingFact: "Home to the ancient city of Uruk, which is one of the first major cities in the history of the world and where the earliest examples of writing were found.",
  ),
  sulaymaniyah(
    title: "Sulaymaniyah",
    area: "17,023",
    population: "2,053,305",
    capitalCity: "Silêmanî",
    interestingFact: "It is known for its vibrant culture, arts, and educational institutions. The Sulaymaniyah Museum houses significant archaeological collections.",
  ),
  diyala(
    title: "Diyala",
    area: "17,685",
    population: "1,637,226",
    capitalCity: "Baqubah",
    interestingFact: "Diyala is known for its diverse geography, including mountains, rivers, and fertile plains. It has been a significant agricultural area throughout history.",
  ),
  wasit(
    title: "Wasit",
    area: "17,153",
    population: "1,378,723",
    capitalCity: "Kut",
    interestingFact: "Known for its historical city of Kut, which was a significant battleground during World War I in the Siege of Kut.",
  ),
  maysan(
    title: "Maysan",
    area: "16,072",
    population: "1,112,673",
    capitalCity: "Amarah",
    interestingFact: " Maysan province is known for its significant marshlands, including the Central Marshes, which are a UNESCO World Heritage Site.",
  ),
  alAnbar(
    title: "Al-Anbar",
    area: "138,501",
    population: "1,771,656",
    capitalCity: "Ramadi",
    interestingFact: " It is the largest province in Iraq by area, covering a significant part of the western region of the country.",
  ),
  najaf(
    title: "Najaf",
    area: "28,824",
    population: "1,471,592",
    capitalCity: "Najaf",
    interestingFact: "The province is home to the Imam Ali Shrine, and the Wadi-us-Salaam cemetery, reputed to be the largest in the world.",
  ),
  ninawa(
    title: "Ninawa",
    area: "37,323",
    population: "3,729,998",
    capitalCity: "Mosul",
    interestingFact: "Contains the ancient city of Mosul, as well as the historic ruins of Nineveh, which was the capital of the Assyrian Empire and one of the most powerful cities of ancient Mesopotamia.",
  ),
  salahAlDin(
    title: "Salah Al-Din",
    area: "24,751",
    population: "1,595,235",
    capitalCity: "Tikrit",
    interestingFact: "Named after the famous Muslim leader Saladin, it is known for its historical sites, including the ruins of Samarra, a UNESCO World Heritage Site.",
  ),
  kirkuk(
    title: "Kirkuk",
    area: "9,679",
    population: "1,597,876",
    capitalCity: "Kerkûk",
    interestingFact: " Kirkuk is known for its diverse population, consisting of Kurds, Arabs, Turkmen, and Assyrians. It's also rich in oil, making it a strategically important city in Iraq.",
  ),
  babil(
    title: "Babil",
    area: "5,603",
    population: "2,065,042",
    capitalCity: "Hillah",
    interestingFact: "Home to the ancient city of Babylon, one of the most famous cities in antiquity, renowned for its impressive hanging gardens, which are one of the Seven Wonders of the Ancient World.",
  ),
  alQadisiyyah(
    title: "Al-Qadisiyyah",
    area: "8,153",
    population: "1,291,048",
    capitalCity: "Al Diwaniyah",
    interestingFact: "This province is named after the Battle of Qadisiyyah, a pivotal battle between the Arab Muslim army and the Sassanian Empire, leading to the Islamic conquest of Persia.",
  ),
  dhiQar(
    title: "Dhi Qar",
    area: "12,900",
    population: "2,095,172",
    capitalCity: "Nasiriyah",
    interestingFact: "This province is home to the ancient Sumerian city of Ur, which is believed to be the birthplace of Abraham from the Bible and the Quran.",
  ),
  karbala(
    title: "Karbala",
    area: "5,034",
    population: "1,218,732",
    capitalCity: "Karbala",
    interestingFact: "This province is home to the holy city of Karbala due to the shrine of Imam Hussein, the grandson of Prophet Muhammad.",
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
