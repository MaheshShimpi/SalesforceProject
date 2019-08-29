public class JSON2Apex {
    
    public class Order {
        public String purchaseOrderId {get;set;} 
        public String customerOrderId {get;set;} 
        public String customerEmailId {get;set;} 
        public Long orderDate {get;set;} 
        public ShippingInfo shippingInfo {get;set;} 
        public OrderLines orderLines {get;set;} 
        
        public Order(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'purchaseOrderId') {
                            purchaseOrderId = parser.getText();
                        } else if (text == 'customerOrderId') {
                            customerOrderId = parser.getText();
                        } else if (text == 'customerEmailId') {
                            customerEmailId = parser.getText();
                        } else if (text == 'orderDate') {
                            orderDate = parser.getLongValue();
                        } else if (text == 'shippingInfo') {
                            shippingInfo = new ShippingInfo(parser);
                        } else if (text == 'orderLines') {
                            orderLines = new OrderLines(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Order consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Meta {
        public Integer totalCount {get;set;} 
        public Integer limit_Z {get;set;} // in json: limit
        public Object nextCursor {get;set;} 
        
        public Meta(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'totalCount') {
                            totalCount = parser.getIntegerValue();
                        } else if (text == 'limit') {
                            limit_Z = parser.getIntegerValue();
                        } else if (text == 'nextCursor') {
                            nextCursor = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Meta consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class CarrierName {
        public Object otherCarrier {get;set;} 
        public String carrier {get;set;} 
        
        public CarrierName(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'otherCarrier') {
                            otherCarrier = parser.readValueAs(Object.class);
                        } else if (text == 'carrier') {
                            carrier = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'CarrierName consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public List_Z list_Z {get;set;} // in json: list
    
    public JSON2Apex(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'list') {
                        list_Z = new List_Z(parser);
                    } else {
                        System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }
    
    public class OrderLines {
        public List<OrderLine> orderLine {get;set;} 
        
        public OrderLines(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'orderLine') {
                            orderLine = arrayOfOrderLine(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'OrderLines consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class OrderLineQuantity {
        public String unitOfMeasurement {get;set;} 
        public String amount {get;set;} 
        
        public OrderLineQuantity(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'unitOfMeasurement') {
                            unitOfMeasurement = parser.getText();
                        } else if (text == 'amount') {
                            amount = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'OrderLineQuantity consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Charge {
        public String chargeType {get;set;} 
        public String chargeName {get;set;} 
        public ChargeAmount chargeAmount {get;set;} 
        public Object tax {get;set;} 
        
        public Charge(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'chargeType') {
                            chargeType = parser.getText();
                        } else if (text == 'chargeName') {
                            chargeName = parser.getText();
                        } else if (text == 'chargeAmount') {
                            chargeAmount = new ChargeAmount(parser);
                        } else if (text == 'tax') {
                            tax = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Charge consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class OrderLineStatus {
        public String status {get;set;} 
        public OrderLineQuantity statusQuantity {get;set;} 
        public Object cancellationReason {get;set;} 
        public TrackingInfo trackingInfo {get;set;} 
        public Object returnCenterAddress {get;set;} 
        
        public OrderLineStatus(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'status') {
                            status = parser.getText();
                        } else if (text == 'statusQuantity') {
                            statusQuantity = new OrderLineQuantity(parser);
                        } else if (text == 'cancellationReason') {
                            cancellationReason = parser.readValueAs(Object.class);
                        } else if (text == 'trackingInfo') {
                            trackingInfo = new TrackingInfo(parser);
                        } else if (text == 'returnCenterAddress') {
                            returnCenterAddress = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'OrderLineStatus consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Elements {
        public List<Order> order {get;set;} 
        
        public Elements(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'order') {
                            order = arrayOfOrder(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Elements consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class ChargeAmount {
        public String currency_Z {get;set;} 
        public Integer amount {get;set;} 
        
        public ChargeAmount(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'currency') {
                            currency_Z = parser.getText();
                        } else if (text == 'amount') {
                            amount = parser.getIntegerValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'ChargeAmount consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class PostalAddress {
        public String name {get;set;} 
        public String address1 {get;set;} 
        public Object address2 {get;set;} 
        public String city {get;set;} 
        public String state {get;set;} 
        public String postalCode {get;set;} 
        public String country {get;set;} 
        public String addressType {get;set;} 
        
        public PostalAddress(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'name') {
                            name = parser.getText();
                        } else if (text == 'address1') {
                            address1 = parser.getText();
                        } else if (text == 'address2') {
                            address2 = parser.readValueAs(Object.class);
                        } else if (text == 'city') {
                            city = parser.getText();
                        } else if (text == 'state') {
                            state = parser.getText();
                        } else if (text == 'postalCode') {
                            postalCode = parser.getText();
                        } else if (text == 'country') {
                            country = parser.getText();
                        } else if (text == 'addressType') {
                            addressType = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'PostalAddress consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Fulfillment {
        public String fulfillmentOption {get;set;} 
        public String shipMethod {get;set;} 
        public Object storeId {get;set;} 
        public Long pickUpDateTime {get;set;} 
        public Object pickUpBy {get;set;} 
        
        public Fulfillment(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'fulfillmentOption') {
                            fulfillmentOption = parser.getText();
                        } else if (text == 'shipMethod') {
                            shipMethod = parser.getText();
                        } else if (text == 'storeId') {
                            storeId = parser.readValueAs(Object.class);
                        } else if (text == 'pickUpDateTime') {
                            pickUpDateTime = parser.getLongValue();
                        } else if (text == 'pickUpBy') {
                            pickUpBy = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Fulfillment consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Item {
        public String productName {get;set;} 
        public String sku {get;set;} 
        
        public Item(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'productName') {
                            productName = parser.getText();
                        } else if (text == 'sku') {
                            sku = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Item consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class List_Z {
        public Meta meta {get;set;} 
        public Elements elements {get;set;} 
        
        public List_Z(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'meta') {
                            meta = new Meta(parser);
                        } else if (text == 'elements') {
                            elements = new Elements(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'List_Z consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class OrderLine {
        public String lineNumber {get;set;} 
        public Item item {get;set;} 
        public Charges charges {get;set;} 
        public OrderLineQuantity orderLineQuantity {get;set;} 
        public Long statusDate {get;set;} 
        public OrderLineStatuses orderLineStatuses {get;set;} 
        public Object refund {get;set;} 
        public Fulfillment fulfillment {get;set;} 
        
        public OrderLine(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'lineNumber') {
                            lineNumber = parser.getText();
                        } else if (text == 'item') {
                            item = new Item(parser);
                        } else if (text == 'charges') {
                            charges = new Charges(parser);
                        } else if (text == 'orderLineQuantity') {
                            orderLineQuantity = new OrderLineQuantity(parser);
                        } else if (text == 'statusDate') {
                            statusDate = parser.getLongValue();
                        } else if (text == 'orderLineStatuses') {
                            orderLineStatuses = new OrderLineStatuses(parser);
                        } else if (text == 'refund') {
                            refund = parser.readValueAs(Object.class);
                        } else if (text == 'fulfillment') {
                            fulfillment = new Fulfillment(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'OrderLine consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class TrackingInfo {
        public Long shipDateTime {get;set;} 
        public CarrierName carrierName {get;set;} 
        public String methodCode {get;set;} 
        public Object carrierMethodCode {get;set;} 
        public String trackingNumber {get;set;} 
        public String trackingURL {get;set;} 
        
        public TrackingInfo(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'shipDateTime') {
                            shipDateTime = parser.getLongValue();
                        } else if (text == 'carrierName') {
                            carrierName = new CarrierName(parser);
                        } else if (text == 'methodCode') {
                            methodCode = parser.getText();
                        } else if (text == 'carrierMethodCode') {
                            carrierMethodCode = parser.readValueAs(Object.class);
                        } else if (text == 'trackingNumber') {
                            trackingNumber = parser.getText();
                        } else if (text == 'trackingURL') {
                            trackingURL = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'TrackingInfo consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class ShippingInfo {
        public String phone {get;set;} 
        public Long estimatedDeliveryDate {get;set;} 
        public Long estimatedShipDate {get;set;} 
        public String methodCode {get;set;} 
        public PostalAddress postalAddress {get;set;} 
        
        public ShippingInfo(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'phone') {
                            phone = parser.getText();
                        } else if (text == 'estimatedDeliveryDate') {
                            estimatedDeliveryDate = parser.getLongValue();
                        } else if (text == 'estimatedShipDate') {
                            estimatedShipDate = parser.getLongValue();
                        } else if (text == 'methodCode') {
                            methodCode = parser.getText();
                        } else if (text == 'postalAddress') {
                            postalAddress = new PostalAddress(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'ShippingInfo consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class Charges {
        public List<Charge> charge {get;set;} 
        
        public Charges(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'charge') {
                            charge = arrayOfCharge(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Charges consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public class OrderLineStatuses {
        public List<OrderLineStatus> orderLineStatus {get;set;} 
        
        public OrderLineStatuses(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'orderLineStatus') {
                            orderLineStatus = arrayOfOrderLineStatus(parser);
                        } else {
                            System.debug(LoggingLevel.WARN, 'OrderLineStatuses consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }  
    
    public static JSON2Apex parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return new JSON2Apex(parser);
    }
    
    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT || 
                curr == System.JSONToken.START_ARRAY) {
                    depth++;
                } else if (curr == System.JSONToken.END_OBJECT ||
                           curr == System.JSONToken.END_ARRAY) {
                               depth--;
                           }
        } while (depth > 0 && parser.nextToken() != null);
    }
    private static List<Charge> arrayOfCharge(System.JSONParser p) {
        List<Charge> res = new List<Charge>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Charge(p));
        }
        return res;
    }
    private static List<Order> arrayOfOrder(System.JSONParser p) {
        List<Order> res = new List<Order>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Order(p));
        }
        return res;
    }
    private static List<OrderLine> arrayOfOrderLine(System.JSONParser p) {
        List<OrderLine> res = new List<OrderLine>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new OrderLine(p));
        }
        return res;
    }
    private static List<OrderLineStatus> arrayOfOrderLineStatus(System.JSONParser p) {
        List<OrderLineStatus> res = new List<OrderLineStatus>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new OrderLineStatus(p));
        }
        return res;
    }
}