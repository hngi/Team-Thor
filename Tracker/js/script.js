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
var i = 0;
var j = 0;
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
        ulGoals.append(addTask)
        addTask.addEventListener("click", () => {
            goalIndex++;
            let newTask = new goal(`goal${goalIndex}`, goalInput.value)
            var goals = []
            goals.push(newTask)
            todoInput.style.display = "block";
            todoBtn.classList.remove('d-none');
            goalInput.value = '';
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
        j++
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





