import 'package:medicine_project/controller/global_state.dart';
import 'package:medicine_project/utils/screen_names.dart';
import 'package:medicine_project/view/add_customer.dart';
import 'package:medicine_project/view/add_stock.dart';
import 'package:medicine_project/view/customer_list.dart';
import 'package:medicine_project/view/payment.dart';
import 'package:medicine_project/view/stock_table.dart';
import 'package:medicine_project/view/update_customer.dart';
import 'package:medicine_project/view/update_stock.dart';
import 'package:medicine_project/view/view_stock.dart';

import 'components/table_widgets.dart';
import 'customer_history_screen.dart';
import 'invoice_review_screen.dart';
import 'invoice_section_screen.dart';

selectedFragment({isOpen, size, screen}) {
  if (screen == DASHBOARD) {
    return StackTable(
      isOpen: isOpen,
      size: size,
    );
  } else if (screen == ADDCUSTOMER) {
    return AddCustomerScreen(
      isOpen: isOpen,
    );
  } else if (screen == INVOICESECTION) {
    return invoice(
      isOpen: isOpen,
    );
  } 
  else if(screen==PAYMENTSECTION){
    return PaymentTable(isOpen: isOpen);
  }
  else if (screen == INVOICEREVIEW) {
    return InvoiceReviewScreen(
      isOpen: isOpen,
    );
  } else if (screen == CUSTOMER) {
    return customerListScreen(
      isOpen: isOpen,
    );
  }
  else if (screen == CUSTOMERHISTORY) {
    return customerHistory();
  } else if (screen == CUSTOMERUPDATE) {
    return UpdateCustomerScreen();
  } else if (screen == VIEWSTOCK) {
    return viewStock();
  }
  else if (screen == ADDSTOCK) {
    return AddStock(
      isOpen: isOpen,
    );
  } else if (screen == UPDATESTOCK) {
    return UpdateStock(
      isOpen: isOpen,
    );
  } else if ( screen == PAYMENTTABLE){
    print("finded=============");
    return PaymentTable(
      isOpen: isOpen,
      size: size,
    );
    
  }
   else {
    return StackTable(
      isOpen: isOpen,
      size: size,
    );
  }
}
