// Importing necessary libraries and services
import { useEffect, useState } from 'react'
import { BROADCAST_MESSAGE, FACEBOOK_MESSAGE } from '../../constants';
import { facebookPopupPostMessage } from '../helper/windowEventHelper';
import { useGetFBAccessTokenMutation, useGetFBUserInforMutation, useUpdateAccountMutation } from '../../fetching/mutation';
import { AxiosError } from '@org/services';
import { getCodeFromUrl } from '../helper/urlSearchParamsHelper';
import { useAccessToken } from './useAccessToken';
import { facebookConfig } from '../../../../configs';

const isRememberMeDefault = true;
                        
// Define the type for the hook
type UseFacebookLoginType = () => {
    isLoading: boolean;
    onFacebookLogin: () => void;
};
export const useFacebookLogin: UseFacebookLoginType = () => {
    const facebookAuthUrl =     facebookConfig.AUTH_URI + 
                                `?client_id=${facebookConfig.APP_ID}` + 
                                `&redirect_uri=${facebookConfig.REDIRECT_URI}` + 
                                `&scope=${facebookConfig.SCOPE}` +
                                `&response_type=code` +
                                `&state={"${facebookConfig.STATE}"}`;
    const [isLoading, setIsLoading] = useState(false);
    const getFBAccessTokenMutation = useGetFBAccessTokenMutation();
    const getFBUserInforMutation = useGetFBUserInforMutation();
    const updateAccountMutation = useUpdateAccountMutation();

    // Get the setToken function from useAccessToken
    const { setToken } = useAccessToken();


    useEffect(() => {
        if(typeof window !== "undefined" && window.opener) {
            // Extract and get access token and error (if any) from url
            const code = getCodeFromUrl();
            if (code) {
                // get token by 'code'
                getFBAccessTokenMutation.mutateAsync({
                    clientId: facebookConfig.APP_ID,
                    clientSecret: facebookConfig.APP_SECRET ,
                    redirectUri: facebookConfig.REDIRECT_URI,
                    code: code
                })
                .then(data => {
                    facebookPopupPostMessage(FACEBOOK_MESSAGE.FACEBOOK_LOGIN_SUCCESS, {
                        accessToken: data.access_token
                    })
                })
                .catch((error: AxiosError | Error) => {
                    console.error("Get fb access token error: ", error);
                    facebookPopupPostMessage(FACEBOOK_MESSAGE.FACEBOOK_LOGIN_FAILED, {});
                })
            }
        }
    });

    const onFacebookLogin = ():void => {
        setIsLoading(true)
        if(typeof window !== 'undefined') {   
            
            const authWindow: Window | null = window.open(
                facebookAuthUrl, 
                'Facebook Sign-In', 
                'width=500,height=600'
            );

            if(authWindow) {
                const handleAuthentication = (event: MessageEvent) => {
                    const { type, payload } = event.data;
                    if (type === FACEBOOK_MESSAGE.FACEBOOK_LOGIN_SUCCESS) {      
                        getFBUserInforMutation.mutateAsync(payload.accessToken)
                        .then(res => {
                            // If web cannot get the user information 
                            // => do not set token, do not login, do not broadcast
                            setToken(payload.accessToken, isRememberMeDefault);
                            // Send login notification message to other tabs
                            postMessage({
                                message: BROADCAST_MESSAGE.SEND_TOKEN,
                                token: payload.accessToken,
                                isRemember: isRememberMeDefault
                            });
    
                            // Update account on server
                            updateAccountMutation
                                .mutateAsync({
                                    email: res.email,
                                    firstName: res.firstName,
                                    lastName: res.lastName
                                })
                                .then(res => {
                                    if (!res) {
                                        console.error("Error response update account infor false")
                                    }
                                })
                                .catch(error => {
                                    console.error("Error update account infor: ", error)
                                })
                        })
                        .catch((error: AxiosError | Error) => {
                            console.error(error);
                        })
                        .finally(() => {
                            // Remove listener
                            window.removeEventListener('message', handleAuthentication);
                            setIsLoading(false);
                            authWindow?.close();
                        })
                    } else if (type === FACEBOOK_MESSAGE.FACEBOOK_LOGIN_FAILED) {
                        console.error("Fail facebook login")
                        // Remove listener
                        window.removeEventListener('message', handleAuthentication);
                        setIsLoading(false);
                        authWindow?.close();
                    }
                };
                // Assign listener to listen to messages from popup
                window.addEventListener('message', handleAuthentication);
            }
        }
    };
    return { onFacebookLogin, isLoading }
};
