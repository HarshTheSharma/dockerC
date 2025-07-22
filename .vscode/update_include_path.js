const fs = require('fs');
const path = require('path');

const configDir = path.resolve(__dirname);
const configFile = path.join(configDir, 'c_cpp_properties.json');

const folderName = process.argv[2] || '';

let config = {
    version: 4,
    configurations: [
        {
            name: "Linux",
            includePath: [],
            defines: [],
            compilerPath: "/usr/bin/gcc",
            cStandard: "gnu17",
            cppStandard: "gnu++20",
            intelliSenseMode: "linux-gcc-x64"
        }
    ]
};

try {
    if (fs.existsSync(configFile)) {
        const data = fs.readFileSync(configFile, 'utf8');
        config = JSON.parse(data);
    }
} catch (err) {
    console.warn('Error reading existing config, starting fresh');
}

let includePath;

if (folderName.trim() === '') {
    includePath = ["${workspaceFolder}/**"];
} else {
    includePath = ["${workspaceFolder}/" + folderName + "/**"];
}

includePath.push("/usr/include", "/usr/local/include");

config.configurations[0].includePath = includePath;

fs.writeFileSync(configFile, JSON.stringify(config, null, 2));

console.log(`Updated includePath to ${includePath.join(', ')}`);
