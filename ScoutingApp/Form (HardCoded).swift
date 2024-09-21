//
//  Manual_Form.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 8/16/24.
//

import SwiftUI

struct FormHardCoded: View {
    
    //General Variables
    @State var paddingGrid : CGFloat = 150
    @State var isManual : Bool
    @State var formTemplate : String = "2024-off-season";
    @State var vari = false
    @Binding var path : NavigationPath
    
    
    @State var data : FormDefaultTemplate
    var body: some View {
        ScrollView{
            //Match Details
            Text("New Scouting Form")
                .font(.custom("SF Pro", size: 30)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom, 50)
            TextField("Team Number", text: $data.matchDetails.teamNumber).keyboardType(.numberPad).padding(.bottom, 20)
            if (isManual){
                HStack{
                    DatePicker("Date", selection: $data.matchDetails.date, displayedComponents: .date).padding(.bottom, 10)
                    Button("Now") {
                        data.matchDetails.date = Date()
                    }.padding(.bottom, 10).padding(.leading, 25)
                }.padding(.bottom, 20)
            }
            Picker("Match type", selection: $data.matchDetails.matchType) {
                ForEach(MatchDetails.matchTypes.allCases) {
                    matchtypes in Text(matchtypes.rawValue.replacingOccurrences(of: "M", with: " M").replacingOccurrences(of: "F", with: " F").capitalized)
                }
            }.padding(.bottom, 20)
            TextField("Match Number", text: $data.matchDetails.matchNumber).keyboardType(.numberPad).padding(.bottom, 20)
            //Auto
            Text("Autonomous").font(.custom("SF Pro", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom, 20)
            Text("Where did the robot start?").font(.custom("SF Pro", size: 20)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom, 10)
            Picker("Where did the robot start?", selection: $data.robotStartPosSelection) {
                ForEach (FormDefaultTemplate.robotStartPos.allCases) {
                    robotStartPos in Text(robotStartPos.rawValue.replacingOccurrences(of: "O", with: " O").replacingOccurrences(of: "S", with: " S").capitalized)
                }
            }.padding(.bottom, 20)
            HStack {
                Text("Did the robot try to collect from the middle line?").onTapGesture {
                    withAnimation(.easeInOut) {
                        data.tryToCollectFromMiddleLine.toggle()
                    }
                }.padding(.trailing, 20)
                Image(systemName: (data.tryToCollectFromMiddleLine ? "circle.inset.filled" : "circle")).foregroundColor(.blue).scaleEffect(1.5).onTapGesture {
                    withAnimation(.easeInOut) {
                        data.tryToCollectFromMiddleLine.toggle()
                    }
                }
            }.padding(.bottom, 20)
            Grid {
                GridRow{
                    Text("Speaker Scores").padding([.vertical, .trailing], 20).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    TextField("", text: $data.speakerScoresAuto).onChange(of: data.speakerScoresAuto) { if (Int(data.speakerScoresAuto) ?? 0 < 0) {
                        data.speakerScoresAuto = "0"
                    }
                    }
                    Image(systemName: "plus").foregroundColor(.blue).onTapGesture {
                        let speakerAuto : Int = Int(data.speakerScoresAuto) ?? 0
                        data.speakerScoresAuto = String(speakerAuto + 1)
                    }.padding(.trailing, 30)
                    Image(systemName: "minus").foregroundColor(.blue).onTapGesture {
                        let speakerAuto : Int = Int(data.speakerScoresAuto) ?? 0
                        data.speakerScoresAuto = String(speakerAuto - 1)
                    }.padding(.trailing, 20)
                }
                GridRow{
                    Text("AMP Scores").padding([.vertical, .trailing], 20).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    TextField("", text: $data.ampScoresAuto).onChange(of: data.ampScoresAuto) { if (Int(data.ampScoresAuto) ?? 0 < 0) {
                        data.ampScoresAuto = "0"
                    }
                    }
                    Image(systemName: "plus").foregroundColor(.blue).onTapGesture {
                        let ampAuto : Int = Int(data.ampScoresAuto) ?? 0
                        data.ampScoresAuto = String(ampAuto + 1)
                    }.padding(.trailing, 30)
                    Image(systemName: "minus").foregroundColor(.blue).onTapGesture {
                        let ampAuto : Int = Int(data.ampScoresAuto) ?? 0
                        data.ampScoresAuto = String(ampAuto - 1)
                    }.padding(.trailing, 20)
                }
            }.padding(.bottom, 20)
            //Tele-Op
            Text("Tele Operated").font(.custom("SF Pro", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom, 20)
            Grid {
                GridRow{
                    Text("Speaker Scores").padding([.vertical, .trailing], 20).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    TextField("", text: $data.speakerScoresTeleop).onChange(of: data.speakerScoresTeleop) { if (Int(data.speakerScoresTeleop) ?? 0 < 0) {
                        data.speakerScoresTeleop = "0"
                    }
                    }
                    Image(systemName: "plus").foregroundColor(.blue).onTapGesture {
                        let speakerTeleop : Int = Int(data.speakerScoresTeleop) ?? 0
                        data.speakerScoresTeleop = String(speakerTeleop + 1)
                    }.padding(.trailing, 30)
                    Image(systemName: "minus").foregroundColor(.blue).onTapGesture {
                        let speakerTeleop : Int = Int(data.speakerScoresTeleop) ?? 0
                        data.speakerScoresTeleop = String(speakerTeleop - 1)
                    }.padding(.trailing, 20)
                }
                GridRow{
                    Text("AMP Scores").padding([.vertical, .trailing], 20).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    TextField("", text: $data.ampScoresTeleop).onChange(of: data.ampScoresTeleop) { if (Int(data.ampScoresTeleop) ?? 0 < 0) {
                        data.ampScoresTeleop = "0"
                    }
                    }
                    Image(systemName: "plus").foregroundColor(.blue).onTapGesture {
                        let ampTeleop : Int = Int(data.ampScoresTeleop) ?? 0
                        data.ampScoresTeleop = String(ampTeleop + 1)
                    }.padding(.trailing, 30)
                    Image(systemName: "minus").foregroundColor(.blue).onTapGesture {
                        let ampTeleop : Int = Int(data.ampScoresTeleop) ?? 0
                        data.ampScoresTeleop = String(ampTeleop - 1)
                    }.padding(.trailing, 20)
                }
                GridRow{
                    Text("Delivery").padding([.vertical, .trailing], 20).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    TextField("", text: $data.deliveriesTeleop).onChange(of: data.deliveriesTeleop) { if (Int(data.deliveriesTeleop) ?? 0 < 0) {
                        data.deliveriesTeleop = "0"
                    }
                    }
                    Image(systemName: "plus").foregroundColor(.blue).onTapGesture {
                        let deliveryTeleop : Int = Int(data.deliveriesTeleop) ?? 0
                        data.deliveriesTeleop = String(deliveryTeleop + 1)
                    }.padding(.trailing, 30)
                    Image(systemName: "minus").foregroundColor(.blue).onTapGesture {
                        let deliveryTeleop : Int = Int(data.deliveriesTeleop) ?? 0
                        data.deliveriesTeleop = String(deliveryTeleop - 1)
                    }.padding(.trailing, 20)
                }
            }.padding(.bottom, 20)
            Text("Where can the robot shoot from?").padding(.bottom, 20)
            Grid {
                GridRow {
                    Text("Speaker")
                        .padding(.trailing, 100)
                    Image(systemName: (data.shootFromPos["Speaker"] ?? false ? "circle.inset.filled" : "circle")).foregroundColor(.blue).scaleEffect(1.5)
                }.padding(.bottom, 30).onTapGesture {
                    withAnimation(.easeInOut) {
                        data.shootFromPos["Speaker"]?.toggle()
                    }
                }
                GridRow {
                    Text("Spike Mark")
                        .padding(.trailing, 100)
                    Image(systemName: (data.shootFromPos["Spike Mark"] ?? false ? "circle.inset.filled" : "circle")).foregroundColor(.blue).scaleEffect(1.5)
                }.padding(.bottom, 30).onTapGesture {
                    withAnimation(.easeInOut) {
                        data.shootFromPos["Spike Mark"]?.toggle()
                    }
                }
                GridRow {
                    Text("Wing")
                        .padding(.trailing, 100)
                    Image(systemName: (data.shootFromPos["Wing"] ?? false ? "circle.inset.filled" : "circle")).foregroundColor(.blue).scaleEffect(1.5)
                }.padding(.bottom, 30).onTapGesture {
                    withAnimation(.easeInOut) {
                        data.shootFromPos["Wing"]?.toggle()
                    }
                }
            }.padding(.bottom, 20)
            //End-Game
            Text("End Game").font(.custom("SF Pro", size: 25)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom, 20)
            HStack {
                Text("Did the robot climb?").padding(.trailing, 50)
                Image(systemName: (data.didRobotClimb ? "circle.inset.filled" : "circle")).foregroundColor(.blue).scaleEffect(1.5)
            }.onTapGesture {
                withAnimation(.easeInOut) {
                    data.didRobotClimb.toggle()
                }
            }
            Grid {
                GridRow{
                    Text("Trap Scores").padding([.vertical, .trailing], 20).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    TextField("", text: $data.trapScoresEndgame).onChange(of: data.trapScoresEndgame) { if (Int(data.trapScoresEndgame) ?? 0 < 0) {
                        data.trapScoresEndgame = "0"
                    }
                    }
                    Image(systemName: "plus").foregroundColor(.blue).onTapGesture {
                        let trapEndgame : Int = Int(data.trapScoresEndgame) ?? 0
                        data.trapScoresEndgame = String(trapEndgame + 1)
                    }.padding(.trailing, 30)
                    Image(systemName: "minus").foregroundColor(.blue).onTapGesture {
                        let trapEndgame : Int = Int(data.trapScoresEndgame) ?? 0
                        data.trapScoresEndgame = String(trapEndgame - 1)
                    }.padding(.trailing, 20)
                }
            }.padding(.bottom, 20)
            TextEditor(text: $data.notes).frame(width: 300, height: 50).border(Color("TitleColor"))
            Button("Submit Form") {
                Task {
                    let dataDoc : [String : Any] = [
                        "teamNumber" : Int(data.matchDetails.teamNumber) ?? 0,
                        "teamColorIsRed" : (data.matchDetails.teamColor == .red),
                        "date" : data.matchDetails.date,
                        "matchType" : data.matchDetails.matchType.rawValue.replacingOccurrences(of: "M", with: " M").replacingOccurrences(of: "F", with: " F").capitalized,
                        "matchNumber" : data.matchDetails.matchNumber,
                        "writer" : UserDefaults.standard.object(forKey: "username") as? String ?? "",
                        "notes" : data.notes,
                        "robotStartPos" : data.robotStartPosSelection.rawValue,
                        "diddleLineCollect" : data.tryToCollectFromMiddleLine,
                        "autoSpeaker" : data.speakerScoresAuto,
                        "autoAMP" : data.ampScoresAuto,
                        "teleopSpeaker" : data.speakerScoresTeleop,
                        "teleopAMP" : data.ampScoresTeleop,
                        "delivery" : data.deliveriesTeleop,
                        "shootFromPos" : data.shootFromPos,
                        "robotClimb" : data.didRobotClimb,
                        "trapEndGame" : data.trapScoresEndgame,
                    ]
                    print(dataDoc)
                    vari = await documents_funcs().upload(formData : dataDoc)
                    if (vari) {
                        print("Document uploaded successfully")
                        print(ContentView().path.count)
                        path.removeLast()
                        print(ContentView().path.count)
                    }
                }
            }.padding(.top, 20)
        }.padding(50).onChange(of: data)
        {
            print(data)
            if let filledForms = UserDefaults.standard.object(forKey: "filledForms") as? Data {
                if var decoded = try? JSONDecoder().decode([FormDefaultTemplate].self, from: filledForms) {
                    print(decoded)
                    if let updatedData = decoded.append(data) as? Encodable {
                        if let encoded = try? JSONEncoder().encode(updatedData) {
                            UserDefaults.standard.set(encoded, forKey: "filledForms")
                            print("Saved successfully")
                        }
                        else {
                            print("error ocurred while encoding filled forms")
                        }
                    }
                    else {
                        print("error ocurred while appending filled forms")
                    }
                }
                else {
                    print("error ocurred while decoding filled forms")
                }
            }
            else {
                var dataArray : [FormDefaultTemplate] = []
                dataArray.append(data)
                if let encoded = try? JSONEncoder().encode(data) {
                    UserDefaults.standard.set(encoded, forKey: "filledForms")
                    print("New filled forms created and saved successfully")
                }
                else {
                    print("error while encoding current filled forms")
                }
            }
        }
    }
}



#Preview {
//    FormHardCoded(isManual: true, matchDetails: MatchDetails(teamNumber: "", teamColor: .blue, date: Date(), matchNumber: ""))
    FormHardCoded(isManual: true, path: Binding<NavigationPath>.constant(NavigationPath()), data: FormDefaultTemplate(matchDetails: MatchDetails(teamNumber: "", teamColor: .blue, date: Date(), matchNumber: "")))
}
