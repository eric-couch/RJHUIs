// LocalStorage Helper Functions
// Provides safe wrappers for localStorage operations with error handling

function saveData(key, jsonData) {
    try {
        if (typeof(Storage) !== "undefined") {
            localStorage.setItem(key, jsonData);
            return true;
        } else {
            console.error("localStorage is not supported by this browser.");
            return false;
        }
    } catch (e) {
        if (e.name === 'QuotaExceededError') {
            console.error("localStorage quota exceeded. Please clear some data.");
        } else {
            console.error("Error saving to localStorage:", e);
        }
        return false;
    }
}

function getData(key) {
    try {
        if (typeof(Storage) !== "undefined") {
            return localStorage.getItem(key);
        } else {
            console.error("localStorage is not supported by this browser.");
            return null;
        }
    } catch (e) {
        console.error("Error reading from localStorage:", e);
        return null;
    }
}

function removeData(key) {
    try {
        if (typeof(Storage) !== "undefined") {
            localStorage.removeItem(key);
            return true;
        } else {
            return false;
        }
    } catch (e) {
        console.error("Error removing from localStorage:", e);
        return false;
    }
}

function isInitialized() {
    try {
        if (typeof(Storage) !== "undefined") {
            var flag = localStorage.getItem("dataInitialized");
            return flag === "true";
        } else {
            return false;
        }
    } catch (e) {
        console.error("Error checking initialization:", e);
        return false;
    }
}

function clearAll() {
    try {
        if (typeof(Storage) !== "undefined") {
            localStorage.clear();
            return true;
        } else {
            return false;
        }
    } catch (e) {
        console.error("Error clearing localStorage:", e);
        return false;
    }
}

// Function to get data and populate a hidden field for postback
function getDataToHiddenField(storageKey, hiddenFieldId) {
    try {
        var data = getData(storageKey);
        if (data && hiddenFieldId) {
            var hiddenField = document.getElementById(hiddenFieldId);
            if (hiddenField) {
                hiddenField.value = data;
            }
        }
    } catch (e) {
        console.error("Error populating hidden field:", e);
    }
}
