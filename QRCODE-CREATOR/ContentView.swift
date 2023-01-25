//
//  ContentView.swift
//  QRCODE-CREATOR
//
//  Created by Furkan on 24.01.2023.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    @State private var text = "furkan"
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var screenSize = UIScreen.main.bounds
    var body: some View {
        VStack {
            Text("QR CODE CREATOR").bold().font(.largeTitle)
            HStack{Spacer()}
            Spacer()
            
            
               generateQRCode(from: text)
                .resizable()
                .interpolation(.none)
               .scaledToFit()
               .frame(width: screenSize.width,height: screenSize.height / 2)
            
            ShareLink(item:generateQRCode(from: text),preview:SharePreview(text, image: generateQRCode(from: text))).foregroundColor(.primary)
        
            Spacer()
            CustomField(text: $text)
            Spacer()

           
            
        }
        .padding()
    }
    func generateQRCode(from string: String) -> Image {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return Image(uiImage: UIImage(cgImage: cgimg))
            }
        }

        return Image(uiImage: UIImage(systemName: "qrcode") ?? UIImage())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
