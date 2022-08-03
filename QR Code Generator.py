# _________________________ CREATE A QR CODE USING qrcode MODULE _________________________

# # Create a basic black & white QR Code for a web link.

# import qrcode as qr
# image = qr.make("https://www.lfd.uci.edu/~gohlke/pythonlibs/")
# image.save("Python_Extension_Packages.png")

# Create a colorful QR Code for a web link.

import qrcode
qr = qrcode.QRCode(version=1,
                   error_correction=qrcode.constants.ERROR_CORRECT_H,
                   box_size=15,
                   border=8)
qr.add_data("https://github.com/HARIOM317")
qr.make(fit=True)
img = qr.make_image(fill_color="red", back_color='white')
img.save("My_github.png")

# _________________________ CREATE A QR CODE USING pyqrcode MODULE _________________________

def qr_using_pyqrcode():
    import pyqrcode
    content = "This is My QR Code."
    url = pyqrcode.create(content)
    url.png("MyQRCode.png", scale=5)
    print("QR Code has created successfully!")
