//
//  CardView.swift
//  EdjoinInterview
//
//  Created by Alexander Sosnov on 11/14/19.
//  Copyright © 2019 Alexander Sosnov. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var title = "CLASSIFIED STAFF"
    var description = "Certificate1"
    var image = "Certificate1"
    @Binding var numberOfPeople: Int

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                BottomIcons(numberOfPeople: $numberOfPeople)
                .padding(.bottom, 15)
            }
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.bottom, 7)
                        .padding(.top, 7)
                        .padding(.bottom, 17)

                        Text("SJCOE Demo")
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        Spacer()

                    }
                    .padding(.leading, 10)
                    Spacer()
                }

            }

        }
            .frame(minWidth: 20, maxWidth: 300, minHeight:
            0, maxHeight: 200)
        .background(Color(#colorLiteral(red: 0.2456268668, green: 0.5129396915, blue: 0.7682726383, alpha: 1)))
        .cornerRadius(20)
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    var binding: Int = 17
    static var previews: some View {
        CardView(numberOfPeople: .constant(17)).previewLayout(.sizeThatFits)
    }
}
#endif

struct BottomIcons: View {
    @Binding var numberOfPeople: Int
    var body: some View {
        HStack {
            Image(systemName: "calendar")
                .resizable()
                .renderingMode(.original)
                .frame(width: 20, height: 20)
                .padding(.horizontal)
            Text("7/17/17")
            Image(systemName: "briefcase.fill")
                .resizable()
                .renderingMode(.original)
                .frame(width: 20, height: 20)
                .padding(.horizontal)
            Text("17")
            Image(systemName: "person.fill")
                .resizable()
                .renderingMode(.original)
                .frame(width: 20, height: 20)
                .padding(.horizontal)
            Text("\(numberOfPeople)")
                .padding(.trailing, 10)
        }
    }
}
