import { Promise } from 'es6-promise';
window.Promise = Promise
import get from "lodash/get";
import set from "lodash/set";
import isFunction from "lodash/isFunction";

export const logger = store => {
    if (process.env.NODE_ENV === "production") return;
    store.subscribe((mutation, state) => {
        const { type, payload } = mutation;
        if (type !== "set") {
            // return console.log(`@${type} ---->`, payload);
        }
        var { reducer, name, path } = payload;
        if (/currentTime|buffered|percent/.test(path)) return;
        if (!name) name = "----";
        if (reducer === "") reducer = "null character";
        if (/^data:/.test(reducer)) reducer = "base64...";
        // console.log(`${name}@set ---->`, path, "---->", reducer);
    });
};

export const setter = (state, { path, reducer }) => {
    const old = get(state, path);
    if (old === undefined) {
        if (process.env.NODE_ENV !== "production") {
            // console.log(
            //     `****** The Path << ${path} >> Not Found And Create New Property`
            // );
        }
    }
    const target = isFunction(reducer) ? reducer(old) : reducer;
    set(state, path, target);
};