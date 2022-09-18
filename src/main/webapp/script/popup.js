function member(msg,clk) {
   var confirmBox = $("#container");
   confirmBox.find(".msg").text(msg);
   confirmBox.find(".yes").unbind().click(function()
   {
   confirmBox.hide();
   });
   confirmBox.find(".yes").click(clk);
   confirmBox.show();
  }