//
//  FirebaseRepository.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-10.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class Repository: ObservableObject {
    static let db = Firestore.firestore()
    static let courseCollection = db.collection("courses")
    static let certificateCollection = db.collection("certificates")
}
