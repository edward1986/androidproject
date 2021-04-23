class Todo {
  int id;
  String text;
  bool done;
  String created_at;
  String updated_at;

  Todo(
      {this.id = 0,
      this.text,
      this.done = false,
      this.created_at = '',
      this.updated_at = ''});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
      id: json['id'],
      text: json['text'],
      done: json['done'],
      created_at: json['created_at'],
      updated_at: json['updated_at']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'done': done,
        'created_at': created_at,
        'updated_at': updated_at
      };
}
