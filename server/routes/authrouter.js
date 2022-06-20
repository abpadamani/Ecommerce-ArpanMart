const express = require("express");
const User = require("../models/users");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");


    authRouter.post("/api/signup",async (req , res)=>{
        try{
            const {name , email , password} = req.body;
            console.log("hello");
        const existinguser = await User.findOne({email});
        if(existinguser){
            return res.status(400).json({msg: "This Email id already Used please try somone else."})
        }
        
        const hashedpassword = await bcryptjs.hash(password , 8);



        let user = new User({
            email,
            name,
            password : hashedpassword,
        });
    
        user = await user.save();
        res.json(user);
        }catch(e){
            res.status(500).json({error : e.message});
           }
    });

    authRouter.get("/api/signup",async (req , res)=>{
        try{
            const {name , email , password} = req.body;
    
            const existinguser = await User.findOne({email});
            if(existinguser){
                return res.status(400).json({msg: "This Email id already Used please try somone else."})
            }
        
            let user =new user({
                email,
                name,
                password,
            });
        
            user = await user.save();
            res.json(user);


        } catch(e){
              res.status(500).json({error : e.message});
             }
       
    });

authRouter.post("/api/signin" , async(req , res) =>{
    try{
        const { email , password } = req.body;

        const user = await user.findOne({email});
        if(!user){
            return res.statusCode(400).json({"msg": "Email Address does not valid. please check again"});
        }


        const isMatched = await bcryptjs.compare(password , user.password);
        if(!isMatched){
            return res.statusCode(400).json({"msg": "Incorrect Password. please try again"});
        }

        const token = jwt.sign({id: user._id},"passwordKey");
        res.json({token,...user._doc});

    }catch(e){
        res.status(500).json({error : e.message});
    }
})

module.exports = authRouter;