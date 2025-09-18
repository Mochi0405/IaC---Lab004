from flask import Flask
import itertools

app = Flask(__name__)

# Lista de mensajes fijos
MESSAGES = [
    "Hola , en efecto estas en el app2",
    "Si, volviste al app2",
    "De nuevo aqui? me extrañaste"
]

# Ciclo infinito round-robin
message_cycle = itertools.cycle(MESSAGES)

@app.get("/")
def index():
    msg = next(message_cycle)
    return f"""
    <!doctype html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>APP3</title>
        <style>
          body {{
            font-family: sans-serif;
            background: linear-gradient (135deg, #f6d365, #fda085);
            color: #333;
            text-align: center;
            padding: 50px;
          }}
          h1 {{
            font-size: 2.5em;
            color: #222;
          }}
          p {{
            font-size: 1.5em;
            margin-top: 20px;
          }}
        </style>
      </head>
      <body>
        <h1>HOLA, AHORA ESTÁS EN EL APP2 🍊</h1>
        <p>{msg}</p>
      </body>
    </html>
    """
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
