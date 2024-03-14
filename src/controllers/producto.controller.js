import jsonwebtoken from "jsonwebtoken"
import { adminPermissions } from "../utils/manage.permissions.js";
import 'dotenv/config'
import { response } from "../utils/responses.js";
import { getProductsModels,createProductsModels } from "../models/productos.models.js";


// get all productos from response object
export const GetProductos = async (req, res) => {

    try {
    
        const data = await getProductsModels()
        response(res, 200, 200, data)
     
    } catch (err) {

        if (err.errno) {

            response(res, 400, err.errno, err.code);

        } else {
            response(res, 500, 500, "something went wrong");

        }
    
    }

}
export const createProducts = async (req, res) => {

    try {
        const { id_Pro, nombre_Pro,descripcion_Pro,precio_Pro,categoria_idFK } = req.body;
        
        if (!id_Pro) {

            response(res, 400, 102, "error products already exists");

        } else {

            //verificamos que no exista una categoria con el mismo nombre
            const productsExis = await getProID(id_Pro)


            if (productsExis.length > 0) {

                response(res, 500, 107, "products already exist");

            } else {

                //verify user permissions
                const adminPermiso = adminPermissions(userData.user.Id_Rol_FK);

                if (!adminPermiso) {

                    response(res, 403, 403, "you dont have permissions");
                } else {

                    //create category
                    const dataPro = {
                        id_Pro: id_Pro,
                        nombre_Pro: Nom_Cat.toLowerCase(),
                        descripcion_Pro:descripcion_Pro,
                        precio_Pro : precio_Pro,
                        categoria_idFK: categoria_idFK
                    }

                    const newProducts = await createProductsModels(dataPro);
                  

                    const objResp = {
                        insertId: id_Pro
                    }
                    response(res, 200, 200, objResp);


                }



            }
        }

    } catch (err) {

        if (err.errno) {

            response(res, 400, err.errno, err.code);

        } else {
            response(res, 500, 500, "something went wrong");

        }


    }


}

