//
//  MessagePage.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 3/11/23.
//

import SwiftUI

struct TitleRow: View {
    @Binding var imageUrl: String
    @Binding var name: String
    
    var body: some View {
        HStack(spacing: 20){
            Image(imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            
            VStack(alignment: .leading)
            {
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }.frame(maxWidth: .infinity, alignment: .leading)
            
//            Image(systemName: "phone.fill")
//                .foregroundColor(.gray)
//                .padding(10)
//                .background(.white)
//                .cornerRadius(50)
        }
        .padding()
    }
}

//struct TitleRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleRow()
//            .background(Color(red: 231/255, green: 255/255, blue: 231/255))
//    }
//}

