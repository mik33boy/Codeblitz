import {
  pool,
  query,
  getAllMenuItems,
  getMenuItemByCode,
  getOrders,
  getQueuedOrders,
  getTotalSales,
  getStaffInfo,
  closePool
} from './testUtils';

// Setup and teardown
beforeAll(async () => {
  // Any setup needed before all tests
  console.log('Starting database tests');
});

afterAll(async () => {
  // Close the database connection after all tests
  await closePool();
  console.log('Database connection closed');
});

// Test database connection
describe('Database Connection', () => {
  it('should connect to the database', async () => {
    // Simple query to test connection
    const result = await query('SELECT 1 as value');
    expect(result).toBeDefined();
    expect(Array.isArray(result)).toBe(true);
    expect(result[0].value).toBe(1);
  });
});

// Test menu items
describe('Menu Items', () => {
  it('should retrieve all menu items', async () => {
    const menuItems = await getAllMenuItems();
    expect(menuItems).toBeDefined();
    expect(Array.isArray(menuItems)).toBe(true);
    // Check if we have menu items in the database
    expect(menuItems.length).toBeGreaterThan(0);
  });

  it('should retrieve a specific menu item by code', async () => {
    // Using a known menu item code from the database
    const code = 'A001'; // Chicken Finger Tamarind
    const menuItem = await getMenuItemByCode(code);
    expect(menuItem).toBeDefined();
    expect(Array.isArray(menuItem)).toBe(true);
    expect(menuItem.length).toBeGreaterThan(0);
    expect(menuItem[0].code).toBe(code);
    expect(menuItem[0].title1).toBe('Chicken Finger Tamarind');
  });
});

// Test orders
describe('Orders', () => {
  it('should retrieve all orders', async () => {
    const orders = await getOrders();
    expect(orders).toBeDefined();
    expect(Array.isArray(orders)).toBe(true);
  });

  it('should retrieve all queued orders', async () => {
    const queuedOrders = await getQueuedOrders();
    expect(queuedOrders).toBeDefined();
    expect(Array.isArray(queuedOrders)).toBe(true);
  });
});

// Test total sales
describe('Sales', () => {
  it('should retrieve all sales records', async () => {
    const sales = await getTotalSales();
    expect(sales).toBeDefined();
    expect(Array.isArray(sales)).toBe(true);
  });
});

// Test staff information
describe('Staff', () => {
  it('should retrieve all staff information', async () => {
    const staff = await getStaffInfo();
    expect(staff).toBeDefined();
    expect(Array.isArray(staff)).toBe(true);
    // Check if we have staff in the database
    expect(staff.length).toBeGreaterThan(0);
  });
});

// Test a more complex query
describe('Complex Queries', () => {
  it('should retrieve menu items with specific criteria', async () => {
    // Get all appetizers
    const appetizers = await query('SELECT * FROM `pos-menu` WHERE label = ?', ['Appetizer']);
    expect(appetizers).toBeDefined();
    expect(Array.isArray(appetizers)).toBe(true);
    expect(appetizers.length).toBeGreaterThan(0);
    // Check if all retrieved items are appetizers
    appetizers.forEach((item: any) => {
      expect(item.label).toBe('Appetizer');
    });
  });
});
