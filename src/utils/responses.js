export const response = (res, status, codigo, message) => {
    if (status != 200) {
        return res.status(status).json({
            result: {
                type: "error",
                code: codigo,
                message: message
            }

        });
    } else {

        return res.status(status).json({
            result: {
                type: "success",
                code: codigo,
                data: message
            }

        });

    }

}