import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/data/api/api_manager.dart';
import 'package:newsapp/data/model/source.dart';
import 'package:newsapp/data/model/source_response.dart';
import 'package:newsapp/ui/base/base_api_state.dart';

class TabsListcubit extends Cubit<TabsListState> {
  TabsListcubit() : super(TabsListState.initial());

  Future<void> getSources(String categoryId) async {
    try {
      emit(state.copyWith(tabsListState: LoadingApiStaet()));
      SourcesResponse sourcesResponse = await ApiManager.getSoucres(categoryId);
      List<Source> sources = sourcesResponse.sources!;
      emit(state.copyWith(
          tabsListState: SuccessApiStaet<List<Source>>(sources)));
    } catch (e) {
      emit(state.copyWith(tabsListState: ErrorApiStaet(e.toString())));
    }
  }
}

class TabsListState {
  late BaseApiState tabsListApistate;
  TabsListState({required this.tabsListApistate});

  TabsListState.initial() {
    tabsListApistate = IdleApiStaet();
  }
  TabsListState copyWith({BaseApiState? tabsListState}) {
    return TabsListState(
      tabsListApistate: tabsListState ?? tabsListApistate,
    );
  }
}
