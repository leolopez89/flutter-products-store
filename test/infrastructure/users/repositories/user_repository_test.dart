import 'dart:convert';

import 'package:flutter_products_store/domain/users/datasources/i_user_local_dao.dart';
import 'package:flutter_products_store/infrastructure/dtos/user_dto.dart';
import 'package:flutter_products_store/infrastructure/users/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'user_repository_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<IUserLocalDao>(as: #MockIUserLocalDao),
])
void main() {
  MockIUserLocalDao mockIRemoteDao = MockIUserLocalDao();
  UserRepository userRepository = UserRepository(mockIRemoteDao);

  test('get, should return a valid object', () {
    final jsonMap = jsonDecode(fixture("user.json"));
    final userDto = UserDto.fromJson(jsonMap);
    when(mockIRemoteDao.get()).thenAnswer((_) => userDto);

    final result = userRepository.get();

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result.email.isNotEmpty, true));

    verify(mockIRemoteDao.get()).called(1);
    verifyNoMoreInteractions(mockIRemoteDao);
  });

  test('isUserLoggedIn, should return a valid answer', () {
    when(mockIRemoteDao.isUserLoggedIn()).thenAnswer((_) => false);

    final result = userRepository.isUserLoggedIn();

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result, false));

    verify(mockIRemoteDao.isUserLoggedIn()).called(1);
    verifyNoMoreInteractions(mockIRemoteDao);
  });

  test('logout, should return a valid answer', () {
    final result = userRepository.logout();

    expect(result.isRight(), true);

    verify(mockIRemoteDao.logout()).called(1);
    verifyNoMoreInteractions(mockIRemoteDao);
  });

  test('save, should return a valid answer', () async {
    final jsonMap = jsonDecode(fixture("user.json"));
    final userDto = UserDto.fromJson(jsonMap);

    final result = await userRepository.save(userDto.toDomain());

    expect(result.isRight(), true);

    verify(mockIRemoteDao.save(any)).called(1);
    verifyNoMoreInteractions(mockIRemoteDao);
  });
}
