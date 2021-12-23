extends Node

enum TypeEnum {ARGUMENT, MANIPULATION, AFFLICTION}
export(TypeEnum) var type

enum TargetEnum {PLAYER, OPPONENT}
export(TargetEnum) var target

export(int) var strength
