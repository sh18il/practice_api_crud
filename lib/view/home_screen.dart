import 'package:crud1/controller/apiServise_controller.dart';
import 'package:crud1/model/crud_model.dart';
import 'package:crud1/service/service_crud.dart';
import 'package:crud1/view/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ApiController>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddScreen(),
        ));
      }),
      body: FutureBuilder(
        future: ApiService().fetchingData(),
        builder: (context, AsyncSnapshot<List<ContactModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("eror${snapshot.hasError}"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ContactModel data = snapshot.data![index];
                return ListTile(
                  title: Text(data.name ?? ""),
                  subtitle: Text(data.email ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            pro.deleteData(data.id!);
                           
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
