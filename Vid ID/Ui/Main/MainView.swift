//
//  MainView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import SwiftUI
import AlamofireNetworkActivityLogger

struct MainView : View {
    
    @ObservedObject private var mViewModel = MainViewModel()
    
    @State private var mSearchQuery: String = ""
    
    var body: some View {
        
        VStack {
            
            // MARK: App Toolbar Title
            Text("app_name")
                .foregroundColor(ColorResource.TEXT_PRIMARY)
                .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_24))
            
            // MARK: Search Video
            HStack {
                
                Image(DrawableResource.IC_SEARCH)
                    .padding([.vertical, .trailing], DimenResource.SIZE_8)
                    .padding([.leading], DimenResource.SIZE_12)
                
                TextField("find_your_favorite_here", text: $mSearchQuery)
                    .foregroundColor(ColorResource.TEXT_PRIMARY)
                    .font(.custom(FontResource.POPPINS_REGULAR, size: DimenResource.SIZE_14))
                
            }
            .background(RoundedRectangle(
                cornerRadius: DimenResource.SIZE_10
            ).fill(ColorResource.DIVIDER_PRIMARY))
            .frame(height: DimenResource.SIZE_40, alignment: .center)
            .padding([.horizontal], DimenResource.SIZE_16)
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            NetworkActivityLogger.shared.level = .debug
            NetworkActivityLogger.shared.startLogging()
        }
        
    }
}

struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
