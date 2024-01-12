import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PagePaiement extends StatelessWidget {
  const PagePaiement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Paiement"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: 250.0,
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Titre de la Card',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: Text('Sous-total :'),
                      trailing: Text('prix'),
                    ),
                    ListTile(
                      title: Text(
                          'Vous économisez :',
                          style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                          '-0,01 €',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                    ListTile(
                      title: Text('TVA :'),
                      trailing: Text('prix'),
                    ),
                    ListTile(
                      title: Text('Total :'),
                      trailing: Text('prix'),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Adresse de livraison",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Adresse',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  ListTile(
                    title: Text('Rue'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    title: Text('code postal + ville :'),
                  ),
                ],
              ),
            ),
            Text(
              "Méthode de paiement",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardList(),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Theme.of(context).colorScheme.outline),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(
                      FontAwesomeIcons.ccApplePay,
                      size: 48.0,
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Theme.of(context).colorScheme.outline),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(
                      FontAwesomeIcons.ccVisa,
                      size: 48.0,
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Theme.of(context).colorScheme.outline),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(
                      FontAwesomeIcons.ccMastercard,
                      size: 48.0,
                    ),
                  ),
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Theme.of(context).colorScheme.outline),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(
                      FontAwesomeIcons.ccPaypal,
                      size: 48.0,
                    ),
                  ),
                )
              ],
            ),
            FilledButton(onPressed:() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Votre commande a été validé', textAlign: TextAlign.center,))), child: Text("Confirmer l'achat"))
          ],
        ));
  }
}

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ColorCard(
          color: Colors.blue,
          text: 'Texte 1',

          isSelected: selectedCardIndex == 0,
          onTap: () {
            handleCardTap(0);
          },
        ),
        ColorCard(
          color: Colors.green,
          text: 'Texte 2',
          isSelected: selectedCardIndex == 1,
          onTap: () {
            handleCardTap(1);
          },
        ),
        ColorCard(
          color: Colors.red,
          text: 'Texte 3',
          isSelected: selectedCardIndex == 2,
          onTap: () {
            handleCardTap(2);
          },
        ),
      ],
    );
  }

  void handleCardTap(int index) {
    setState(() {
      if (selectedCardIndex == index) {
        selectedCardIndex = -1;
      } else {
        selectedCardIndex = index;
      }
    });
  }
}

class ColorCard extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorCard({
    required this.color,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            color: isSelected ? color.withOpacity(0.8) : color,
            child: Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (isSelected)
            Positioned(
              top: -10.0,
              right: -10.0,
              child: Container(
                padding: EdgeInsets.all(4.0),
                  child: FaIcon(Icons.check_circle, color: Theme.of(context).colorScheme.inversePrimary)
              ),
            ),
        ],
      ),
    );
  }
}