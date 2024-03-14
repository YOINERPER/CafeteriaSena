import { connection } from "../database/db.js";

//obtener todas las categorias
export const getAllCat = () => {
    return new Promise((resolve, reject) => {

        connection.query("SELECT * FROM categorias", (err, result) => {
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

//obtener categorias por nombre
export const GetCatxName = (Nom_Cat) => {
    return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM categorias WHERE Nom_Cat = ?", [Nom_Cat], (err, result) => {

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

//obtener categorias por ID
export const GetCatxId = (id) => {
    return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM categorias WHERE Id_Cat = ?", [id], (err, result) => {

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

//crear categorias
export const CreateCat = (datos) => {
    return new Promise((resolve, reject) => {
        connection.query("INSERT INTO categorias (Id_Cat, Nom_Cat) VALUES (?,?)", [datos.Id_Cat, datos.Nom_Cat], (err, results) => {

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

//actualizar categorias
export const UpdateCat = (datos) => {
    return new Promise((resolve, reject) => {

        connection.query("UPDATE categorias SET Nom_Cat= ? WHERE Id_Cat = ?",
            [datos.Nom_Cat, datos.id], (err, result) => {
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

//eliminar categorias
export const deleteCat = (id) => {
    return new Promise((resolve, reject) => {
        connection.query("DELETE FROM categorias WHERE Id_Cat = ?", [id], (err, result) => {
            if (err) {
                console.log(err);
                const objError = {
                    errno: err.errno,
                    code: err.code
                }
                reject(objError);

            } else {
                resolve(result);

            }
        })
    })
}
