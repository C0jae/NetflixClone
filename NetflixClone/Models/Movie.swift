//
//  Movie.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/05/14.
//

import Foundation

struct TrendingMoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}

/*
 {
adult = 0;
"backdrop_path" = "/9Ngw106BLlNJ4iVpRHlrDfaLpCV.jpg";
"genre_ids" =             (
 878,
 12,
 28
);
id = 406759;
"media_type" = movie;
"original_language" = en;
"original_title" = Moonfall;
overview = "A mysterious force knocks the moon from its orbit around Earth and sends it hurtling on a collision course with life as we know it.";
popularity = "2003.107";
"poster_path" = "/odVv1sqVs0KxBXiA8bhIBlPgalx.jpg";
"release_date" = "2022-02-03";
title = Moonfall;
video = 0;
"vote_average" = "6.5";
"vote_count" = 959;
}
 */
