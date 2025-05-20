import formValidator from "$lib/formValidator";

describe('Form Validator', () => {
  test("Check if form validator returns no error when provided with correct values", () => {
    expect(formValidator({ name: "Robert", age: 10 })).toStrictEqual({});
  });

  test("Check if form validator is a valid type", () => {
    expect(typeof formValidator({ name: "", age: 0 })).toBe("object");
  });
});
