//%attributes = {}
// Rebuild the sample order desk dataset.
ds.Order.all().drop()
SET DATABASE PARAMETER([Order]; Table sequence number; 0)

var $orders : Collection
var $order : cs.OrderEntity
var $data : Object

$orders:=New collection(\
New object("orderNumber"; "SO-10482"; "customer"; "Northwind Medical"; "status"; "Awaiting shipment"; "total"; "$4,280.00"; "date"; Current date-1; "address"; "18 Harbor Street"; "notes"; "Deliver before 5 PM"); \
New object("orderNumber"; "SO-10483"; "customer"; "Alpine Outdoor Co."; "status"; "In preparation"; "total"; "$1,945.50"; "date"; Current date-1; "address"; "72 Market Avenue"; "notes"; "Call on arrival"); \
New object("orderNumber"; "SO-10484"; "customer"; "Bluebird Coffee Roasters"; "status"; "Ready"; "total"; "$782.00"; "date"; Current date-2; "address"; "4 Station Road"; "notes"; "Include wholesale invoice"); \
New object("orderNumber"; "SO-10485"; "customer"; "Cedar & Stone"; "status"; "On hold"; "total"; "$3,116.75"; "date"; Current date-2; "address"; "205 Oak Lane"; "notes"; "Waiting for confirmation"); \
New object("orderNumber"; "SO-10486"; "customer"; "Harbor House Hotels"; "status"; "Shipped"; "total"; "$6,450.00"; "date"; Current date-3; "address"; "90 King Street"; "notes"; "Split delivery across two sites")\
)

For each ($data; $orders)
	$order:=ds.Order.new()
	$order.fromObject($data)
	$order.save()
End for each 