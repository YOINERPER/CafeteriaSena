import { connection } from "../database/db.js";

// obtener roles por id
export const getRolById = ( id)=>{
  
    return new Promise ((resolve, reject) =>{

        connection.query("SELECT * FROM roles WHERE Id_Rol = ?", [id],(err, results)=>{
            if (err) {
            
                const objError = {
                    errno: err.errno,
                    code: err.code
                }
                reject(objError);
            }
            else {
                resolve(results)
            }
        })
    })
   
}

//obtener todos los roles
export const getAllRoles = ()=>{
  
    return new Promise ((resolve, reject) =>{

        connection.query("SELECT * FROM roles",(err, results)=>{
            if (err) {
            
                const objError = {
                    errno: err.errno,
                    code: err.code
                }
                reject(objError);
            }
            else {
                resolve(results)
            }
        })
    })
   
}

// obtenr roles por nombre
export const getRolxName = (nombre)=>{
  
    return new Promise ((resolve, reject) =>{

        connection.query("SELECT * FROM roles WHERE Nom_Rol = ?", [nombre],(err, results)=>{
            if (err) {
            
                const objError = {
                    errno: err.errno,
                    code: err.code
                }
                reject(objError);
            }
            else {
                resolve(results)
            }
        })
    })
   
}

//crear roles
export const createRol = (nombre) => {
    
    return new Promise((resolve, reject) => {
        connection.query("INSERT INTO roles (Nom_Rol) VALUES (?)", [nombre], (err, results) => {

            if (err) {
                const objError = {
                    errno: err.errno
                }
                reject(objError);

            } else {
                resolve(results);
            }

        })
    })
}

//actualizar roles
export const updateRol = (datos) => {
  
    return new Promise((resolve, reject) => {

        connection.query("UPDATE roles SET Nom_Rol= ? WHERE Id_Rol = ?",
            [datos.Nom_Rol, datos.Id_Rol], (err, result) => {
                if (err) {
                    const objError = {
                        errno: err.errno
                    }
                    reject(objError);

                } else {
                    resolve(result);
                }

            });
    })
}