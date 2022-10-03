import userService from '../../services/userService';
import { setToken } from './tokenReducer';

/*
export const initializeUsers = () => {
	return async dispatch => {
		const users = await userService.getAll();
		dispatch({
			type: 'INIT_USERS',
			data: users
		});
	};
};
*/

export const register = user => {
	return async dispatch => {
		await userService.register(user);
		const loginResponse = await userService.login(user);
		const { token, ...loggedInUser } = loginResponse;
		dispatch({
			type: 'REGISTER_USER',
			data: loggedInUser
		});
		dispatch(setToken(token));
	};
};

export const login = user => {
	return async dispatch => {
		const response = await userService.login(user);
		const { token, ...loggedInUser } = response;
		dispatch({
			type: 'LOGIN_USER',
			user: loggedInUser
		});
		dispatch(setToken(token));
	};
};

export const logout = () => {
	return {
		type: 'LOGOUT'
	};
};

export const deleteUser = (user, token) => {
	return async dispatch => {
		await userService.deleteUser(user, token);
		dispatch({
			type: 'REMOVE_USER',
			data: { user }
		});
	};
};

const userReducer = (state = [], action) => {
	switch (action.type) {
	case 'LOGIN_USER':
	case 'REGISTER_AND_LOGIN_USER':
		window.localStorage.setItem('user', JSON.stringify(action.user));
		return action.user;
	case 'LOGOUT':
		window.localStorage.removeItem('user');
		return null;
	//case 'INIT_USERS':
	//	return action.data;
	default:
		return state;
	}
};

export default userReducer;
