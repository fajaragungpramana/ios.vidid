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
    
    var body: some View {
        
        VStack {
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            NetworkActivityLogger.shared.level = .debug
            NetworkActivityLogger.shared.startLogging()
            
            self.mViewModel.getListTrending(request: TrendingRequest(
                mediaType: .ALL,
                timeWindow: .WEEK)
            )
        }
        
    }
}

struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
