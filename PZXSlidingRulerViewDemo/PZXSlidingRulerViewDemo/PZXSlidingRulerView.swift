import UIKit

class PZXSlidingRulerView: UIView, UIScrollViewDelegate {
    private let rulerView = RulerView()
    private let arrowView = UIView()
    private let valueLabel = UILabel()
    private let scrollView = UIScrollView()
    
    var maxValue: CGFloat = 200 {
        didSet {
            rulerView.maxValue = maxValue
            setupViews()
        }
    }
    
    var unitValue: CGFloat = 1 {
        didSet {
            rulerView.unitValue = unitValue
            setupViews()
        }
    }
    
    var space: CGFloat = 10 {
        didSet {
            rulerView.space = space
            setupViews()
        }
    }
    
    var initialValue: CGFloat = 20 {
        didSet {
            scrollToInitialValue()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        let totalUnits = maxValue / unitValue
        rulerView.frame = CGRect(x: 0, y: 0, width: CGFloat(totalUnits) * space, height: 100)
        rulerView.setNeedsDisplay()

        scrollView.frame = CGRect(x: 0, y: 50, width: self.frame.width, height: 100)
        scrollView.contentSize = rulerView.frame.size
        scrollView.delegate = self

        let inset = scrollView.frame.width / 2
        scrollView.contentInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        
        scrollView.addSubview(rulerView)
        self.addSubview(scrollView)
        
        // 绘制箭头
        arrowView.frame = CGRect(x: scrollView.frame.width / 2 - 10, y: 90, width: 20, height: 20)
        arrowView.backgroundColor = .clear
        self.addSubview(arrowView)
        
        let arrowLayer = CAShapeLayer()
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x: 0, y: 0))
        arrowPath.addLine(to: CGPoint(x: 10, y: 20))
        arrowPath.addLine(to: CGPoint(x: 20, y: 0))
        arrowPath.close()
        arrowLayer.path = arrowPath.cgPath
        arrowLayer.fillColor = UIColor.red.cgColor
        arrowView.layer.addSublayer(arrowLayer)

        valueLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 50)
        valueLabel.textAlignment = .center
        valueLabel.font = UIFont.systemFont(ofSize: 24)
        self.addSubview(valueLabel)

        rulerView.backgroundColor = .white
        
        // 滚动到初始值
        scrollToInitialValue()
    }
    
    private func scrollToInitialValue() {
        let offsetX = initialValue * space - scrollView.frame.width / 2
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: false)
        updateValueLabel()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateValueLabel()
    }
    
    private func updateValueLabel() {
        let offsetX = scrollView.contentOffset.x
        let inset = scrollView.contentInset.left
        let unitWidth = space
        let value = (offsetX + inset) / unitWidth * rulerView.unitValue
        
        valueLabel.text = String(format: "%.1f", value)
    }
}
