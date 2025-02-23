document.addEventListener("DOMContentLoaded", () => {
    if (document.getElementById("routine-list")) {
        renderRoutines();
    }
    if (document.getElementById("progress-list")) {
        renderProgress();
        renderChart();
    }
});

// ========================
// 🔹 Routine Management (Add, Display, and Delete)
// ========================

// Show Gym Workout Options Only When Selected
function toggleGymOptions() {
    let activityType = document.getElementById("activity-type").value;
    let gymOptions = document.getElementById("gym-options");

    gymOptions.style.display = (activityType === "Gym Workout") ? "block" : "none";
}

// Function to Add Routine and Save to Local Storage
function addRoutine() {
    let day = document.getElementById("day-select").value;
    let activityType = document.getElementById("activity-type").value;
    let routineName = (activityType === "Gym Workout") 
        ? `Gym - ${document.getElementById("gym-type").value}` 
        : activityType;

    let routines = JSON.parse(localStorage.getItem("routines")) || {};
    if (!routines[day]) routines[day] = [];
    routines[day].push(routineName);

    localStorage.setItem("routines", JSON.stringify(routines));
    alert("Routine added successfully!");
    renderRoutines(); // Update UI immediately
}

// Function to Display Routines on My Routines Page with Delete Button
function renderRoutines() {
    let routines = JSON.parse(localStorage.getItem("routines")) || {};
    let routineList = document.getElementById("routine-list");
    if (!routineList) return;

    routineList.innerHTML = "";

    Object.keys(routines).forEach(day => {
        let daySection = document.createElement("li");
        daySection.className = "list-group-item";
        daySection.innerHTML = `<strong>${day}</strong>`;

        let routineItems = document.createElement("ul");
        routines[day].forEach((routine, index) => {
            let routineItem = document.createElement("li");
            routineItem.className = "d-flex justify-content-between align-items-center";
            routineItem.innerHTML = `
                ${routine}
                <button class="btn btn-danger btn-sm" onclick="deleteRoutine('${day}', ${index})">Delete</button>
            `;
            routineItems.appendChild(routineItem);
        });

        daySection.appendChild(routineItems);
        routineList.appendChild(daySection);
    });
}

// Function to Delete a Routine
function deleteRoutine(day, index) {
    let routines = JSON.parse(localStorage.getItem("routines")) || {};

    if (routines[day]) {
        routines[day].splice(index, 1); // Remove the specific routine

        // If the day's routine list is empty, delete the key
        if (routines[day].length === 0) {
            delete routines[day];
        }

        localStorage.setItem("routines", JSON.stringify(routines));
        renderRoutines(); // Refresh the UI
    }
}

// ========================
// 🔹 Progress Tracking (Calculate and Save Calories Burned)
// ========================

// Calorie Burn Rate Per Minute Based on Exercise Type
const exerciseCalories = {
    "Running": 10, "Swimming": 8, "Cycling": 6, "Yoga": 4,
    "Chest": 7, "Back": 7, "Legs": 8, "Biceps": 6, "Triceps": 6, "Shoulders": 6
};

// Function to Calculate Calories and Save Entry
// Function to Calculate Calories and Save Entry
function calculateCalories() {
    let exerciseType = document.getElementById("exercise-type").value;
    let weight = parseFloat(document.getElementById("weight").value);
    let duration = parseFloat(document.getElementById("exercise-time").value);

    if (isNaN(weight) || isNaN(duration) || weight <= 0 || duration <= 0) {
        alert("Please enter valid weight and exercise duration.");
        return;
    }

    // Convert caloriesBurned to a number
    let caloriesBurned = Number((exerciseCalories[exerciseType] * weight * (duration / 60)).toFixed(2));

    let progressData = JSON.parse(localStorage.getItem("progress")) || [];
    let date = new Date().toISOString().split("T")[0];

    progressData.push({ date, exerciseType, duration, caloriesBurned });
    localStorage.setItem("progress", JSON.stringify(progressData));

    alert("Workout saved successfully!");
    renderProgress();
    setTimeout(renderChart, 500); // Ensure chart updates after new data
}



// Function to Display Workout History Table
function renderProgress() {
    let progressData = JSON.parse(localStorage.getItem("progress")) || [];
    let progressList = document.getElementById("progress-list");
    if (!progressList) return;

    progressList.innerHTML = "";
    if (progressData.length === 0) {
        progressList.innerHTML = `<tr><td colspan="4" class="text-center text-muted">No workouts recorded</td></tr>`;
    } else {
        progressData.forEach(entry => {
            let row = document.createElement("tr");
            row.innerHTML = `
                <td>${entry.date}</td>
                <td>${entry.exerciseType}</td>
                <td>${entry.duration} min</td>
                <td>${entry.caloriesBurned} kcal</td>
            `;
            progressList.appendChild(row);
        });
    }
}

// ========================
// 🔹 Plot Progress Chart (Using Chart.js)
// ========================


