<img src="https://github.com/user-attachments/assets/6034a9e0-d10e-48e5-b7c4-141b6f91b76d" width="30%">

## Usage

引入PZXSlidingRulerView文件夹

```
        let rulerView = PZXSlidingRulerView(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 150))
        rulerView.maxValue = 200
        rulerView.unitValue = 1
        
        self.view.addSubview(rulerView)
```
