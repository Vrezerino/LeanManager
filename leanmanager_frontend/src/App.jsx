import './App.css';
import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';

import { initializeAssets } from './state/reducers/assetReducer';
import { initializeInventoryUsers } from './state/reducers/userReducer';

import { logout } from './state/reducers/userReducer';
import { removeToken } from './state/reducers/tokenReducer';

const App = () => {
	const dispatch = useDispatch();
	const notif = useSelector(({ notification }) => notification);

	const logOut = () => {
		dispatch(logout());
		dispatch(removeToken());
	};

	useEffect(() => {
		dispatch(initializeInventoryUsers);
		dispatch(initializeAssets);
		dispatch(initializeAssets);
		dispatch(initializeAssets);
		dispatch(initializeAssets);
		dispatch(initializeAssets);
		dispatch(initializeAssets);
		dispatch(initializeAssets);
	}, []);

	return (
		<div className="App">
			yeah
		</div>
	);
};

export default App;
