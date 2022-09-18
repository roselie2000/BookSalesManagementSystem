function member(msg,clk) {
   let confirmBox = $("#container");
   confirmBox.find(".msg").text(msg);
   confirmBox.find(".yes").unbind().click(function()
   {
   confirmBox.hide();
   });
   confirmBox.find(".yes").click(clk);
   confirmBox.show();
  }