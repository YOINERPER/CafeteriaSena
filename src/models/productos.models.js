import { connection } from "../database/db.js";

export const getProductsModels = () => {
    return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM productos", (err, result) => {
            if (err){
               const  objetodeError= {
                errno:  err.errno,
                codde:err.code

                }
                    reject(objetodeError)
                }
            else{
                resolve(result)
            }
        })

    })
}
export const createProductsModels = (datos) => {
    return new Promise((resolve, reject) => {
        connection.query("INSERT INTO productos (id_Pro, nombre_Pro,descripcion_Pro,precio_Pro,categoria_idFK ) VALUES (?,?,?,?,?)", [datos.id_Pro, datos.nombre_Pro, datos.descripcion_Pro,datos.precio_Pro,datos.categoria_idFK], (err, results) => {
            if (err){
                const objetodeError = {
                    errno: err.errno,
                    code: err.code
                }
                reject(objetodeError);
            } else {
                resolve(results);
            }
        });
    });
};

export const getProID = (id) => {
    return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM productos WHERE id_Pro = ?", [id], (err, result) => {

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

export const UpdateProduc = (datos) => {
    return new Promise((resolve, reject) => {

        connection.query("UPDATE productos SET Nom_Cat= ? WHERE Id_Cat = ?",
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

export const deleteProduc = (id) => {
    return new Promise((resolve, reject) => {
        connection.query("DELETE FROM productos WHERE id_Pro = ?", [id], (err, result) => {
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
