//
//  CardDetail.swift
//  EdjoinInterview
//
//  Created by Alexander Sosnov on 11/15/19.
//  Copyright © 2019 Alexander Sosnov. All rights reserved.
//

import SwiftUI

struct CardDetail: View {
    @State var goToLogin = false
    @State var viewState = CGSize.zero
    @State var goToOverview = false
    @State var items = 3
    @State var arrayOfCards = [1,2,3]
    @State var t = true
    @State private var applicantRowClicked = false

    var body: some View {
        ZStack {

            Color(#colorLiteral(red: 0.2923514071, green: 0.6221273317, blue: 0.9437338083, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                CategoriesTitles()
                    .padding(.top, 85)
                Divider()
                    .foregroundColor(.red)
                //                Spacer()

                ScrollView{
                    ForEach (arrayOfCards, id: \.self) {_ in
                        ApplicantRow()
                            .onTapGesture {
                                self.applicantRowClicked.toggle()
                            }
//                            if applicantRowClicked {
//                                Text("haha")
//                            }
                            .padding(.bottom, 5)
                            .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                }
                Spacer()
            }
            
            MenuRightDetail(gTPS: $goToLogin, showLogout: $goToOverview, items: $items, arrayOfCards: $arrayOfCards)
            
            if goToLogin {
                Login(show: $goToLogin)
                    .opacity(goToLogin ? 1 : 0)
                    .offset(y: goToLogin ? 0 : 20)
                    .animation(Animation.easeInOut)
            }
            if goToOverview {
                Overview()
                    .opacity(goToOverview ? 1 : 0)
                    .offset(y: goToOverview ? 0 : 20)
                    .animation(Animation.easeIn)
            }
            if applicantRowClicked {
                InterviewScreen()
            }
        }

    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail()
    }
}

struct MenuRightDetail : View {
    @Binding var gTPS: Bool
    @State var showUpdateList = false
    @Binding var showLogout: Bool
    @Binding var items: Int
    @Binding var arrayOfCards: [Int]
    @State var showStatList = false

    var body: some View {

        return VStack {
            HStack(spacing: 12) {
                VStack { Image(systemName: "backward.end.fill") }
                    .onTapGesture { self.showLogout.toggle() }
                    .frame(width: 44, height: 44)
                    .background(Color("button"))
                    .foregroundColor(.primary)
                    .cornerRadius(9)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                Text("It is, CardDetail!")

                Spacer()
                Button(action: { self.showStatList.toggle() }) {
                    VStack { Image(systemName: "person.3.fill") }
                        .foregroundColor(.primary)
                        .frame(width: 44, height: 44)
                        .background(Color("button"))
                        .cornerRadius(22)
                        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                        .sheet(isPresented: $showStatList) {
                            StatisticsView()
                    }
                }
                Text("\(items)")
//                if showUpdateList {
//                    TableView(items: $items)
//                    Text("You should follow me on Twitter: @twostraws")
//                        .font(.largeTitle)
//                }
                Button(action: { self.showUpdateList.toggle(); self.items += 1; self.arrayOfCards.append(self.items + 1)}) {
                    VStack { Image(systemName: "arrow.clockwise") }
                        .foregroundColor(.primary)
                        .frame(width: 44, height: 44)
                        .background(Color("button"))
                        .cornerRadius(9)
                        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
//                        .sheet(isPresented: $showUpdateList) {
//                            TableView(items: self.$items)
//                    }
                }
                
                VStack { Image(systemName: "arrowshape.turn.up.right.fill") }
                    .frame(width: 44, height: 44)
                    .background(Color("button"))
                    .foregroundColor(.primary)
                    .cornerRadius(9)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                    .onTapGesture { self.gTPS.toggle() }
            }
            .padding().offset(y: 5)
            
            Spacer()
        }

    }

}


struct CategoriesTitles: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Applicant")
                Text("Name")
                    .bold()
//                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            }
            .padding(.leading, 10)
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Interview")
                Text("Time")
                    .bold()
//                Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            }
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Interview")
                Text("Status")
                    .bold()
            }
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Interview")
                Text("Score")
                    .bold()
            }
            .padding(.trailing, 10)
        }
    }
}

struct ApplicantRow: View {
//    @State private var applicantRowClicked = false

    var body: some View {
        VStack {

            HStack {
                VStack {
                    Text("First Name")
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    Text("Last Name")
                        .bold()
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
                .padding(.leading, 10)
                Spacer()
                VStack(alignment: .leading) {
                    Text("10/4/2019")
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    Text("9:00 am")
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
                Spacer()
                Text("Pending   ")
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                Spacer()
                Text("001")
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    .padding(.trailing, 50)
            }
//            .onTapGesture {
//                self.applicantRowClicked.toggle()
//            }
//            if applicantRowClicked {
//                Text("haha")
//            }
            Divider()
        }
    }

}
