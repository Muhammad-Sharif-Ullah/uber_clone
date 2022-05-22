
part of 'vanilla_counter_bloc.dart';

abstract class VanillaCounterEvent{}

class VanillaCounterIncrement extends VanillaCounterEvent{}
class VanillaCounterDecrement extends VanillaCounterEvent{}
class VanillaCounterMakeZero extends VanillaCounterEvent{}