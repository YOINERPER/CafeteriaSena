import mysql2 from "mysql2";

const mysql = mysql2;

export const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'senalearn'
})

if(connection){
    console.log("DB Connection success")
}else{
    console.log("DB connection error")
}
