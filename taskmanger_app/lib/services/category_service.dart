import 'package:flutter/foundation.dart';
import '../models/category.dart';
import "../repositories/repository.dart";

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  saveCategory(Category_ category) async {
    return await _repository.save('categories', category.categoryMap());
  }

  getCategories() async {
    return await _repository.getAll('categories');
  }

  getCategoryById(categoryId) async {
    return await _repository.getById("categories", categoryId);
  }

  updateCategory(Category_ category) async {
    return await _repository.update('categories', category.categoryMap());
  }

  deleteCategory(categoryId) async {
    return await _repository.delete("categories", categoryId);
  }
}