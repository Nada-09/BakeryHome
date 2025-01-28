////
////  CourseDetailView.swift
////  BakeryHome
////
////  Created by Nada Abdullah on 27/07/1446 AH.
////
//
import SwiftUI
import MapKit
import Combine

struct CourseDetailView: View {
    var course: Record
    @State private var region: MKCoordinateRegion
    
    init(course: Record) {
        self.course = course
        self._region = State(initialValue: MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: course.fields.locationLatitude,
                        longitude: course.fields.locationLongitude
                    ),
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                ))
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack (alignment: .leading, spacing: 16)  {
                    
                    AsyncImage(url: URL(string: course.fields.imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 250) // ملء العرض
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: UIScreen.main.bounds.width, height: 250)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About the course:")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        
                        Text(course.fields.description)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                    }
                    .padding(.horizontal, 16)
                    
                    Divider()
                    
                    
                    HStack{
                        Text("Chef:")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                        Text(course.fields.chefID)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                    }
                    
                    HStack {
                        Text("Level:")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                        Text(course.fields.level.rawValue.capitalized)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(RoundedRectangle(cornerRadius: 12)
                                .fill(levelColor(for: course.fields.level)))
                        
                        
                        Spacer()
                        
                        Text("Duration:")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                        Text("\(Int((course.fields.endDate - course.fields.startDate) / 3600))h")
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                    }
                    
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
                }
                .padding(.horizontal, 16)
                
                
                Map(coordinateRegion: $region, interactionModes: .all)
                    .frame(width: 365,height: 150)
                    .cornerRadius(10)
                    .padding(.vertical)
                
                
                Button(action: {
                    
                }) {
                    Text("Book a Space")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 365, height: 48)
                        .background(Color.qolange)
                        .cornerRadius(12)
                }
            }
                
                .navigationTitle("Course Details")
                .navigationBarTitleDisplayMode(.inline)
                // back button
                
                
            }
        }
        
    }
    
    private func formatDate(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let Formatter = DateFormatter()
        Formatter.dateFormat = "dd MMM - h:MM a"
        return Formatter.string(from: date)
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
// }

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
