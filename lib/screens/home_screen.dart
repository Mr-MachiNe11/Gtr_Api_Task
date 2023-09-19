import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*late Future<ProductModel?> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }*/

  Future<ProductModel> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://www.pqstec.com/InvoiceApps/Values/GetProductList?pageNo=1&pageSize=100&searchquery=boys'),
        headers: {
          'Authorization':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI0MTMiLCJDdXJyZW50Q29tSWQiOiIxIiwibmJmIjoxNjk0ODQ0MTg2LCJleHAiOjE2OTU0NDg5ODYsImlhdCI6MTY5NDg0NDE4Nn0.VKZ3-Nj1xKqvFSVaLPKCxbplFxW374hTwdKtd6aah_o',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final myData = ProductModel.fromJson(data);
        return myData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle any exceptions that occur during the API request
      print('Error: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductModel?>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  // Display data
                  return ListView.builder(
                    itemCount: snapshot.data!.productList.length,
                    itemBuilder: (context, index) {
                      final product = snapshot.data!.productList[index];
                      final updateDate = product.updateDate;

                      // Format the date using the desired format (e.g., "yyyy/MM/dd")
                      final formattedUpdateDate = DateFormat('yyyy/MM/dd')
                          .format(
                              DateTime.parse(updateDate.replaceAll('/', '-')));

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text('Code: ${product.code}'),
                          subtitle: Text('Date: $formattedUpdateDate'),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(product.imagePath.toString()),
                          ),
                          trailing: Text('Price: ${product.price}'),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
