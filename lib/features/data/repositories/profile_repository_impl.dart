import 'package:windenergy/features/data/servises/db_service.dart';
import 'package:windenergy/features/domain/entities/profile.dart';
import 'package:windenergy/features/domain/repositories/profile_repository.dart';
import 'package:windenergy/utils/exception.dart';
import 'package:windenergy/utils/result.dart';

class ProfileRepositoryImpl extends ProfileRepository{
  final DbService dbService;

  ProfileRepositoryImpl({required this.dbService});

  @override
  FutureResult<Profile> readProfile() async {
    try{
      return await dbService.readProfile();
    } on ServerException catch(e){
      return Success(reason: e.reason);
    }
  }
}