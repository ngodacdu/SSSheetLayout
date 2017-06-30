# SSSheetLayout

[![CI Status](http://img.shields.io/travis/Macbook/SSSheetLayout.svg?style=flat)](https://travis-ci.org/Macbook/SSSheetLayout)
[![Version](https://img.shields.io/cocoapods/v/SSSheetLayout.svg?style=flat)](http://cocoapods.org/pods/SSSheetLayout)
[![License](https://img.shields.io/cocoapods/l/SSSheetLayout.svg?style=flat)](http://cocoapods.org/pods/SSSheetLayout)
[![Platform](https://img.shields.io/cocoapods/p/SSSheetLayout.svg?style=flat)](http://cocoapods.org/pods/SSSheetLayout)

- This project is written for custom collection view layout like sheet form
- In fact, many applications need to show view like sheet, so this project focus to make the collection view scrollable horizontal and vertical. The main feature is keep top and left dock

## Requirements
* iOS 8.0+
* Xcode 8.0

## Installation

SSSheetLayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SSSheetLayout"
```

## Usage

1. Set collection view layout with custom type SSSheetLayout
![Change layout type](https://github.com/ngodacdu/SSSheetLayout/blob/master/Screenshots/CustomLayout.png)

2. Set datasource for collection view layout (SSSheetLayout)
![Set Datasource](https://github.com/ngodacdu/SSSheetLayout/blob/master/Screenshots/DragDataSource.png)

3. How to change size for collection view cell

```ruby
func collectionView(collectionView: UICollectionView, sizeForItem indexPath: IndexPath) -> CGSize {
    if indexPath.row == 0 {
        return CGSize(width: 100, height: 30)
    }
    return CGSize(width: 50, height: 30)
}
```

4. How to keep dock when scroll to max, min offset
```ruby
func scrollViewDidScroll(_ scrollView: UIScrollView) {
    scrollView.keepDockOffset()
}
```

## Author

Ngô Đắc Du, ngodacdu92@gmail.com

## License

SSSheetLayout is available under the MIT license. See the LICENSE file for more info.
