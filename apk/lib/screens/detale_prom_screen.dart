import 'package:flutter/material.dart';
import 'package:aplikacja_do_promocji_bankowych/screens/wymogi_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Text textWidget(String text, double fontSize, FontWeight bold) => Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: bold),
    );

class DetaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nazwa banku'),
      ),
      body: ListView(
        children: [
          textWidget(
            '200 zł od Banku Pekao w najnowszej promocji popularnego Konta Przekorzystnego dla młodych!',
            25,
            FontWeight.bold,
          ),
          textWidget(
            'Kto skorzysta z promocji konta dla młodych?',
            22,
            FontWeight.bold,
          ),
          textWidget(
            'Promocja skierowana jest do nowych klientów, to znaczy osób które w terminie od 01.01.2020 do 23.01.2022 nie posiadały, ani nie współposiadały żadnego produktu dla klientów indywidualnych Banku Pekao. Sama oferta Konta Przekorzystnego dla młodych skierowana jest do osób w przedziale wiekowym 18 – 26 lat.',
            16,
            FontWeight.normal,
          ),
          textWidget(
            'Czas trwania promocji?',
            22,
            FontWeight.bold,
          ),
          textWidget(
            'Aby skorzystać z promocji najpóźniej do 31.03.2022 musisz założyć Konto Przekorzystne dla młodych.',
            16,
            FontWeight.normal,
          ),
          textWidget(
            'Proste warunki do zdobycia 200 zł w gotówce od Banku Peako!',
            22,
            FontWeight.bold,
          ),
          textWidget(
            '50 zł premii Najpóźniej do 31.03.2022 załóż Konto Przekorzystne dla młodych Banku Pekao z kartą do konta oraz dostępem do aplikacji mobilnej, koniecznie za pomocą selfie poprzez stronę www banku lub aplikację mobilną PeoPay 50 zł otrzymasz do końca kolejnego miesiąca po otwarciu konta. 150 zł premii W każdym z 3 pełnych miesięcy kalendarzowych po otwarciu konta wykonaj min. 5 transakcji bezgotówkowych na dowolną kwotę swoją kartą debetową do konta Mastercard lub aplikacją PeoPay 50 zł (x3) za każdy miesiąc aktywności otrzymasz do końca następnego miesiąca ',
            16,
            FontWeight.normal,
          ),
          textWidget(
            '50 zł premii Najpóźniej do 31.03.2022 załóż Konto Przekorzystne dla młodych Banku Pekao z kartą do konta oraz dostępem do aplikacji mobilnej, koniecznie za pomocą selfie poprzez stronę www banku lub aplikację mobilną PeoPay 50 zł otrzymasz do końca kolejnego miesiąca po otwarciu konta. 150 zł premii W każdym z 3 pełnych miesięcy kalendarzowych po otwarciu konta wykonaj min. 5 transakcji bezgotówkowych na dowolną kwotę swoją kartą debetową do konta Mastercard lub aplikacją PeoPay 50 zł (x3) za każdy miesiąc aktywności otrzymasz do końca następnego miesiąca ',
            16,
            FontWeight.normal,
          ),
          Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WymogiScreen()));
                  },
                  child: Text(
                    'Weź udział!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )))
        ],
      ),
    );
  }
}
