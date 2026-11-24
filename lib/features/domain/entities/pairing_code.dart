import "package:equatable/equatable.dart";
enum PairingCodeStatus { valid, invalid}

class PairingCode extends Equatable{
  final String userId;
  final int turbineId;
  final String codeHash;
  final PairingCodeStatus status;
  final DateTime? expiresAt;
  final DateTime? createdAt;
  final DateTime? validatedAt;

  const PairingCode({
    this.userId = "",
    this.turbineId = 0,
    this.codeHash = "",
    this.status =PairingCodeStatus.invalid,
    this.expiresAt,
    this.createdAt,
    this.validatedAt,
  });

  @override
  List<Object?> get props => [userId, turbineId, codeHash, createdAt];
}

