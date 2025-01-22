//
//  BakeryModel.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 19/07/1446 AH.
//

import Foundation

class BakeryHomeVM: ObservableObject {
    @Published var courses: [Course] = [
        Course(name: "Babka Dough", difficulty: "Beginner", duration: "2h", dateTime: "19 Feb - 4:00 pm", imageName: "babka")
    ]
    @Published var popularCourses: [Course] = []
    
}
