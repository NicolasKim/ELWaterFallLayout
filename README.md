# ELWaterFallLayout

[![CI Status](http://img.shields.io/travis/jinqiucheng1006@live.cn/ELWaterFallLayout.svg?style=flat)](https://travis-ci.org/jinqiucheng1006@live.cn/ELWaterFallLayout)
[![Version](https://img.shields.io/cocoapods/v/ELWaterFallLayout.svg?style=flat)](http://cocoapods.org/pods/ELWaterFallLayout)
[![License](https://img.shields.io/cocoapods/l/ELWaterFallLayout.svg?style=flat)](http://cocoapods.org/pods/ELWaterFallLayout)
[![Platform](https://img.shields.io/cocoapods/p/ELWaterFallLayout.svg?style=flat)](http://cocoapods.org/pods/ELWaterFallLayout)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ELWaterFallLayout is available through [CocoaPods]([http://cocoapods.org](http://cocoapods.org)). To install

it, simply add the following line to your Podfile:

```ruby
pod "ELWaterFallLayout"
```



## Usage

```
import ELWaterFallLayout
```



```swift
lazy var flowLayout : ELWaterFlowLayout = ELWaterFlowLayout()
flowLayout.scrollDirection = .horizontal //.vertical
collectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height - 200)) , collectionViewLayout:flowLayout)
collectionView.backgroundColor = UIColor.white
collectionView.delegate = self
collectionView.dataSource = self
self.flowLayout.delegate = self
flowLayout.lineCount = 10//十列
flowLayout.vItemSpace = 10//垂直间距10
flowLayout.hItemSpace = 10//水平间距10
flowLayout.edge = UIEdgeInsets.zero
collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
self.view.addSubview(collectionView)

```



### delegate protocol

```swift
func el_flowLayout(_ flowLayout: ELWaterFlowLayout, heightForRowAt index: Int) -> CGFloat {
//do something for the cell height
return height
}
```


## Result
![image](https://github.com/NicolasKim/ELWaterFallLayout/blob/master/screenshot.gif)


## Author

jinqiucheng1006@live.cn

## License

ELWaterFallLayout is available under the MIT license. See the LICENSE file for more info.
