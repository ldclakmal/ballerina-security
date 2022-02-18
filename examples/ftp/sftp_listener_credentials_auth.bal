import ballerina/ftp;
import ballerina/io;

listener ftp:Listener securedEP = new ({
    protocol: ftp:SFTP,
    host: "127.0.0.1",
    port: 2222,
    auth: {
        credentials: {
            username: "foo",
            password: "pass"
        }
    },
    path: "/upload",
    pollingInterval: 2,
    fileNamePattern: "(.*).txt"
});

isolated service on securedEP {
    isolated function onFileChange(ftp:WatchEvent event) {
        foreach ftp:FileInfo addedFile in event.addedFiles {
            io:println("Added file of path: ", addedFile.path);
        }
        foreach string deletedFile in event.deletedFiles {
            io:println("Deleted file of path: ", deletedFile);
        }
    }
}
