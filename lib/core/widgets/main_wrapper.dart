import 'package:countries/features/feature_countries/domain/entities/countries_entity.dart';
import 'package:countries/features/feature_countries/presention/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCountryEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: BlocBuilder<HomeBloc,HomeState>(
          builder:(context, state){
            {
              if (state is CountriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is CountriesLoaded) {
                List<CountriesEntities> countryList = state.countries;
                return ListView.builder(
                  itemCount: countryList.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            countryList[index].name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            countryList[index].capital,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(countryList[index].flag,scale: 1),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
    }
            return Container();
          }
      ),
    );
  }
}
