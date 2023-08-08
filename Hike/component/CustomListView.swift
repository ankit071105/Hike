//
//  CustomListView.swift
//  Hike
//
//  Created by ANKIT KUMAR on 01/08/23.
//

import SwiftUI

struct CustomListView: View {
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    var body: some View {
        LabeledContent{
            if rowContent != nil {
                Text(rowContent!)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }else if (rowLinkLabel != nil && rowLinkDestination != nil){
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.indigo)
                    .fontWeight(.heavy)
                    .font(.system(size: 18))
                
            }else {
                EmptyView()
            }

        }label: {
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                      Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
         
                
                    .padding(.leading)
                    
            }
        }
    }
}

struct CustomListView_Previews: PreviewProvider {
    static var previews: some View {

        List{
            CustomListView(rowLabel: "Website",
                           rowIcon: "globe", rowContent: nil, rowTintColor: .indigo,
                              rowLinkLabel: "Ankit Profile Linkedin" ,
                          rowLinkDestination: "https://www.linkedin.com/in/ankit-kumar-01a52827b/")
        }
    }
}
