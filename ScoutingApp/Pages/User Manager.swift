//
//  User Manager.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 8/16/24.
//

import SwiftUI

struct User_Manager: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.3.fill")
                Text("User Manager")
                    .font(.custom("SF Pro", size: 30)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    User_Manager()
}
