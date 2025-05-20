import { query } from '../testUtils';

// 1. View incoming orders from waiters
export async function getIncomingOrders(): Promise<any> {
  return query(`
    SELECT * FROM que_orders 
    WHERE order_status = 'pending' 
    ORDER BY date DESC, time DESC
  `);
}

// 2. Get bill details for printing
export async function getBillDetails(receiptNumber: string): Promise<any> {
  return query(`
    SELECT * FROM total_sales 
    WHERE receipt_number = ?
  `, [receiptNumber]);
}

// 3. Split bill functionality
export async function splitBill(
  originalReceiptNumber: string, 
  splitItems: any[], 
  newReceiptNumber: string
): Promise<boolean> {
  try {
    // Start a transaction (this would need to be implemented in a real scenario)
    // 1. Create a new bill with the split items
    // 2. Update the original bill to remove the split items
    // 3. Commit the transaction
    
    // For testing purposes, we'll just simulate this with a query
    await query(`
      INSERT INTO total_sales (
        receipt_number, 
        date, 
        time, 
        cashier_name, 
        items_ordered, 
        total_amount, 
        amount_paid, 
        amount_change, 
        order_take, 
        table_number, 
        order_status, 
        waiter_name, 
        service_charge, 
        cashier_shift, 
        sales_code
      ) 
      SELECT 
        ?, 
        date, 
        time, 
        cashier_name, 
        ?, 
        ?, 
        0, 
        0, 
        order_take, 
        table_number, 
        'pending', 
        waiter_name, 
        service_charge, 
        cashier_shift, 
        sales_code
      FROM total_sales 
      WHERE receipt_number = ?
    `, [
      newReceiptNumber, 
      JSON.stringify(splitItems), 
      calculateTotalAmount(splitItems), 
      originalReceiptNumber
    ]);
    
    return true;
  } catch (error) {
    console.error('Error splitting bill:', error);
    return false;
  }
}

// Helper function to calculate total amount
function calculateTotalAmount(items: any[]): number {
  return items.reduce((total, item) => {
    const price = parseFloat(item.basePrice) || 0;
    const quantity = parseInt(item.order_quantity.replace('x', '')) || 1;
    return total + (price * quantity);
  }, 0);
}

// 4. Apply discount or coupon
export async function applyDiscount(
  receiptNumber: string, 
  discountType: string, 
  discountAmount: number
): Promise<boolean> {
  try {
    // Get the current bill
    const bills = await query(`
      SELECT * FROM total_sales 
      WHERE receipt_number = ?
    `, [receiptNumber]);
    
    if (!bills || bills.length === 0) {
      return false;
    }
    
    const bill = bills[0];
    const totalAmount = bill.total_amount;
    const discountValue = discountType === 'percentage' 
      ? (totalAmount * discountAmount / 100) 
      : discountAmount;
    
    // Update the bill with the discount
    await query(`
      UPDATE total_sales 
      SET discount_amount = ? 
      WHERE receipt_number = ?
    `, [discountValue, receiptNumber]);
    
    return true;
  } catch (error) {
    console.error('Error applying discount:', error);
    return false;
  }
}

// 5. Void or cancel transaction
export async function voidTransaction(
  receiptNumber: string, 
  managerApproval: string, 
  reason: string
): Promise<boolean> {
  try {
    // In a real implementation, you would verify the manager approval
    // For testing, we'll just check if it's provided
    if (!managerApproval) {
      return false;
    }
    
    // Update the transaction status
    await query(`
      UPDATE total_sales 
      SET order_status = 'voided', 
          void_reason = ?, 
          void_approval = ? 
      WHERE receipt_number = ?
    `, [reason, managerApproval, receiptNumber]);
    
    return true;
  } catch (error) {
    console.error('Error voiding transaction:', error);
    return false;
  }
}

// 6. Process payment
export async function processPayment(
  receiptNumber: string, 
  paymentType: string, 
  amountPaid: number
): Promise<any> {
  try {
    // Get the current bill
    const bills = await query(`
      SELECT * FROM total_sales 
      WHERE receipt_number = ?
    `, [receiptNumber]);
    
    if (!bills || bills.length === 0) {
      return { success: false, message: 'Bill not found' };
    }
    
    const bill = bills[0];
    const totalAmount = bill.total_amount;
    const discountAmount = bill.discount_amount || 0;
    const finalAmount = totalAmount - discountAmount;
    
    if (amountPaid < finalAmount) {
      return { success: false, message: 'Insufficient payment' };
    }
    
    const change = amountPaid - finalAmount;
    
    // Update the bill with payment information
    await query(`
      UPDATE total_sales 
      SET amount_paid = ?, 
          amount_change = ?, 
          payment_type = ?, 
          order_status = 'completed' 
      WHERE receipt_number = ?
    `, [amountPaid, change, paymentType, receiptNumber]);
    
    return { 
      success: true, 
      change, 
      paymentType, 
      amountPaid, 
      finalAmount 
    };
  } catch (error) {
    console.error('Error processing payment:', error);
    return { success: false, message: 'Error processing payment' };
  }
}

