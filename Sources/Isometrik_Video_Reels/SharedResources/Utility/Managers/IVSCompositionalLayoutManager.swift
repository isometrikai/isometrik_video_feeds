//
//  IVSCompositionalLayoutManager.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 17/12/24.
//
import Foundation
import UIKit

/// This defines the direction of the collection view layout items
enum DirectionEnum{
    case horizontal
    case vertical
}

/// Used to make items , groups for compositional layout
struct IVSCompositionalLayoutManager{
    
    static func createItem(width:NSCollectionLayoutDimension,height:NSCollectionLayoutDimension,spacing:CGFloat) -> NSCollectionLayoutItem{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        return item
    }
    
    static func createGroup(layoutDirection:DirectionEnum,width:NSCollectionLayoutDimension,height:NSCollectionLayoutDimension,items:[NSCollectionLayoutItem]) -> NSCollectionLayoutGroup{
        switch layoutDirection {
        case .horizontal:
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
            return group
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        }
    }
    
    static func createGroup(layoutDirection:DirectionEnum,width:NSCollectionLayoutDimension,height:NSCollectionLayoutDimension,item:NSCollectionLayoutItem,count:Int) -> NSCollectionLayoutGroup{
        switch layoutDirection {
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), repeatingSubitem: item, count: count)
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), repeatingSubitem: item, count: count)
        }
    }
    
    static func createSection(group:NSCollectionLayoutGroup) -> NSCollectionLayoutSection{
        return NSCollectionLayoutSection(group: group)
    }
    
    
    static func supplementaryHeader(heightForHeader:CGFloat=65,shouldPinToBounds:Bool,contentInset:NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))->NSCollectionLayoutBoundarySupplementaryItem{
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(heightForHeader)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.contentInsets = contentInset
        header.pinToVisibleBounds = shouldPinToBounds
        return header
    }
    
    
    static func supplementaryFooter(heightForFooter:CGFloat=65,shouldPinToBounds:Bool,contentInset:NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))->NSCollectionLayoutBoundarySupplementaryItem{
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(heightForFooter)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        footer.contentInsets = contentInset
        footer.pinToVisibleBounds = shouldPinToBounds
        return footer
    }
}


