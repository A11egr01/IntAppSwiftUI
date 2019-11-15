//
//  Login.swift
//  EdjoinInterview
//
//  Created by Alexander Sosnov on 11/14/19.
//  Copyright © 2019 Alexander Sosnov. All rights reserved.
//

import SwiftUI

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    @Binding var show: Bool
    @State private var showOverview = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.2456268668, green: 0.5129396915, blue: 0.7682726383, alpha: 1))
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 0) {
                TopImage(show: $show)
//                .offset(y: showOverview ? 10 : 10)

                EmailView(show: $show, email: $email)

                Divider()
                PasswordView(show: $show, password: $password)
                
                LoginAndResetPassword(show: $show, showOverview: $showOverview)
            }
            .padding(.horizontal, isScreenTall ? 50 : 0)

            
            if showOverview {
                Overview()
                .opacity(showOverview ? 1 : 0)
                .offset(y: showOverview ? 0 : 20)
                .animation(Animation.easeInOut)
//                Text("You should follow me on Twitter: @twostraws")
//                    .font(.largeTitle)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)


    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(show: .constant(true))
    }
}

struct EmailView: View {
    @Binding var show: Bool
    @Binding var email: String

    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .frame(width: 16, height: 16)
                .foregroundColor(Color("loginicon"))
                .padding(.all)
                .background(Color("background"))
                .cornerRadius(16)
                .padding(12)
            TextField("Your email", text: $email)
                .frame(height: 72)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("buttonShadow2"), radius: 30, x: 0, y: 30)
        .padding(.horizontal, 16)
        .padding(.top, 30)
        .opacity(show ? 1 : 0)
        .offset(y: show ? 0 : 20)
        .animation(Animation.easeOut(duration: 0.6))
    }

}

struct PasswordView: View {
    @Binding var show: Bool
    @Binding var password: String
    var body: some View {
        HStack {
            Image(systemName: "lock.fill")
                .frame(width: 16, height: 16)
                .foregroundColor(Color("loginicon"))
                .padding(.all)
                .background(Color("background"))
                .cornerRadius(16)
                .padding(12)
            TextField("Password", text: $password)
                .frame(height: 72)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("buttonShadow2"), radius: 30, x: 0, y: 30)
        .padding(.horizontal, 16)
        .padding(.top, 30)
        .opacity(show ? 1 : 0)
        .offset(y: show ? 0 : 20)
        .animation(Animation.easeOut(duration: 0.6))
    }
}

struct LoginAndResetPassword: View {
    @Binding var show: Bool
    @Binding var showOverview: Bool

    var body: some View {
        HStack {
            Text("Forgot password?")
                .font(.subheadline)
                .underline()
                .padding(.leading, 12)
            
            Spacer()
            
            Button(action: {self.showOverview.toggle()}) {
                Text("Log in").foregroundColor(.white)
            }
            .padding(.horizontal, 36)
            .padding(.vertical, 12)
            .background(Color("background3"))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .padding(16)
        .opacity(show ? 1 : 0)
        .offset(y: show ? 0 : 20)
        .animation(Animation.easeOut(duration: 0.6))
    }
}

struct TopImage: View {
    @Binding var show: Bool
    var body: some View {
        Image("loginLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: isScreenTall ? 226 : 150)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .opacity(show ? 1 : 0)
            .offset(y: show ? 0 : 20)
            .animation(Animation.easeOut(duration: 0.6).delay(0.1))
    }
}
