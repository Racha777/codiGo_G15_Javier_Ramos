import { useContext, useEffect, useState } from "react";
import { AdminContext } from "../../../contexts/AdminContext";
import { GetCategories } from "../../../services/CategoriesServices";
import { GetAllProducts, PostProduct,UploadImage } from "../../../services/ProductsServices";
import './Products.scss';

export const Products = () => {
    const { setAdminTitle } = useContext(AdminContext);
    const [productFile,setProductFile] = useState();
    const [listOfProducts, setListOfProducts] = useState([]);
    const [listOfCategories, setListOfCategories] = useState([]);
    const [product, setProduct] = useState({
        productoNombre: '',
        productoDescripcion: '',
        productoPrecio: 0.00,
        productoImagen: '',
        categoriaId: 0,
    });
    const [bandera, setBandera] = useState(false);

    useEffect(() => {
        const fetchData = async () => {
            const response = await GetCategories();
            setListOfCategories(response.content);
        }
        fetchData();
    }, [])

    useEffect(()=>{
        const fetchData = async () => {
            const response = await GetAllProducts();
            setListOfProducts(response.content);
        }
        fetchData();
    },[bandera])

    useEffect(() => {
        setAdminTitle('Products');
        const fetchData = async () => {
            try {
                const response = await GetAllProducts();
                if (response.success) {
                    setListOfProducts(response.content);
                }
            } catch (error) {
                console.log(error)
            }
        }
        fetchData();
    }, [])

    const createProduct = async (event) => {
        event.preventDefault();
        try {
            /*const responseUrl = await UploadImage(productFile);
            console.log(responseUrl.content);
            if(responseUrl.success){
                setProduct({ ...product, productoImagen: responseUrl.content });
                console.log(product);
            }*/
            
            const response = await PostProduct(product);
            if (response.success) {
                setBandera(!bandera);
                setProduct({
                    productoNombre: '',
                    productoDescripcion: '',
                    productoPrecio: 0.00,
                    productoImagen: '',
                    categoriaId: 0,
                })
                //setProductFile()
            }
        } catch (error) {
            console.log(error)
        }
    };

    const handleInputChange = (event) => {
        const { name, value } = event.target;
        if (name === 'productoPrecio') {
            return setProduct({ ...product, [name]: parseFloat(value) });
        } else if (name === 'categoriaId') {
            return setProduct({ ...product, [name]: parseInt(value) });
        } else {
            return setProduct({ ...product, [name]: value });
        }
    };

    const handleFileChange = async (event) => {
        //setProductFile(event.target.files[0])
            const responseUrl = await UploadImage(event.target.files[0]);
            console.log(responseUrl.content);
            if(responseUrl.success){
                setProduct({ ...product, productoImagen: responseUrl.content });
                console.log(product);
            }
    }
    return (
        <div className='Products'>
            <h4 className='Products-subtitle'>All products</h4>
            <div className='Products-table'>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Imagen</th>
                            {/* <th>Product category</th> */}
                        </tr>
                    </thead>
                    <tbody>
                        {
                            listOfProducts.length > 0 && listOfProducts.map(product => (
                                <tr key={product.productoId}>
                                    <td>{product.productoNombre}</td>
                                    <td>{product.productoDescripcion}</td>
                                    <td>{product.productoPrecio}</td>
                                    <td>{product.productoImagen}</td>
                                    {/* <td>{product.productoCategoria}</td> */}
                                </tr>
                            ))
                        }
                    </tbody>
                </table>
            </div>

            <h4 className='Products-subtitle'>Create product</h4>
            <form className='Products-create-form' onSubmit={createProduct} encType="multipart/form-data">
                <div className="form-group">
                    <label htmlFor="productoNombre">Nombre de producto</label>
                    <input
                        type="text"
                        name='productoNombre'
                        id='productoNombre'
                        value={product.productoNombre}
                        onChange={handleInputChange}
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="productoDescripcion">Product description</label>
                    <input
                        type="text"
                        name='productoDescripcion'
                        id='productoDescripcion'
                        value={product.productoDescripcion}
                        onChange={handleInputChange}
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="productoPrecio">Product price</label>
                    <input
                        type="number"
                        min={0}
                        step={0.1}
                        name='productoPrecio'
                        id='productoPrecio'
                        value={product.productoPrecio}
                        onChange={handleInputChange} />
                </div>
                <div className="form-group">
                    <label htmlFor="productoImagen">Product image</label>
                    <input
                        type="file"
                        onChange={handleFileChange}
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="categoriaId">Product category</label>
                    <select
                        name='categoriaId'
                        id='categoriaId'
                        value={product.categoriaId}
                        onChange={handleInputChange}
                    >
                        <option value="">Elegir Categoria</option>
                        {
                            listOfCategories.map((category, index) => (
                                <option key={index} value={category.categoriaId}>{category.categoriaNombre}</option>
                            ))
                        }
                    </select>
                </div>
                <div className='form-group'>
                    <button className='Products-create-button'>Create product</button>
                </div>
            </form>
        </div>
    )
}