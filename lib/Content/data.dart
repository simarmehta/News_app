import 'package:news_app/model/categorymodel.dart';

 List<CategoryModel> getCategory(){
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel= new CategoryModel();

  //1.1
  categoryModel.categoryName= "Business";
  categoryModel.imgUrl="https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80";
  category.add(categoryModel);

  categoryModel=new CategoryModel();
  //1.2
  categoryModel.categoryName= "Technology";
  categoryModel.imgUrl="https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  categoryModel=new CategoryModel();


  //1.3
  categoryModel.categoryName= "Health";
  categoryModel.imgUrl="https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1031&q=80";
  category.add(categoryModel);

  categoryModel=new CategoryModel();

  //1.4
  categoryModel.categoryName= "Science";
  categoryModel.imgUrl="https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  categoryModel=new CategoryModel();

  //1.5
  categoryModel.categoryName= "Entertainment";
  categoryModel.imgUrl="https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  categoryModel=new CategoryModel();

  return category;


 }