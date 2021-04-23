import 'package:dio/dio.dart';
import '../models/employee_model.dart';
import '../providers/db_provider.dart';

class EmployeeApiProvider {
  Future<List<Employee>> getAllEmployee() async {
    var url = "http://10.0.2.2:8000/api/users";
    var resp = await Dio().get(url);

    List<Employee> listE = List<Employee>();
    (resp.data as List).map((e) async {
      var employee = Employee.fromJson(e);
      var dbEmployee = await DBProvider.db.getById("Employee", "email", employee.email);
      if(dbEmployee.length > 0) {
        if(dbEmployee[0]["email"] == employee.email){
          return;
        }
      }else{
        listE.add(employee);
      }
      DBProvider.db.createEmployee(Employee.fromJson(e));
    }).toList();

    return listE;
  }
}