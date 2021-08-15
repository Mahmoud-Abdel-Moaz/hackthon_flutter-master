class Result {
    bool adult;
    String backdrop_path;
    List<int>? genre_ids;
    int id;
    String original_language;
    String original_title;
    String overview;
    double popularity;
    String poster_path;
    String release_date;
    String title;
    bool video;
    double vote_average;
    int vote_count;

    Result({required this.adult, required this.backdrop_path, required this.genre_ids, required this.original_language, required this.id, required this.original_title, required this.overview, required this.popularity, required this.poster_path, required this.release_date, required this.title, required this.video, required this.vote_average, required this.vote_count});

    factory Result.fromJson(Map<String, dynamic> json) {
        return Result(
            adult: json['adult'], 
            backdrop_path: json['backdrop_path'], 
            genre_ids: json['genre_ids'] != null ? new List<int>.from(json['genre_ids']) : null, 
            id: json['id'], 
            original_language: json['original_language'], 
            original_title: json['original_title'], 
            overview: json['overview'], 
            popularity: json['popularity'], 
            poster_path: json['poster_path'], 
            release_date: json['release_date'], 
            title: json['title'], 
            video: json['video'], 
            vote_average: json['vote_average'], 
            vote_count: json['vote_count'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['adult'] = this.adult;
        data['backdrop_path'] = this.backdrop_path;
        data['id'] = this.id;
        data['original_language'] = this.original_language;
        data['original_title'] = this.original_title;
        data['overview'] = this.overview;
        data['popularity'] = this.popularity;
        data['poster_path'] = this.poster_path;
        data['release_date'] = this.release_date;
        data['title'] = this.title;
        data['video'] = this.video;
        data['vote_average'] = this.vote_average;
        data['vote_count'] = this.vote_count;
        if (this.genre_ids != null) {
            data['genre_ids'] = this.genre_ids;
        }
        return data;
    }
}