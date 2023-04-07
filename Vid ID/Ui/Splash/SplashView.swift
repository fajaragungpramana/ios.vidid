//
//  SplashView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import SwiftUI

struct SplashView : View {
    var body: some View {
        
        VStack {
            Text("app_name")
                .foregroundColor(ColorResource.APP_PRIMARY)
                .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_32))
        }
        
    }
}

struct SplashView_Previews : PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
