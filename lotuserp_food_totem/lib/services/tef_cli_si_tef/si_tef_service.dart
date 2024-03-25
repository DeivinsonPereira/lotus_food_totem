import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clisitef/model/clisitef_data.dart';
import 'package:flutter_clisitef/model/data_events.dart';
import 'package:flutter_clisitef/model/modalidade.dart';
import 'package:flutter_clisitef/model/pinpad_information.dart';
import 'package:flutter_clisitef/model/transaction.dart';
import 'package:flutter_clisitef/model/transaction_events.dart';
import 'package:flutter_clisitef/pdv/simulated_pin_pad_widget.dart';
import 'package:get/get.dart';

import '../dependencies.dart';

class SiTefService {
  var configController = Dependencies.configController();
  var paymentController = Dependencies.paymentController();
  var cliSiTefController = Dependencies.cliSiTefController();

  void configureCliSitefCallbacks() {
    cliSiTefController.pdv.pinPadStream.stream.listen((PinPadInformation event) {
      cliSiTefController.setPinPadInfo(
          'isPresent: ${event.isPresent.toString()} \n isBluetoothEnabled: ${event.isBluetoothEnabled.toString()} \n isConnected: ${event.isConnected.toString()} \n isReady: ${event.isReady.toString()} \n event: ${event.event.toString()} ');
    });

    cliSiTefController.pdv.dataStream.stream.listen((CliSiTefData event) {
      if (kDebugMode) {
        print(event.buffer);
        print(event.event);
      }

      if (event.event == DataEvents.menuTitle) {
        cliSiTefController.setLastTitle(event.buffer);
      }

      if (event.event == DataEvents.messageCashier) {
        cliSiTefController.setLastMsgCashier(event.buffer);
      }

      if (event.event == DataEvents.messageCustomer) {
        cliSiTefController.setLastMsgCustomer(event.buffer);
      }

      if (event.event == DataEvents.messageCashierCustomer) {
        cliSiTefController.setLastMsgCashierCustomer(event.buffer);
      }

      if (event.event == DataEvents.messageQrCode) {
        cliSiTefController.setLastMsgCashierCustomer(event.buffer);
      }

      if ((event.event == DataEvents.showQrCodeField) ||
          (event.event == DataEvents.removeQrCodeField)) {
        cliSiTefController.setLastMsgCashierCustomer(event.buffer);
      }

      if (event.event == DataEvents.confirmation) {
        Widget cancelButton = ElevatedButton(
          child: const Text("Cancelar"),
          onPressed: () {
            cliSiTefController.pdv.client.continueTransaction('0');
            Get.back();
          },
        );
        Widget continueButton = ElevatedButton(
          child: const Text("Continuar"),
          onPressed: () {
            cliSiTefController.pdv.client.continueTransaction('1');
            Get.back();
          },
        );

        AlertDialog alert = AlertDialog(
          title: Text(event.buffer),
          actions: [
            cancelButton,
            continueButton,
          ],
        );

        Get.dialog(alert);
        /*showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );*/
      }

      if (event.event == DataEvents.confirmGoBack) {
        Widget backButton = ElevatedButton(
          child: const Text("Voltar"),
          onPressed: () {
            cliSiTefController.pdv.client.continueTransaction('1');
            Get.back();
          },
        );
        Widget confirmeButton = ElevatedButton(
          child: const Text("Confirmar"),
          onPressed: () {
            cliSiTefController.pdv.client.continueTransaction('0');
            Get.back();
          },
        );

        AlertDialog alert = AlertDialog(
          title: Text(event.buffer),
          actions: [
            backButton,
            confirmeButton,
          ],
        );
        /*
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );*/
        Get.dialog(alert);
      }

      if (event.event == DataEvents.pressAnyKey) {
        Widget continueButton = ElevatedButton(
          child: const Text("Continuar"),
          onPressed: () {
            cliSiTefController.pdv.client.continueTransaction('1');
            Get.back();
          },
        );

        AlertDialog alert = AlertDialog(
          title: Text(event.buffer),
          actions: [
            continueButton,
          ],
        );
        /*
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );*/
        Get.dialog(alert);
      }

      if (event.event == DataEvents.abortRequest) {
        cliSiTefController.setShowAbortButton(true);
        if (cliSiTefController.showAbortButton.value) {
          cancelCurrentTransaction();
          cliSiTefController.setShowAbortButton(false);
          cliSiTefController.setAbortTransaction(false);
        } else {
          cliSiTefController.pdv.continueTransaction('1');
        }
      } else {
        cliSiTefController.setShowAbortButton(false);
      }

      if (event.event == DataEvents.getFieldInternal ||
          event.event == DataEvents.getField ||
          event.event == DataEvents.getFieldBarCode ||
          event.event == DataEvents.getFieldCurrency) {
        Get.dialog(SimulatedPinPadWidget(
          title: cliSiTefController.lastTitle.value,
          options: event.buffer,
          submit: cliSiTefController.pdv.continueTransaction,
          cancel: () async {
            cliSiTefController.pdv.continueTransaction('-1');
          },
        ));
        /* showDialog(
            context: context,
            builder: (context) {
              return SimulatedPinPadWidget(
                title: cliSiTefController.lastTitle.value,
                options: event.buffer,
                submit: cliSiTefController.pdv.continueTransaction,
                cancel: () async {
                  cliSiTefController.pdv.continueTransaction('-1');
                },
              );
            });*/
      }

      if (event.event == DataEvents.menuOptions) {
        List<String> options = event.buffer.split(';');
        Get.dialog(
              Scaffold(
                appBar: AppBar(
                  title: Text(cliSiTefController.lastTitle.value),
                  automaticallyImplyLeading: false,
                ),
                body: ListView.builder(
                  itemCount: options.length - 1,
                  itemBuilder: (context, index) {
                    final item = options[index].split(':');
                    final opcao = item[0];
                    final descricao = item[1];

                    return ListTile(
                      title: Text(descricao),
                      subtitle: Text(opcao),
                      onTap: () {
                        cliSiTefController.pdv.continueTransaction(opcao);
                        Get.back();
                      },
                    );
                  },
                ),
              ),);

        /* showDialog(
            context: context,
            builder: (context) {
              List<String> options = event.buffer.split(';');
              return Scaffold(
                appBar: AppBar(
                  title: Text(cliSiTefController.lastTitle.value),
                  automaticallyImplyLeading: false,
                ),
                body: ListView.builder(
                  itemCount: options.length - 1,
                  itemBuilder: (context, index) {
                    final item = options[index].split(':');
                    final opcao = item[0];
                    final descricao = item[1];

                    return ListTile(
                      title: Text(descricao),
                      subtitle: Text(opcao),
                      onTap: () {
                        cliSiTefController.pdv.continueTransaction(opcao);
                        Get.back();
                      },
                    );
                  },
                ),
              );
            });*/
      }
    });
  }

