import { getAllTokens, getAllTokensUsers, InserTokens, getAllTokensxTipo, getAllTokensxId, UpdateToken } from "../models/tokens.model.js";
import { response } from "../utils/responses.js";
import jsonwebtoken from 'jsonwebtoken'
import { InstPermissions, adminPermissions } from "../utils/manage.permissions.js";
import { GetUserbyId } from "../models/users.model.js";
import 'dotenv/config.js'
const jwt = jsonwebtoken;

export const GetAllTokens = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

        if (err) {
            response(res, 500, 105, "Something went wrong");
        } else {

            try {
                //verify permissions
                const { Id_Rol_FK } = data.user;

                let adPermision = adminPermissions(Id_Rol_FK);

                if (adPermision) {

                    const tokens = await getAllTokens();

                    response(res, 200, 200, tokens);


                } else {
                    response(res, 403, 403, "you dont have permissions");
                }

            } catch (err) {

                if (err.errno) {
                    response(res, 500, 500, "something went wrong");
                } else {
                    response(res, 500, 500, "something went wrong");
                }
            }
        }
    })

}

//get  TOKENS by user id
export const GetTokenssxUser = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {
        if (err) {
            response(res, 500, 105, "Something went wrong");
        } else {

            try {
                //verify permissions
                const { Id_Rol_FK } = data.user;
                let adPermision = adminPermissions(Id_Rol_FK);

                if (adPermision) {
                    const { id } = req.params;

                    if (id) {

                        //verify exist user
                        const user = await GetUserbyId(id)

                        if (user.length < 1) {

                            response(res, 400, 103, "user don't exist");

                        } else {

                            const tokens = await getAllTokensUsers(id);

                            if (tokens.length > 0) {
                                response(res, 200, 200, tokens);
                            } else {
                                response(res, 204, 204, tokens);
                            }
                        }


                    } else {
                        response(res, 400, 102, "Something went wrong");
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
    })

}

//get  TOKENS by type
export const GetTokenssxTipo = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {
        if (err) {
            response(res, 500, 105, "Something went wrong");
        } else {

            try {
                //verify permissions
                const { Id_Rol_FK } = data.user;
                let adPermision = adminPermissions(Id_Rol_FK);

                if (adPermision) {
                    const { tipo } = req.params;

                    if (tipo) {

                        const tokens = await getAllTokensxTipo(tipo);

                        if (tokens.length > 0) {
                            response(res, 200, 200, tokens);
                        } else {
                            response(res, 204, 204, tokens);
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
    })

}

// Insert Tokens
export const InsertToken = async (req, res) => {

    jwt.verify(req.token, process.env.SECRETWORD, async (err, data) => {

        if (err) {
            response(res, 500, 105, "Something went wrong");
        }
        // verify permissions
        const { Id_Rol_FK } = data.user;
        let adPermision = adminPermissions(Id_Rol_FK);

        if (adPermision) {

            try {

                const { Token, Fec_Caducidad, Id_User, Tipo_token } = req.body;

                if (!Token || !Fec_Caducidad || !Id_User || !Tipo_token) {

                    response(res, 400, 102, "Something went wrong");

                } else {

                    //verificamos que exista el usuario
                    const UserExists = await GetUserbyId(Id_User)


                    if (UserExists.length < 1) {

                        response(res, 500, 103, "User don't exist");

                    } else {

                        //create tokens
                        const datos = {
                            codigo: Token,
                            exp: Fec_Caducidad,
                            Id_User: Id_User,
                            tipo: Tipo_token
                        }
                        console.log(datos)

                        const newToken = await InserTokens(datos);
                        const objResp = {
                            insertId: newToken.insertId
                        }
                        response(res, 200, 200, objResp);

                    }
                }


            } catch (err) {

                if (err.errno) {

                    response(res, 400, err.errno, err.code);

                } else {
                    response(res, 500, 500, "something went wrong");

                }


            }

        } else {
            response(res, 403, 403, "you dont have permissions");
        }


    })
}

//update Tokens
export const UpdateTokens = async (req, res) => {

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
                let datosEnv;

                //verify token exist
                const token = await getAllTokensxId(id)

                if (token.length < 1) {

                    response(res, 500, 103, "Something went wrong");

                } else {

                    //user verify exist
                    if (datos.Id_User) {

                        const userExist = await GetUserbyId(datos.Id_User);
                        if (userExist.length < 1) {

                            response(res, 500, 103, "User don't exist");

                        } else {

                            datosEnv = {
                                Id_Token: id,
                                Token: datos.Token || token[0].Token,
                                User_Id_FK: datos.Id_User,
                                Fec_Caducidad: datos.Fec_Caducidad || token[0].Fec_Caducidad,
                                Tipo_token: datos.Tipo_token || token[0].Tipo_token
                            }

                            const responses = await UpdateToken(datosEnv)
                            const objRes = {
                                affectedRows: responses.affectedRows
                            }
                            response(res, 200, 200, objRes);
                        }

                    } else {

                        datosEnv = {
                            Id_Token: id,
                            Token: datos.Token || token[0].Token,
                            User_Id_FK: datos.Id_User || token[0].Id_User_FK,
                            Fec_Caducidad: datos.Fec_Caducidad || token[0].Fec_Caducidad,
                            Tipo_token: datos.Tipo_token || token[0].Tipo_token
                        }

                        const responses = await UpdateToken(datosEnv)
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