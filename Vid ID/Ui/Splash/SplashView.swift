//
//  SplashView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import SwiftUI

struct SplashView : View {
    
    // MARK: State
    @State private var mIsLoadingDone = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Text("app_name")
                    .foregroundColor(ColorResource.APP_PRIMARY)
                    .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_32))
            }
            .navigationDestination(isPresented: $mIsLoadingDone) {
                MainView()
            }
            
        }.onAppear {
            self.gotoMainView()
        }
        
    }
    
    private func gotoMainView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                self.mIsLoadingDone = true
            }
        }
    }
    
}

struct SplashView_Previews : PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
