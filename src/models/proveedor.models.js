import {connection} from "../database/db.js";

export const getAllproveedor = () =>{
    return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM proveedor",(err, result) =>{
            if(err){
                
            }
        }
    })
    
    
}