class UPIDetails {
  final String upiID;
  final String payeeName;
  final double amount;
  final String transactionNote;
  final String currency;

  UPIDetails({
    required this.upiID,
    required this.payeeName,
    required this.amount,
    required this.transactionNote,
    required this.currency,
  });
}
