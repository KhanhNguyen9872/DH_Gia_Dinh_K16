const express = require('express');
const qrcode = require('qrcode');

const router = express.Router();
router.post('/', async (req, res) => {
    try {
        const text = req.body.url;
        const qr = await qrcode.toDataURL(text);
        const qrImage = Buffer.from(qr.split(',')[1], 'base64');
        res.writeHead(200, {
            'Content-Type': 'image/png',
            'Content-Length': qrImage.length
        });
        res.end(qrImage);
    } catch (err) {
        console.log(err);
        res.status(500).json({ error: 'Failed to generate QR code' });
    }
});

// GET route example
router.get('/', (req, res) => {
    res.render('qrcode');
});


module.exports = router;