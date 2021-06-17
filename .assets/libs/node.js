/* global require module */

const { lstatSync, readdirSync, writeFileSync } = require('fs');
const { join } = require('path');

const inflateInput = (inputDirs, parentDir = '/') =>
    inputDirs.map(
        inputDir =>
            (
                item =>
                    lstatSync(item).isDirectory()
                        ? inflateInput(readdirSync(item), item)
                        : [item]
            )(join(parentDir, inputDir))
    ).reduce(
        (a, c) => a.concat(c),
        []
    );

const getNamePathPair = filePath => {
    const elements = filePath.split('/');

    return [
        elements.slice(0, elements.length - 1).join('/'),
        elements[elements.length - 1]
    ];
};

const getVerticalList = inputArray =>
    inputArray.reduce((a, c) => a ? `${a}\n${c}` : c, '');

const writeToFile = (filePath, text) => {
    writeFileSync(filePath, text);
    console.log(`\nList stored in file: ${filePath}`);
};

module.exports.inflateInput = inflateInput;
module.exports.getNamePathPair = getNamePathPair;
module.exports.getVerticalList = getVerticalList;
module.exports.writeToFile = writeToFile;
