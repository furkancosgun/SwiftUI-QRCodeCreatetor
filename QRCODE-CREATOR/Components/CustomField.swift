//
//  CustomField.swift
//  QRCODE-CREATOR
//
//  Created by Furkan on 24.01.2023.
//

import SwiftUI

struct CustomField: View {
    @Binding var text : String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "text.alignleft").padding(.trailing,10)
                TextField("Text..",text: $text)
            }
            Divider()
        }
    }
}


struct CustomField_Previews: PreviewProvider {
    static var previews: some View {
        CustomField(text: .constant("sda"))
    }
}
