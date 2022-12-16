//function Validatename(form)
//{
//         var idstr=form["formaddcust:customerName"].value;
//         var nameformat =/^([a-zA-Z]+(.)?[\s]*)$/;
//
//          if(idstr.match(nameformat))
//          {		
//        	  document.getElementById("customerNameErrorMessage").innerHTML = "";
//               return true;
//                 }
//               else
//                 {
//                 document.getElementById("customerNameErrorMessage").innerHTML = "CustomerNameErrorMessage";
//                 
//                 return false;
//                 }
//
//       }
//function Validatephone(form)
//{
//	var indstr=form["formaddcust:customerPhoneNo"].value;
//	var phnformat =/^\d{10}$/;
//	
//	if(indstr.match(phnformat))
//	{		
//		document.getElementById("customerPhoneErrorMessage").innerHTML = "";
//		return true;
//	}
//	else
//	{
//		document.getElementById("customerPhoneErrorMessage").innerHTML = "Customer Phone Number is Not Valid";
//		
//		return false;
//	}
//	
//}
//function Validateuser(form)
//{
//	var idstr=form["formaddcust:userName"].value;
//	var userformat =/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
//	
//	if(idstr.match(userformat))
//	{		
//		document.getElementById("usernamemsg").innerHTML = "";
//		return true;
//	}
//	else
//	{
//		document.getElementById("usernamemsg").innerHTML = "UserName Format is Not Valid";
//		
//		return false;
//	}
//	
//}
//
//function Validatepwd(form)
//{
//	var idstr=form["formaddcust:passcode"].value;
//	var pwdformat =/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
//	
//	if(idstr.match(pwdformat))
//	{		
//		document.getElementById("pwdmsg").innerHTML = "";
//		return true;
//	}
//	else
//	{
//		document.getElementById("pwdmsg").innerHTML = "Password Format is Not Valid";
//		
//		return false;
//	}
//	
//}
//function Validateadd1(form)
//{
//	var idstr=form["formaddcust:address1"].value;
//	var add1format =/^[#.0-9a-zA-Z\s,-]+$/;
//	
//	if(idstr.match(add1format))
//	{		
//		document.getElementById("addmsg").innerHTML = "";
//		return true;
//	}
//	else
//	{
//		document.getElementById("addmsg").innerHTML = "Address 1 Format is Not Valid";
//		
//		return false;
//	}
//	
//}
//function Validateadd2(form)
//{
//	var idstr=form["formaddcust:address2"].value;
//	var add2format =/^[#.0-9a-zA-Z\s,-]+$/;
//	
//	if(idstr.match(add1format))
//	{		
//		document.getElementById("add2msg").innerHTML = "";
//		return true;
//	}
//	else
//	{
//		document.getElementById("add2msg").innerHTML = "Address 2 Format is Not Valid";
//		
//		return false;
//	}
//	
//}
//function Validatecity(form)
//{
//	var idstr=form["formaddcust:address"].value;
//	var cityformat =/^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$/;
//	
//	if(idstr.match(cityformat))
//	{		
//		document.getElementById("citymsg").innerHTML = "";
//		return true;
//	}
//	else
//	{
//		document.getElementById("citymsg").innerHTML = "City Format is Not Valid";
//		
//		return false;
//	}
//	
//}
//function Validatezip(form)
//{
//	var idstr=form["formaddcust:zipcode"].value;
//	var zipformat =/^\d{6}$/;
//	
//	if(idstr.match(zipformat))
//	{		
//		document.getElementById("zipmsg").innerHTML = "";
//		return true;
//	}
//	else
//	{
//		document.getElementById("zipmsg").innerHTML = "Zipcode Format is Not Valid";
//		return false;
//	}
//	
//}
//function Validateitemname(form)
//{
//         var idstr=form["formaddstock:itemName"].value;
//         var nameformat =/^([a-zA-Z]+(.)?[\s]*)$/;
//
//          if(idstr.match(nameformat))
//          {		
//        	  document.getElementById("itemerror").innerHTML = "";
//               return true;
//                 }
//               else
//                 {
//                 document.getElementById("itemerror").innerHTML = "Item Name is not in Proper Format";
//                 
//                 return false;
//                 }
//
//       }
//function Validateprice(form)
//{
//	var idstr=form["formaddstock:price"].value;
//	var nameformat =/^\d/;
//	
//	if(idstr.match(nameformat))
//	{		
//		document.getElementById("pricerror").innerHTML = "";
//		return true;
//	}
//	else
//	{
//		document.getElementById("pricerror").innerHTML = "Price is not in Proper Format";
//		
//		return false;
//	}
//	
//}
//function Validatequan(form)
//{
//	var idstr=form["formaddstock:quantityAvail"].value;
//	var nameformat =/^\d/;
//	
//	if(idstr.match(nameformat))
//	{		
//		document.getElementById("quanerror").innerHTML = "";
//		return true;
//	}
//	else
//	{
//		document.getElementById("quanerror").innerHTML = "Quantity is not in Proper Format";
//		
//		return false;
//	}
//	
//}
