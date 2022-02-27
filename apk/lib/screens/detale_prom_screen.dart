import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/wymogi_screen.dart';

Text textWidget(
        String text, double fontSize, FontWeight bold, TextAlign textAlign) =>
    Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: bold,
      ),
      textAlign: textAlign,
    );

class DetaleScreen extends StatefulWidget {
  @override
  State<DetaleScreen> createState() => _DetaleScreenState();
}

class _DetaleScreenState extends State<DetaleScreen> {
  bool _isFavorite = false;
  static const String _url =
      'https://korzystnapremia.bnpparibasplus.pl/?utm_source=eBroker&utm_medium=Affiliate&utm_campaign=KontozKarta&utm_content=KontozKarta_korzystnaPremia500&utm_term=KontozKarta_korzystnaPremia500_Affiliate&utm_id=eBroker_Affiliate&userId=0&affId=5287211&uap=40929911&saids=58700004990129021_p69334788662&la=LAID620e806a762ea873135084%7C2607%7C21937%7C40929911%7C1645117546&gclid=CLbm5bech_YCFRRqGQodBEULAg&gclsrc=ds';

  void _changeFavourite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BNP Paribas'),
        actions: [
          IconButton(
              onPressed: _changeFavourite,
              icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_outline))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            textWidget(
              'Gwarantowana premia 400 zł do wzięcia i rowery do wygrania w promocji "Jazda po nagrodę" w BNP Paribas!',
              25,
              FontWeight.bold,
              TextAlign.justify,
            ),
            Text(''),
            textWidget(
              'Opis promocji',
              22,
              FontWeight.bold,
              TextAlign.center,
            ),
            textWidget(
              'Dla kogo promocja? Udział wziąć może osoba pełnoletnia z polskim obywatelstwem, która nie jest stroną umowy ramowej z BNP Paribas, a także nie ma i w okresie 12 miesięcy przed datą złożenia wniosku o konto w niniejszej promocji nie posiadała konta osobistego w BNP Paribas i/lub w Raiffeisen Polbanku. Wykluczenie obejmuje też współposiadaczy kont w BNP Paribas.  Nagrody. W promocji "Jazda po nagrodę" na każdego uczestnika czekają 2 gwarantowane bonusy pieniężne w wysokości 150 i 250 zł (co w sumie da tytułowe 400 zł).',
              16,
              FontWeight.normal,
              TextAlign.justify,
            ),
            Text(''),
            textWidget(
              'Nagrody szczegóły',
              22,
              FontWeight.bold,
              TextAlign.center,
            ),
            textWidget(
              'O kolejnych bonusach organizator promocji powiadomi Cię mailowo (przesyłając wiadomości z adresu jazdaponagrode@bnpparibasplus.pl): do 19.04.2022 r. o przyznaniu bonusu 150 zł (za spełnienie warunków w marcu); do 27.06.2022 r. o przyznaniu bonusu 250 zł (za spełnienie warunków w kwietniu i maju).  Na pierwszą z wymienionych wiadomości będzie trzeba zareagować. Za pomocą danych z maila otrzymanego od organizatora będzie należało zalogować się na stronie promocji i tam najpóźniej do 26.04.2022 r. podać numer rachunku konta założonego w BNP Paribas w ramach promocji. To właśnie na ten rachunek będą wpływać bonusy: do 30.04. (150 zł) oraz do 30.06.2022 r. (250 zł). ',
              16,
              FontWeight.normal,
              TextAlign.justify,
            ),
            Text(''),
            textWidget(
              'Zasady promocji',
              22,
              FontWeight.bold,
              TextAlign.center,
            ),
            textWidget(
              'By wziąć udział w promocji: zarejestruj się na stronie promocji, zaznaczając wszystkie oświadczenia (udział w promocji wziąć można tylko za pośrednictwem tej strony); to już na tym etapie należy też zadeklarować wolę udziału w konkursie - o jego szczegółach piszę jednak nieco niżej; w kolejnym kroku (na tej samej stronie) do 6.03.2022 r. przejdź do złożenia wniosku o Konto Otwarte na Ciebie wraz z wydawaną do niego kartą (najlepiej wybrać Kartę Otwartą na Dzisiaj - o tym dlaczego, piszę nieco niżej); pamiętaj przy tym, by wniosek uzupełnić tymi samymi danymi co formularz rejestracji na stronie promocji; zawrzyj umowę z bankiem o konto, kartę i dostęp do bankowości internetowej (najpóźniej do 20.03.2022 r.); nadaj PIN do karty wydanej do konta w ciągu 7 dni od jej otrzymania (zrób to jednak nie później niż do 20.03.2022 r.); w marcu 2022 r. wykonaj min. 3 przelewy poprzez bankowość internetową lub aplikację mobilną BNP Paribas (mogą to być "zwykłe" przelewy na dowolne kwoty i na dowolne konto - np. na własne konto w innym banku).',
              16,
              FontWeight.normal,
              TextAlign.justify,
            ),
            Container(
              color: Colors.white,
              child: TextButton(
                onPressed: _launchURL,
                child: Text(
                  'Przejdź do promocji!',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
