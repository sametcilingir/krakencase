import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krakencase/layers/application_layer/constants/string_constants.dart';
import 'package:krakencase/layers/presentation_layer/routes/app_router.dart';
import '../../../../application_layer/di/locator.dart';
import '../../../widgets/anime_card.dart';
import '../bloc/anime_list_bloc.dart';
import '../../../../application_layer/handlers/method_channel_handler.dart';

class AnimeListPage extends StatefulWidget {
  const AnimeListPage({Key? key}) : super(key: key);

  @override
  State<AnimeListPage> createState() => _AnimeListPageState();
}

class _AnimeListPageState extends State<AnimeListPage> {
  late AnimeListBloc _bloc;
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  String _selectedType = StringConstants.allText;
  String _selectedFilter = StringConstants.allText;

  final Map<String, String?> typeOptions = StringConstants.typeOptionsMap;
  final Map<String, String?> filterOptions = StringConstants.filterOptionsMap;

  @override
  void initState() {
    super.initState();
    _bloc = locator<AnimeListBloc>();

    MethodChannelHandler.invokeMethod(StringConstants.fetchAnimeListMethod);

    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    MethodChannelHandler.setMethodCallHandler((call) async {
      if (call.method == StringConstants.fetchAnimeListMethod) {
        _bloc.add(
          FetchAnimeListEvent(
            page: _currentPage,
            type: typeOptions[_selectedType],
            filter: filterOptions[_selectedFilter],
            reset: true,
          ),
        );
      }
    });
  }

  void _onScroll() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      _currentPage++;
      _bloc.add(
        FetchAnimeListEvent(
          page: _currentPage,
          type: typeOptions[_selectedType],
          filter: filterOptions[_selectedFilter],
        ),
      );
    }
  }

  void _onTypeChanged(String? value) {
    if (value != null && value != _selectedType) {
      setState(() {
        _selectedType = value;
        _currentPage = 1;
      });
      _bloc.add(
        FetchAnimeListEvent(
          page: _currentPage,
          type: typeOptions[_selectedType],
          filter: filterOptions[_selectedFilter],
          reset: true,
        ),
      );
    }
  }

  void _onFilterChanged(String? value) {
    if (value != null && value != _selectedFilter) {
      setState(() {
        _selectedFilter = value;
        _currentPage = 1;
      });
      _bloc.add(
        FetchAnimeListEvent(
          page: _currentPage,
          type: typeOptions[_selectedType],
          filter: filterOptions[_selectedFilter],
          reset: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.animeListTitle),
        actions: [
          DropdownButton<String>(
            value: _selectedType,
            items: typeOptions.keys.map((String key) {
              return DropdownMenuItem<String>(
                value: key,
                child: Text(key),
              );
            }).toList(),
            onChanged: _onTypeChanged,
          ),
          const SizedBox(width: 10),
          DropdownButton<String>(
            value: _selectedFilter,
            items: filterOptions.keys.map((String key) {
              return DropdownMenuItem<String>(
                value: key,
                child: Text(key),
              );
            }).toList(),
            onChanged: _onFilterChanged,
          ),
        ],
      ),
      body: BlocBuilder<AnimeListBloc, AnimeListState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is AnimeListLoading && state.animes.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AnimeListLoaded || state is AnimeListLoading) {
            final animes = state.animes;
            return ListView.builder(
              key: ValueKey(
                '${StringConstants.listViewKey}_${_selectedType}_$_selectedFilter',
              ),
              controller: _scrollController,
              itemCount: animes.length,
              itemBuilder: (context, index) {
                final anime = animes[index];
                return AnimeCard(
                  anime: anime,
                  onTap: () {
                    AutoRouter.of(context)
                        .push(AnimeDetailRoute(animeId: anime.id));
                  },
                );
              },
            );
          } else if (state is AnimeListError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
