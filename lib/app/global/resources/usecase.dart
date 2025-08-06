abstract class UseCase<Type,Params> {
  Future<Type> call({required Params params});
}

abstract class UseCaseSync<Type,Params> {
  Type call({required Params params});
}