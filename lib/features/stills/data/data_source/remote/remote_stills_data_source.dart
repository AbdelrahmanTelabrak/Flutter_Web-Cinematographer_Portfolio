import 'package:ahmed_abdelrehim_portfolio/core/errors.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/data/model/project_catalogue_model.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/data/model/project_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class StillsRemoteDataSource {
  Future<List<ProjectCatalogueModel>> getProjectsCatalogue();
  Future<List<ProjectCatalogueModel>> getLatestProjects();
  Future<ProjectDetailsModel> getProjectDetails({required String id});
}

class StillsRemoteDataSourceImpl implements StillsRemoteDataSource{

  final db = FirebaseFirestore.instance;
  @override
  Future<List<ProjectCatalogueModel>> getLatestProjects() async{
    List<ProjectCatalogueModel> projects = [];
    final querySnapshot = await db.collection("latest").get();
    for (var docSnapshot in querySnapshot.docs) {
      print(docSnapshot.data());
      projects.add(ProjectCatalogueModel.fromJson(docSnapshot.data()));
    }
    return projects;
  }

  @override
  Future<ProjectDetailsModel> getProjectDetails({required String id}) async {
    print("IN REMOTE DATA SOURCE");
    print('ID: $id');
    final querySnapshot = await db.collection("projects").doc(id).get();
    print(querySnapshot.data());
    if (querySnapshot.data() == null) {
      throw ServerException();
    }
    return ProjectDetailsModel.fromJson(querySnapshot.data()!);
  }

  @override
  Future<List<ProjectCatalogueModel>> getProjectsCatalogue() async {
    print("IN REMOTE DATA SOURCE");
    List<ProjectCatalogueModel> projects = [];
    final querySnapshot = await db.collection("catalogue").get();
    for (var docSnapshot in querySnapshot.docs) {
      print(docSnapshot.data());
      projects.add(ProjectCatalogueModel.fromJson(docSnapshot.data()));
    }
    // for (var project in projects) {
    //   print(project.toString());
    // }
    return projects;
  }

}