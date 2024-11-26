import 'package:cue_swap/datatables/own_offers.datasource.dart';
import 'package:cue_swap/provider/product_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/ui/cards/ad_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class OwnOffersView extends StatefulWidget {
  const OwnOffersView({super.key});

  @override
  State<OwnOffersView> createState() => _OwnOffersViewState();
}

class _OwnOffersViewState extends State<OwnOffersView> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getProducts();
  }
  
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text('Mis ofertas', style: CustomLabels.h1),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: AdCard(
                  width: 550,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '¿Quieres saber acerca de economía circular? ',
                              style: CustomLabels.tableHeader,
                            ),
                            TextSpan(
                              text: ' Accede aquí',
                              style: CustomLabels.textSpanLink.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Flurorouter.institutionalBlogRoute);
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Icon(
                          Icons.eco_outlined,
                          color: Colors.white.withOpacity(0.7),
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: PaginatedDataTable(
                headingRowColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(106, 133, 160, 1),
                ),
                
                columns: [
                  DataColumn(label: Text('Publicacion', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Ofertador', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Estado', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Producto intercambiado', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Valor', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Fecha', style: CustomLabels.tableHeader)),
                ],
                source: OwnOffersDTS(user.offers!, context),
                rowsPerPage: _rowsPerPage,
                onRowsPerPageChanged: (value) {
                  setState(() {
                    _rowsPerPage = value ?? 10;
                  });
                },
                header: Text(
                  'Esta es la lista de las publicaciones que ha hecho el usuario',
                  maxLines: 2,
                  style: CustomLabels.navbarMessage,
                )
              ),
            ),
          ),
        ],
      ),
    );

  }
}