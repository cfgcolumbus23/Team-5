const express = require("express");
const app = express();
const data = require("./data/data.js");
const cors = require("cors");
app.use(cors());
app.use(express.json());
app.post("/login", (req, res) => {
	//login endpoint for assigning roles
	//returns a boolean based on id
	const { id } = req.body;
	if (id == 0) {
		res.json({ admin: true }).status(200);
	} else {
		res.json({ admin: false }).status(200);
	}
});

app.get("/assignments", (req, res) => {
	//get all assignment data
	/*/returns [{
        assignmentName: String,
			assignmentId: int,
			assessmentPercent: [int],
			practicePercent: [int],
			certificateEarned: [boolean]
    }]
    /*/
	res.json(data.assignments);
});

app.get("/user/:id", (req, res) => {
	//get an individual user's data
	const { id } = req.params;
	if (id >= data.assignments.length) {
		return res.status(404).json("user not found");
	}
	let studentData = [];
	data.assignments.forEach((assignment) => {
		const singleAssignment = {
			assignmentName: assignment.assignmentName,
			assesmentPercent: assignment["assessmentPercent"][id],
			practicePercent: assignment["practicePercent"][id],
			certificateEarned: assignment.certificateEarned[id],
		};
		studentData.push(singleAssignment);
	});
	res.json({
		firstName: data.firstNames[id],
		lastName: data.lastNames[id],
		studentData: studentData,
	});
});

app.get("/assignments/average", (req, res) => {
	//average score of all assignments
	let assignmentSum = 0;
	let assessmentsTaken = 0;
	data.assignments.forEach((assignment) => {
		assessmentsTaken += assignment.assessmentPercent.length;
		assignment.assessmentPercent.forEach((grade) => {
			assignmentSum += grade;
		});
	});
	const average = assignmentSum / assessmentsTaken;
	res.json({ average: average });
});

app.get("/assignments/:id", (req, res) => {
	//get individual assignment
	/*/{
        assignmentName: String,
			assignmentId: int,
			assessmentPercent: [int],
			practicePercent: [int],
			certificateEarned: [boolean]
    }/*/
	const { id } = req.params;
	if (id >= data.assignments.length) res.json("user not found").status(404);
	res.json(data.assignments[id]);
});

app.get("/assignments/average/:id", (req, res) => {
	//get the average on an individual assignment
	const id = req.params.id;
	if (id >= data.assignments.length) {
		res.status(404).json("User not found");
	} else {
		let gradeSum = 0;
		data.assignments[id].assessmentPercent.forEach((grade) => {
			gradeSum += grade;
		});
		const average = gradeSum / data.assignments[id].assessmentPercent.length;
		res.json(average);
	}
});

app.get("/users", (req, res) => {
	let users = [];
	for (let i = 0; i < data.firstNames.length; i++) {
		users.push({ name: data.firstNames[i] + " " + data.lastNames[i], id: i });
	}
	res.json(users);
});

app.listen(4000);
