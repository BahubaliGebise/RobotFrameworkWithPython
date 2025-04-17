import openpyxl
import json
import os
from robot.api.deco import keyword


class ReadFromExcel:
    def __init__(self):
        self.test_data = {}

    @keyword
    def read_test_data(self, file_path):
        """Reads data from the Excel file and stores it in a dictionary."""
        workbook = openpyxl.load_workbook(file_path)
        sheet = workbook.active

        for row in sheet.iter_rows(min_row=2, values_only=True):  # Starting from row 2 to skip headers
            test_case_id = row[0]
            method = row[1]
            url = row[2]
            headers = json.loads(row[3]) if row[3] else {}
            payload = row[4] if row[4] else None
            expected_status = row[5]

            self.test_data[test_case_id] = {
                "Method": method,
                "URL": url,
                "Headers": headers,
                "Payload": payload,
                "Expected_Status": expected_status
            }

        return self.test_data

    @keyword
    def read_json_payload(self, filename):
        """Reads the payload JSON from the 'Payloads' folder."""
        file_path = os.path.join("Payloads", filename)
        if os.path.exists(file_path):
            with open(file_path, "r") as file:
                return json.load(file)
        return {}

