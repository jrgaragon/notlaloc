process.env.PORT = process.env.PORT || 3000;
process.env.database = 'HbhOn83foM';
process.env.user = 'HbhOn83foM';
process.env.password = 'mE1ckK664n';
process.env.NODE_ENV = process.env.NODE_ENV || 'dev';

let urlDatabase;

if (process.env.NODE_ENV === 'dev') {
    urlDatabase = 'remotemysql.com'
} else {
    urlDatabase = 'proddatabase';
}

process.env.URLDB = urlDatabase;