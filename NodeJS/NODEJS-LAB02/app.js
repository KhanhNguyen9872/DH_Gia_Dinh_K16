const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

let todos = [
    { id: 1, task: 'Learn Node.js', completed: false },
    { id: 2, task: 'Build a REST API', completed: false },
    { id: 3, task: 'Write unit tests', completed: false },
    { id: 4, task: 'Deploy application', completed: true },
    { id: 5, task: 'Document API endpoints', completed: false }
];

app.set('view engine', 'pug');
app.use(express.static('public'));

app.get('/todos', (req, res) => {
    res.render('todos', { todos });
});

app.get('/api/todos', (req, res) => {
    res.json(todos);
});

app.post('/api/todos', (req, res) => {
    const { task } = req.body;
    if (!task) {
        return res.status(400).json({ error: 'Task cannot be empty' });
    }
    const newTodo = {
        id: todos.length + 1,
        task,
        completed: false
    };
    todos.push(newTodo);
    res.status(201).json(newTodo);
});

app.put('/api/todos/:id', (req, res) => {
    const { id } = req.params;
    const { task } = req.body;
    const todo = todos.find(todo => todo.id === parseInt(id));
    if (!todo) {
        return res.status(404).json({ error: 'Task not found' });
    }
    if (!task) {
        return res.status(400).json({ error: 'Task cannot be empty' });
    }
    todo.task = task;
    res.json({ message: 'Task updated successfully', todo });
});

app.delete('/api/todos/:id', (req, res) => {
    const { id } = req.params;
    const index = todos.findIndex(todo => todo.id === parseInt(id));
    if (index === -1) {
        return res.status(404).json({ error: 'Task not found' });
    }
    const deletedTodo = todos.splice(index, 1);
    res.json({ message: 'Task deleted successfully', deletedTodo });
});

app.listen(8080, () => {
    console.log('Server is running on http://localhost:8080');
});
