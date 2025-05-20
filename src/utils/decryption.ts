import CryptoJS from 'crypto-js';

export default class Decryption {
    private static readonly KEY = 'Codeblitz@2025Secretkey!@';

    /**
     * Decrypts data that was encrypted by the PHP backend
     * @param encryptedData - The encrypted data in base64 format
     * @returns The decrypted data
     */
    static decrypt(encryptedData: string): any {
        try {
            // Decode base64 to binary string
            const rawData = atob(encryptedData);
            
            // Extract IV (first 16 bytes) from the binary string and parse as WordArray
            const iv = CryptoJS.enc.Latin1.parse(rawData.slice(0, 16));
            
            // Extract ciphertext from the binary string and parse as WordArray
            const ciphertext = CryptoJS.enc.Latin1.parse(rawData.slice(16));
            
            // Decrypt
            const decrypted = CryptoJS.AES.decrypt(
                ciphertext,
                CryptoJS.enc.Utf8.parse(this.KEY),
                {
                    iv: iv,
                    mode: CryptoJS.mode.CBC,
                    padding: CryptoJS.pad.Pkcs7
                }
            );
            
            // Convert to string and parse JSON. This expects the decrypted data to be UTF-8 JSON.
            const decryptedStr = decrypted.toString(CryptoJS.enc.Utf8);
            return JSON.parse(decryptedStr);
        } catch (error) {
            console.error('Decryption error:', error);
            // Re-throw the error with a more specific message
            throw new Error('Failed to decrypt data. Check key, IV, or data format.');
        }
    }
} 