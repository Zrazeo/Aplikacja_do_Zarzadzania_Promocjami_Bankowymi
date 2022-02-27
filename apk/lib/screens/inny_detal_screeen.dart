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

class InnyDetalScreen extends StatefulWidget {
  @override
  State<InnyDetalScreen> createState() => _InnyDetalScreenState();
}

class _InnyDetalScreenState extends State<InnyDetalScreen> {
  bool _isFavorite = false;
  static const String _url =
      'https://jazdaponagrode.bnpparibasplus.pl/?utm_source=eBroker&utm_medium=Affiliate&utm_campaign=KontozKarta&utm_content=KontozKarta_JazdaPoNagrode400&utm_term=KontozKarta_JazdaPoNagrode400_Affiliate&utm_id=eBroker_Affiliate&userId=0&affId=5287211&uap=40931717&saids=58700004990129021_p69326951010&la=LAID620ea42f4a58d740129981%7C2607%7C21915%7C40931717%7C1645126703&gclid=CKfxj8a-h_YCFSZKHgIdbugPVA&gclsrc=ds';

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
              'Korzystna premia - Zyskaj aż 500 zł w bonach do Biedronki za konto w BNP Paribas',
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
              'Dla kogo promocja? Udział wziąć może osoba pełnoletnia z polskim obywatelstwem, która nie jest stroną umowy ramowej z BNP Paribas, a także nie ma i w okresie 12 miesięcy przed datą złożenia wniosku o konto w niniejszej promocji nie miała konta osobistego w BNP Paribas i/lub w Raiffeisen Polbanku. Wykluczenie obejmuje też współposiadaczy kont w BNP Paribas.',
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
              'Dla kogo promocja? Udział wziąć może osoba pełnoletnia z polskim obywatelstwem, która nie jest stroną umowy ramowej z BNP Paribas, a także nie ma i w okresie 12 miesięcy przed datą złożenia wniosku o konto w niniejszej promocji nie miała konta osobistego w BNP Paribas i/lub w Raiffeisen Polbanku. Wykluczenie obejmuje też współposiadaczy kont w BNP Paribas. ',
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
              'By wziąć udział w promocji: zarejestruj się na stronie promocji, zaznaczając wszystkie oświadczenia (udział w promocji wziąć można tylko za pośrednictwem tej strony); w kolejnym kroku (na tej samej stronie) do 10.03.2022 r. przejdź do złożenia wniosku o Konto Otwarte na Ciebie wraz z wydawaną do niego kartą (najlepiej wybrać Kartę Otwartą na Dzisiaj - o tym dlaczego, piszę nieco niżej); pamiętaj przy tym, by wniosek uzupełnić tymi samymi danymi co formularz rejestracji na stronie promocji; zawrzyj umowę z bankiem o konto, kartę i dostęp do bankowości internetowej (najpóźniej do 24.03.2022 r.); nadaj PIN do karty wydanej do konta w ciągu 7 dni od jej otrzymania (zrób to jednak nie później niż do 24.03.2022 r.); w marcu 2022 r. wykonaj min. 3 płatności Blikiem (na dowolne kwoty; mogą, ale nie muszą być to płatności w sklepach Biedronka).  Spełnienie powyższych warunków zapewni Ci pierwszą nagrodę - bon do Biedronki o wartości 100 zł oraz otworzy drogę do zdobywania kolejnych nagród.   By otrzymać drugi bon - tym razem już o wartości 200 zł - w kwietniu 2022 roku: wykonaj min. 5 płatności kartą wydaną do konta (mogą to być płatności na dowolne, nawet drobne kwoty; te transakcje możesz, ale nie musisz wykonywać w sklepach Biedronka) oraz zapewnij wpływ(y) na sumę min. 700 zł na konto w BNP Paribas (warunek ten można spełnić w prosty sposób - wystarczy przelew z własnego konta w innym banku).',
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
