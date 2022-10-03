import axios from 'axios';
import { baseUrl } from '../utils/utils';

const getAll = async () => {
	const response = await axios.get(`${baseUrl}/assets`);
	return response.data;
};

const postNew = async (newAsset, token) => {
	const response = await axios.post(`${baseUrl}/assets`, newAsset, { headers: { Authorization: token } });
	return response.data;
};

const deleteAsset = async (code, token) => {
	const response = await axios.delete(`${baseUrl}/assets/${code}`, { headers: { Authorization: token } });
	return response.data;
};

const ticketAsset = async (code, ticket, token, name) => {
	const response = await axios.post(`${baseUrl}/assets/${code}`, { ticket, name }, { headers: { Authorization: token } });
	return response.data;
};

const exports = { getAll, postNew, deleteAsset, ticketAsset };
export default exports;