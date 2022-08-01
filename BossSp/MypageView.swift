//
//  MypageView.swift
//  BossSp
//
//  Created by 이정동 on 2022/07/28.
//

import SwiftUI

struct MypageView: View {
    @State private var presentAlert = false
    @State private var userName = ""// 닉네임
    @State private var selfIntro = ""//자기 소개
    var body: some View {
        ScrollView {
            VStack{
                Image("")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white))
                Button (action:{
                }){
                    Text("사진 추가")
                        .frame(minWidth: 0, maxWidth: 75)
                        .foregroundColor(Color.white)
                    
                }.tint(.blue)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 20, trailing: 0))
                Button("프로필 편집"){
                    alertTf(title: "프로필 편집", message: "닉네임과 소개를 입력해주세요", hintText: "닉네임을 입력하세요",hintText2: "소개를 입력하세요" ,primaryTitle: "취소", secondaryTitle: "등록"){text in
                        print(text)
                    } secondaryAction:{
                        print("Cancle")
                    }
                }
                .frame(minWidth: 0, maxWidth: 150)
                .font(.title2)
                .foregroundColor(Color.white)
                .tint(.black)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
//                        .alert("프로필 편집", isPresented: $presentAlert, actions: {
//                            TextField("닉네임을 입력하세요", text: $userName)
//
//                            SecureField("소개란", text: $selfIntro)
//
//                            Button("등록", action: {})
//                                       Button("취소", role: .cancel, action: {})
//                                   }, message: {
//                                       Text("닉네임과 자기 소개를 채워주세요.")
//                                   })
            
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .padding(20)
                .background(Color.gray)
            
            VStack(alignment: .leading){
    
                    
                Text("닉네임") // 맛집 이름 입력 섹션
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                TextField("닉네임을 입력하세요", text: $userName)
                    .keyboardType(.default)
                    .frame(width: 310.0, height: 20.0)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.gray))
                
                
                Text("자기 소개")// 맛집 이름 입력 섹션
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                TextField("소개란", text: $selfIntro)
                    .keyboardType(.default)
                    .frame(width: 310.0, height: 250.0)
                    .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color.gray))
                
                
            
        }
        
        }
    }
    
}
struct MypageView_Previews: PreviewProvider {
    static var previews: some View {
        MypageView()
    }
}
extension View{
    func alertTf(title : String, message: String, hintText: String,hintText2:String, primaryTitle: String,secondaryTitle: String, primaryAction:@escaping (String)->(),secondaryAction:@escaping ()->()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField{field in
            field.placeholder = hintText
        }
        alert.addTextField{field in
            field.placeholder = hintText2
        }
        alert.addAction(.init(title: primaryTitle, style: .cancel, handler: { _ in
            secondaryAction()
        }))
        
        alert.addAction(.init(title: secondaryTitle, style: .default, handler: { _ in
            if let text = alert.textFields?[0].text{
                primaryAction(text)
            }
            else{
                primaryAction("")
            }
        }))
        rootController().present(alert,animated: true,completion: nil)
    }
    func rootController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
            
        }
        return root
    }
    

}

