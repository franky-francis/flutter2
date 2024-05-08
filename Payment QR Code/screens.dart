// inside the build method

  final upiDetails = UPIDetails(
     upiID: 'enter the upi id here',
    payeeName: 'Francis Xavier',
    amount: 1,
    transactionNote: 'note if needed',
    currency: 'INR',
  );

 GlobalKey globalKey = GlobalKey(); // to generate every time a new QR Code

String qrData = 'upi://pay?pa=${upiDetails.upiID}&pn=${upiDetails.payeeName}&am=${upiDetails.amount}&tn=${upiDetails.transactionNote}&tn=${upiDetails.transactionNote}';
// it will pass the required details in the QR Code

// To display the qr it will load from the asset, it will create a Qr with the help of the plugin
QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 300.0,
                ),
