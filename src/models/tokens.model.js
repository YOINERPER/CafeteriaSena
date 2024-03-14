import { connection } from "../database/db.js";

//insertar tokens en la base de datos
export const InserTokens = (datos, tipo = 2) =>{

    return new Promise ((resolve, reject)=>{
        connection.query("INSERT INTO tokens (Token,Fec_Caducidad, User_Id_FK, Tipo_token) VALUES (?,?,?,?)", [datos.codigo, datos.exp, datos.Id_User, tipo], (err, results) => {
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

//verificar tokens de usuario
export const VerEmailToken = ( datos, tipo)=>{
    
    return new Promise((resolve, reject)=>{
        connection.query("SELECT * FROM tokens WHERE User_Id_FK = ? AND Token = ? AND tipo_token = ?", [datos.Id_User, datos.codigo, tipo], (err, results) => {
            if (err) {
                 const objError = {
                    errno: err.errno
                }
                reject(objError);
            }else{

                resolve(results);
            }
        
        })
    })
}

export const getAllTokens = () => {
    return new Promise((resolve, reject) => {

        connection.query("SELECT * FROM tokens", (err, result) => {
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

export const getAllTokensUsers = (id) => {
    return new Promise((resolve, reject) => {

        connection.query("SELECT * FROM tokens WHERE User_Id_FK = ?", [id], (err, result) => {
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

export const getAllTokensxTipo = (tipo) => {
    return new Promise((resolve, reject) => {

        connection.query("SELECT * FROM tokens WHERE Tipo_token = ?", [tipo], (err, result) => {
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

export const getAllTokensxId = (id) => {
    return new Promise((resolve, reject) => {

        connection.query("SELECT * FROM tokens WHERE Id_Token = ?", [id], (err, result) => {
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

//actualizar tokens
export const UpdateToken = (datos) => {
    return new Promise((resolve, reject) => {

        connection.query("UPDATE tokens SET Token= ?, Fec_Caducidad = ?, User_Id_FK = ?, Tipo_token = ?  WHERE Id_Token = ?",
            [datos.Token, datos.Fec_Caducidad, datos.User_Id_FK, datos.Tipo_token,datos.Id_Token], (err, result) => {
                if (err) {
                    console.log(err);
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