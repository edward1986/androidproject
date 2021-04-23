import 'package:flutter/material.dart';
import '../../utils/loader.dart';import 'package:get/get.dart';
import '../../controllers/company_controller.dart';
import '../../models/company_model.dart';

class CompaniesEditPage extends StatelessWidget {
  final companiesController = Get.put(CompanyController());

  get companyId => Get.parameters["id"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Company'),
        ),
        body: GetBuilder<CompanyController>(
          initState: (_) {
            companiesController.listarCompany(companyId);
          },
          builder: (api) {
            var company = api.company;

            if (companiesController.carregando.value == true) {
              return Loader(
                msg: 'Loading',
                color: Colors.red,
              );
            }
            return _buildForm(company);
          },
        ));
  }

  Widget _buildForm(Rx<CompanyModel> company) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: companiesController.formKey,
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: TextFormField(
                    initialValue: company.value.name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    onSaved: companiesController.setName,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: TextFormField(
                    initialValue: company.value.email,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                    ),
                    //onChanged: controller.setEmail,
                    onSaved: companiesController.setEmail,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: RaisedButton(
                  child: Text('Save'),
                  onPressed: () async {
                    companiesController.atualizar(company.value.id);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
