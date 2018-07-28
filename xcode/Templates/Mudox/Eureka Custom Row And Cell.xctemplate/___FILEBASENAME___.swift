public class <#Cell>: Cell<<#Value#>>, CellType {

    public override func setup() {
        super.setup()
        // like `awakeFromNib`
    }

    public override func update() {
        super.update()
        // like `show(_ content: Type)`
    }
}

public class <#Row#>: Row<<#Cell#>>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<CustomCell>(nibName: "<#XibName#>")
    }
}
