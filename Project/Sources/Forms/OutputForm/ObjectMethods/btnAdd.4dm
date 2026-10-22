var $order : cs.OrderEntity
$order:=ds.Order.new()
$order.customer:=""
$order.status:="New"
$order.total:="$0.00"
$order.date:=Current date
$order.address:=""
$order.notes:=""
$order.save()
$order.orderNumber:="SO-"+String(20000+$order.ID)
$order.save()

var $object:={entity: $order; theme: Form.theme; radius: Form.radius}
var $win : Integer
$win:=Open form window("InputForm"; Movable form dialog box)
DIALOG("InputForm"; $object)

Form.orders:=ds.Order.all()
Form.selectedOrder:=ds.Order.get($order.ID)

Form.theme:=$object.theme
Form.radius:=$object.radius
ApplyTheme(Form)
