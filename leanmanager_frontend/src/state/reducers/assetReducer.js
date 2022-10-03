/* eslint-disable indent */
/* eslint-disable no-case-declarations */
import assetService from '../../services/assetService';

export const initializeAssets = () => {
	return async dispatch => {
		const assets = await assetService.getAll();
		dispatch({
			type: 'INIT_ASSETS',
			data: assets
		});
	};
};

export const addAsset = (asset, token) => {
	return async dispatch => {
		const newAsset = await assetService.postNew(asset, token);
		dispatch({
			type: 'ADD_ASSET',
			data: newAsset
		});
	};
};

export const deleteAsset = (asset, token) => {
	return async dispatch => {
		await assetService.deleteAsset(asset, token);
		dispatch({
			type: 'REMOVE_ASSET',
			data: { asset }
		});
	};
};

export const ticketAsset = (code, commentObj, token, name) => {
	return async dispatch => {
		const savedTicket = await assetService.ticketAsset(code, commentObj, token, name);
		dispatch({
			type: 'TICKET_ASSET',
			code,
			ticket: savedTicket
		});
	};
};

const assetReducer = (state = [], action) => {
	switch (action.type) {
		case 'ADD_ASSET':
			return [...state, action.data];
		case 'REMOVE_ASSET':
			return state.flatMap(asset => asset.code !== action.data.code ? asset : []);
		case 'TICKET_ASSET':
			const assetToTicket = state.find(asset => asset.code === action.code);
			const ticketedAsset = { ...assetToTicket, tickets: assetToTicket.comments.concat(action.ticket) };
			return state.map(asset => asset.code !== action.code ? asset : ticketedAsset);
		case 'INIT_ASSETS':
			return action.data;
		default:
			return state;
	}
};

export default assetReducer;
