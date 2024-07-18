import UIKit

class RulerView: UIView {
    var maxValue: CGFloat = 100
    var unitValue: CGFloat = 1
    var space: CGFloat = 10  // 每个刻度的间距
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.clipsToBounds = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
        self.clipsToBounds = false
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let totalUnits = Int(maxValue / unitValue)
        
        for i in 0...totalUnits {
            let x = CGFloat(i) * space
            let isMajorTick = i % 10 == 0
            let lineHeight: CGFloat = isMajorTick ? 20 : 10
            let tickColor: UIColor = isMajorTick ? .black : .gray
            
            let tickView = UIView(frame: CGRect(x: x, y: bounds.height - lineHeight, width: 1.0, height: lineHeight))
            tickView.backgroundColor = tickColor
            addSubview(tickView)
            
            if isMajorTick {
                let labelWidth: CGFloat = 30.0
                let labelX = x - labelWidth / 2.0  // 居中位置计算
                
                let label = UILabel(frame: CGRect(x: labelX+0.5, y: bounds.height - 40, width: labelWidth, height: 20))
                label.textAlignment = .center
                label.text = "\(i * Int(unitValue))"
                label.font = UIFont.systemFont(ofSize: 12)
                label.backgroundColor = .clear
                addSubview(label)
            }
        }
    }
}
