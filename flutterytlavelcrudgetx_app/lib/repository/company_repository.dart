import '../models/company_model.dart';
import '../utils/custom_dio.dart';

class CompanyRepository {
  Future<List<CompanyModel>> getCompanies() async {
    final dio = CustomDio().instance;

    await Future.delayed(Duration(seconds: 1));

    return dio.get('/users').then((res) =>
        res.data
            .map<CompanyModel>((c) => CompanyModel.fromJson(c))
            .toList());
  }

  Future<CompanyModel> getCompany(String id) async {
    final dio = CustomDio().instance;

    final response = await dio.get('/users/$id');
    CompanyModel company = CompanyModel.fromJson(response.data);
    return company;
  }

  Future createCompany(String name, String email) async {
    final dio = CustomDio().instance;
    final bodyData = {'name': name, 'email': email};

    return dio.post('/users/', data: bodyData);
  }

  Future updateCompany(String id, String name, String email) async {
    final dio = CustomDio().instance;
    final bodyData = {'name': name, 'email': email};

    return dio.put('/users/$id', data: bodyData);
  }

  Future deleteCompany(String id) {
    final dio = CustomDio().instance;

    return dio.delete('/users/$id');
  }
}
