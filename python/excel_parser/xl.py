import openpyxl

wb = openpyxl.load_workbook(filename="./sf.xlsx")
sheet_sf = wb["TDSheet"]
sheet_gtd = wb["gtd"]
wb.active = sheet_sf


def main():
    goods = {}  # Dict of all goods with number of repeatences in gtd sheet
    for row in range(1, sheet_gtd.max_row + 1):
        if sheet_gtd[f"B{row}"].value.strip() in goods:
            goods[sheet_gtd[f"B{row}"].value.strip()] += 1
        else:
            goods[sheet_gtd[f"B{row}"].value.strip()] = 1

    uniq_goods = goods.copy()   # Dict of uniq goods in gtd sheet
    for k in goods:
        if goods[k] > 1:
            del uniq_goods[k]

    dict_gtd = {}   # Dict of uniq goods in gtd sheet with gtds as values
    for row in range(1, sheet_gtd.max_row + 1):
        if sheet_gtd[f"B{row}"].value.strip() in uniq_goods:
            dict_gtd[sheet_gtd[f"B{row}"].value.strip()] = sheet_gtd[f"E{row}"].value.strip()

    for row in range(1, sheet_sf.max_row):
        if sheet_sf[f"B{row}"].value == 1:
            sheet_sf_begin = row + 1   # The first line of goods list in TDSheet sheet
            print(sheet_sf_begin) 
            break

    for row in range(sheet_sf_begin, sheet_sf.max_row):
        if "Всего к оплате" in sheet_sf[f"B{row}"].value:
            sheet_sf_end = row  # The last line of goods list in TDSheet sheet
            print(sheet_sf_end)
            break

    # Insterting gtds from gtd sheet into TDSheet sheet
    for row in range(sheet_sf_begin, sheet_sf_end):
        if sheet_sf[f"B{row}"].value.strip() in dict_gtd:
            sheet_sf.cell(row=row, column=32).value = dict_gtd[sheet_sf[f"B{row}"].value.strip()]

    wb.remove(sheet_gtd)
    wb.save("./sf_gtd.xlsx")


if __name__ == "__main__":
    main()
