import './PublicHeader.scss';
import { BiSearch } from 'react-icons/bi';
import { Link, NavLink } from 'react-router-dom';
import { RiShoppingBag3Line, RiUser3Line } from 'react-icons/ri';
import { HiOutlineMenuAlt3 } from 'react-icons/hi';
import { Modal, Button } from 'react-bootstrap';
import { useState } from 'react';

export const PublicHeader = () => {

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);

    return (
        <>
            <div className='Header'>
                <div className="u_wrapper">
                    <nav className='Header-container'>
                        <div className="Header-icon">
                            <Link to={"/pe"}>
                                MODA
                            </Link>
                        </div>
                        <ul className='Header-nav-list'>
                            <li>
                                <NavLink
                                    to={"/pe/buscar"}
                                    className={(estatus) => estatus.isActive ? 'Header-nav-item active' : 'Header-nav-item'}
                                >
                                    Todos
                                </NavLink>
                            </li>
                            <li>
                                <NavLink
                                    to={"/pe/buscar/novedades"}
                                    className={(estatus) => estatus.isActive ? 'Header-nav-item active' : 'Header-nav-item'}
                                >
                                    Novedades
                                </NavLink>
                            </li>
                            <li>
                                <NavLink
                                    // to={"/pe/buscar/destacados"}
                                    to={"/admin-panel/products"}
                                    className={(estatus) => estatus.isActive ? 'Header-nav-item active' : 'Header-nav-item'}
                                >
                                    Destacados
                                </NavLink>
                            </li>
                        </ul>
                        <div className='Header-search-product'>
                            <div className='Header-search-container'>
                                <BiSearch className='Header-search-icon' />
                                <input className='Header-search-input' type="text" placeholder="Buscar producto" />
                            </div>
                        </div>
                        <div className="Header-shoping-cart">
                            <RiShoppingBag3Line />
                        </div>
                        <div className="Header-user">
                            <RiUser3Line onClick={() => setShow(true)} />
                        </div>
                        <div className="Header-burger-button">
                            <HiOutlineMenuAlt3 />
                        </div>
                    </nav>
                </div>
            </div>

            <Modal show={show} onHide={handleClose} className='Auth-modal'>
                <Modal.Header closeButton>
                </Modal.Header>
                <Modal.Body>
                    <div className='Auth-modal-logo'>
                        <img src='/vite.svg' alt='logo' />
                    </div>
                    <div className='Auth-modal-form'>
                        <div className='Auth-modal-form-title'>
                            Iniciar sesión
                        </div>
                        <input className='Auth-modal-form-input' type="text" placeholder="Correo electrónico" />
                        <input className='Auth-modal-form-input' type="password" placeholder="Contraseña" />
                        <button className='Auth-modal-form-button' type="submit">
                            Iniciar sesión
                        </button>
                        <button className='Auth-modal-form-button' type="submit">
                            Crear cuenta
                        </button>
                    </div>
                </Modal.Body>
            </Modal>
        </>
    )
}