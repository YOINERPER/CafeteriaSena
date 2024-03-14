import express from "express"
import userRoutes from "./v1/routes/users.routes.js";
import routesCategorias from "./v1/routes/categorias.routes.js";
import routesLocation from "./v1/routes/localizacion.routes.js";
import routesTokens from "./v1/routes/tokens.routes.js";
import routesRoles from "./v1/routes/roles.routes.js";
import routesProductos from "./v1/routes/productos.routes.js" ;
import {swaggerDocs} from "./v1/swagger.js"
import cors from "cors"


const app = express();


app.use(cors({credentials: true, origin: 'http://127.0.0.1:5500'}));

app.use(express.json());

//routes
app.use(userRoutes);
app.use(routesCategorias);
app.use(routesLocation);
app.use(routesTokens);
app.use(routesRoles);
app.use(routesProductos);




app.listen(3000,()=>{
    console.log("Server run in port 3000");
    swaggerDocs(app,3000)
});