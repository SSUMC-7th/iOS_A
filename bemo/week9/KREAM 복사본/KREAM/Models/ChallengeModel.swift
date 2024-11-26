//
//  ChallengeModel.swift
//  KREAM
//
//  Created by 임효진 on 11/3/24.
//

import UIKit

struct ChallengeModel {
    
    let image: String
}

extension ChallengeModel {
    
    static func dummy() -> [ChallengeModel] {
        return [
            ChallengeModel(image: "https://i.pinimg.com/736x/12/b4/cf/12b4cfae0aa0c1f0402da19059872d0a.jpg"),
            ChallengeModel(image:"https://i.pinimg.com/736x/07/07/61/0707618c14adcac73a14b05a90e49faa.jpg"),
            ChallengeModel(image: "https://i.pinimg.com/736x/35/73/c7/3573c7789d091f4b432d71b039264417.jpg"),
            ChallengeModel(image: "https://img.dmitory.com/img/202204/7jg/ofe/7jgofekuIMGgqeI4wk4w84.jpg"),
            ChallengeModel(image: "https://cdn.ggilbo.com/news/photo/202105/848641_677727_570.jpg"),
            ChallengeModel(image: "https://i.pinimg.com/736x/7e/6c/ed/7e6ced01dfa36d15cd299c6a3258e323.jpg"),
            ChallengeModel(image: "https://i.pinimg.com/474x/7c/af/3e/7caf3e7c327c65eb73dcf899b7dc6d7f.jpg"),
            ChallengeModel(image: "https://i.pinimg.com/474x/a5/fb/e4/a5fbe4b47f843556d2eb5e3131bdc1cf.jpg"),
            ChallengeModel(image: "https://i.pinimg.com/474x/21/25/de/2125de9ae883930ce126ed8866e4d5dd.jpg"),
            ChallengeModel(image: "https://i.pinimg.com/474x/14/2d/17/142d17d25981c516a8b07c9919da2459.jpg"),
            ChallengeModel(image: "https://i.pinimg.com/474x/e4/12/5b/e4125b0665878bd86917ea8fd1e7d7bf.jpg"),
            ChallengeModel(image: "https://postfiles.pstatic.net/MjAyMDAzMzFfMTYw/MDAxNTg1NTg0MDU4ODYx.moXWqkbLcmSXPwoSNANT7Y6RZiF90qVxIZOz-F0sPcMg.Z6lWgwuUUumjSlReYwOXRQMoxwF65XBt81wrgcGEJigg.JPEG.chwippo1/output_797946413.jpg?type=w773"),
            ChallengeModel(image: "https://postfiles.pstatic.net/MjAyMjAzMTdfMTIw/MDAxNjQ3NTIxMzA0ODU3.2g-EfStrenOJBZ75h0DD5UoiARVL8VKNwewaIuXki8Yg.iHUnaTLDwFPD_bOGWn4qNfnuL_Xxwe1Nf18cHNXuLFAg.JPEG.sua2651/8862D733%EF%BC%8D88FB%EF%BC%8D4E4F%EF%BC%8DB191%EF%BC%8D26A584AF0E31.jpeg?type=w773"),
        ]
    }
}
