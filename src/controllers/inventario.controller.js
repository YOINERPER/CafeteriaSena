import jsonwebtoken from "jsonwebtoken"
import { adminPermissions } from "../utils/manage.permissions.js";
import 'dotenv/config'
import uniqid from 'uniqid';
import { response } from "../utils/responses.js";
import { getAllCat, GetCatxName, CreateCat, GetCatxId, UpdateCat, deleteCat } from "../models/inventario.model.js";
import { getProductsModels } from "../models/productos.model.js";

const jwt = jsonwebtoken;



//get all inventario
export const GetInventario = async (req, res) => {

    try {

        const categorias = await getAllCat();

        if (categorias.length > 0) {
            response(res, 200, 200, categorias);
        } else {
            response(res, 204, 204, categorias);
        }




    } catch (error) {

        if (err.errno) {

            response(res, 400, err.errno, err.code);

        } else {
            response(res, 500, 500, "something went wrong");

        }
    }

}

// create 
export const createInventario = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

        if (err) {
            response(res, 500, 105, "Something went wrong");
        }

        try {

            const inventario_Uid = uniqid();

            const { producto_idFK,cantidad_disponible,fecha_actualizacion } = req.body; // datos que se reciben desde el body 
         

            if (!producto_idFK) {

                response(res, 400, 102, "Something went wrong");

            } else {

                //verificamos que no exista un inventario  con el mismo producto
                const categoriaExists = await GetCatxName(Nom_Cat)


                if (categoriaExists.length > 0) {

                    response(res, 500, 107, "category already exist");

                } else {

                    const userData = jwt.decode(req.token, process.env.SECRETWORD);

                    //verify user permissions
                    const adminPermiso = adminPermissions(userData.user.Id_Rol_FK);

                    if (!adminPermiso) {

                        response(res, 403, 403, "you dont have permissions");
                    } else {


                        //create inventario
                
                        const datos = {
                    
                
                            cantidad_disponible:cantidad_disponible
                
                        }

                        const newCategory = await CreateCat(datos);
                        const objResp = {
                            insertId: Id_Cat
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


    })
}