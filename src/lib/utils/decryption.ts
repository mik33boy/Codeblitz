import CryptoJS from 'crypto-js';

const ENCRYPTION_KEY = 'Codeblits@2025Passkey!@';
const IV_LENGTH = 16; // AES IV length is 16 bytes

export function decryptMenuData(encryptedData: any): any {
    if (Array.isArray(encryptedData)) {
        return encryptedData.map(item => {
            const decryptedItem: any = {};
            for (const [key, value] of Object.entries(item)) {
                if (key === 'message') {
                    decryptedItem[key] = value; // Don't decrypt error messages
                } else {
                    decryptedItem[key] = decrypt(value);
                }
            }
            return decryptedItem;
        });
    } else if (typeof encryptedData === 'object' && encryptedData !== null && typeof encryptedData.message !== 'undefined') {
        // Handle single object response with potentially only a message
        return encryptedData;
    }
    return encryptedData; // Return as is if not an array or expected object
}

function decrypt(text: any): any {
    if (typeof text !== 'string' || text === '') {
        return text; // Return non-strings, empty strings, or null/undefined values as is
    }

    try {
        // Decode the Base64 string
        const decodedText = atob(text);
        
        // Separate IV and encrypted text
        const iv = CryptoJS.enc.Latin1.parse(decodedText.substring(0, IV_LENGTH));
        const encrypted = CryptoJS.enc.Latin1.parse(decodedText.substring(IV_LENGTH));
        
        // Decrypt
        const decrypted = CryptoJS.AES.decrypt(
            { ciphertext: encrypted }, // Pass ciphertext as WordArray object
            CryptoJS.enc.Utf8.parse(ENCRYPTION_KEY),
            {
                iv: iv,
                mode: CryptoJS.mode.CBC,
                padding: CryptoJS.pad.Pkcs7
            }
        );
        
        const result = decrypted.toString(CryptoJS.enc.Utf8);
        // Return the decrypted result, or the original text if result is empty (e.g., failed decryption)
        return result || text;
    } catch (error) {
        console.error('Decryption error for value:', text, ', Error:', error);
        return text; // Return original text if decryption fails (invalid format, wrong key, etc.)
    }
} 