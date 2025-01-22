//
//  CoursesView.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 22/07/1446 AH.
//

import SwiftUI

struct CoursesView: View {
    @StateObject private var viewModel = CoursesViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                        Button("Retry") {
                            viewModel.fetchCourses()
                        }
                        .padding()
                    }
                } else {
                    List(viewModel.records, id: \.id) { record in
                        NavigationLink(destination: CourseDetailView(record: record)) {
                            VStack(alignment: .leading) {
                                Text(record.fields.title)
                                    .font(.headline)
                                Text(record.fields.locationName)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetchCourses()
            }
        }
    }
}

struct CourseDetailView: View {
    let record: Record

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(record.fields.title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Location: \(record.fields.locationName)")
                .font(.subheadline)

            Text("Level: \(record.fields.level.rawValue.capitalized)")
                .font(.subheadline)

            Text("Start Date: \(Date(timeIntervalSince1970: record.fields.startDate))")
                .font(.subheadline)

            Text("End Date: \(Date(timeIntervalSince1970: record.fields.endDate))")
                .font(.subheadline)

            Text(record.fields.description)
                .font(.body)

            Spacer()
        }
        .padding()
        .navigationTitle(record.fields.title)
    }
}

#Preview {
    CoursesView()
}
