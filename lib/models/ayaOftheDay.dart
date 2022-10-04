class AyaOfTheDay{

  final String? arText;
  final String? enTran;
  final String? suraName;
  final int? suraNumber;

  AyaOfTheDay({this.arText,this.enTran,this.suraName,this.suraNumber});

  factory AyaOfTheDay.fromJSON(Map<String ,dynamic>json){
    return AyaOfTheDay(
      arText: json['data'][0]['text'],
      enTran: json['data'][2]['text'],
      suraName: json['data'][2]['surah']['name'],
      suraNumber:json ['data'][2]['numberInSurah'],
    );
  }

}