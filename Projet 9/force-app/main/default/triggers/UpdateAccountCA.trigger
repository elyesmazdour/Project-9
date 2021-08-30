trigger UpdateAccountCA on Order (before update,after update) {
    if(Trigger.isUpdate && Trigger.isAfter) {
        HandlerUpdateAccount.updateAccHandler(trigger.new);
    }
  /*  List<Order> orders = new List<Order>();
        for(Order order : trigger.new){
            if(order.Status == 'Ordered'){
                
                orders.add(order);
            }
        }
    */

}