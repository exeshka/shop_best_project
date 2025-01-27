abstract interface class UserException implements Exception {}

class UserNotFoundException implements UserException {}

class UserServerErrorException implements UserException {}

class UserUnknownException implements UserException {}
