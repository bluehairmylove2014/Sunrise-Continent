// Importing necessary libraries and services
import { useSearchHotelMutation } from '../../fetching/mutation';

export const useSearch = () => {
    const searchMutation = useSearchHotelMutation();
    const onSearch = (searchContent) => {
        console.log("Run on search: ", searchContent)
        return new Promise((resolve, reject) => {
            // Handle keys here
            const keys = ["viet nam", "giuong doi"];
            searchMutation
                .mutateAsync(keys)
                .then(res => {
                    resolve(res);
                })
                .catch(error => {
                    reject(error)
                })  
        })
    }
    return {onSearch, isLoading: searchMutation.isLoading}
};
