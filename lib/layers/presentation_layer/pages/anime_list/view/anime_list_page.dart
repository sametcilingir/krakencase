import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/anime_card.dart';
import '../../../../application_layer/constants/string_constants.dart';
import '../../../../application_layer/di/locator.dart';
import '../../../routes/app_router.dart';
import '../bloc/anime_list_bloc.dart';

class AnimeListPage extends StatelessWidget {
  const AnimeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeListBloc>(
      create: (context) => locator<AnimeListBloc>()..add(const CallMethodChannelEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringConstants.animeListTitle),
          actions: const [
            TypeDropdown(),
            SizedBox(width: 10),
            FilterDropdown(),
          ],
        ),
        body: const AnimeListView(),
      ),
    );
  }
}

class TypeDropdown extends StatelessWidget {
  const TypeDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AnimeListBloc, AnimeListState, String?>(
      selector: (state) => state.currentType,
      builder: (context, currentType) {
        final bloc = context.read<AnimeListBloc>();
        final entry = bloc.typeOptions.entries.firstWhere(
          (element) => element.value == currentType,
          orElse: () => bloc.typeOptions.entries.first,
        );
        return DropdownButton<String>(
          value: entry.key,
          items: bloc.typeOptions.keys.map((String key) {
            return DropdownMenuItem<String>(
              value: key,
              child: Text(key),
            );
          }).toList(),
          onChanged: (value) {
            final selectedType = value != StringConstants.allText ? bloc.typeOptions[value] : null;
            context.read<AnimeListBloc>().add(
                  ChangeFilterEvent(
                    type: selectedType,
                    filter: bloc.state.currentFilter,
                  ),
                );
          },
          underline: const SizedBox(),
          icon: const Icon(Icons.filter_list, color: Colors.white),
        );
      },
    );
  }
}

class FilterDropdown extends StatelessWidget {
  const FilterDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AnimeListBloc, AnimeListState, String?>(
      selector: (state) => state.currentFilter,
      builder: (context, currentFilter) {
        final bloc = context.read<AnimeListBloc>();
        final entry = bloc.filterOptions.entries.firstWhere(
          (element) => element.value == currentFilter,
          orElse: () => bloc.filterOptions.entries.first,
        );
        return DropdownButton<String>(
          value: entry.key,
          items: bloc.filterOptions.keys.map((String key) {
            return DropdownMenuItem<String>(
              value: key,
              child: Text(key),
            );
          }).toList(),
          onChanged: (value) {
            final selectedFilter = value != StringConstants.allText ? bloc.filterOptions[value] : null;
            context.read<AnimeListBloc>().add(
                  ChangeFilterEvent(
                    type: bloc.state.currentType,
                    filter: selectedFilter,
                  ),
                );
          },
          underline: const SizedBox(),
          icon: const Icon(Icons.sort, color: Colors.white),
        );
      },
    );
  }
}

class AnimeListView extends StatefulWidget {
  const AnimeListView({Key? key}) : super(key: key);

  @override
  State<AnimeListView> createState() => _AnimeListViewState();
}

class _AnimeListViewState extends State<AnimeListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeListBloc, AnimeListState>(
      builder: (context, state) {
        if (state is AnimeListLoading && state.animes.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AnimeListLoaded || state is AnimeListLoading) {
          final animes = state.animes;
          if (animes.isEmpty) {
            return const Center(child: Text(StringConstants.noAnimeFoundText));
          }
          return ListView.builder(
            key: const ValueKey(StringConstants.listViewKey),
            controller: _scrollController,
            itemCount: state.hasReachedMax ? animes.length : animes.length + 1,
            itemBuilder: (context, index) {
              if (index < animes.length) {
                final anime = animes[index];
                return AnimeCard(
                  key: ValueKey(anime.id),
                  anime: anime,
                  onTap: () {
                    AutoRouter.of(context).push(AnimeDetailRoute(animeId: anime.id));
                  },
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          );
        } else if (state is AnimeListError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _onScroll() {
    if (_isBottom) {
      final bloc = context.read<AnimeListBloc>();
      if (bloc.state is AnimeListLoading) {
        return;
      }
      bloc.add(
        FetchAnimeListEvent(
          page: (bloc.state.animes.length ~/ 25) + 1,
          type: bloc.state.currentType,
          filter: bloc.state.currentFilter,
        ),
      );
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }
}
