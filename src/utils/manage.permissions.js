
export const adminPermissions = (rolId) => {
    if (rolId != 2) {
        return false
        
    }else{

        return true
    }
}

export const UserPermissions = (rolId) => {
    if (rolId != 1) {
        return false
        
    }else{
        return true
    }
}

export const InstPermissions = (rolId) => {
    if (rolId != 3) {
        return false
        
    }else{
        return true
    }
}