import { getAllLoc, getAllLocUsers, InsertLocation, getLocxId, updateLocation } from '../models/localizacion.model.js'
import { adminPermissions } from '../utils/manage.permissions.js';
import jsonwebtoken from 'jsonwebtoken'
import 'dotenv/config'
import { response } from '../utils/responses.js';
import { GetUserbyId } from '../models/users.model.js'
const jwt = jsonwebtoken;



//get all localizaciones
export const GetLocations = async (req, res) => {

    try {

        jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

            const { Id_Rol_FK } = data.user;

            const adminPermiso = adminPermissions(Id_Rol_FK);

            if (adminPermiso) {
                const locations = await getAllLoc();

                if (locations.length > 0) {
                    response(res, 200, 200, locations);
                } else {
                    response(res, 204, 204, locations);
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

//get  locations by user id
export const GetLocationsxUser = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

        try {
            const { id } = req.params;

            if (id) {

                //verify exist user
                const user = await GetUserbyId(id)

                if (user.length < 1) {

                    response(res, 400, 103, "user don't exist");

                } else {

                    const locations = await getAllLocUsers(id);

                    if (locations.length > 0) {
                        response(res, 200, 200, locations);
                    } else {
                        response(res, 204, 204, locations);
                    }
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

// create locations
export const createLocations = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

        if (err) {
            response(res, 500, 105, "Something went wrong");
        }

        try {


            const { Dir_Ip, Id_User } = req.body;

            if (!Dir_Ip || !Id_User) {

                response(res, 400, 102, "Something went wrong");

            } else {

                //verificamos que exista el usuario
                const UserExists = await GetUserbyId(Id_User)


                if (UserExists.length < 1) {

                    response(res, 500, 103, "User don't exist");

                } else {

                    const { Id_Rol_FK } = data.user;

                    //verify user permissions
                    const adminPermiso = adminPermissions(Id_Rol_FK);

                    if (!adminPermiso) {

                        response(res, 403, 403, "you dont have permissions");
                    } else {

                        //create category
                        const datos = {
                            Dir_Ip: Dir_Ip,
                            Id_User: Id_User
                        }

                        const newLocation = await InsertLocation(datos);
                        const objResp = {
                            insertId: newLocation.insertId
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

// //update locations
export const UpdateLocations = async (req, res) => {

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

                //verify exist location
                let datosEnv;
                const location = await getLocxId(id)

                if (location.length < 1) {

                    response(res, 500, 103, "Something went wrong");

                } else {

                    //user verify exist
                    if (datos.Id_User) {

                        const userExist = await GetUserbyId(datos.Id_User);

                        if (userExist.length < 1) {

                            response(res, 500, 103, "User don't exist");


                        } else {

                            datosEnv = {
                                Id_Loc: id,
                                Dir_Ip: datos.Dir_Ip || location[0].Dir_Ip,
                                Id_User_FK: datos.Id_User
                            }

                            const responses = await updateLocation(datosEnv)
                            const objRes = {
                                affectedRows: responses.affectedRows
                            }
                            response(res, 200, 200, objRes);
                        }

                    } else {

                        datosEnv = {
                            Id_Loc: id,
                            Dir_Ip: datos.Dir_Ip || location[0].Dir_Ip,
                            Id_User_FK: datos.Id_User || location[0].Id_User_FK
                        }

                        const responses = await updateLocation(datosEnv)
                        const objRes = {
                            affectedRows: responses.affectedRows
                        }
                        response(res, 200, 200, objRes);

                    }

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