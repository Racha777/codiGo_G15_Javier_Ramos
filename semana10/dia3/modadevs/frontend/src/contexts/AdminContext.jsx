import { createContext, useEffect, useState } from "react";

export const AdminContext = createContext();

export const AdminContextProvider = ({ children }) => {
    const [adminTitle, setAdminTitle] = useState("Products");
    const [productsList, setProductsList] = useState({
        isLoading: false,
        isError: false,
        isSuccess: false,
        errorMessage: "",
        successMessage: "",
        products: [],
    });
    const [productsFiltered, setProductsFiltered] = useState([]);

    useEffect(() => {
        setProductsFiltered(productsList.products);
    }, [productsList.products]);

    const handleProductsList = (key, value) => {
        setProductsList({
            ...productsList,
            [key]: value,
        });
    }

    return (
        <AdminContext.Provider value={{
            adminTitle,
            setAdminTitle,
            productsList,
            handleProductsList,
            productsFiltered,
            setProductsFiltered
        }}>
            {children}
        </AdminContext.Provider>
    );
}