import { connection } from "../database/db.js";
//Obtiene las ordenes por id del usuario
export const GetInv = (id) => {
    return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM ordenes WHERE id = ?", [id], (err, result) => {

            if (err) {
                const objError = {
                    errno: err.errno
                }
                reject(objError);
            } else {
                resolve(result);
            }

        })
    })
}
