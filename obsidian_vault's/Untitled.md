wie kann ich im folgenden, die daten von der db als stream abfragen, sodass nicht alle daten auf einmal mit toArray() geladen werden?

routes:

const router = require("express").Router();
const controller = require("./controller");
const {validateCreateTask} = require("./middlewares");
const authUser = require("../../middlewares/authUser");


router.post("/", authUser, validateCreateTask, controller.createTask);
router.get("/", authUser, controller.getTasks);


module.exports = router;

controller:

const catchAsync = require("../../../utils/catchAsync");
const services = require("../services");


module.exports = catchAsync(async (req, res) => {
    const userId = req.user.id;

    const tasks = await services.getTasks({userId});

    res.json(tasks);
});


service:

const models = require("../models");


module.exports = async ({userId}) => {
    const tasks = await models.getTasks({userId});

    return tasks;
};


model:

const {getDb, ObjectId} = require("../../../db/mongo");


module.exports = async ({userId}) => {
    const db = getDb();
    const filter = {
        userId: new ObjectId(userId),
    };

    const cursor = db.collection("tasks").find(filter);
    const tasks = await cursor.toArray();

    return tasks;
};
