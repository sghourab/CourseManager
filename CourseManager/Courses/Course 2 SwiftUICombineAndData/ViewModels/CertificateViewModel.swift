//
//  CertificateViewModel.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-25.
//

import Firebase
import Foundation

final class CertificateViewModel: ObservableObject {
    @Published var certificates: [Certificate] = []
    
    init() {
        fetchCertificates()
    }

    private func fetchCertificates() {
        Repository.certificateCollection.getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting certifcate documents: \(error)")
            } else {
                if let querySnapshot = querySnapshot {
                    for document in querySnapshot.documents {
                        let data = document.data()
                        
                        let id = data["id"] as? String ?? ""
                        let course = data["course"] as? String ?? ""
                        let dateValue = (data["date"] as AnyObject).dateValue()
                        let date = dateValue.formatDate()
                        let logo = data["logo"] as? String ?? ""
                        let instructor = data["instructor"] as? String ?? ""
                        
                        let certificate = Certificate(id: id, course: course, date: date, logo: logo, instructor: instructor)
                        
                        self.certificates.append(certificate)
                    }
                }
            }
        }
    }
}
