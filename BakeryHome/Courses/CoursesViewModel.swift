//
//  BakeryModel.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 19/07/1446 AH.
//

import Foundation
import Combine

class CourseViewModel: ObservableObject {
    @Published var courses: [CourseRecord] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let token = "Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001"
    
    // الدالة التي تتعامل مع البيانات الجديدة
    func fetchCourses() {
        guard let url = URL(string: "https://api.airtable.com/v0/appXMW3ZsAddTpClm/course") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "Authorization")
        
        isLoading = true
        errorMessage = nil
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: CourseWelcome.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] welcome in
                // معالجة البيانات الجديدة من الحقول
                self?.courses = welcome.records.map { record in
                    let updatedRecord = record
                    // إضافة عملية تحضير البيانات إذا لزم الأمر (مثل تحويل التاريخ)
                    // يمكنك استخدام `fields` الجديدة كما تشاء مثل: `fields.level`, `fields.locationName`
                    return updatedRecord
                }
            }
            .store(in: &cancellables)
    }
}
