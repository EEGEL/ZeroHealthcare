from flask import Flask, jsonify, request
from app.connections.db_connect import get_db_connection
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
app.url_map.strict_slashes = False

@app.route('/hospitals', methods=['GET'])
def get_hospitals():
    pincode = request.args.get('pincode', type=int)
    hospital_name = request.args.get('hospital_name')
    city = request.args.get('city')

    conn = get_db_connection()
    cursor = conn.cursor()

    query = "SELECT hospital_id, hospital_name, location, city, state, pincode, contact_num FROM HOSPITAL"
    filters = []
    params = []

    if pincode:
        filters.append("pincode BETWEEN ? AND ?")
        params.extend([pincode - 5, pincode + 5])
    elif hospital_name:
        filters.append("LOWER(hospital_name) LIKE ?")
        params.append(f"%{hospital_name.lower()}%")

    if filters:
        query += " WHERE " + " AND ".join(filters)

    cursor.execute(query, params)
    rows = cursor.fetchall()

    hospital_list = []
    for row in rows:
        hospital = {
            "hospital_id": row.hospital_id,
            "hospital_name": row.hospital_name,
            "location": row.location,
            "city": row.city,
            "state": row.state,
            "pincode": row.pincode,
            "contact_num": row.contact_num
        }
        hospital_list.append(hospital)

    # If no hospitals found for pincode, fallback to city
    if pincode and not hospital_list and city:
        cursor.execute(
            "SELECT hospital_id, hospital_name, location, city, state, pincode, contact_num FROM HOSPITAL WHERE city = ?",
            (city,)
        )
        rows = cursor.fetchall()
        for row in rows:
            hospital = {
                "hospital_id": row.hospital_id,
                "hospital_name": row.hospital_name,
                "location": row.location,
                "city": row.city,
                "state": row.state,
                "pincode": row.pincode,
                "contact_num": row.contact_num
            }
            hospital_list.append(hospital)

    conn.close()

    if not hospital_list and pincode and not city:
        return jsonify({"message": "No hospitals found in the given pincode. Please provide a city to search."}), 404

    return jsonify(hospital_list)

if __name__ == '__main__':
    app.run(debug=True)
