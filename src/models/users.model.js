import { connection } from "../database/db.js";


//Obtener todos los usuario
export const getAllUsers = () => {

    return new Promise((resolve, reject) => {

        connection.query('SELECT Id_User,Nom_User,Ape_User,Tel_User,Ema_User,Id_Rol_FK,Fot_User,Est_Email_User FROM usuarios', (err, results, fields) => {
            if (err) {
                console.log(err)
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

//Obtener usuario por Email
export const UserByEmail = async (Ema_User) => {
    return new Promise((resolve, reject) => {

        connection.query("SELECT * FROM usuarios WHERE Ema_User = ?", [Ema_User], (err, results) => {
            if (err) {
                console.log(err)
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

//Regitrar Usuarios
export const InsertUsers = ( datos) => {

    const { Id_User, Nom_User, Ape_User, Ema_User, passEncripted, Id_Rol_FK } = datos;

    return new Promise((resolve, reject) => {

        connection.query("INSERT INTO usuarios (Id_User,Nom_User,Ape_User,Ema_User,Pass_User,Id_Rol_FK, Est_Email_User) VALUES (?,?,?,?,?,?,?)", [Id_User, Nom_User, Ape_User, Ema_User, passEncripted, Id_Rol_FK, 0], (err, results, fields) => {
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


//seleccionar usuarios por id
export const GetUserbyId = ( id) => {

    return new Promise((resolve, reject) => {
        connection.query("SELECT Id_User,Nom_User,Ape_User,Ema_User,Id_Rol_FK, Est_Email_User FROM USUARIOS WHERE Id_User = ?", [id], (err, results) => {
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

//actualizar estado usuarios
export const UserDataUpdate = (datos) => {
    
    return new Promise((resolve, reject) => {
        connection.query("UPDATE usuarios SET Nom_User = ?,Ape_User=?,Tel_User=?,Ema_User=?,Fot_User=? WHERE Id_User = ?", [datos.Nom_User,datos.Ape_User,datos.Tel_User,datos.Ema_User,datos.Fot_User,datos.Id_User], (err, results) => {
            if (err) {
                console.log(err)
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

//actualizar estado email a verificado
export const UpdateEstEmail = (id) => {
    return new Promise((resolve, reject) => {
        connection.query("UPDATE usuarios SET Est_Email_User = ? WHERE Id_User = ?", [1, id], (err, results) => {
            if (err) {
                console.log(err)
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

//verificar existencia tanto por email o por nombre de usuario
export const getUserByEmailUser = (campoV, valor) => {
    return new Promise((resolve, reject) => {

        connection.query(`SELECT * FROM usuarios WHERE ${campoV} = ?`, [valor], async (err, results, fields) => {
            if (err) {
                console.log(err)
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