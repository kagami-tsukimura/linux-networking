const tasksTableBodyElement = document.getElementById('tasks-table-body');
const taskTitleInputElement = document.getElementById('task-title-input');
const taskAddButtonElement = document.getElementById('task-add-button');

async function loadTasks() {
  // NOTE: ロード時に、既存のタスクを削除する（追加時に既存のタスクが重複して更新される対策）
  tasksTableBodyElement.innerHTML = '';
  const response = await fetch('/api/tasks');
  const responseBody = await response.json();

  const tasks = responseBody.tasks;
  tasks.forEach((task) => {
    const titleTdElement = document.createElement('td');
    titleTdElement.innerText = task.title;

    const createdAtTdElement = document.createElement('td');
    createdAtTdElement.innerText = task.createdAt;

    const trElement = document.createElement('tr');
    trElement.appendChild(titleTdElement);
    trElement.appendChild(createdAtTdElement);

    tasksTableBodyElement.appendChild(trElement);
  });
}

async function registerTask() {
  const title = taskTitleInputElement.value;
  const requestBody = {
    title: title,
  };
  await fetch('/api/tasks', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(requestBody),
  });
  await loadTasks();
}

async function main() {
  taskAddButtonElement.addEventListener('click', registerTask);
  await loadTasks();
}

main();
