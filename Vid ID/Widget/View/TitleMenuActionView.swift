//
//  TitleMenuActionView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 08/04/23.
//

import SwiftUI

struct TitleMenuActionView : View {
    
    var title: LocalizedStringKey
    var onClickActionListener: () -> ()
    
    var body: some View {
        
        HStack {
            
            Text(self.title)
                .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_20))
            
            Spacer()
            
            Button {
                self.onClickActionListener()
            } label: {
                
                Text("see_all")
                    .foregroundColor(ColorResource.APP_PRIMARY)
                    .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_12))
                
            }
            
        }
        .frame(width: .infinity)
        .padding(.horizontal, DimenResource.SIZE_16)
        
    }
}
