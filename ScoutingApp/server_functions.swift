//
//  server_functions.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 9/17/24.
//

import Foundation
import FirebaseFirestore

struct documents_funcs {
    func upload (formData : [String : Any]) async -> Bool {
        let db = Firestore.firestore()
        do {
            try await db.collection("filledForms").addDocument(data: formData)
            return true
        } catch {
            print("error")
            return false
        }
    }
}