  void pinpad() async {
    try {
      await cliSiTefController.pdv.isPinPadPresent();

      PinPadInformation pinPad = cliSiTefController.pdv.pinPadStream.pinPadInfo;
      if (pinPad.isPresent) {
        cliSiTefController.pdv.client.setPinpadDisplayMessage('Flutter Clisitef');
      }
      cliSiTefController.setPinPadInfo('''
             isPresent: ${pinPad.isPresent.toString()}
             isBluetoothEnabled: ${pinPad.isBluetoothEnabled.toString()}
             isConnected: ${pinPad.isConnected.toString()}
             isReady: ${pinPad.isReady.toString()}
             event: ${pinPad.event.toString()}
            ''');
    } on Exception {
      if (kDebugMode) {
        print('Failed!');
      }
    }
  }

  void transaction() async {
    try {
      Stream<Transaction> paymentStream = await cliSiTefController.pdv.payment(
        Modalidade.credito.value,
        47,
        cupomFiscal: '1',
        dataFiscal: DateTime.now(),
        restricoes: '[27;28]',
      );

      if (cliSiTefController.isSimulated.value) {
        if (kDebugMode) {
          print('here is simulated');
        }
      }

      paymentStream.listen((Transaction transaction) {
        cliSiTefController.transactionStatus =
            transaction.event ?? TransactionEvents.unknown;
        if (cliSiTefController.transactionStatus ==
            TransactionEvents.transactionConfirm) {
          cliSiTefController.dataReceived.add(
              cliSiTefController.pdv.cliSitetRespMap[134]!); //Map com todos os campos retornados

          //campos mapeados em propriedades
          cliSiTefController.dataReceived.add(cliSiTefController.pdv.cliSiTefResp.nsuHost);
          cliSiTefController.dataReceived.add(cliSiTefController.pdv.cliSiTefResp.viaCliente);

          cliSiTefController.dataReceived
              .add(cliSiTefController.pdv.cliSiTefResp.viaEstabelecimento);
        }
      });
    } on Exception catch (e) {
      cliSiTefController.transactionStatus = TransactionEvents.transactionError;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void cancelCurrentTransaction() async {
    try {
      await cliSiTefController.pdv.client.abortTransaction(continua: 1);
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Cancel!');
        print(e.toString());
      }
    }
  }

  void cancel() async {
    try {
      await cliSiTefController.pdv.cancelTransaction();

      cliSiTefController.dataReceived = [];
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Cancel!');
        print(e.toString());
      }
    }
  }
}
