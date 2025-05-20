import mysql from 'mysql2/promise';

// Database connection configuration for tests
export const dbConfig = {
  host: 'localhost',
  user: 'root', // Default XAMPP username
  password: '', // Default XAMPP password
  database: 'sql12759808',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
};

// Create a connection pool
export const pool = mysql.createPool(dbConfig);

// Helper function to execute a query
export async function query(sql: string, params?: any[]): Promise<any> {
  try {
    const [rows] = await pool.execute(sql, params);
    return rows;
  } catch (error) {
    console.error('Database query error:', error);
    throw error;
  }
}

// Helper function to get a menu item by code
export async function getMenuItemByCode(code: string): Promise<any> {
  return query('SELECT * FROM `pos-menu` WHERE code = ?', [code]);
}

// Helper function to get all menu items
export async function getAllMenuItems(): Promise<any> {
  return query('SELECT * FROM `pos-menu`');
}

// Helper function to get orders
export async function getOrders(): Promise<any> {
  return query('SELECT * FROM `orders`');
}

// Helper function to get queued orders
export async function getQueuedOrders(): Promise<any> {
  return query('SELECT * FROM `que_orders`');
}

// Helper function to get total sales
export async function getTotalSales(): Promise<any> {
  return query('SELECT * FROM `total_sales`');
}

// Helper function to get staff information
export async function getStaffInfo(): Promise<any> {
  return query('SELECT * FROM `user-staff`');
}

// Helper function to close the connection pool
export async function closePool(): Promise<void> {
  await pool.end();
}
