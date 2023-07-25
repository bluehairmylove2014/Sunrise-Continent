import { useState } from "react";
import { useGptMutation } from "../../fetching/mutation";


export const useSplitToKeys = () => {
    const [isLoading, setIsLoading] = useState(false);
    const gptMutation = useGptMutation();

    const onSplitToKeys = (message) => {
        return new Promise(
            (resolve, reject) => {
                setIsLoading(true);

                gptMutation
                .mutateAsync(message)
                .then(res => {
                    resolve(res);
                })
                .catch(err => {
                    console.error(err);
                    reject(err)
                }) 
            }
        );
    };

    // Returning the onLogin function and the loading state
    return {
        onSplitToKeys,
        isLoading
    };
};
