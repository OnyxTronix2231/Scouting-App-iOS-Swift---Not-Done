//
//  ContentView.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 8/13/24.
//

import SwiftUI
import Network

enum isSignedIn {
    case Y, N
}

struct ContentView: View {
    @State var isSignedIn : isSignedIn = .N;
    @State var currentUser : UserModel = UserModel()
    @State var password : String = ""
    @State var filledForms: [FormDefaultTemplate] = []
    @State var path : NavigationPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            ZStack {
                Color("BackgroundColor").ignoresSafeArea(.all)
                VStack {
                    switch isSignedIn {
                    case .Y:
                        Button("Logout") {
                            if (currentUser.logout()) {
                                isSignedIn = .N
                            }
                        }.padding([.top, .horizontal], 50).padding(.bottom, 30).transition(.slide)
                        Text("Welcome " + currentUser.username)
                            .font(.custom("SF Pro", size: 30)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).transition(.slide)
                        NavigationLink(value: "ScoutingForms") {
                            Image(systemName: "book.pages")
                            Text("Scouting Forms")
                        }.navigationDestination(for: String.self) { val in
                            if (val == "ScoutingForms"){
                                Scouting_Forms(path: $path)
                            }
                            else if (val == "NewManualForm"){
                                FormHardCoded(isManual: true, path: $path, data: FormDefaultTemplate(matchDetails: MatchDetails(teamNumber: "", teamColor: .blue, date: Date(), matchNumber: "")))
                            }
                        }.transition(.slide).font(.custom("SF Pro", size: 20)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.vertical, 20)
                        NavigationLink(destination: User_Manager()) {
                            Image(systemName: "person.3")
                            Text("User Manager")
                        }.transition(.slide).font(.custom("SF Pro", size: 20)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.vertical, 20)
                        
                    case .N:
                        Text("Welcome Guest")
                            .font(.custom("SF Pro", size: 40)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.top, 80)
                        Text("Please sign in to continue").font(.custom("SF Pro", size: 20)).fontWeight(.light).padding(.bottom, 50)
                        TextField("Username: ", text: $currentUser.username).autocorrectionDisabled().foregroundColor(Color("TitleColor")).font(.custom("SF Pro", size: 20)).padding(.horizontal, 50).padding(.bottom, 20)
                        TextField("Password: ", text: $password).autocorrectionDisabled().foregroundColor(Color("TitleColor")).font(.custom("SF Pro", size: 20)).padding([.bottom, .leading, .trailing], 50)
                        Button("Sign In") {
                            Task {
                                if (await currentUser.signInWithEmailAndPassword(password: password)){
                                    print(currentUser.username)
                                    withAnimation (.easeInOut) {
                                        isSignedIn = .Y
                                    }
                                }
                            }
                        }.padding(.bottom, 20)
                    }
                    Spacer()
                    Image("Logo").resizable().padding(20).aspectRatio(contentMode: .fit)
                }
            }.onAppear(perform: {
                if (UserDefaults.standard.object(forKey: "username") as? String ?? "" != ""){
                    currentUser.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
                    let monitor = NWPathMonitor()
                    monitor.pathUpdateHandler = { path in
                        if path.status == .satisfied {
                            DispatchQueue.main.async {
                                print("Online")
                                Task {
                                    if (await currentUser.offlineSignIn(password: UserDefaults.standard.object(forKey: "password") as? String ?? "")){
                                        print(currentUser.username)
                                        withAnimation (.easeInOut) {
                                            isSignedIn = .Y
                                        }
                                    }
                                }
                            }
                        }
                        else {
                            DispatchQueue.main.async {
                                print("Offline")
                                Task {
                                    if (await currentUser.offlineSignIn(password: UserDefaults.standard.object(forKey: "password") as? String ?? "")){
                                        print(currentUser.username)
                                        withAnimation (.easeInOut) {
                                            isSignedIn = .Y
                                        }
                                    }
                                }
                            }
                        }
                    }
                    let queue = DispatchQueue(label: "Network")
                    monitor.start(queue: queue)
                }
            })
        }
    }
}



#Preview {
    ContentView()
}
