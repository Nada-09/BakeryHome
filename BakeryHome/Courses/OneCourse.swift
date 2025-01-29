//
//  OneCourse.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 22/07/1446 AH.
//

import SwiftUI

struct OneCourse: View {
    var course: CourseRecord
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 5, x: 0, y: 2)
                .frame(width: 365, height: 100)
            
            HStack(spacing: 15) {
                AsyncImage(url: URL(string: course.fields.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .cornerRadius(8)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(course.fields.title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Text(course.fields.level.rawValue.capitalized)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(RoundedRectangle(cornerRadius: 12)
                        .fill(levelColor(for: course.fields.level))
                        )
                    
                    HStack(spacing: 5) {
                        Image(systemName: "hourglass")
                            .foregroundColor(.brownn)
                            .font(.system(size: 12, weight: .medium))
                        
                        Text("\(Int((course.fields.endDate - course.fields.startDate) / 3600))h")
                            .font(.system(size: 11, weight: .medium))
                    }
                    
                    HStack(spacing: 5) {
                        Image(systemName: "calendar")
                            .foregroundColor(.brownn)
                            .font(.system(size: 12, weight: .medium))
                        
                        Text(formatDate(course.fields.startDate))
                            .font(.system(size: 11, weight: .medium))
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 8)
        }
        .padding(.vertical, -3)
    }
    
    private func formatDate(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM - h:mm a"
        return formatter.string(from: date)
    }
    
    private func levelColor(for level: Level) -> Color {
        switch level {
        case .beginner:
            return Color.brownn
            
        case .advance:
            return Color.qolange
            
        case .intermediate:
            return Color.cream
        }
    }
}

#Preview {
    OneCourse(course: CourseRecord(
        id: "rec1DauP3kw5Q76oo",
        createdTime: .the20250107T224048000Z,
        fields: CourseFields(
            locationLongitude: -91.55456,
            locationName: "Ferriday",
            locationLatitude: 31.63017,
            title: "Banana bread",
            imageURL: "https://i.imgur.com/w2CXHgV.png",
            level: .intermediate,
            endDate: 1734036000,
            id: "8CC4D2BB-B7CF-4048-8694-8FEB72B22D29",
            chefID: "8FD82BB4-EEBC-40E2-A627-B379CFB4DFC1",
            description: "Create a simple and delicious banana bread recipe in a hands-on session suitable for all ages.",
            startDate: 1734028800
        )
    ))
    .padding(.horizontal, 30)
}
