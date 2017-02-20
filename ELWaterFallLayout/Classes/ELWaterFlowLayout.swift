//
//  ELWaterFlowLayout.swift
//  WaterFlow
//
//  Created by 金秋成 on 2017/2/17.
//  Copyright © 2017年 金秋成. All rights reserved.
//

import UIKit


public protocol ELWaterFlowLayoutDelegate : NSObjectProtocol{
    func el_flowLayout(_ flowLayout : ELWaterFlowLayout, heightForRowAt index:Int) -> CGFloat;
}


open class ELWaterFlowLayout: UICollectionViewFlowLayout {
    
    fileprivate var attrArr :[UICollectionViewLayoutAttributes] = []
    
    fileprivate var lineHeightRecArr : [CGFloat] = [0]
    
    fileprivate var lineWidth     :CGFloat   = 0
    
    weak open var delegate : ELWaterFlowLayoutDelegate?
    
    //列的数量 默认为1列
    open var lineCount : UInt = 3 {
        didSet{
            self.resetLineHeight()
            self.resetLineWidth()
            self.invalidateLayout()//重新刷新视图
        }
    }
    
    open var hItemSpace : CGFloat = 10 {
        didSet{
            self.resetLineHeight()
            self.resetLineWidth()
            self.invalidateLayout()
        }
    }
    
    open var vItemSpace : CGFloat = 10{
        didSet{
            self.resetLineHeight()
            self.resetLineWidth()
            self.invalidateLayout()
        }
    }
    
    open var edge : UIEdgeInsets = UIEdgeInsets.zero{
        didSet{
            self.resetLineHeight()
            self.resetLineWidth()
            self.invalidateLayout()
        }
    }

    
    override public  init() {
        super.init()
        
        guard let lineWidth = self.collectionView?.frame.size.width else {
            return
        }
        self.lineWidth = lineWidth

    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func resetLineHeight(){
        lineHeightRecArr.removeAll()
        for _ in 0..<lineCount {
            lineHeightRecArr.append(0.0)
        }
    }
    
    func resetLineWidth(){
        self.lineWidth = ((self.collectionView?.frame.size.width)! - self.edge.left - self.edge.right - CGFloat(self.lineCount-1)*self.hItemSpace)/CGFloat(self.lineCount);
    }
    
    
    override open func prepare() {
        super.prepare()
        resetLineWidth()
        resetLineHeight()
        
        if let sectionCount = self.collectionView?.dataSource?.numberOfSections!(in: self.collectionView!) {
            for section in 0..<sectionCount{
                if let rowCount = self.collectionView?.dataSource?.collectionView(self.collectionView!, numberOfItemsInSection: section) {
                    for row in 0..<rowCount {
                        let attr = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: row, section: section))
                        self.modifyLayoutAttributes(attr: attr)
                        attrArr.append(attr)
                    }
                }

            }
        }
        
        
    }
    
    
    override   open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return attrArr[indexPath.item]
    }
    
    override   open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrArr
    }
    
    
    func modifyLayoutAttributes(attr : UICollectionViewLayoutAttributes?) {
        if let a = attr {
            let sl = self.findShortestLine()
            let x = CGFloat(sl.index) * (self.lineWidth + self.hItemSpace) + self.edge.left
            let y = sl.height + self.vItemSpace
            let width = self.lineWidth
            
            let height = self.delegate?.el_flowLayout(self, heightForRowAt: a.indexPath.row)
            
            a.frame = CGRect(x: x, y: y, width: width, height: height!)
            
            self.updateLineHeightRec(at: sl.index, with: y + height!)
        }
        
    }
    
    
    func findShortestLine() -> (index:Int,height:CGFloat) {
        var shortestHeight =  CGFloat.greatestFiniteMagnitude
        var shortestIndex  =  0
        for index in 0..<self.lineHeightRecArr.count{
            if shortestHeight > self.lineHeightRecArr[index] {
                shortestHeight = self.lineHeightRecArr[index]
                shortestIndex = index
            }
        }
        return (shortestIndex,shortestHeight)
    }
    
    
    func fineLongestLine() -> (index:Int,height:CGFloat) {
        var longestHeight :CGFloat =  0.0
        var longestIndex  =  0
        for index in 0..<self.lineHeightRecArr.count{
            if longestHeight < self.lineHeightRecArr[index] {
                longestHeight = self.lineHeightRecArr[index]
                longestIndex = index
            }
        }
        return (longestIndex,longestHeight)
    }
    
    
    func updateLineHeightRec(at index:Int, with height:CGFloat){
        
        self.lineHeightRecArr[index] = height

    }
    
    
    override open var collectionViewContentSize: CGSize{
        get{
            return CGSize(width: (self.collectionView?.frame.size.width)!, height: self.fineLongestLine().height)
        }
    }
    
    
}
