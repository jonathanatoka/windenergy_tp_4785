import 'package:windenergy/features/domain/entities/pairing_code.dart';
import 'package:windenergy/features/domain/entities/profile.dart';
import 'package:windenergy/features/domain/entities/turbine.dart';
import 'package:windenergy/utils/result.dart';

abstract class DbService {
  FutureResult<void> signIn({
    required String email,
    required String password,
  });

  FutureResult<void> signUp({
    required String fullName,
    required String email,
    required String password,
  });

  FutureResult<void> signOut();

  FutureResult<Profile> readProfile();

  FutureResult<int> readCount();

  FutureResult<double> readTotalPowerW();

  FutureResult<List<Turbine>> readTurbines();

  FutureResult<int> createTurbine({
    String serialNumber = "",
    String customName = "",
    double latitude = 0.0,
    double longitude = 0.0,
  });

  FutureResult<PairingCode> readPairingCode({
    int turbineId = 0,
  });

  FutureResult<void> readTurbineActivation();

  FutureResult<void> updateTurbine({
    int turbineId = 0,
    String customName = "",
    double latitude = 0.0,
    double longitude = 0.0,
  });

  FutureResult<void> deleteTurbine({
    int turbineId = 0,
  });
}