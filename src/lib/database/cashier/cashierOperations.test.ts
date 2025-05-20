import {
  getIncomingOrders,
  getBillDetails,
  splitBill,
  applyDiscount,
  voidTransaction,
  processPayment,
  getReceiptForReprint,
  issueRefund,
  closeRegister,
  cashierLogin,
  getPendingTransactions,
  getCompletedTransactions,
  markBillAsPaid,
  getWaiterNotes
} from './cashierOperations';

// Mock the testUtils module
jest.mock('../testUtils', () => {
  return {
    query: jest.fn(),
    closePool: jest.fn().mockResolvedValue(undefined)
  };
});

// Import the mocked query function
import { query } from '../testUtils';

describe('Cashier Operations', () => {
  beforeEach(() => {
    // Clear all mocks before each test
    jest.clearAllMocks();
  });

  // 1. View incoming orders from waiters
  describe('getIncomingOrders', () => {
    it('should retrieve pending orders', async () => {
      // Setup mock data
      const mockOrders = [
        { que_order_no: 1, receipt_number: '123', order_status: 'pending', table_number: '5' },
        { que_order_no: 2, receipt_number: '124', order_status: 'pending', table_number: '7' }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockOrders);

      // Call the function
      const result = await getIncomingOrders();

      // Verify the query function was called
      expect(query).toHaveBeenCalled();

      // Verify the result
      expect(result).toEqual(mockOrders);
    });
  });

  // 2. Print customer bills
  describe('getBillDetails', () => {
    it('should retrieve bill details for a specific receipt number', async () => {
      // Setup mock data
      const mockBill = [
        {
          total_order: 524,
          receipt_number: '675',
          total_amount: 180,
          items_ordered: '[{"order_name":"Kangkong Chips w/ Pinakurat","order_quantity":"x1","basePrice":180}]'
        }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockBill);

      // Call the function
      const result = await getBillDetails('675');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        expect.stringContaining('SELECT * FROM total_sales'),
        ['675']
      );

      // Verify the result
      expect(result).toEqual(mockBill);
    });
  });

  // 3. Split bill functionality
  describe('splitBill', () => {
    it('should split a bill into two separate bills', async () => {
      // Setup mock data
      const splitItems = [
        { order_name: 'Kangkong Chips w/ Pinakurat', order_quantity: 'x1', basePrice: 180 }
      ];
      (query as jest.Mock).mockResolvedValueOnce({ affectedRows: 1 });

      // Call the function
      const result = await splitBill('675', splitItems, '676');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        expect.stringContaining('INSERT INTO total_sales'),
        expect.arrayContaining(['676'])
      );

      // Verify the result
      expect(result).toBe(true);
    });
  });

  // 4. Apply discount or coupon
  describe('applyDiscount', () => {
    it('should apply a percentage discount to a bill', async () => {
      // Setup mock data
      const mockBill = [
        { total_order: 524, receipt_number: '675', total_amount: 200 }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockBill);
      (query as jest.Mock).mockResolvedValueOnce({ affectedRows: 1 });

      // Call the function
      const result = await applyDiscount('675', 'percentage', 10);

      // Verify the mocks were called with the correct parameters
      expect(query).toHaveBeenNthCalledWith(
        1,
        expect.stringContaining('SELECT * FROM total_sales'),
        ['675']
      );
      expect(query).toHaveBeenNthCalledWith(
        2,
        expect.stringContaining('UPDATE total_sales'),
        [20, '675'] // 10% of 200 = 20
      );

      // Verify the result
      expect(result).toBe(true);
    });

    it('should apply a fixed amount discount to a bill', async () => {
      // Setup mock data
      const mockBill = [
        { total_order: 524, receipt_number: '675', total_amount: 200 }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockBill);
      (query as jest.Mock).mockResolvedValueOnce({ affectedRows: 1 });

      // Call the function
      const result = await applyDiscount('675', 'fixed', 15);

      // Verify the mocks were called with the correct parameters
      expect(query).toHaveBeenNthCalledWith(
        1,
        expect.stringContaining('SELECT * FROM total_sales'),
        ['675']
      );
      expect(query).toHaveBeenNthCalledWith(
        2,
        expect.stringContaining('UPDATE total_sales'),
        [15, '675'] // Fixed discount of 15
      );

      // Verify the result
      expect(result).toBe(true);
    });
  });

  // 5. Void or cancel transaction
  describe('voidTransaction', () => {
    it('should void a transaction with manager approval', async () => {
      // Setup mock data
      (query as jest.Mock).mockResolvedValueOnce({ affectedRows: 1 });

      // Call the function
      const result = await voidTransaction('675', 'MANAGER123', 'Customer changed mind');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        expect.stringContaining('UPDATE total_sales'),
        ['Customer changed mind', 'MANAGER123', '675']
      );

      // Verify the result
      expect(result).toBe(true);
    });

    it('should not void a transaction without manager approval', async () => {
      // Call the function
      const result = await voidTransaction('675', '', 'Customer changed mind');

      // Verify the mock was not called
      expect(query).not.toHaveBeenCalled();

      // Verify the result
      expect(result).toBe(false);
    });
  });

  // 6. Process payment
  describe('processPayment', () => {
    it('should process a cash payment successfully', async () => {
      // Setup mock data
      const mockBill = [
        {
          total_order: 524,
          receipt_number: '675',
          total_amount: 200,
          discount_amount: 20
        }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockBill);
      (query as jest.Mock).mockResolvedValueOnce({ affectedRows: 1 });

      // Call the function
      const result = await processPayment('675', 'cash', 200);

      // Verify the mocks were called with the correct parameters
      expect(query).toHaveBeenNthCalledWith(
        1,
        expect.stringContaining('SELECT * FROM total_sales'),
        ['675']
      );
      expect(query).toHaveBeenNthCalledWith(
        2,
        expect.stringContaining('UPDATE total_sales'),
        [200, 20, 'cash', '675'] // amount_paid, change, payment_type, receipt_number
      );

      // Verify the result
      expect(result.success).toBe(true);
      expect(result.change).toBe(20); // 200 paid - (200 total - 20 discount) = 20 change
    });

    it('should reject payment if amount is insufficient', async () => {
      // Setup mock data
      const mockBill = [
        {
          total_order: 524,
          receipt_number: '675',
          total_amount: 200,
          discount_amount: 0
        }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockBill);

      // Call the function
      const result = await processPayment('675', 'cash', 150);

      // Verify only the first query was called
      expect(query).toHaveBeenCalledTimes(1);

      // Verify the result
      expect(result.success).toBe(false);
      expect(result.message).toBe('Insufficient payment');
    });
  });

  // 7. Reprint receipt
  describe('getReceiptForReprint', () => {
    it('should retrieve receipt details for reprinting', async () => {
      // Setup mock data
      const mockReceipt = [
        {
          total_order: 524,
          receipt_number: '675',
          total_amount: 180,
          items_ordered: '[{"order_name":"Kangkong Chips w/ Pinakurat","order_quantity":"x1","basePrice":180}]'
        }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockReceipt);

      // Call the function
      const result = await getReceiptForReprint('675');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        expect.stringContaining('SELECT * FROM total_sales'),
        ['675']
      );

      // Verify the result
      expect(result).toEqual(mockReceipt);
    });
  });

  // 8. Issue refund
  describe('issueRefund', () => {
    it('should issue a refund with manager approval', async () => {
      // Setup mock data
      (query as jest.Mock).mockResolvedValueOnce({ affectedRows: 1 });

      // Call the function
      const result = await issueRefund('675', 50, 'Food quality issue', 'MANAGER123');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        expect.stringContaining('INSERT INTO return_orders'),
        ['675', 50, 'Food quality issue', 'MANAGER123']
      );

      // Verify the result
      expect(result).toBe(true);
    });

    it('should not issue a refund without manager approval', async () => {
      // Call the function
      const result = await issueRefund('675', 50, 'Food quality issue', '');

      // Verify the mock was not called
      expect(query).not.toHaveBeenCalled();

      // Verify the result
      expect(result).toBe(false);
    });
  });

  // 9. Close register and generate report
  describe('closeRegister', () => {
    it('should close the register and generate a sales report', async () => {
      // Setup mock data
      const mockSales = [
        {
          total_order: 524,
          receipt_number: '675',
          total_amount: 180,
          discount_amount: 0,
          order_status: 'completed',
          payment_type: 'cash'
        },
        {
          total_order: 525,
          receipt_number: '676',
          total_amount: 200,
          discount_amount: 20,
          order_status: 'completed',
          payment_type: 'card'
        },
        {
          total_order: 526,
          receipt_number: '677',
          total_amount: 150,
          discount_amount: 0,
          order_status: 'voided',
          payment_type: null
        }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockSales);
      (query as jest.Mock).mockResolvedValueOnce({ affectedRows: 1 });

      // Call the function
      const result = await closeRegister('Michael', 'DEFAULT001');

      // Verify the mocks were called with the correct parameters
      expect(query).toHaveBeenNthCalledWith(
        1,
        expect.stringContaining('SELECT * FROM total_sales'),
        ['Michael', 'DEFAULT001']
      );
      expect(query).toHaveBeenNthCalledWith(
        2,
        expect.stringContaining('INSERT INTO remit_sales'),
        ['Michael', '360', expect.any(String)] // 180 + (200 - 20) = 360
      );

      // Verify the result
      expect(result).toBeDefined();
      expect(result.totalSales).toBe(360);
      expect(result.salesByPaymentType).toEqual({ cash: 180, card: 180 });
      expect(result.transactionCount).toBe(2);
      expect(result.voidCount).toBe(1);
    });
  });

  // 10. Cashier login
  describe('cashierLogin', () => {
    it('should authenticate a cashier with valid credentials', async () => {
      // Setup mock data
      const mockUser = [
        {
          staff_no: 50,
          firstName: 'Michael',
          lastName: 'Dayandante',
          email: 'mike@gmail.com'
        }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockUser);

      // Call the function
      const result = await cashierLogin('mike@gmail.com', 'password');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        expect.stringContaining('SELECT * FROM `user-staff`'),
        ['mike@gmail.com']
      );

      // Verify the result
      expect(result.success).toBe(true);
      expect(result.user).toBeDefined();
      expect(result.user.firstName).toBe('Michael');
    });

    it('should reject login with invalid email', async () => {
      // Setup mock data
      (query as jest.Mock).mockResolvedValueOnce([]);

      // Call the function
      const result = await cashierLogin('invalid@gmail.com', 'password');

      // Verify the result
      expect(result.success).toBe(false);
      expect(result.message).toBe('User not found');
    });
  });

  // 11. View transactions
  describe('getPendingTransactions', () => {
    it('should retrieve all pending transactions', async () => {
      // Setup mock data
      const mockTransactions = [
        { total_order: 524, receipt_number: '675', order_status: 'pending' },
        { total_order: 525, receipt_number: '676', order_status: 'pending' }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockTransactions);

      // Call the function
      const result = await getPendingTransactions();

      // Verify the query function was called
      expect(query).toHaveBeenCalled();

      // Verify the result
      expect(result).toEqual(mockTransactions);
    });
  });

  describe('getCompletedTransactions', () => {
    it('should retrieve all completed transactions for a specific date', async () => {
      // Setup mock data
      const mockTransactions = [
        { total_order: 524, receipt_number: '675', order_status: 'completed', date: '2025-05-20' },
        { total_order: 525, receipt_number: '676', order_status: 'completed', date: '2025-05-20' }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockTransactions);

      // Call the function
      const result = await getCompletedTransactions('2025-05-20');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        expect.stringContaining('SELECT * FROM total_sales'),
        ['2025-05-20']
      );

      // Verify the result
      expect(result).toEqual(mockTransactions);
    });
  });

  // 12. Mark bill as paid
  describe('markBillAsPaid', () => {
    it('should mark a bill as paid', async () => {
      // Setup mock data
      const mockBill = [
        { total_order: 524, receipt_number: '675', total_amount: 200, discount_amount: 0 }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockBill);
      (query as jest.Mock).mockResolvedValueOnce({ affectedRows: 1 });

      // Call the function
      const result = await markBillAsPaid('675', 'cash', 200);

      // Verify the mocks were called with the correct parameters
      expect(query).toHaveBeenNthCalledWith(
        1,
        expect.stringContaining('SELECT * FROM total_sales'),
        ['675']
      );
      expect(query).toHaveBeenNthCalledWith(
        2,
        expect.stringContaining('UPDATE total_sales'),
        ['cash', 200, 0, '675'] // payment_type, amount_paid, change, receipt_number
      );

      // Verify the result
      expect(result).toBe(true);
    });
  });

  // 13. Get waiter notes
  describe('getWaiterNotes', () => {
    it('should retrieve waiter notes for a specific receipt', async () => {
      // Setup mock data
      const mockNotes = [
        {
          que_order_no: 683,
          receipt_number: '977002',
          items_ordered: '[{"order_name":"Salt and Pepper Fish Fillet","order_name2":"","order_quantity":"x1","order_size":"Regular","order_addons_price":"0","order_addons_price2":"0","order_addons_price3":"0","basePrice":300,"delivered":"0"}]',
          waiter_name: 'Michael',
          waiter_code: 'MD9915'
        }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockNotes);

      // Call the function
      const result = await getWaiterNotes('977002');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        expect.stringContaining('SELECT * FROM que_orders'),
        ['977002']
      );

      // Verify the result
      expect(result).toEqual(mockNotes);
    });
  });
});
