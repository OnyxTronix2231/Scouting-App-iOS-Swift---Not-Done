//
//  FormAdmin.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 8/17/24.
//

import SwiftUI

struct FormAdmin: View {
    @State var paddingGrid : CGFloat = 150
    
    @State var matchDetails : MatchDetails
    @State var matchTypes : [String] = ["Qualification Match", "Qualification Final", "Semi Final", "Final"]
    @State var autoScoresPos : [Int : Bool] = [
        
        1 : false,
        2 : false,
        3 : false,
        4 : false,
        5 : false,
        6 : false,
        7 : false,
        8 : false,
        
    ]
    var body: some View {
        VStack{
            Grid {
                GridRow {
                    Image(systemName: (autoScoresPos[8] ?? false ? "8.circle.fill" : "8.circle")).foregroundColor(.orange).scaleEffect(1.5).onTapGesture {
                        withAnimation(.easeInOut) {
                            autoScoresPos[8]?.toggle()
                        }
                    }
                }.padding(.bottom, 20).padding(.trailing, paddingGrid)
                GridRow{
                    Image(systemName: (autoScoresPos[7] ?? false ? "7.circle.fill" : "7.circle")).foregroundColor(.orange).scaleEffect(1.5).onTapGesture {
                        withAnimation(.easeInOut) {
                            autoScoresPos[7]?.toggle()
                        }
                    }
                }.padding(.bottom, 20).padding(.trailing, paddingGrid)
                GridRow{
                    Image(systemName: (autoScoresPos[6] ?? false ? "6.circle.fill" : "6.circle")).foregroundColor(.orange).scaleEffect(1.5).onTapGesture {
                        withAnimation(.easeInOut) {
                            autoScoresPos[6]?.toggle()
                        }
                    }.padding(.trailing, paddingGrid)
                    Image(systemName: (autoScoresPos[3] ?? false ? "3.circle.fill" : "3.circle")).foregroundColor(.orange).scaleEffect(1.5).onTapGesture {
                        withAnimation(.easeInOut) {
                            autoScoresPos[3]?.toggle()
                        }
                    }
                }.padding(.bottom, 20)
                GridRow{
                    Image(systemName: (autoScoresPos[5] ?? false ? "5.circle.fill" : "5.circle")).foregroundColor(.orange).scaleEffect(1.5).onTapGesture {
                        withAnimation(.easeInOut) {
                            autoScoresPos[5]?.toggle()
                        }
                    }.padding(.trailing, paddingGrid)
                    Image(systemName: (autoScoresPos[2] ?? false ? "2.circle.fill" : "2.circle")).foregroundColor(.orange).scaleEffect(1.5).onTapGesture {
                        withAnimation(.easeInOut) {
                            autoScoresPos[2]?.toggle()
                        }
                    }
                }.padding(.bottom, 20)
                GridRow{
                    Image(systemName: (autoScoresPos[4] ?? false ? "4.circle.fill" : "4.circle")).foregroundColor(.orange).scaleEffect(1.5).onTapGesture {
                        withAnimation(.easeInOut) {
                            autoScoresPos[4]?.toggle()
                        }
                    }.padding(.trailing, paddingGrid)
                    Image(systemName: (autoScoresPos[1] ?? false ? "1.circle.fill" : "1.circle")).foregroundColor(.orange).scaleEffect(1.5).onTapGesture {
                        withAnimation(.easeInOut) {
                            autoScoresPos[1]?.toggle()
                        }
                    }
                }.padding(.bottom, 20)
            }
        }
        
    //Driver 1-10
        //Defenese 1-10
        //was defended?
        //Foul Amount
    }
}

#Preview {
    FormAdmin(matchDetails: MatchDetails(teamNumber: "", teamColor: .blue, date: Date(), matchNumber: ""))
}
