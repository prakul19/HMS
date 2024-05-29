//
//  PageModel.swift
//  LogInPage
//
//  Created by prakul agarwal on 27/05/24.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "", imageUrl: "work", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Welcome to Hosp Connect", description: "Transforming Healthcare with Our Hospital Management System", imageUrl: "cowork", tag: 0),
        Page(name: "Meet new people!", description: "The perfect place to meet new people so you can meet new people!", imageUrl: "work", tag: 1),
        Page(name: "Edit your face", description: "Don't like your face? Well then edit your face with our edit-face tool!", imageUrl: "website", tag: 2),
    ]
}
