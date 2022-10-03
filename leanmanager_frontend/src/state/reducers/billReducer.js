/* eslint-disable indent */
/* eslint-disable no-case-declarations */
import billService from '../../services/billService';

export const initializeBills = () => {
	return async dispatch => {
		const bills = await billService.getAll();
		dispatch({
			type: 'INIT_BILLS',
			data: bills
		});
	};
};

export const addBill = (bill, token) => {
	return async dispatch => {
		const newBill = await billService.postNew(bill, token);
		dispatch({
			type: 'ADD_BILL',
			data: newBill
		});
	};
};

export const deleteBill = (bill, token) => {
	return async dispatch => {
		await billService.deleteAsset(bill, token);
		dispatch({
			type: 'REMOVE_BILL',
			data: { bill }
		});
	};
};

const billReducer = (state = [], action) => {
	switch (action.type) {
		case 'ADD_BILL':
			return [...state, action.data];
		case 'REMOVE_BILL':
			return state.flatMap(bill => bill.id !== action.data.id ? bill : []);
		case 'INIT_BILLS':
			return action.data;
		default:
			return state;
	}
};

export default billReducer;
