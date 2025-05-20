# Database Testing with Jest

This directory contains utilities and tests for the database operations in the application.

## Overview

The database testing setup includes:

1. **testUtils.ts**: Contains utility functions for database operations
2. **database.test.ts**: Tests that connect to a real database
3. **mockDatabase.test.ts**: Tests that use mocks to test database operations
4. **salesOperations.ts**: Example of database operations for sales data
5. **salesOperations.test.ts**: Tests for the sales operations using mocks

## Running Tests

### Running All Tests

```bash
npm test
```

### Running Only Mock Tests

```bash
npx jest src/lib/database/mockDatabase.test.ts src/lib/database/salesOperations.test.ts
```

### Running Only Real Database Tests

```bash
npx jest src/lib/database/database.test.ts
```

## Test Types

### Mock Tests

Mock tests don't require a real database connection. They use Jest's mocking capabilities to simulate database operations. These tests are useful for:

- Testing the logic of database operations without a real database
- Testing error handling
- Fast and reliable testing during development

### Real Database Tests

Real database tests connect to an actual database. These tests are useful for:

- Testing the actual database schema
- Testing complex queries
- Integration testing with the real database

## Database Configuration

The database configuration is in `testUtils.ts`. Update this file if you need to change the database connection settings.

```typescript
export const dbConfig = {
  host: 'localhost',
  user: 'root', // Default XAMPP username
  password: '', // Default XAMPP password
  database: 'sql12759808',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
};
```

## Writing New Tests

### Writing Mock Tests

1. Import the functions you want to test
2. Mock the `query` function from `testUtils.ts`
3. Set up the expected return values for the mocked functions
4. Test your functions with the mocked data

Example:

```typescript
// Mock the testUtils module
jest.mock('./testUtils', () => {
  return {
    query: jest.fn(),
    closePool: jest.fn().mockResolvedValue(undefined)
  };
});

// Import the mocked query function
import { query } from './testUtils';

describe('My Test Suite', () => {
  beforeEach(() => {
    // Clear all mocks before each test
    jest.clearAllMocks();
  });

  it('should test something', async () => {
    // Setup mock data
    const mockData = [{ id: 1, name: 'Test' }];
    (query as jest.Mock).mockResolvedValueOnce(mockData);

    // Call the function you want to test
    const result = await myFunction();

    // Verify the mock was called with the correct parameters
    expect(query).toHaveBeenCalledWith('SELECT * FROM my_table', []);
    
    // Verify the result
    expect(result).toEqual(mockData);
  });
});
```

### Writing Real Database Tests

1. Import the functions you want to test from `testUtils.ts`
2. Write tests that use these functions to interact with the database
3. Make sure the database is properly set up with the required tables and data

Example:

```typescript
import { query, closePool } from './testUtils';

describe('My Test Suite', () => {
  afterAll(async () => {
    // Close the database connection after all tests
    await closePool();
  });

  it('should test something with the real database', async () => {
    // Execute a query against the real database
    const result = await query('SELECT * FROM my_table WHERE id = ?', [1]);
    
    // Verify the result
    expect(result).toBeDefined();
    expect(Array.isArray(result)).toBe(true);
    // Add more assertions as needed
  });
});
```
