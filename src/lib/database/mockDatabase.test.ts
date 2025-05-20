// This file demonstrates how to test database operations using mocks
// instead of connecting to a real database

// Mock the mysql2/promise module
jest.mock('mysql2/promise', () => {
  // Create a mock pool with execute method
  const mockPool = {
    execute: jest.fn(),
    end: jest.fn().mockResolvedValue(undefined)
  };
  
  // Return the mock implementation
  return {
    createPool: jest.fn().mockReturnValue(mockPool)
  };
});

// Import the modules to test
import mysql from 'mysql2/promise';
import { 
  query, 
  getAllMenuItems, 
  getMenuItemByCode,
  closePool
} from './testUtils';

// Get the mock pool
const mockPool = (mysql.createPool as jest.Mock)();

describe('Database Operations with Mocks', () => {
  beforeEach(() => {
    // Clear all mocks before each test
    jest.clearAllMocks();
  });

  afterAll(async () => {
    await closePool();
  });

  describe('query function', () => {
    it('should execute SQL queries correctly', async () => {
      // Setup the mock to return a specific result
      const mockResult = [[{ id: 1, name: 'Test Item' }]];
      mockPool.execute.mockResolvedValueOnce(mockResult);

      // Call the function
      const result = await query('SELECT * FROM test_table WHERE id = ?', [1]);

      // Verify the mock was called with the correct parameters
      expect(mockPool.execute).toHaveBeenCalledWith('SELECT * FROM test_table WHERE id = ?', [1]);
      
      // Verify the result
      expect(result).toEqual(mockResult[0]);
    });

    it('should handle errors correctly', async () => {
      // Setup the mock to throw an error
      const mockError = new Error('Database error');
      mockPool.execute.mockRejectedValueOnce(mockError);

      // Call the function and expect it to throw
      await expect(query('SELECT * FROM test_table')).rejects.toThrow('Database error');
    });
  });

  describe('getAllMenuItems function', () => {
    it('should retrieve all menu items', async () => {
      // Setup mock data
      const mockMenuItems = [
        { menu_no: 1, code: 'A001', title1: 'Chicken Finger Tamarind', label: 'Appetizer', price1: 305 },
        { menu_no: 2, code: 'A002', title1: 'Pork Chips with Pinakurat Sauce', label: 'Appetizer', price1: 200 }
      ];
      mockPool.execute.mockResolvedValueOnce([mockMenuItems]);

      // Call the function
      const result = await getAllMenuItems();

      // Verify the mock was called with the correct query
      expect(mockPool.execute).toHaveBeenCalledWith('SELECT * FROM `pos-menu`', undefined);
      
      // Verify the result
      expect(result).toEqual(mockMenuItems);
    });
  });

  describe('getMenuItemByCode function', () => {
    it('should retrieve a menu item by code', async () => {
      // Setup mock data
      const mockMenuItem = [
        { menu_no: 1, code: 'A001', title1: 'Chicken Finger Tamarind', label: 'Appetizer', price1: 305 }
      ];
      mockPool.execute.mockResolvedValueOnce([mockMenuItem]);

      // Call the function
      const result = await getMenuItemByCode('A001');

      // Verify the mock was called with the correct parameters
      expect(mockPool.execute).toHaveBeenCalledWith('SELECT * FROM `pos-menu` WHERE code = ?', ['A001']);
      
      // Verify the result
      expect(result).toEqual(mockMenuItem);
    });
  });
});
