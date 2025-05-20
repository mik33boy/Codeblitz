import { query } from './testUtils';

// Function to get total sales for a specific date
export async function getSalesByDate(date: string): Promise<any> {
  return query('SELECT * FROM `total_sales` WHERE date = ?', [date]);
}

// Function to get total sales amount for a specific date
export async function getTotalSalesAmountByDate(date: string): Promise<number> {
  const result = await query(
    'SELECT SUM(total_amount) as total FROM `total_sales` WHERE date = ?', 
    [date]
  );
  return result[0]?.total || 0;
}

// Function to get sales by cashier
export async function getSalesByCashier(cashierName: string): Promise<any> {
  return query('SELECT * FROM `total_sales` WHERE cashier_name = ?', [cashierName]);
}

// Function to get total sales amount by cashier
export async function getTotalSalesAmountByCashier(cashierName: string): Promise<number> {
  const result = await query(
    'SELECT SUM(total_amount) as total FROM `total_sales` WHERE cashier_name = ?', 
    [cashierName]
  );
  return result[0]?.total || 0;
}

// Function to get sales by date range
export async function getSalesByDateRange(startDate: string, endDate: string): Promise<any> {
  return query(
    'SELECT * FROM `total_sales` WHERE date >= ? AND date <= ?', 
    [startDate, endDate]
  );
}

// Function to get total sales amount by date range
export async function getTotalSalesAmountByDateRange(startDate: string, endDate: string): Promise<number> {
  const result = await query(
    'SELECT SUM(total_amount) as total FROM `total_sales` WHERE date >= ? AND date <= ?', 
    [startDate, endDate]
  );
  return result[0]?.total || 0;
}
