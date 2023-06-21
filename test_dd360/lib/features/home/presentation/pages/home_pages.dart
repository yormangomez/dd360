import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_dd360/core/helper/format_helpers.dart';
import 'package:test_dd360/core/util/ap_size.dart';
import 'package:test_dd360/core/util/ap_text_style.dart';
import 'package:test_dd360/core/util/apcolors.dart';
import 'package:test_dd360/features/home/presentation/bloc/comics/comics_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/events/events_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/marvel/marvel_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/series/series_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/stories/stories_bloc.dart';
import 'package:test_dd360/navigator.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  void initState() {
    context.read<MarvelBloc>().add(const MarvelGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APColors.whiteDD260,
        elevation: 0,
      ),
      body: BlocBuilder<MarvelBloc, MarvelState>(
        builder: (context, state) {
          return state.marvelCharacters != null && state.marvelCharacters != []
              ? Container(
                  width: double.infinity,
                  height: APScreenSize.height(context) / 1,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    // physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    shrinkWrap: true,
                    itemCount: state.marvelCharacters!.length,
                    itemBuilder: (context, index) {
                      final data = state.marvelCharacters![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () {
                            context
                                .read<ComicsBloc>()
                                .add(ComicsGetEvent(id: data.id.toString()));
                            context
                                .read<EventsBloc>()
                                .add(EventsGetEvent(id: data.id.toString()));
                            context
                                .read<SeriesBloc>()
                                .add(SeriesGetEvent(id: data.id.toString()));
                            context
                                .read<StoriesBloc>()
                                .add(StoriesGetEvent(id: data.id.toString()));
                            AppNavigator.push(Routes.CHARACTER);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: APColors.whitePure,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: APColors.primaryMain.withOpacity(.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            width: double.infinity,
                            height: APScreenSize.height(context) / 5,
                            child: Table(
                              columnWidths: const {
                                0: FractionColumnWidth(0.4),
                                1: FractionColumnWidth(0.6),
                              },
                              children: [
                                TableRow(children: [
                                  Container(
                                    height: APScreenSize.height(context) / 5,
                                    decoration: BoxDecoration(
                                      color: APColors.secondary,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${data.thumbnail!.path}.${data.thumbnail!.extension}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: APScreenSize.height(context) / 5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Nombre: ',
                                            style: APTextStyle.textMD.bold
                                                .copyWith(
                                              color: APColors.secondaryDark,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            data.name!,
                                            style: APTextStyle.textMD.semibold
                                                .copyWith(
                                              color: APColors.secondaryDark,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            'Ultima modificación: ',
                                            style: APTextStyle.textMD.bold
                                                .copyWith(
                                              color: APColors.secondaryDark,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              AppFormatters.instance
                                                  .dateFormatUtil(
                                                dateTime: DateTime.parse(
                                                    data.modified!),
                                                typeFormat:
                                                    TypeFormat.yyyyMMMdd,
                                              ),
                                              style: APTextStyle.textMD.semibold
                                                  .copyWith(
                                                color: APColors.secondaryDark,
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            'Descripción: ',
                                            style: APTextStyle.textMD.bold
                                                .copyWith(
                                              color: APColors.secondaryDark,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            data.description != null &&
                                                    data.description != ''
                                                ? data.description!
                                                : 'Sin descrición',
                                            overflow: TextOverflow.ellipsis,
                                            style: APTextStyle.textMD.semibold
                                                .copyWith(
                                              color: APColors.secondaryDark,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
