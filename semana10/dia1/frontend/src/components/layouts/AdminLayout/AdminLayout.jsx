import { AdminContent } from '../../common/AdminContent/AdminContent';
import { AdminSidebar } from '../../common/AdminSidebar/AdminSidebar';
import { Outlet } from 'react-router-dom';
import './AdminLayout.scss';

export const AdminLayout = ({ children }) => {

    return (
        <div className='Admin-layout'>
            <AdminSidebar />
            <AdminContent >
                <Outlet />
            </AdminContent>
        </div>
    )
}