//
//  DummyDataUtils.swift
//  TestForApi
//
//  Created by Habibur Rahman on 4/7/24.
//

import Foundation

struct DummyDataUtils {
    
    static let dummyGenra_Action = Genre(id: 1 , name: "Action")
    static let dummyGenra_Comedy = Genre(id: 2 , name: "Comedy")
    static let dummyGenra_Thriller = Genre(id: 3 , name: "Thriller")
    
    static let dummyZenraList = [dummyGenra_Action,dummyGenra_Comedy,dummyGenra_Thriller]
    
    static let dummyMovieData01 = MovieApiModel(genres : dummyZenraList, originalTitle: "Movie 1", overview: "This is overview 1", posterPath: "/wNAhuOZ3Zf84jCIlrcI6JhgmY5q.jpg",title: "Furiosa: A Mad Max Saga")

    static let dummyMovieData02 = MovieApiModel(genres : dummyZenraList, originalTitle: "Movie 2", overview: "overview 2" , posterPath: "/xg27NrXi7VXCGUr7MG75UqLl6Vg.jpg",title: "Inside Out 2")
    
    static let movieList = [dummyMovieData01, dummyMovieData02, dummyMovieData01, dummyMovieData02]
    
}

struct DummyCastData {
    
    static let dummyCastData1 = Cast(gender: 1, name: "Anya Taylor-Joy", profilePath: "/jxAbDJWvz4p1hoFpJYG5vY2dQmq.jpg", character: "Furiosa")
    
    static let dummyCastData2 = Cast(gender: 2, name: "Chris Hemsworth", profilePath: "/xkHHiJXraaMFXgRYspN6KVrFn17.jpg", character: "Dementus")
    
    static let castList  = [dummyCastData1, dummyCastData2, dummyCastData1, dummyCastData2]
    
}



