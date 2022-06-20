//import section
const express = require("express");
const mongoose = require("mongoose");

//import from other files
const authRouter = require("./routes/authrouter");

//initialization
const app = express();
const PORT = 3000;
const DB = "mongodb+srv://arpanmt:arpan123@cluster0.l7t4l.mongodb.net/?retryWrites=true&w=majority";
//middleware 
app.use(express.json());
app.use(authRouter);

//connections
mongoose.connect(DB).then( ()=>{console.log("connection Sucessfull") }).catch(e => { console.log(e)});



app.listen(PORT ,"0.0.0.0", ()=>{
    console.log(`connected with port number ${PORT}`);
});