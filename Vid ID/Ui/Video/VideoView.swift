//
//  VideoView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 11/04/23.
//

import SwiftUI

struct VideoView : View {
    
    // MARK: Environment
    @Environment(\.presentationMode) private var mMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
            HStack {
                
                Button {
                    self.mMode.wrappedValue.dismiss()
                } label: {
                    Image(DrawableResource.IC_BACK_BLACK)
                        .renderingMode(.original)
                }
                .padding(.horizontal, DimenResource.SIZE_16)
                
                Spacer()
                
            }
            
            ScrollView {
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct VideoView_Previews : PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
