import UIKit

// Read in an image from a url string
func imageFor(_ str: String) -> UIImage {
    let url = URL(string: str)
    let imgData = try? Data(contentsOf: url!)
    let uiImage = UIImage(data:imgData!)
    return uiImage!
}

//image
let u1 = "https://i.ibb.co/d0K6bbb/tumblr-344bca3e77091fdec95c69cc6d8a28c4-d757c70a-1280.png"
let ui1 = imageFor(u1)


let sz = CGSize(width: 1024, height: 1024)
let renderer = UIGraphicsImageRenderer(size: sz)

let image = renderer.image { (context) in
    ui1.draw(in: CGRect(x: 0, y: 0, width: 1024, height: 1024))

}

image
