import UIKit

func imageFor(_ str: String) -> UIImage {
    let url = URL(string: str)
    let imgData = try? Data(contentsOf: url!)
    let uiImage = UIImage(data:imgData!)
    return uiImage!
}

//image
let img1 = "https://i.ibb.co/d0K6bbb/tumblr-344bca3e77091fdec95c69cc6d8a28c4-d757c70a-1280.png"
let img1 = imageFor(u1)


let sizing = CGSize(width: 1024, height: 1024)
let renderer = UIGraphicsImageRenderer(size: sizing)

let image = renderer.image { (context) in
    img1.draw(in: CGRect(x: 0, y: 0, width: 1024, height: 1024))

}

image
