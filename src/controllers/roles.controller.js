import { getAllRoles, getRolById, getRolxName, createRol, updateRol } from '../models/roles.model.js'
import { adminPermissions } from '../utils/manage.permissions.js';
import jsonwebtoken from 'jsonwebtoken'
import 'dotenv/config'
import { response } from '../utils/responses.js';
const jwt = jsonwebtoken;



//get all roles
export const GetRoles = async (req, res) => {

    try {

        jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

            const { Id_Rol_FK } = data.user;

            const adminPermiso = adminPermissions(Id_Rol_FK);

            if (adminPermiso) {
                const roles = await getAllRoles();

                if (roles.length > 0) {
                    response(res, 200, 200, roles);
                } else {
                    response(res, 204, 204, roles);
                }
            } else {
                response(res, 401, 401, "You don't have permissions");
            }

        });

    } catch (error) {

        if (err.errno) {

            response(res, 400, err.errno, err.code);

        } else {
            response(res, 500, 500, "something went wrong");

        }
    }

}

//get  roles by id
export const GetRolesxId = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

        try {
            const { id } = req.params;

            if (id) {

                const roles = await getRolById(id);

                if (roles.length > 0) {
                    response(res, 200, 200, roles);
                } else {
                    response(res, 204, 204, roles);
                }

            } else {
                response(res, 400, 102, "Something went wrong");
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

// create roles
export const createRoles = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

        if (err) {
            response(res, 500, 105, "Something went wrong");
        }

        try {

            const { Id_Rol_FK } = data.user;

            //verify user permissions
            const adminPermiso = adminPermissions(Id_Rol_FK);

            if (!adminPermiso) {

                response(res, 403, 403, "you dont have permissions");
            } else {

                const { Nom_Rol } = req.body;

                if (!Nom_Rol) {

                    response(res, 400, 102, "Something went wrong");

                } else {

                    //verificamos que no exista un rol con el mismo nombre
                    const rolExists = await getRolxName(Nom_Rol)


                    if (rolExists.length > 0) {

                        response(res, 500, 107, "rol already exist");

                    } else {



                        //create a rol
                        const datos = {
                            Nom_Rol: Nom_Rol.toLowerCase()
                        }

                        const newRol = await createRol(datos.Nom_Rol);
                        const objResp = {
                            insertId: newRol.insertId
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
// //update roles
export const UpdateRoles = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, dat) => {
        if (err) {

            response(res, 400, 105, "Something went wrong");
        }

        try {
            const { Id_Rol_FK } = dat.user;

            let adPermision = adminPermissions(Id_Rol_FK);

            if (adPermision) {

                //Data
                const { id } = req.params;
                const datos = req.body;

                //verify exist ROL
                let datosEnv;
                const roles = await getRolById(id)

                if (roles.length < 1) {

                    response(res, 500, 103, "Something went wrong");

                } else {


                    datosEnv = {
                        Id_Rol : id,
                        Nom_Rol: datos.Nom_Rol || roles[0].Nom_Rol
                    }

                  

                    const responses = await updateRol(datosEnv)
                    const objRes = {
                        affectedRows: responses.affectedRows
                    }

                    response(res, 200, 200, objRes);
                }

            } else {
                response(res, 401, 401, "You don't have permissions");
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