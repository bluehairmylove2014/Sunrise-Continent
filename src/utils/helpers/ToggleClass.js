/**
 * Handler for click outside the element.
 * @param {MouseEvent} event - The click event.
 */
function handleClickOutside(focusArea, className, event) {
    const target = event.target;
    if (!focusArea.contains(target)) {
        focusArea.classList.remove(className);
        document.removeEventListener('click', focusArea._handleClickOutside);
    }
}

/**
 * Toggle the specified class on the given element.
 * @param {HTMLElement} element - The element to toggle the class on.
 * @param {string} className - The class name to toggle.
 */
export function toggleClass(element, className) {
    if (!element) {
        return;
    }
    const boundHandleClickOutside = (e) => handleClickOutside(element, className, e);

    if (element.classList.contains(className)) {
        element.classList.remove(className);
        document.removeEventListener('click', element._handleClickOutside);
    } else {
        element.classList.add(className);
        element._handleClickOutside = boundHandleClickOutside;
        setTimeout(() => {
            document.addEventListener('click', element._handleClickOutside);
        }, 100);
    }
}

export function toggleClassNoListener(element, className) {
    if (!element) {
        return;
    }
    if (element.classList.contains(className)) {
        element.classList.remove(className);
    } else {
        element.classList.add(className);
    }
}