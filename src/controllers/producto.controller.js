import jsonwebtoken from "jsonwebtoken"
import { adminPermissions } from "../utils/manage.permissions.js";
import 'dotenv/config'
import { response } from "../utils/responses.js";
import {GetCatxId} from "../models/categorias.model.js";
import { getProductsModels,createProductsModels, getProID, deleteProduc } from "../models/productos.models.js";
import uniqid from 'uniqid';

const jwt = jsonwebtoken;
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
    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

        if (err) {
            response(res, 500, 105, "Something went wrong");
            console.log(err)
        }


        try {

            const id_Pro = uniqid();
            const {nombre_Pro,descripcion_Pro,precio_Pro,categoria_idFK } = req.body;
            
            if (!id_Pro) {
    
                response(res, 400, 102, "error products already exists");
    
            } else {
    
                //verificamos que no exista una categoria con el mismo nombre
                const productsExis = await getProID(id_Pro)
                const catExist = await GetCatxId(categoria_idFK)
    
    
                if (productsExis.length > 0 || catExist.length < 0 ) {
    
                    response(res, 500, 107, "products or categories already exist");
    
                } else {
    
                    //verify user permissions

                    const userData = jwt.decode(req.token, process.env.SECRETWORD);

                    const adminPermiso = adminPermissions(userData.user.Id_Rol_FK);
    
                    if (!adminPermiso) {
    
                        response(res, 403, 403, "you dont have permissions");
                    } else {
    
                        //create category
                        const dataPro = {
                            id_Pro: id_Pro,
                            nombre_Pro: nombre_Pro,
                            descripcion_Pro:descripcion_Pro,
                            precio_Pro : precio_Pro,
                            categoria_idFK: categoria_idFK
                            
                        }
                        
                        const nuevoProducts = await createProductsModels(dataPro);
                        
    
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
                console.log(err)
    
            }
    
    
        }
    })
 
}



export const deleteProductos = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, datos) => {
        if (err) {

            response(res, 400, 105, "Something went wrong");
            console.log("sapos hptas")
        }

        try {

            const { id } = req.params;
            const { Id_Rol_FK } = datos.user;

            const permiso = adminPermissions(Id_Rol_FK);

            if (!permiso) {
                response(res, 401, 401, "You don't have permissions");
            }

            //verify category exist

            const producto = await getProID(id)

            if (producto.length > 0) {

                const responses = await deleteProduc(id)


                response(res, 200, 200, responses);

                


            } else {
                response(res, 200, 204, category);
            }



        } catch (err) {

            if (err.errno) {

                response(res, 400, err.errno, err.code);

            } else {
                response(res, 500, 500, "something went wrong");
                console.log(err)

            }
        }
    })
}

