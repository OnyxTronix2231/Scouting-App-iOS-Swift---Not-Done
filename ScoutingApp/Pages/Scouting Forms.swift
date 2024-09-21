//
//  Scouting.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 8/15/24.
//

import SwiftUI
struct Scouting_Forms: View {
    @Binding var path : NavigationPath
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            VStack {
                NavigationLink(value: "NewManualForm") {
                    Text("New Manual Form")
                }
                //        NavigationLink(destination: Form_Modular_(fields: )) {
                //            Text("New Modular Form").padding(.vertical, 20)
                //        }
                HStack{
                    Image(systemName: "book.pages.fill")
                    Text("Scouting Forms")
                        .font(.custom("SF Pro", size: 30)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                Text("Next Matches:").cornerRadius(10).frame(maxWidth: .infinity, alignment: .leading).font(.custom("SF Pro", size: 25)).fontWeight(.bold).padding(30)
                
                Text("Recent Forms:").cornerRadius(10).frame(maxWidth: .infinity, alignment: .leading).font(.custom("SF Pro", size: 25)).fontWeight(.bold).padding(30)
                Spacer()
                Button("Reset All Forms") {
                    UserDefaults.standard.set(nil, forKey: "filledForms")
                }
                List {
                    let decoded = try? JSONDecoder().decode(Array<FormDefaultTemplate>.self, from: UserDefaults.standard.object(forKey: "filledForms") as? Data ?? Data())
                    ForEach(decoded ?? [FormDefaultTemplate](), id: \.self.matchDetails.matchNumber) { form in
                        FormHardCoded(isManual: true, path: $path, data: form)
                    }
                }
            }
        }
    }
}


#Preview {
    //    Scouting_Forms()
    Scouting_Forms(path: Binding<NavigationPath>.constant(NavigationPath()))
}
