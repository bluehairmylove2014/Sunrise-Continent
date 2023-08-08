import React from 'react';

import Header from './Header';
import Footer from './Footer';

const UserMainLayout = ({children}) => {
    return (
        <>
            <Header/>
                {children}
            <Footer/>
        </>
    );
}

export default UserMainLayout;
