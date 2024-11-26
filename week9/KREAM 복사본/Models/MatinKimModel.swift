import UIKit

struct MatinKimModel{
    let image: UIImage
}

extension MatinKimModel{
    static func Makedummy() ->[MatinKimModel]{
        return[
            MatinKimModel(image: .matinkimblue),
            MatinKimModel(image: .matinkimpurple),
            MatinKimModel(image: .matinkimgreen),
            MatinKimModel(image: .matinkimburgundy),
            MatinKimModel(image: .matinkimcherry),
            MatinKimModel(image: .matinkimbrown),
            MatinKimModel(image: .matinkimblue),
            MatinKimModel(image: .matinkimpurple),
            MatinKimModel(image: .matinkimgreen),
            MatinKimModel(image: .matinkimburgundy),
            MatinKimModel(image: .matinkimcherry),
            MatinKimModel(image: .matinkimbrown)
            
            
        ]
    }
}
