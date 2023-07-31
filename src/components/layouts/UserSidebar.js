import React, { useEffect, useRef } from 'react';
import {
    Link 
} from 'react-router-dom';
import { useLogout } from '../../libs/business-logic/src/lib/auth';

const UserSidebar = ({isActive, callback}) => {
    const sidebarRef = useRef(null);
    const { onLogout } = useLogout();

    useEffect(() => {
        if(sidebarRef.current.classList.contains('active') && !isActive) {
            sidebarRef.current.classList.remove('active');
            callback(false)
        }
        else if(!sidebarRef.current.classList.contains('active') && isActive) {
            sidebarRef.current.classList.add('active');
            callback(true)
        }

    }, [isActive, sidebarRef, callback])

    const handleClose = () => {
        sidebarRef.current.classList.remove('active');
        callback(false)
    }

    return (
        <div className={`common-component__user-sidebar ${isActive ? 'active' : ''}`} ref={sidebarRef}>
            <div className='cc-user-sidebar__header'>
                <div></div>
                <button 
                    className='cc-user-sidebar-header__close-btn'
                    onClick={handleClose}
                >
                    x
                </button>
            </div>
            <ul>
                <li>
                    <Link to='/profile'>
                        <i className="fi fi-rr-user"></i>
                        <span>Your profile</span>
                    </Link>
                </li>
                <li>
                    <Link to='/profile'>
                        <i className="fi fi-rr-hand-holding-heart"></i>
                        <span>Your wishlist</span>
                    </Link>
                </li>
                <li>
                    <Link to='/setting'>
                        <i className="fi fi-rr-settings"></i>
                        <span>Setting</span>
                    </Link>
                </li>
                <li>
                    <button onClick={() => {
                        onLogout();
                        handleClose();
                    }}>
                        <i className="fi fi-rr-power"></i>
                        <span>Logout</span>
                    </button>
                </li>
            </ul>
        </div>
    );
}

export default UserSidebar;
