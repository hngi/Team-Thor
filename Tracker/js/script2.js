const addBtn = document.querySelector("#add-btn")
const addTask = document.querySelector("#add-task")
const addGoal = document.querySelector("#add-goal")
const todo = document.querySelector("#todo")
const ulTasks = document.querySelector('#task');
const ulGoals = document.querySelector('#goals');
const goalInput = document.querySelector('#goal-input');
const goalList = document.querySelectorAll('.goal-list');
const progressSpan = document.querySelector('#progress')
const todoForm = document.querySelector("#todoForm");
const todoInput = document.querySelector('#todoInput');
const currentTask = document.querySelector('#current-task');
const spanElement = document.querySelector("div .todo")
const deleteBtn = document.querySelector("#delete-goal")
let goals = []

window.addEventListener('load', function(){
    var gitems = JSON.parse(localStorage.getItem('Goals'))
    for(i=0; i<gitems.length; i++){
        goalIndex++;
        let tasks = []
        let newGoal = new Goal(`goal${goalIndex}`, gitems[i], tasks)
        const addTask = document.createElement('span');
        addTask.innerText = newGoal.goalItem;
        ulGoals.append(addTask);
        goals.push(newGoal);
    }
    console.log(gitems.length);
})

class Goal {
    constructor(id, goalItem, todos, selected=false) {
    this.id = id;
    this.goalItem = goalItem;
    this.todos = todos;
    this.selected = selected
    }
}
let j = 0;
let goalIndex = 0
let checked = 0
let percentage = 0

addGoal.addEventListener("click", () => {
    if(goalInput.value == ""){
        alert("Enter a goal")
    } else {
        console.log(j)
        goalIndex++;
        let tasks = []
        let newGoal = new Goal(`goal${goalIndex}`, goalInput.value, tasks)
        const addTask = document.createElement('span');
        addTask.innerText = newGoal.goalItem;
        ulGoals.append(addTask);
        goals.push(newGoal);

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
    
        const allGoals = ulGoals.querySelectorAll("span");
        allGoals.forEach(goalss => {
            goalss.addEventListener("click", () => {
                todoForm.style.display = "block"
                for(i=0; i<allGoals.length; i++){
                    allGoals[i].removeAttribute("class")
                    goals[i].selected = false;
                }
                todoInput.style.display = "block";
                goalss.setAttribute("class", "selected")
                for(i=0; i<allGoals.length; i++){
                    if(allGoals[i].hasAttribute("class")){
                        goals[i].selected = true
                    }
                }
                const labelElement = ulTasks.querySelectorAll("label")
                labelElement.forEach(label => {
                    label.remove()
                })
                percentage = 0
                checked = 0
                progressSpan.innerHTML = `${percentage}%`
                goals.forEach(selectedGoal => {
                    if(selectedGoal.selected){
                        j = selectedGoal.todos.length
                        currentTask.style.display = 'block';
                        currentTask.innerText = `These are your goals for ${selectedGoal.goalItem}`
                        selectedGoal.todos.forEach(goal => {
                            const label = document.createElement("label")
                            const input = document.createElement("input");
                            const del =  document.createElement("button");
                            del.innerText = 'delete'
                            input.setAttribute("type", "checkbox")
                            input.setAttribute("value", todoInput.value)
                            input.setAttribute("class", "goal-list");
                            label.appendChild(input)
                            label.appendChild(document.createTextNode(goal))
                            label.appendChild(del)
                            ulTasks.appendChild(label);
                            todoInput.value = "";
                            del.addEventListener('click', () => {
                                j--;
                                label.remove()
                                if(input.checked){
                                    checked--;
                                }
                                percentage = Math.round((checked/j) * 100)
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
                                percentage =  Math.round((checked/j) * 100)
                                if(percentage === NaN) percentage = 0
                                progressSpan.innerHTML = `${percentage}%`      
                            })
                            // percentage = Math.round((checked/j) * 100)
                            progressSpan.innerHTML = `${percentage}%`
                        })
                    }
                })

            })
        })
        todoForm.addEventListener("submit", () => {
            event.preventDefault()
            if(todoInput.value == ""){
                todoInput.value = ""
            } else {
                j++;
                goals.forEach(goal => {
                    if(goal.selected){
                        i++;
                        goal.todos.push(todoInput.value)
                        const label = document.createElement("label")
                        const input = document.createElement("input");
                        const del =  document.createElement("button");
                        del.innerText = 'delete'
                        input.setAttribute("type", "checkbox")
                        input.setAttribute("value", todoInput.value)
                        input.setAttribute("class", "goal-list");
                        label.appendChild(input)
                        label.appendChild(document.createTextNode(todoInput.value))
                        label.appendChild(del)
                        ulTasks.appendChild(label);
                        todoInput.value = "";
                
                        del.addEventListener('click', () => {
                            j--;
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
                                label.style.textDecoration = "line-through";
                            } else {
                                checked--
                                label.style.textDecoration = "none";
                            }
                            percentage =  Math.round((checked/j) * 100)
                            if(percentage === NaN) percentage = 0
                            progressSpan.innerHTML = `${percentage}%`
                            
                        })
                        percentage = Math.round((checked/j) * 100)
                        if(isNaN(percentage)){
                            percentage = 0
                        }
                        progressSpan.innerHTML = `${percentage}%`
                    }
                })
            }
        })
        goalInput.value = "";
        
    }

})
deleteBtn.addEventListener("click", () => {
    goals = []
    const allGoals = ulGoals.querySelectorAll("span")
    allGoals.forEach(goals => {
        goals.remove()
    })
    const allTasks = ulTasks.querySelectorAll("label")
    allTasks.forEach(task => {
        task.remove()
    })
    localStorage.removeItem("Goals")
    progressSpan.innerHTML = ""
    todoForm.style.display = "none"
    currentTask.style.display = "none"
})

         
        (function saveinLS (inputGoal) {
            let inputGoals = getGoalFromLS()
            inputGoals.push(inputGoal)
            localStorage.setItem('Goals', JSON.stringify(inputGoals))
        })(goalInput.value)

        
        // (function copyfromLS () {
        //     var gitems = JSON.parse(localStorage.getItem('Goals').value)
        //     console.log(gitems);
        // })()
    

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