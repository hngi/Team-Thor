var addBtn = document.getElementById('add-btn');
var ulGoals = document.getElementById('goals');
var goalInput = document.getElementById('goal-input');
var goalList = document.getElementsByClassName('goal-list');


addBtn.addEventListener("click", () => {

    if (goalInput.value==""){
        alert("Enter a goal")
    }
    else{
        var li = document.createElement("li");
    var a = document.createElement("a");
    a.appendChild(document.createTextNode(goalInput.value));
    li.appendChild(a);
    li.setAttribute("class", "goal-list");
    ulGoals.appendChild(li);
    goalInput.value = "";

   
    }
})




