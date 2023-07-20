type flexFunctionType<T, U> = (args: U, accumulate: number) => Promise<T>
export const debouncePromise = <T, U>(func: flexFunctionType<T, U>, timeout: number) => {
    let timer: NodeJS.Timeout | null = null;
    let accumulate = 0;
    return (args: U) => new Promise<T>((resolve, reject) => {
        if (timer) {
            clearTimeout(timer);
        }

        accumulate += 1;

        timer = setTimeout(() => {
            timer = null;
            func(args, accumulate)
            .then(data => resolve(data))
            .catch(error => reject(error));
        }, timeout);
    })
}