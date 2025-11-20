
class Note{
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  // consturctor
  Note(this._id,
      this._title,
     this._description,
      this._date,
      this._priority);


 // getters
 int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  // setter
  set title(String newTitle){
    if(newTitle.length <= 255){
      this._title = newTitle;
    }
  }

  set description(String newDescription){
    if(newDescription.length <=255){
      this._description = newDescription;
    }
  }

  set date(String newDate){
    this._date = newDate;
    }

    set priority(int newPriority){
    if(newPriority >= 1 && newPriority <=2 ){
      this._priority = newPriority;
    }
    }
    // Convert a Note Object into a map object
    Map<String,dynamic>toMap(){
    var map = Map<String,dynamic>();

    if(id != null ){
      map['id'] = _id;
    }
    map['title '] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['priority'] = _priority;

    return map;
}

  // Extract a note object from a map Object
  Note.fromMapObject(Map<String,dynamic> map)
   : _id = map['id'],
    _title =map ['title'],
    _description = map['description'],
    _date = map['date'],
    _priority = map['priority'];



  }



  


