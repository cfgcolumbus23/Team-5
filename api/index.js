const express = require("express");
const app = express();
const data = require("./data/data.js");
const cors = require("cors");
app.use(cors());
app.use(express.json());
app.post("/login", (req, res) => {
	const { id } = req.body;
	if (id === 1) {
		res.json({ admin: true }).status(200);
	} else {
		res.json({ admin: false }).status(200);
	}
});

app.get("/assignments", (req, res) => {
	res.json(data.assignemnts);
});

app.get("/assignments/:id", (req, res) => {
	const { id } = req.params;
	if (id >= data.assignemnts.length) res.json("user not found").status(404);
	res.json(data.assignemnts[id]);
});

app.get("/user/:id", (req, res) => {
	const { id } = req.params;
	if (id >= data.assignemnts.length) {
		return res.status(404).json("user not found");
	}
	let studentData = [];
	data.assignemnts.forEach((assignment) => {
		const singleAssignment = {
			assignmentName: assignment.assignmentName,
			assessmentPercent: assignment["assessmentPercent"][id],
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

app.listen(4000);