// 7. Reprint receipt
export async function getReceiptForReprint(receiptNumber: string): Promise<any> {
  return query(`
    SELECT * FROM total_sales 
    WHERE receipt_number = ?
  `, [receiptNumber]);
}

// 8. Issue refund
export async function issueRefund(
  receiptNumber: string, 
  refundAmount: number, 
  refundReason: string, 
  managerApproval: string
): Promise<boolean> {
  try {
    // In a real implementation, you would verify the manager approval
    if (!managerApproval) {
      return false;
    }
    
    // Record the refund
    await query(`
      INSERT INTO return_orders (
        receipt_number, 
        refund_amount, 
        refund_reason, 
        manager_approval, 
        refund_date, 
        refund_time
      ) VALUES (?, ?, ?, ?, CURDATE(), CURTIME())
    `, [receiptNumber, refundAmount, refundReason, managerApproval]);
    
    return true;
  } catch (error) {
    console.error('Error issuing refund:', error);
    return false;
  }
}

// 9. Close register and generate report
export async function closeRegister(
  cashierName: string, 
  shiftCode: string
): Promise<any> {
  try {
    // Get all sales for this cashier and shift
    const sales = await query(`
      SELECT * FROM total_sales 
      WHERE cashier_name = ? 
      AND cashier_shift = ? 
      AND date = CURDATE()
    `, [cashierName, shiftCode]);
    
    // Calculate totals
    const totalSales = sales.reduce((total: number, sale: any) => {
      if (sale.order_status === 'completed') {
        return total + (sale.total_amount - (sale.discount_amount || 0));
      }
      return total;
    }, 0);
    
    const salesByPaymentType = sales.reduce((acc: any, sale: any) => {
      if (sale.order_status === 'completed') {
        const paymentType = sale.payment_type || 'cash';
        acc[paymentType] = (acc[paymentType] || 0) + (sale.total_amount - (sale.discount_amount || 0));
      }
      return acc;
    }, {});
    
    // Record the end-of-day report
    await query(`
      INSERT INTO remit_sales (
        cashier_name, 
        total_sales, 
        remit_date, 
        remit_time, 
        remit_shortage, 
        remit_validation, 
        food_summary
      ) VALUES (?, ?, CURDATE(), CURTIME(), 0, 'Validated', ?)
    `, [cashierName, totalSales.toString(), JSON.stringify(sales)]);
    
    return {
      totalSales,
      salesByPaymentType,
      transactionCount: sales.filter((s: any) => s.order_status === 'completed').length,
      voidCount: sales.filter((s: any) => s.order_status === 'voided').length,
      date: new Date().toISOString().split('T')[0]
    };
  } catch (error) {
    console.error('Error closing register:', error);
    return null;
  }
}

// 10. Cashier login
export async function cashierLogin(
  email: string, 
  password: string
): Promise<any> {
  try {
    // In a real implementation, you would hash the password and compare
    // For testing, we'll just check if the email exists
    const users = await query(`
      SELECT * FROM \`user-staff\` 
      WHERE email = ?
    `, [email]);
    
    if (!users || users.length === 0) {
      return { success: false, message: 'User not found' };
    }
    
    // In a real implementation, you would verify the password
    // For testing, we'll just return the user
    const user = users[0];
    
    return { 
      success: true, 
      user: {
        id: user.staff_no,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        role: 'cashier'
      }
    };
  } catch (error) {
    console.error('Error during login:', error);
    return { success: false, message: 'Error during login' };
  }
}

// 11. View transactions
export async function getPendingTransactions(): Promise<any> {
  return query(`
    SELECT * FROM total_sales 
    WHERE order_status = 'pending' 
    ORDER BY date DESC, time DESC
  `);
}

export async function getCompletedTransactions(
  date?: string
): Promise<any> {
  const dateFilter = date ? 'AND date = ?' : '';
  const params = date ? [date] : [];
  
  return query(`
    SELECT * FROM total_sales 
    WHERE order_status = 'completed' 
    ${dateFilter}
    ORDER BY date DESC, time DESC
  `, params);
}

// 12. Mark bill as paid
export async function markBillAsPaid(
  receiptNumber: string, 
  paymentType: string, 
  amountPaid: number
): Promise<boolean> {
  try {
    // Get the current bill
    const bills = await query(`
      SELECT * FROM total_sales 
      WHERE receipt_number = ?
    `, [receiptNumber]);
    
    if (!bills || bills.length === 0) {
      return false;
    }
    
    const bill = bills[0];
    const totalAmount = bill.total_amount;
    const discountAmount = bill.discount_amount || 0;
    const finalAmount = totalAmount - discountAmount;
    const change = amountPaid - finalAmount;
    
    // Update the bill status
    await query(`
      UPDATE total_sales 
      SET order_status = 'completed', 
          payment_type = ?, 
          amount_paid = ?, 
          amount_change = ? 
      WHERE receipt_number = ?
    `, [paymentType, amountPaid, change, receiptNumber]);
    
    return true;
  } catch (error) {
    console.error('Error marking bill as paid:', error);
    return false;
  }
}

// 13. Get waiter notes
export async function getWaiterNotes(receiptNumber: string): Promise<any> {
  return query(`
    SELECT * FROM que_orders 
    WHERE receipt_number = ?
  `, [receiptNumber]);
}
