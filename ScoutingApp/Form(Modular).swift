//
//  Form(Modular).swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 8/26/24.
//

import SwiftUI

struct Form_Modular_: View {
    @State var Fields : Fields = JSONDecoding().getJSON()
    var body: some View {
        VStack {
            ForEach (0..<$Fields.elements.count, id: \.self) { i in
                HStack {
                    if (Fields.elements[i]["elementKind"] == "title") {
                        Text(Fields.elements[i]["elementValue"]!).font(.custom("SF Pro", size: 20)).fontWeight(.bold).padding(.bottom, 20)
                    }
                    else if (Fields.elements[i]["elementKind"] == "multi-choice") {
                        Picker(Fields.elements[i]["elementName"]!, selection: $Fields.elements[i]["elementValue"]) {
                            ForEach (JSONDecoding().getArray(stringArray: Fields.elements[i]["elementOptions"]!), id: \.self) {
                                elementOption in Text(elementOption)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Form_Modular_()
}
