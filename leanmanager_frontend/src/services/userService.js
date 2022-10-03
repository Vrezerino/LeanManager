import axios from 'axios';
import { baseUrl } from '../utils/utils';

const login = async user => {
	const response = await axios.post(`${baseUrl}/inventoryUsers/login`, user);
	return response.data;
};
const register = async user => {
	const response = await axios.post(`${baseUrl}/inventoryUsers/register`, user);
	return response.data;
};

const getAll = async () => {
	const response = await axios.get(`${baseUrl}/inventoryUsers`);
	return response.data;
};

const getOne = async id => {
	const response = await axios.get(`${baseUrl}/inventoryUsers/:${id}`);
	return response.data;
};

const exports = { login, register, getAll, getOne };
export default exports;