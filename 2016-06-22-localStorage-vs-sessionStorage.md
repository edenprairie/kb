# Diff HTML5 Local storage vs. Session storage

`localStorage` and `sessionStorage` both extend Storage. There is no difference between them except for the intended "non-persistence" of sessionStorage.

That is, the data stored in `localStorage` persists until explicitly deleted. Changes made are saved and available for all current and future visits to the site.

For `sessionStorage`, changes are only available per window (or tab in browsers like Chrome and Firefox). Changes made are saved and available for the current page, as well as future visits to the site on the same window. Once the window is closed, the storage is deleted.