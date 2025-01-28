//////
//////  CoursesView.swift
//////  BakeryHome
//////
//////  Created by Nada Abdullah on 22/07/1446 AH.
//////
////
///
///
//import SwiftUI
//
//struct CoursesView: View {
//    @StateObject private var viewModel = CourseViewModel()
//
//    var body: some View {
//        NavigationView {
//            List(viewModel.courses) { course in
//                VStack(alignment: .leading) {
//                    Text(course.title)
//                        .font(.headline)
//                    Text(course.level.capitalized)
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//            }
//            .navigationTitle("Courses")
//            .task {
//                await viewModel.fetchCourses()
//            }
//            .overlay {
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                } else if let error = viewModel.errorMessage {
//                    Text(error).foregroundColor(.red)
//                }
//            }
//        }
//    }
//}
//
//
//#Preview {
//    CoursesView()
//}
