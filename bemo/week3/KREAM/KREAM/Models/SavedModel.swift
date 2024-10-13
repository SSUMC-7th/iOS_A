//
//  SavedModel.swift
//  KREAM
//
//  Created by 임효진 on 10/12/24.
//

import Foundation

struct SavedModel {
    let image: String
    let title: String
    let content: String
    let price: String
}

final class dummySavedModel {
    static let savedDatas: [SavedModel] = [
        SavedModel(image: "상품 이미지-1",title: "손오공이 잃어버린 머리띠 반쪽", content: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", price: "2,112,120원"),
        SavedModel(image: "상품 이미지-2",title: "골드 반지", content: "결혼 준비하는 당신?! 약혼녀에게 이 반지를 선물하는 건 어때요?!", price: "100원"),
        SavedModel(image: "상품 이미지-3",title: "하얀 신발", content: "짝퉁 나이키 신발! 정말 푹신푹신해서 걷다가 졸려서 넘어지...", price: "112,120원"),
        SavedModel(image: "상품 이미지-4",title: "에베레스트 다이아 반지", content: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", price: "12,000원"),
        SavedModel(image: "상품 이미지-5",title: "아디다스다 신발", content: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", price: "82,120원"),
        SavedModel(image: "상품 이미지-6",title: "황제 잠옷", content: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", price: "92,012,129원"),
        SavedModel(image: "상품 이미지-7",title: "고장난 기타", content: "블라블ㄹ바블ㄹ바ㅏㅂ", price: "10,000원")
    ]
}
