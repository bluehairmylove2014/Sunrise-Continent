// Service
import { loginApi, checkLoginApi } from './API';
// Encode support
import { SHA256 } from "crypto-js";
// Constants
import { VARIABLES } from '../constants/Variables.constants';


/**
 * Service class for managing user accounts and authentication.
 * This service follows the Singleton design pattern to provide a single instance across the application.
 */
class AuthService {
    static instance = null;
    authorizeToken = null;

    /**
     * Get the singleton instance of UserService.
     * @returns {AuthService} The instance of UserService.
     */
    static getInstance() {
        if (!AuthService.instance) {
            AuthService.instance = new AuthService();
        }
        return AuthService.instance;
    }

    /**
     * Login function.
     * Sends a login request to the server and handles the server response.
     * If the login is successful, stores the user account in `currentUser`.
     * @param {string} email - The user's email.
     * @param {string} password - The user's password.
     */
    login(email, password) {
        // Send login request to the server
        // Handle the server response
        // Store the user account in `currentUser` if login is successful

        let hashPsw = SHA256(password).toString();

        return new Promise((resolve, reject) => {
            loginApi(email, hashPsw)
                .then(res => {
                    if (!res.ok) {
                        throw new Error(res.status);
                    }
                    return res.json();
                })
                .then(data => {
                    this.authorizeToken = data.token;
                    localStorage.setItem(VARIABLES.AUTH_TOKEN_LSKEY, data.token);
                    resolve(data.status_code);
                })
                .catch(error => {
                    // Check if error message is a number (which would mean it's a status code)
                    const statusCode = parseInt(error.message, 10);
                    if (!isNaN(statusCode)) {
                        resolve({ status_code: statusCode });
                    } else {
                        reject(error);
                    }
                })
        })
    }

    /**
     * Logout function.
     * Clears the exist token.
     */
    logout() {
        this.authorizeToken = null;
        localStorage.removeItem(VARIABLES.AUTH_TOKEN_LSKEY);
        window.location.reload();
    }

    /**
     * Register function.
     * Sends a registration request to the server and handles the server response.
     * If the registration is successful, stores the user account in `currentUser`.
     * @param {string} email - The user's email.
     * @param {string} password - The user's password.
     */
    register(email, password) {
        // Send registration request to the server
        // Handle the server response
        // Store the user account in `currentUser` if registration is successful

        let hashPsw = SHA256(password).toString();

        return new Promise((resolve, reject) => {
            loginApi(email, hashPsw)
                .then(res => {
                    if (!res.ok) {
                        throw new Error(res.status);
                    }
                    return res.json();
                })
                .then(data => {
                    this.authorizeToken = data.token;
                    localStorage.setItem(VARIABLES.AUTH_TOKEN_LSKEY, data.token);
                    resolve(data.status_code);
                })
                .catch(error => {
                    // Check if error message is a number (which would mean it's a status code)
                    const statusCode = parseInt(error.message, 10);
                    if (!isNaN(statusCode)) {
                        resolve({ status_code: statusCode });
                    } else {
                        reject(error);
                    }
                })
        })
    }

    /**
     * Check if the user is logged in.
     * @returns {boolean} True if the user is logged in, false otherwise.
     */
    isLoggedIn() {
        return new Promise((resolve, reject) => {
            const authToken = this.getAuthToken();
            if (!authToken) {
                resolve({ status_code: 403 });
            }
            else {
                checkLoginApi(authToken)
                    .then(res => {
                        if (!res.ok) {
                            throw new Error(res.status);
                        }
                        return res.json();
                    })
                    .then(data => {
                        resolve({ data, status_code: 200 });
                    })
                    .catch(error => {
                        // Check if error message is a number (which would mean it's a status code)
                        const statusCode = parseInt(error.message, 10);
                        if (!isNaN(statusCode)) {
                            resolve({ status_code: statusCode, error: error });
                        } else {
                            reject(error);
                        }
                    })
            }
        });
    }

    /**
     * Get authorization token from localstorage
     * @return {string | null} string if token is exist, undefine if not
     */
    getAuthToken() {
        return this.authorizeToken ? this.authorizeToken : localStorage.getItem(VARIABLES.AUTH_TOKEN_LSKEY);
    }
}

export default AuthService.getInstance();
