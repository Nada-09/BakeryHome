////
////  CourseDetailView.swift
////  BakeryHome
////
////  Created by Nada Abdullah on 27/07/1446 AH.
////
//



//import SwiftUI
//import MapKit
//import Combine
//
//struct CourseDetailView: View {
//    var course: Record
//    
//    var body: some View {
//        NavigationView{
//            ScrollView{
//                
//                VStack (alignment: .leading, spacing: 16)  {
//                    
//                    AsyncImage(url: URL(string: course.fields.imageURL)) { image in
//                        image
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: UIScreen.main.bounds.width, height: 250)
//                            .clipped()
//                    } placeholder: {
//                        ProgressView()
//                            .frame(width: UIScreen.main.bounds.width, height: 250)
//                    }
//                    .padding(.horizontal, 16)
//                    
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("About the course:")
//                            .font(.system(size: 16, weight: .semibold, design: .rounded))
//                        
//                        Text(course.fields.description)
//                            .font(.system(size: 14, weight: .regular, design: .rounded))
//                    }
//                    .padding(.horizontal, 16)
//            
//                    
//                    Divider()
//                    
//                    
//                    HStack{
//                        Text("Chef:")
//                            .font(.system(size: 14, weight: .semibold, design: .rounded))
//                        Text(course.fields.chefID)
//                            .font(.system(size: 14, weight: .regular, design: .rounded))
//                    }
//                    
//                    HStack {
//                        Text("Level:")
//                            .font(.system(size: 14, weight: .semibold, design: .rounded))
//                        Text(course.fields.level.rawValue.capitalized)
//                            .font(.system(size: 14, weight: .regular, design: .rounded))
//                            .foregroundColor(.white)
//                            .padding(.vertical, 4)
//                            .padding(.horizontal, 8)
//                            .background(RoundedRectangle(cornerRadius: 12)
//                                .fill(levelColor(for: course.fields.level)))
//                        
//                        
//                        Spacer()
//                        
//                        Text("Duration:")
//                            .font(.system(size: 14, weight: .semibold, design: .rounded))
//                        Text("\(Int((course.fields.endDate - course.fields.startDate) / 3600))h")
//                            .font(.system(size: 14, weight: .regular, design: .rounded))
//                    }
//                    
//                    HStack {
//                        Text("Date & time:")
//                            .font(.system(size: 14, weight: .semibold, design: .rounded))
//                        
//                        Text(formatDate(course.fields.startDate))
//                            .font(.system(size: 14, weight: .regular, design: .rounded))
//                        
//                        Spacer()
//                        
//                        Text("Location:")
//                            .font(.system(size: 14, weight: .semibold, design: .rounded))
//                        Text(course.fields.locationName)
//                            .font(.system(size: 14, weight: .regular, design: .rounded))
//                    }
//                }
//                .padding(.horizontal, 16)
//                
//                MapView(course: course)
//                
//                
//                Button(action: {
//                    
//                }) {
//                    Text("Book a Space")
//                        .font(.system(size: 17, weight: .semibold))
//                        .foregroundColor(.white)
//                        .frame(width: 365, height: 48)
//                        .background(Color.qolange)
//                        .cornerRadius(12)
//                }
//            }
//                
//                .navigationTitle("Course Details")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button (action: {
//                            
//                        }) {
//                            HStack {
//                                Image(systemImage: "Chevron.left")
//                                    .foregroundColor(.cream)
//                            }
//                        }
//                    }
//                }
//                
//                
//            }
//        }
//        
//    }
//    
//    private func formatDate(_ timestamp: Int) -> String {
//        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
//        let Formatter = DateFormatter()
//        Formatter.dateFormat = "dd MMM - h:MM a"
//        return Formatter.string(from: date)
//    }
//        
//    
//    private func levelColor(for level: Level) -> Color {
//        switch level {
//        case .beginner:
//            return Color.brownn
//            
//        case .advance:
//            return Color.qolange
//            
//        case .intermediate:
//            return Color.cream
//        }
//    }


import SwiftUI
import MapKit

struct CourseDetailView: View {
    var course: Record
    
    // تقسيم العرض إلى أقسام لتخفيف العبء على المترجم
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    courseImage
                    courseDetails
                    Divider()
                    courseAdditionalInfo
                    courseLocation
                    MapView(latitude: course.fields.locationLatitude, longitude: course.fields.locationLongitude)
                    bookingButton
                }
                .navigationTitle("Course Details")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        backButton
                    }
                }
            }
        }
    }
    
    // MARK: - Components
    
    // صورة الدورة
    private var courseImage: some View {
        AsyncImage(url: URL(string: course.fields.imageURL)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 250)
                .clipped()
        } placeholder: {
            ProgressView()
                .frame(width: UIScreen.main.bounds.width, height: 250)
        }
    }
    
    // تفاصيل الدورة
    private var courseDetails: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("About the course:")
                .font(.system(size: 16, weight: .semibold, design: .rounded))
            Text(course.fields.description)
                .font(.system(size: 14, weight: .regular, design: .rounded))
        }
        .padding()
    }
        
    
    // معلومات إضافية عن الدورة
    private var courseAdditionalInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Chef:")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                Text(course.fields.chefID)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
            }
            .padding(.horizontal)
            HStack {
                Text("Level:")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                Text(course.fields.level.rawValue.capitalized)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(RoundedRectangle(cornerRadius: 12).fill(levelColor(for: course.fields.level)))
                
                Spacer()
                
                Text("Duration:")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                Text("\(Int((course.fields.endDate - course.fields.startDate) / 3600))h")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
            }
            .padding(.horizontal)
        }
    }
    
    // عرض الموقع والتاريخ
    private var courseLocation: some View {
        HStack {
            Text("Date & time:")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
            Text(formatDate(course.fields.startDate))
                .font(.system(size: 14, weight: .regular, design: .rounded))
            
            Spacer()
            
            Text("Location:")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
            Text(course.fields.locationName)
                .font(.system(size: 14, weight: .regular, design: .rounded))
        }
        .padding(.horizontal)
    }
    
    // زر العودة
    private var backButton: some View {
        Button(action: {
            // Action عند العودة
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.qolange)
        }
    }
    
    // زر الحجز
    private var bookingButton: some View {
        Button(action: {
            // Action عند الضغط
        }) {
            Text("Book a Space")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: 365, height: 48)
                .background(Color.qolange)
                .cornerRadius(12)
        }
        
    }
    
    // MARK: - Helper Functions
    
    private func formatDate(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM - h:mm a"
        return formatter.string(from: date)
    }
    
    private func levelColor(for level: Level) -> Color {
        switch level {
        case .beginner: return Color.green
        case .intermediate: return Color.orange
        case .advance: return Color.red
        }
    }
}


#Preview {
    CourseDetailView(course: Record(
        id: "rec1DauP3kw5Q76oo",
        createdTime: .the20250107T224048000Z,
        fields: Fields(
            locationLongitude: -91.55456,
            locationName: "Ferriday",
            locationLatitude: 31.63017,
            title: "Banana bread",
            imageURL: "https://i.imgur.com/w2CXHgV.png",
            level: .intermediate,
            endDate: 1734036000,
            id: "8CC4D2BB-B7CF-4048-8694-8FEB72B22D29",
            chefID: "8FD82BB4-EEBC-40E2-A627-B379CFB4DFC1",
            description: "Create a simple and delicious banana bread recipe in a hands-on session.",
            startDate: 1734028800
        )
    ))
}
