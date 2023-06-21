import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_dd360/core/helper/spacer_helper.dart';
import 'package:test_dd360/core/util/ap_size.dart';
import 'package:test_dd360/core/util/ap_text_style.dart';
import 'package:test_dd360/core/util/apcolors.dart';
import 'package:test_dd360/features/home/presentation/bloc/comics/comics_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/events/events_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/series/series_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/stories/stories_bloc.dart';
import 'package:test_dd360/features/home/presentation/widget/card_marvel.dart';

class CharacterInfo extends StatefulWidget {
  const CharacterInfo({Key? key}) : super(key: key);

  @override
  _CharacterInfoState createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedPage = 0;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: selectedPage,
    )..addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APColors.whiteDD260,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: APColors.primaryMain,
        ),
        actions: [
          // IconButton(
          //   onPressed: () async =>
          //       await AppUtils.instance.launchWhatsApp(context),
          //   icon: const Icon(Icons.support_agent_outlined),
          //   color: APColors.primaryMain,
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              width: APScreenSize.width(context) / 1,
              height: APScreenSize.height(context) / 20,
              child: TabBar(
                onTap: (value) {
                  //  valueSwipin(value, context);
                },
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                indicator: BoxDecoration(
                  color: APColors.primaryMain,
                  borderRadius: BorderRadius.circular(16),
                ),
                labelStyle: APTextStyle.textMD.bold.copyWith(
                  fontSize: 16,
                ),
                unselectedLabelColor: APColors.primaryMain,
                labelColor: APColors.whitePure,
                tabs: const [
                  Tab(text: 'comics'),
                  Tab(text: 'events'),
                  Tab(text: 'series'),
                  Tab(text: 'stories'),
                ],
              ),
            ),
            VSpacer(APScreenSize.height(context) / 90),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SizedBox(
                    height: 800,
                    width: double.infinity,
                    child: BlocBuilder<ComicsBloc, ComicsState>(
                      builder: (context, state) {
                        return state.marvelComics != null &&
                                state.marvelComics != []
                            ? Container(
                                width: double.infinity,
                                height: APScreenSize.height(context) / 1,
                                child: ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: state.marvelComics!.length,
                                  itemBuilder: (context, index) {
                                    final data = state.marvelComics![index];
                                    return CardMarvel(
                                      title: data.title!,
                                      image:
                                          '${data.thumbnail!.path}.${data.thumbnail!.extension}',
                                      date: data.modified!,
                                      description: data.description != null &&
                                              data.description != ''
                                          ? data.description!
                                          : 'Sin descrición',
                                      onTap: () {},
                                    );
                                  },
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 800,
                    width: double.infinity,
                    child: BlocBuilder<EventsBloc, EventsState>(
                      builder: (context, state) {
                        return state.marvelEvents != null &&
                                state.marvelEvents != []
                            ? Container(
                                width: double.infinity,
                                height: 700,
                                child: ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  // physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: state.marvelEvents!.length,
                                  itemBuilder: (context, index) {
                                    final data = state.marvelEvents![index];
                                    return CardMarvel(
                                      title: data.title!,
                                      image:
                                          '${data.thumbnail!.path}.${data.thumbnail!.extension}',
                                      date: data.modified!,
                                      description: data.description != null &&
                                              data.description != ''
                                          ? data.description!
                                          : 'Sin descrición',
                                      onTap: () {},
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 800,
                    width: double.infinity,
                    child: BlocBuilder<SeriesBloc, SeriesState>(
                      builder: (context, state) {
                        return state.marvelSeries != null &&
                                state.marvelSeries != []
                            ? Container(
                                width: double.infinity,
                                height: 700,
                                child: ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  // physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: state.marvelSeries!.length,
                                  itemBuilder: (context, index) {
                                    final data = state.marvelSeries![index];
                                    return CardMarvel(
                                      title: data.title!,
                                      image:
                                          '${data.thumbnail!.path}.${data.thumbnail!.extension}',
                                      date: data.modified!,
                                      description: data.description != null &&
                                              data.description != ''
                                          ? data.description!
                                          : 'Sin descrición',
                                      onTap: () {},
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 800,
                    width: double.infinity,
                    child: BlocBuilder<StoriesBloc, StoriesState>(
                      builder: (context, state) {
                        return state.marvelStories != null &&
                                state.marvelStories != []
                            ? Container(
                                width: double.infinity,
                                height: 700,
                                child: ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  // physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: state.marvelStories!.length,
                                  itemBuilder: (context, index) {
                                    final data = state.marvelStories![index];
                                    return CardMarvel(
                                      title: data.title!,
                                      image:
                                          'https://gravatar.com/avatar/22e99c4fdb39439d4b1066a250e0f624?s=400&d=robohash&r=x',
                                      date: data.modified!,
                                      description: data.description != null &&
                                              data.description != ''
                                          ? data.description!
                                          : 'Sin descrición',
                                      onTap: () {},
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
