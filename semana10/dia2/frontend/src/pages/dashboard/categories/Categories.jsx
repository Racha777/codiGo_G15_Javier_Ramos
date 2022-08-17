import { useContext, useEffect, useState } from "react";
import { AdminContext } from "../../../contexts/AdminContext";
import { GetCategories, PostCategory } from "../../../services/CategoriesServices";

export const Categories = () => {

    const { setAdminTitle } = useContext(AdminContext);
    const [listOfCategories, setListOfCategories] = useState([]);
    const [category, setCategory] = useState({
        categoriaNombre: "",
        categoriaDescripcion: "",
    });
    const [bandera, setBandera] = useState(false);

    useEffect(() => {
        setAdminTitle('Categories');
    }, []);

    useEffect(() => {
        const fetchData = async () => {
            const response = await GetCategories();
            setListOfCategories(response.content);
        }
        fetchData();
    }, [bandera])

    const createCategory = async (event) => {
        event.preventDefault();
        try {
            const response = await PostCategory(category);
            if (response.success === true) {
                setBandera(!bandera);
                setCategory({
                    categoriaNombre: "",
                    categoriaDescripcion: "",
                })
                console.log('La categoria se creado correctamente')
            } else {
                alert('La categoria no se pudo crear')
            }
        } catch (error) {
            console.log(error)
        }
    };

    const handleInputChange = (event) => {
        const { name, value } = event.target;
        return setCategory({ ...category, [name]: value });
    };

    return (
        <div className='Products'>
            <h4 className='Products-subtitle'>All categories</h4>
            <div className='Products-table'>
                <table>
                    <thead>
                        <tr>
                            <th>Product name</th>
                            <th>Product description</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            listOfCategories.length > 0 && listOfCategories.map(category => (
                                <tr key={category.categoriaId}>
                                    <td>{category.categoriaNombre}</td>
                                    <td>{category.categoriaDescripcion}</td>
                                </tr>
                            ))
                        }
                    </tbody>
                </table>
            </div>

            <h4 className='Products-subtitle'>Create category</h4>
            <form className='Products-create-form' onSubmit={createCategory}>
                <div className="form-group">
                    <label htmlFor="productName">Category name</label>
                    <input
                        type="text"
                        name='categoriaNombre'
                        id='categoriaNombre'
                        value={category.categoriaNombre}
                        onChange={handleInputChange}
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="productDescription">Category description</label>
                    <input
                        type="text"
                        name='categoriaDescripcion'
                        id='categoriaDescripcion'
                        value={category.categoriaDescripcion}
                        onChange={handleInputChange}
                    />
                </div>
                <div className='form-group'>
                    <button className='Products-create-button'>Create category</button>
                </div>
            </form>
        </div>
    )
}