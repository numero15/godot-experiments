extends Node
class_name ReplyData

enum TypeEnum {SEDUCTION, INTIMIDATION, PERSUASION}
export(TypeEnum) var type

export(String) var reply_name = 'No name'

export(int) var duration

export(bool) var equiped

export(Texture) var thumbnail
