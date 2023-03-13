import 'dart:convert';

import 'package:flutter_products_store/infrastructure/dtos/user_dto.dart';
import 'package:flutter_products_store/infrastructure/users/datasources/user_local_dao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'user_local_dao_test.mocks.dart';

@GenerateMocks(<Type>[], customMocks: <MockSpec<dynamic>>[
  MockSpec<GetStorage>(
      as: #MockGetStorage, unsupportedMembers: {#getKeys, #getValues}),
])
void main() {
  late UserLocalDao userLocalDao;
  final storage = MockGetStorage();

  setUp(() {
    userLocalDao = UserLocalDao(storage);
  });

  test('get, should return a valid object', () {
    String json = fixture("user.json");
    final decoded = jsonDecode(json);

    when(storage.read(any)).thenAnswer((_) => json);

    final result = userLocalDao.get();

    expect(result.email, decoded["email"]);
    verify(storage.read(any)).called(1);
    verifyNoMoreInteractions(storage);
  });

  test('isUserLoggedIn, should return a valid object', () {
    bool response = false;
    when(storage.read(any)).thenAnswer((_) => "");

    final result = userLocalDao.isUserLoggedIn();

    expect(result, response);
    verify(storage.read(any)).called(1);
    verifyNoMoreInteractions(storage);
  });

  test('logout, should return a valid object', () {
    userLocalDao.logout();

    verify(storage.write(any, any)).called(1);
    verifyNoMoreInteractions(storage);
  });

  test('save, should return a valid object', () {
    String json = fixture("user.json");
    final decoded = jsonDecode(json);
    final userDto = UserDto.fromJson(decoded);

    userLocalDao.save(userDto);

    verify(storage.write(any, any)).called(1);
    verifyNoMoreInteractions(storage);
  });
}
