import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class VentasFormPage extends StatefulWidget {
  VentasFormPage({Key key}) : super(key: key);

  @override
  _VentasFormPageState createState() => _VentasFormPageState();
}

class _VentasFormPageState extends State<VentasFormPage> {
  bool asTabs = false;
  String selectedValue;
  String _fecha = '';
  var cantidad = '0';
  var precio = '0';
  int valorVenta = 000;
  // String preselectedValue = "dolor sit";
  // ExampleNumber selectedNumber;
  // List<int> selectedItems = [];
  final List<DropdownMenuItem> items = [];
  TextEditingController _inputFieldDateController = new TextEditingController();
  // static const String appTitle = "Search Choices demo";
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  int selectedRadio, selectedRadio2;

  @override
  void initState() {
    selectedRadio = 0;
    selectedRadio2 = 0;

    String wordPair = "";
    loremIpsum
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas'),
        centerTitle: true,
      ),
      body: Stack(children: [
        Center(
          child: _formVentas(),
        )
      ]),
    );
  }

  _formVentas() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.only(bottom: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0,
                  )
                ]),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    // color: HexColor('#2E78EF'),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          HexColor('#3C345F'),
                          HexColor('#291E43'),
                        ]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                      child: Text(
                        'Registro Ventas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_outlined,
                      color: HexColor('#3C345F'),
                    ),
                    Text(
                      'Fecha y Grupo Étnico',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                _crearFecha(context),
                SizedBox(
                  height: 15.0,
                ),
                _crearGrupoEtnico(),
                Divider(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_outlined,
                      color: HexColor('#3C345F'),
                    ),
                    Text(
                      'Ubicación',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                _crearDepartamento(),
                SizedBox(
                  height: 15.0,
                ),
                _crearMunicipio(),
                SizedBox(
                  height: 15.0,
                ),
                _crearVereda(),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_outlined,
                      color: HexColor('#3C345F'),
                    ),
                    Text(
                      'Proyecto y Línea Productiva',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Rubro (Línea productiva)',
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 15.0,
                ),
                _crearProyecto(),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_outlined,
                      color: HexColor('#3C345F'),
                    ),
                    Text(
                      'Observaciones',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                _crearObservaciones(),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_outlined,
                      color: HexColor('#3C345F'),
                    ),
                    Text(
                      ' Detalles de la venta',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                _crearDetalleVenta(),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_outlined,
                      color: HexColor('#3C345F'),
                    ),
                    Text(
                      ' Detalles de la venta',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                _crearDetalleProducto(),
                // _crearBoton(),
                // SizedBox(
                //   height: 10.0,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _crearEmail() {
    return StreamBuilder(
        // stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorText: snapshot.error,
            // icon: Icon(
            //   Icons.alternate_email,
            //   color: HexColor('#2E78EF'),
            // ),
            hintText: 'ejemplo@mail.com',
            labelText: 'Correo Electronico',
            counterText: snapshot.data,
          ),
          // onChanged: bloc.changeEmail,
        ),
      );
    });
  }

  _crearPassword() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Select one",
            searchHint: "Select one",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
        );
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: 'DD-MM-AAAA',
          labelText: 'DD-MM-AAAA',
          suffixIcon: Icon(
            Icons.calendar_today,
            color: HexColor('#3C345F'),
          ),
          // icon: Icon(
          //   Icons.calendar_today,
          //   color: Colors.green[300],
          // ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _fecha = formatDate(picked, [yyyy, '-', mm, '-', dd, '-', hh, '-', nn]);
        _inputFieldDateController.text =
            formatDate(picked, [dd, '-', mm, '-', yyyy]);
      });
    }
  }

  _crearGrupoEtnico() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]),
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: SearchableDropdown.single(
        items: items,
        value: selectedValue,
        hint: "Grupo Étnico",
        searchHint: "Grupo Étnico",
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        doneButton: "Done",
        displayItem: (item, selected) {
          return (Row(children: [
            selected
                ? Icon(
                    Icons.radio_button_checked,
                    color: HexColor('#3C345F'),
                  )
                : Icon(
                    Icons.radio_button_unchecked,
                    color: HexColor('#291E43'),
                  ),
            SizedBox(width: 7),
            Expanded(
              child: item,
            ),
          ]));
        },
        isExpanded: true,
      ),
    );
  }

  _crearDepartamento() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Departamento",
            searchHint: "Departamento",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            clearIcon: Icon(Icons.close),
            isExpanded: true,
          ),
        );
      },
    );
  }

  _crearMunicipio() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Municipio",
            searchHint: "Municipio",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
        );
      },
    );
  }

  _crearVereda() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Vereda",
            searchHint: "Vereda",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
        );
      },
    );
  }

  _crearProyecto() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Seleccione Proyecto",
            searchHint: "Seleccione Proyecto",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
        );
      },
    );
  }

  _crearObservaciones() {
    return StreamBuilder(
        // stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          // expands: true,
          maxLines: 10,
          minLines: 1,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorText: snapshot.error,
            // icon: Icon(
            //   Icons.alternate_email,
            //   color: HexColor('#2E78EF'),
            // ),
            hintText: 'Observaciones',
            labelText: 'Observaciones',
            counterText: snapshot.data,
          ),
          // onChanged: bloc.changeEmail,
        ),
      );
    });
  }

  _crearDetalleVenta() {
    setSelectedRadio(int val) {
      setState(() {
        selectedRadio = val;
        selectedRadio2 = val;
      });
    }

    return Container(
      child: Column(
        children: [
          Text('Tipo de Apoyo'),
          RadioListTile(
            value: 1,
            groupValue: selectedRadio2,
            title: Text('Directo'),
            // subtitle: Text(user.lastName),
            onChanged: (val) {
              print("Radio $val");
              setSelectedRadio(val);
            },
            // selected: selectedUser == user,
            activeColor: Colors.green,
          ),
          RadioListTile(
            value: 2,
            groupValue: selectedRadio2,
            title: Text('Indirecto'),
            // subtitle: Text(user.lastName),
            onChanged: (val) {
              print("Radio $val");
              setSelectedRadio(val);
            },
            // selected: selectedUser == user,
            activeColor: Colors.green,
          ),
          RadioListTile(
            value: 3,
            groupValue: selectedRadio2,
            title: Text('Particular'),
            // subtitle: Text(user.lastName),
            onChanged: (val) {
              print("Radio $val");
              setSelectedRadio(val);
            },
            // selected: selectedUser == user,
            activeColor: Colors.green,
          ),
          Text('Venta con acuerdo'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Radio(
                    value: 4,
                    groupValue: selectedRadio,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text('No')
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 5,
                    groupValue: selectedRadio,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text('Si')
                ],
              ),
            ],
          ),
          StreamBuilder(
              // stream: bloc.emailStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                // expands: true,
                maxLines: 10,
                minLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorText: snapshot.error,
                  // icon: Icon(
                  //   Icons.alternate_email,
                  //   color: HexColor('#2E78EF'),
                  // ),
                  hintText: 'Lugar de entrega',
                  labelText: 'Lugar de entrega',
                  counterText: snapshot.data,
                ),
                // onChanged: bloc.changeEmail,
              ),
            );
          }),
        ],
      ),
    );
  }

  _crearDetalleProducto() {
    return Container(
      child: Column(
        children: [
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[500]),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                child: SearchableDropdown.single(
                  items: items,
                  value: selectedValue,
                  hint: "Producto Comercializado",
                  searchHint: "Producto Comercializado",
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  clearIcon: Icon(Icons.close),
                  isExpanded: true,
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[500]),
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
            child: SearchableDropdown.single(
              items: items,
              value: selectedValue,
              hint: "Tipo de Producto",
              searchHint: "Tipo de Producto",
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              doneButton: "Hecho",
              displayItem: (item, selected) {
                return (Row(children: [
                  selected
                      ? Icon(
                          Icons.radio_button_checked,
                          color: HexColor('#3C345F'),
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                          color: HexColor('#291E43'),
                        ),
                  SizedBox(width: 7),
                  Expanded(
                    child: item,
                  ),
                ]));
              },
              isExpanded: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Unidad de venta'),
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[500]),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                child: SearchableDropdown.single(
                  items: items,
                  value: selectedValue,
                  hint: "Unidad de Medida",
                  searchHint: "Unidad de Medida",
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  clearIcon: Icon(Icons.close),
                  isExpanded: true,
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
              // stream: bloc.emailStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: Icon(
                    Icons.monetization_on,
                    color: HexColor('#3C345F'),
                  ),
                  // errorText: snapshot.error,
                  hintText: 'Precio',
                  labelText: 'Precio',
                  counterText: snapshot.data,
                ),
                onChanged: (value) {
                  precio = value;
                },
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
              // stream: bloc.emailStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // errorText: snapshot.error,
                  suffixIcon: Icon(
                    Icons.bar_chart_rounded,
                    color: HexColor('#3C345F'),
                  ),
                  hintText: 'Cantidad',
                  labelText: 'Cantidad',
                  counterText: snapshot.data,
                ),
                onChanged: (value) {
                  cantidad = value;
                  setState(() {
                    var p = int.parse(precio);
                    var c = int.parse(cantidad);
                    var total = (p * c);
                    valorVenta = total;
                  });
                },
              ),
            );
          }),
          SizedBox(
            height: 20,
          ),
          Text('Valor Total de La venta',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Text('\$ $valorVenta ',
              style: TextStyle(
                  color: Colors.green[500],
                  fontSize: 25,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
