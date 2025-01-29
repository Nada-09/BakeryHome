////
////  MapView.swift
////  BakeryHome
////
////  Created by Nada Abdullah on 29/07/1446 AH.
////
//


//
//  MapView.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 29/07/1446 AH.
//

import SwiftUI
import MapKit

struct MapView: View {
    let latitude: Double
    let longitude: Double
    
    @State private var region: MKCoordinateRegion
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        self._region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all)
            .frame(width: 365, height: 150)
            .cornerRadius(12)
            .padding(.vertical)
    }
}

#Preview {
    MapView(latitude: 31.63017, longitude: -91.55456)
}



//import SwiftUI
//import MapKit
//
//struct MapView: View {
//    @State private var region: MKCoordinateRegion
//
//    init(course: Record) {
//        self._region = State(initialValue: MKCoordinateRegion(
//            center: CLLocationCoordinate2D(
//                latitude: course.fields.locationLatitude,
//                longitude: course.fields.locationLongitude
//            ),
//            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//        ))
//    }
//
//    var body: some View {
//        Map(coordinateRegion: $region, interactionModes: .all)
//            .frame(width: 365, height: 150)
//            .cornerRadius(10)
//            .padding(.vertical)
//    }
//}
//
//#Preview {
//    let sampleCourse = Record(
//        id: "sample",
//        createdTime: .the20250107T224048000Z,
//        fields: Fields(
//            locationLongitude: -91.55456,
//            locationName: "Ferriday",
//            locationLatitude: 31.63017,
//            title: "Sample Course",
//            imageURL: "https://via.placeholder.com/150",
//            level: .beginner,
//            endDate: 1734036000,
//            id: "sample-id",
//            chefID: "chef-id",
//            description: "Sample Description",
//            startDate: 1734028800
//        )
//    )
//    return MapView(course: sampleCourse)
//}
