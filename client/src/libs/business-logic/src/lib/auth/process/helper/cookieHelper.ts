export function setCookie(name: string, value: string, hours: number) {
  if (typeof document !== "undefined") {
    let expires = "";
    if (hours) {
      const date = new Date();

      // hours * 60 * 60 * 1000: convert to milisecond
      date.setTime(date.getTime() + hours * 60 * 60 * 1000);
      expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "") + expires;
  }
}

export function getCookie(name: string): string | null {
  if (typeof document !== "undefined") {
    const nameEQ = name + "=";
    const cookieArr = document.cookie.split(";");
    let result: string | null = null;
    cookieArr.forEach((cookie) => {
      const c = cookie.trim();
      if (c.indexOf(nameEQ) === 0) {
        result = c.substring(nameEQ.length, c.length);
      }
    });

    return result;
  }
  return null;
}

export function deleteCookie(name: string) {
  setCookie(name, "", -1);
}
