import { applyMiddleware } from 'redux';
import { configureStore } from '@reduxjs/toolkit';
import { composeWithDevTools } from '@redux-devtools/extension';

import thunk from 'redux-thunk';

//import notifReducer from './reducers/notifReducer';
import userReducer from './reducers/userReducer';
import assetReducer from './reducers/assetReducer';
//import billReducer from './reducers/billReducer.js';
//import customerReducer from './reducers/customerReducer';
//import orderReducer from './reducers/orderReducer';
//import ticketReducer from './reducers/ticketReducer';
import tokenReducer from './reducers/tokenReducer';

const reducer = {
	//notification: notifReducer,
	user: userReducer,
	asset: assetReducer,
	//bill: billReducer,
	//customer: customerReducer,
	//order: orderReducer,
	//ticket: ticketReducer,
	token: tokenReducer
};

const store = configureStore({ reducer, devTools: composeWithDevTools(applyMiddleware(thunk)) });
export default store;