import 'dart:convert';

/// statusCode : 200
/// message : "Random quotes"
/// pagination : {"currentPage":1,"nextPage":2,"totalPages":2}
/// totalQuotes : 20
/// data : [{"_id":"5eb17aafb69dc744b4e76efc","quoteText":"Carry out the republican principle of universal suffrage, or strike it from your banners and substitute 'Freedom and Power to one half of society, and Submission and Slavery to the other.'","quoteAuthor":"Ernestine Rose","quoteGenre":"freedom","__v":0},{"_id":"5eb17aaeb69dc744b4e7586a","quoteText":"Faith is an aptitude of the spirit. It is, in fact, a talent: you must be born with it.","quoteAuthor":"Anton Chekhov","quoteGenre":"faith","__v":0},{"_id":"5eb17aaeb69dc744b4e732ed","quoteText":"The '80s made up for all the abuse I took during the '70s. I outlived all my critics. By the time I retired, everybody saw me as a venerable institution. Things do change.","quoteAuthor":"Kareem Abdul-Jabbar","quoteGenre":"change","__v":0},{"_id":"5eb17aaeb69dc744b4e726b1","quoteText":"As a general rule, the most successful man in life is the man who has the best information.","quoteAuthor":"Benjamin Disraeli","quoteGenre":"best","__v":0},{"_id":"5eb17aaeb69dc744b4e7523d","quoteText":"As the leader of twelve apostles, even Jesus had more executive experience than Obama.","quoteAuthor":"Ann Coulter","quoteGenre":"experience","__v":0},{"_id":"5eb17ab0b69dc744b4e7a4a2","quoteText":"We worked to develop our own operations to advance U.S. counterterrorism objectives by penetrating terrorist safe havens and collecting intelligence that would inform policy and enable our own operations.","quoteAuthor":"Cofer Black","quoteGenre":"intelligence","__v":0},{"_id":"5eb17ab2b69dc744b4e8033c","quoteText":"We are special because we've been united not by a common race or ethnicity. We're bound together by common values. That family is the most important institution in society. That almighty God is the source of all we have.","quoteAuthor":"Marco Rubio","quoteGenre":"society","__v":0},{"_id":"5eb17ab0b69dc744b4e7983b","quoteText":"A girl's got to do what she's got to do to make somebody pay her a compliment. If that means moaning 'til the cows come home, then so be it.","quoteAuthor":"Cat Deeley","quoteGenre":"home","__v":0},{"_id":"5eb17aaeb69dc744b4e759a1","quoteText":"Comedy is an escape, not from truth but from despair a narrow escape into faith.","quoteAuthor":"Christopher Fry","quoteGenre":"faith","__v":0},{"_id":"5eb17ab1b69dc744b4e7da18","quoteText":"How can a society that exists on instant mashed potatoes, packaged cake mixes, frozen dinners, and instant cameras teach patience to its young?","quoteAuthor":"Paul Sweeney","quoteGenre":"patience","__v":0}]

RandomQuoteList randomQuoteListFromJson(String str) =>
    RandomQuoteList.fromJson(json.decode(str));

String randomQuoteListToJson(RandomQuoteList data) =>
    json.encode(data.toJson());

class RandomQuoteList {
  RandomQuoteList({
    int? statusCode,
    String? message,
    Pagination? pagination,
    int? totalQuotes,
    List<QuoteData>? data,
  }) {
    _statusCode = statusCode;
    _message = message;
    _pagination = pagination;
    _totalQuotes = totalQuotes;
    _data = data;
  }

  RandomQuoteList.fromJson(Map<String,dynamic> json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    _totalQuotes = json['totalQuotes'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(QuoteData.fromJson(v));
      });
    }
  }

  int? _statusCode;
  String? _message;
  Pagination? _pagination;
  int? _totalQuotes;
  List<QuoteData>? _data;

  int? get statusCode => _statusCode;

  String? get message => _message;

  Pagination? get pagination => _pagination;

  int? get totalQuotes => _totalQuotes;

  List<QuoteData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    map['totalQuotes'] = _totalQuotes;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "5eb17aafb69dc744b4e76efc"
/// quoteText : "Carry out the republican principle of universal suffrage, or strike it from your banners and substitute 'Freedom and Power to one half of society, and Submission and Slavery to the other.'"
/// quoteAuthor : "Ernestine Rose"
/// quoteGenre : "freedom"
/// __v : 0

QuoteData dataFromJson(String str) => QuoteData.fromJson(json.decode(str));

String dataToJson(QuoteData data) => json.encode(data.toJson());

class QuoteData {
  QuoteData({
    String? id,
    String? quoteText,
    String? quoteAuthor,
    String? quoteGenre,
    int? v,
  }) {
    _id = id;
    _quoteText = quoteText;
    _quoteAuthor = quoteAuthor;
    _quoteGenre = quoteGenre;
    _v = v;
  }

  QuoteData.fromJson(dynamic json) {
    _id = json['_id'];
    _quoteText = json['quoteText'];
    _quoteAuthor = json['quoteAuthor'];
    _quoteGenre = json['quoteGenre'];
    _v = json['__v'];
  }

  String? _id;
  String? _quoteText;
  String? _quoteAuthor;
  String? _quoteGenre;
  int? _v;

  String? get id => _id;

  String? get quoteText => _quoteText;

  String? get quoteAuthor => _quoteAuthor;

  String? get quoteGenre => _quoteGenre;

  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['quoteText'] = _quoteText;
    map['quoteAuthor'] = _quoteAuthor;
    map['quoteGenre'] = _quoteGenre;
    map['__v'] = _v;
    return map;
  }
}

/// currentPage : 1
/// nextPage : 2
/// totalPages : 2

Pagination paginationFromJson(String str) =>
    Pagination.fromJson(json.decode(str));

String paginationToJson(Pagination data) => json.encode(data.toJson());

class Pagination {
  Pagination({
    int? currentPage,
    int? nextPage,
    int? totalPages,
  }) {
    _currentPage = currentPage;
    _nextPage = nextPage;
    _totalPages = totalPages;
  }

  Pagination.fromJson(dynamic json) {
    _currentPage = json['currentPage'];
    _nextPage = json['nextPage'];
    _totalPages = json['totalPages'];
  }

  int? _currentPage;
  int? _nextPage;
  int? _totalPages;

  int? get currentPage => _currentPage;

  int? get nextPage => _nextPage;

  int? get totalPages => _totalPages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = _currentPage;
    map['nextPage'] = _nextPage;
    map['totalPages'] = _totalPages;
    return map;
  }
}
