import { 
  getSalesByDate,
  getTotalSalesAmountByDate,
  getSalesByCashier,
  getTotalSalesAmountByCashier,
  getSalesByDateRange,
  getTotalSalesAmountByDateRange
} from './salesOperations';
import { closePool } from './testUtils';

// Mock the testUtils module
jest.mock('./testUtils', () => {
  return {
    query: jest.fn(),
    closePool: jest.fn().mockResolvedValue(undefined)
  };
});

// Import the mocked query function
import { query } from './testUtils';

describe('Sales Operations', () => {
  beforeEach(() => {
    // Clear all mocks before each test
    jest.clearAllMocks();
  });

  afterAll(async () => {
    await closePool();
  });

  describe('getSalesByDate', () => {
    it('should retrieve sales for a specific date', async () => {
      // Setup mock data
      const mockSales = [
        { total_order: 524, receipt_number: '675', date: '2025-05-20', total_amount: 180 },
        { total_order: 525, receipt_number: '676', date: '2025-05-20', total_amount: 200 }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockSales);

      // Call the function
      const result = await getSalesByDate('2025-05-20');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith('SELECT * FROM `total_sales` WHERE date = ?', ['2025-05-20']);
      
      // Verify the result
      expect(result).toEqual(mockSales);
    });
  });

  describe('getTotalSalesAmountByDate', () => {
    it('should calculate total sales amount for a specific date', async () => {
      // Setup mock data
      const mockResult = [{ total: 380 }];
      (query as jest.Mock).mockResolvedValueOnce(mockResult);

      // Call the function
      const result = await getTotalSalesAmountByDate('2025-05-20');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        'SELECT SUM(total_amount) as total FROM `total_sales` WHERE date = ?', 
        ['2025-05-20']
      );
      
      // Verify the result
      expect(result).toBe(380);
    });

    it('should return 0 if no sales found for the date', async () => {
      // Setup mock data for no results
      const mockResult = [{ total: null }];
      (query as jest.Mock).mockResolvedValueOnce(mockResult);

      // Call the function
      const result = await getTotalSalesAmountByDate('2025-05-21');

      // Verify the result
      expect(result).toBe(0);
    });
  });

  describe('getSalesByCashier', () => {
    it('should retrieve sales for a specific cashier', async () => {
      // Setup mock data
      const mockSales = [
        { total_order: 524, receipt_number: '675', cashier_name: 'Michael', total_amount: 180 },
        { total_order: 525, receipt_number: '676', cashier_name: 'Michael', total_amount: 200 }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockSales);

      // Call the function
      const result = await getSalesByCashier('Michael');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith('SELECT * FROM `total_sales` WHERE cashier_name = ?', ['Michael']);
      
      // Verify the result
      expect(result).toEqual(mockSales);
    });
  });

  describe('getSalesByDateRange', () => {
    it('should retrieve sales for a date range', async () => {
      // Setup mock data
      const mockSales = [
        { total_order: 524, receipt_number: '675', date: '2025-05-20', total_amount: 180 },
        { total_order: 525, receipt_number: '676', date: '2025-05-21', total_amount: 200 }
      ];
      (query as jest.Mock).mockResolvedValueOnce(mockSales);

      // Call the function
      const result = await getSalesByDateRange('2025-05-20', '2025-05-21');

      // Verify the mock was called with the correct parameters
      expect(query).toHaveBeenCalledWith(
        'SELECT * FROM `total_sales` WHERE date >= ? AND date <= ?', 
        ['2025-05-20', '2025-05-21']
      );
      
      // Verify the result
      expect(result).toEqual(mockSales);
    });
  });
});
