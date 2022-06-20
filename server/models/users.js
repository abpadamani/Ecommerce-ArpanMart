const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name:{
        type: String,
        required : true,
        trim : true,

    },

    email:{
        required: true,
        trim:true,
        type:String,
        validate:{
            validator: (value) =>{
                const re =
  /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please enter valid email address",
        }
    },

    password:{
        type: String,
        required: true,
        validator:{
            validator: (value) =>{
              return value.length < 6;
            },
            message: "please enter long password",
        }
        
    },
    address:{
        type: String,
       default: "",
        
    },

    type:{
        type: String,
        default: "user",
    }
});

const User = mongoose.model("User" , userSchema);
module.exports =User;