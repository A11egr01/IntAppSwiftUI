//
//  ModalView.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 7/5/19.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct ModalView : View {
    var body: some View {
        ZStack {
            BlurView(style: .systemMaterial)
            LottieView(filename: "8569-file-save")
        }
        .frame(width: 360, height: 360)
        .cornerRadius(30)
        .shadow(radius: 30)
    }
}

#if DEBUG
struct ModalView_Previews : PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
#endif
