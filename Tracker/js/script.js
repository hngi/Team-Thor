var addBtn = document.getElementById('add-btn');
var addTask = document.getElementById('add-goal')
var addGoal = document.getElementById('add-goal')
var todo = document.getElementById('todo')
var ulTasks = document.getElementById('task');
var ulGoals = document.getElementById('goals');
var goalInput = document.getElementById('goal-input');
var goalList = document.getElementsByClassName('goal-list');
var progressSpan = document.getElementById('progress')
var todoForm = document.getElementById("todoForm");
var todoInput = document.getElementById('todoInput');
var currentTask = document.getElementById('current-task');
var todoBtn = document.getElementById('todoBtn');

class goal {
    constructor(id, goalItem, todos) {
    this.id = id;
    this.goalItem = goalItem;
    this.todos = todos
    }
}

// Document Raedy
document.addEventListener('DOMContentLoaded', getFromLocalStorage)

var i = 0;
var goalIndex = 0
let checked = 0
let percentage = 0
// let newGoal = new goal(`goal[i]`, goalInput.value)
addGoal.addEventListener('click', () => {
    if (goalInput.value==""){
        alert("Enter a goal")
    }
    else {
        const li = document.createElement('li')
        const addTask = document.createElement('span')
        li.append(addTask)
        addTask.innerText = goalInput.value
        ulGoals.appendChild(addTask)
        
        // save in local storage
        function getGoalFromLS() {
            let inputGoals
            const goalFromLS = localStorage.getItem('Goals')
            if (goalFromLS === null) {
                inputGoals = []
            } else {
                inputGoals = JSON.parse(goalFromLS)
            }
            return inputGoals
        }       

        

        (function saveinLS (inputGoal) {
            let inputGoals = getGoalFromLS()
    
            inputGoals.push(inputGoal)
            localStorage.setItem('Goals', JSON.stringify(inputGoals))
        })(goalInput.value)

          // Clear Input Goal
          goalInput.value = '';


        addTask.addEventListener("click", () => {
            goalIndex++;
            let newTask = new goal(`goal${goalIndex}`, goalInput.value)
            var goals = []
            goals.push(newTask)            

            todoInput.style.display = "block";
            todoBtn.classList.remove('d-none');
            currentTask.innerText = `These are your To do lists for: ${addTask.innerText}` 

            
        })
    }
})



todoForm.addEventListener("submit", () => {
    event.preventDefault()
    if (todoInput.value==""){
        alert("Enter a task")
    }
    else{
        console.log(todoForm)
        i++;
        const label = document.createElement("label")
        const input = document.createElement("input");
        const del =  document.createElement("button");
        del.innerText = 'delete'
        input.setAttribute("type", "checkbox")
        input.setAttribute("value", todoInput.value)
        input.setAttribute("class", "goal-list");
        label.setAttribute("class", "label");
        label.appendChild(input)
        label.appendChild(document.createTextNode(todoInput.value))
        label.appendChild(del)
        ulTasks.appendChild(label);
        todoInput.value = "";

        del.addEventListener('click', () => {
            i--;
            label.remove()
            if(input.checked){
                checked--;
            }
            percentage = Math.round((checked/i) * 100)
            if(isNaN(percentage)){
                percentage = 0
            }
            progressSpan.innerHTML = `${percentage}%`
            
        })
        input.addEventListener('click', () => {
            if (input.checked){
                checked++;
            } else {
                checked--
            }
            percentage =  Math.round((checked/i) * 100)
            if(percentage === NaN) percentage = 0
            progressSpan.innerHTML = `${percentage}%`
            
        })
        percentage = Math.round((checked/i) * 100)
        progressSpan.innerHTML = `${percentage}%`
    }
}) 

// save in local storage
function getGoalFromLS() {
    let inputGoals
    const goalFromLS = localStorage.getItem('Goals')
    if (goalFromLS === null) {
        inputGoals = []
    } else {
        inputGoals = JSON.parse(goalFromLS)
    }
    return inputGoals
} 

// Loads when document is ready and print courses into shopping cart
function getFromLocalStorage() {
    let goalsLS = getGoalFromLS()

    // Loop through courses and print into cart
    goalsLS.forEach(goal => {
        const li = document.createElement('li')
        const addTask = document.createElement('span')
        li.append(addTask)
        addTask.innerText = goal
        ulGoals.appendChild(addTask)
    });
}



