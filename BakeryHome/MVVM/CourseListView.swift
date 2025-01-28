//
//  CourseListView.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 26/07/1446 AH.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseViewModel()
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationView {
            List(viewModel.courses, id: \.id) { course in
                OneCourse(course: course)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Courses")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchTerm, prompt: "Search")
        
            .onAppear {
                viewModel.fetchCourses()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    CourseListView()
}

