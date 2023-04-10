//
//  SearchView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 10/04/23.
//

import SwiftUI

struct SearchView : View {
    
    // MARK: Environment
    @Environment(\.presentationMode) private var mMode: Binding<PresentationMode>
    
    // MARK: State
    @State private var mSearchQuery: String = ""
    
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
                
                HStack {
                    
                    Image(DrawableResource.IC_SEARCH)
                        .padding([.vertical, .trailing], DimenResource.SIZE_8)
                        .padding(.leading, DimenResource.SIZE_12)
                    
                    TextField("find_your_favorite_here", text: $mSearchQuery)
                        .foregroundColor(ColorResource.TEXT_PRIMARY)
                        .font(.custom(FontResource.POPPINS_REGULAR, size: DimenResource.SIZE_14))
                    
                }
                .background(RoundedRectangle(
                    cornerRadius: DimenResource.SIZE_10
                ).fill(ColorResource.DIVIDER_PRIMARY))
                .frame(height: DimenResource.SIZE_40, alignment: .center)
                .padding(.trailing, DimenResource.SIZE_16)
                
            }
            
            ScrollView {
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SearchView_Previews : PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
