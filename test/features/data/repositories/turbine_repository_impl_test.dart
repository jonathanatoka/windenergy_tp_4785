import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:windenergy/features/data/servises/db_service.dart';
import 'package:windenergy/features/data/repositories/turbine_repository_impl.dart';

import 'package:windenergy/features/domain/entities/position.dart';
import 'package:windenergy/features/domain/entities/turbine.dart';
import 'package:windenergy/features/domain/entities/pairing_code.dart';

import 'package:windenergy/utils/result.dart';

class MockDbService extends Mock implements DbService {}

void main() {
  late MockDbService dbService;
  late TurbineRepositoryImpl repository;

  setUp(() {
    dbService = MockDbService();

    repository = TurbineRepositoryImpl(
      dbService: dbService,
    );
  });

  group('TurbineRepositoryImpl', () {

    // TEST 1 : Read Count
    test('should read turbine count from DbService', () async {
      when(() => dbService.readCount())
          .thenAnswer((_) async => Success<int>(
        value: 5,
        reason: 'Success',
      ));

      final result = await repository.readCount();

      expect(result, isA<Success<int>>());
      expect((result as Success<int>).value, 5);

      verify(() => dbService.readCount()).called(1);
    });

    // TEST 2 : Read Total Power
    test('should read total power from DbService', () async {
      when(() => dbService.readTotalPowerW())
          .thenAnswer((_) async => Success<double>(
        value: 1500.0,
        reason: 'Success',
      ));

      final result = await repository.readTotalPowerW();

      expect(result, isA<Success<double>>());
      expect((result as Success<double>).value, 1500.0);

      verify(() => dbService.readTotalPowerW()).called(1);
    });

    // TEST 3 : Read Turbines
    test('should read turbines from DbService', () async {
      when(() => dbService.readTurbines())
          .thenAnswer((_) async => Success<List<Turbine>>(
        value: [],
        reason: 'Success',
      ));

      final result = await repository.readTurbines();

      expect(result, isA<Success<List<Turbine>>>());

      verify(() => dbService.readTurbines()).called(1);
    });

    // TEST 4 : Create Turbine
    test('should create a turbine with correct parameters', () async {
      when(() => dbService.createTurbine(
        serialNumber: 'WT001',
        customName: 'Wind Turbine 1',
        latitude: 1.5,
        longitude: 2.5,
      )).thenAnswer((_) async => Success<int>(
        value: 1,
        reason: 'Success',
      ));

      final result = await repository.createTurbine(
        serialNumber: 'WT001',
        customName: 'Wind Turbine 1',
        position: const Position(
          latitude: 1.5,
          longitude: 2.5,
        ),
      );

      expect(result, isA<Success<int>>());
      expect((result as Success<int>).value, 1);

      verify(() => dbService.createTurbine(
        serialNumber: 'WT001',
        customName: 'Wind Turbine 1',
        latitude: 1.5,
        longitude: 2.5,
      )).called(1);
    });

    // TEST 5 : Read Pairing Code
    test('should read pairing code from DbService', () async {
      when(() => dbService.readPairingCode(turbineId: 1))
          .thenAnswer((_) async => Success<PairingCode>(
        value: null,
        reason: 'Success',
      ));

      final result = await repository.readPairingCode(
        turbineId: 1,
      );

      expect(result, isA<Success<PairingCode>>());

      verify(() => dbService.readPairingCode(
        turbineId: 1,
      )).called(1);
    });

    // TEST 6 : Read Turbine Activation
    test('should read turbine activation from DbService', () async {
      when(() => dbService.readTurbineActivation())
          .thenAnswer((_) async => Success<void>(
        reason: 'Success',
      ));

      final result = await repository.readTurbineActivation();

      expect(result, isA<Success<void>>());

      verify(() => dbService.readTurbineActivation()).called(1);
    });

    // TEST 7 : Update Turbine
    test('should update turbine with correct parameters', () async {
      when(() => dbService.updateTurbine(
        turbineId: 1,
        customName: 'Updated Turbine',
        latitude: 1.5,
        longitude: 2.5,
      )).thenAnswer((_) async => Success<void>(
        reason: 'Success',
      ));

      final result = await repository.updateTurbine(
        turbineId: 1,
        customName: 'Updated Turbine',
        position: const Position(
          latitude: 1.5,
          longitude: 2.5,
        ),
      );

      expect(result, isA<Success<void>>());

      verify(() => dbService.updateTurbine(
        turbineId: 1,
        customName: 'Updated Turbine',
        latitude: 1.5,
        longitude: 2.5,
      )).called(1);
    });

    // TEST 8 : Delete Turbine
    test('should delete turbine from DbService', () async {
      when(() => dbService.deleteTurbine(turbineId: 1))
          .thenAnswer((_) async => Success<void>(
        reason: 'Success',
      ));

      final result = await repository.deleteTurbine(
        turbineId: 1,
      );

      expect(result, isA<Success<void>>());

      verify(() => dbService.deleteTurbine(
        turbineId: 1,
      )).called(1);
    });

  });
}