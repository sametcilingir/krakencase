// Mocks generated by Mockito 5.4.0 from annotations
// in krakencase/test/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:either_dart/either.dart' as _i4;
import 'package:flutter_bloc/flutter_bloc.dart' as _i13;
import 'package:krakencase/layers/data_layer/models/anime_model.dart' as _i2;
import 'package:krakencase/layers/data_layer/models/character_model.dart'
    as _i3;
import 'package:krakencase/layers/data_layer/services/remote/anime/base/anime_remote_service_base.dart'
    as _i9;
import 'package:krakencase/layers/domain_layer/entities/anime_entity.dart'
    as _i12;
import 'package:krakencase/layers/domain_layer/repositories/anime/base/anime_repository_base.dart'
    as _i11;
import 'package:krakencase/layers/domain_layer/usecases/get_anime_detail_usecase.dart'
    as _i5;
import 'package:krakencase/layers/domain_layer/usecases/get_top_anime_usecase.dart'
    as _i7;
import 'package:krakencase/layers/presentation_layer/pages/anime_detail/bloc/anime_detail_bloc.dart'
    as _i6;
import 'package:krakencase/layers/presentation_layer/pages/anime_list/bloc/anime_list_bloc.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAnimeModel_0 extends _i1.SmartFake implements _i2.AnimeModel {
  _FakeAnimeModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDatumForAnime_1 extends _i1.SmartFake implements _i2.DatumForAnime {
  _FakeDatumForAnime_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCharacterModel_2 extends _i1.SmartFake
    implements _i3.CharacterModel {
  _FakeCharacterModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_3<L, R> extends _i1.SmartFake implements _i4.Either<L, R> {
  _FakeEither_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetAnimeDetailUseCase_4 extends _i1.SmartFake
    implements _i5.GetAnimeDetailUseCase {
  _FakeGetAnimeDetailUseCase_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAnimeDetailState_5 extends _i1.SmartFake
    implements _i6.AnimeDetailState {
  _FakeAnimeDetailState_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTopAnimeUseCase_6 extends _i1.SmartFake
    implements _i7.GetTopAnimeUseCase {
  _FakeGetTopAnimeUseCase_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAnimeListState_7 extends _i1.SmartFake
    implements _i8.AnimeListState {
  _FakeAnimeListState_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AnimeRemoteServiceBase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnimeRemoteServiceBase extends _i1.Mock
    implements _i9.AnimeRemoteServiceBase {
  MockAnimeRemoteServiceBase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<_i2.AnimeModel> getTopAnime(
    int? page, {
    String? type,
    String? filter,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopAnime,
          [page],
          {
            #type: type,
            #filter: filter,
          },
        ),
        returnValue: _i10.Future<_i2.AnimeModel>.value(_FakeAnimeModel_0(
          this,
          Invocation.method(
            #getTopAnime,
            [page],
            {
              #type: type,
              #filter: filter,
            },
          ),
        )),
      ) as _i10.Future<_i2.AnimeModel>);

  @override
  _i10.Future<_i2.DatumForAnime> getAnimeDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getAnimeDetail,
          [id],
        ),
        returnValue: _i10.Future<_i2.DatumForAnime>.value(_FakeDatumForAnime_1(
          this,
          Invocation.method(
            #getAnimeDetail,
            [id],
          ),
        )),
      ) as _i10.Future<_i2.DatumForAnime>);

  @override
  _i10.Future<_i3.CharacterModel> getAnimeCharacters(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAnimeCharacters,
          [id],
        ),
        returnValue:
            _i10.Future<_i3.CharacterModel>.value(_FakeCharacterModel_2(
          this,
          Invocation.method(
            #getAnimeCharacters,
            [id],
          ),
        )),
      ) as _i10.Future<_i3.CharacterModel>);
}

/// A class which mocks [AnimeRepositoryBase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnimeRepositoryBase extends _i1.Mock
    implements _i11.AnimeRepositoryBase {
  MockAnimeRepositoryBase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<_i4.Either<Exception, List<_i12.AnimeEntity>>> getTopAnime(
    int? page, {
    String? type,
    String? filter,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopAnime,
          [page],
          {
            #type: type,
            #filter: filter,
          },
        ),
        returnValue:
            _i10.Future<_i4.Either<Exception, List<_i12.AnimeEntity>>>.value(
                _FakeEither_3<Exception, List<_i12.AnimeEntity>>(
          this,
          Invocation.method(
            #getTopAnime,
            [page],
            {
              #type: type,
              #filter: filter,
            },
          ),
        )),
      ) as _i10.Future<_i4.Either<Exception, List<_i12.AnimeEntity>>>);

  @override
  _i10.Future<_i4.Either<Exception, _i12.AnimeEntity>> getAnimeDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAnimeDetail,
          [id],
        ),
        returnValue: _i10.Future<_i4.Either<Exception, _i12.AnimeEntity>>.value(
            _FakeEither_3<Exception, _i12.AnimeEntity>(
          this,
          Invocation.method(
            #getAnimeDetail,
            [id],
          ),
        )),
      ) as _i10.Future<_i4.Either<Exception, _i12.AnimeEntity>>);
}

/// A class which mocks [AnimeDetailBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnimeDetailBloc extends _i1.Mock implements _i6.AnimeDetailBloc {
  MockAnimeDetailBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.GetAnimeDetailUseCase get getAnimeDetailUseCase => (super.noSuchMethod(
        Invocation.getter(#getAnimeDetailUseCase),
        returnValue: _FakeGetAnimeDetailUseCase_4(
          this,
          Invocation.getter(#getAnimeDetailUseCase),
        ),
      ) as _i5.GetAnimeDetailUseCase);

  @override
  _i6.AnimeDetailState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAnimeDetailState_5(
          this,
          Invocation.getter(#state),
        ),
      ) as _i6.AnimeDetailState);

  @override
  _i10.Stream<_i6.AnimeDetailState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i10.Stream<_i6.AnimeDetailState>.empty(),
      ) as _i10.Stream<_i6.AnimeDetailState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void add(_i6.AnimeDetailEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i6.AnimeDetailEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i6.AnimeDetailState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i6.AnimeDetailEvent>(
    _i13.EventHandler<E, _i6.AnimeDetailState>? handler, {
    _i13.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i13.Transition<_i6.AnimeDetailEvent, _i6.AnimeDetailState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i10.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  void onChange(_i13.Change<_i6.AnimeDetailState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AnimeListBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnimeListBloc extends _i1.Mock implements _i8.AnimeListBloc {
  MockAnimeListBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.GetTopAnimeUseCase get getTopAnimeUseCase => (super.noSuchMethod(
        Invocation.getter(#getTopAnimeUseCase),
        returnValue: _FakeGetTopAnimeUseCase_6(
          this,
          Invocation.getter(#getTopAnimeUseCase),
        ),
      ) as _i7.GetTopAnimeUseCase);

  @override
  _i8.AnimeListState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAnimeListState_7(
          this,
          Invocation.getter(#state),
        ),
      ) as _i8.AnimeListState);

  @override
  _i10.Stream<_i8.AnimeListState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i10.Stream<_i8.AnimeListState>.empty(),
      ) as _i10.Stream<_i8.AnimeListState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void add(_i8.AnimeListEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i8.AnimeListEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i8.AnimeListState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i8.AnimeListEvent>(
    _i13.EventHandler<E, _i8.AnimeListState>? handler, {
    _i13.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i13.Transition<_i8.AnimeListEvent, _i8.AnimeListState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i10.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  void onChange(_i13.Change<_i8.AnimeListState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
