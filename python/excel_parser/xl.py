import openpyxl

wb = openpyxl.load_workbook(filename='./sf.xlsx')
sheet_sf = wb['TDSheet']
sheet_gtd = wb['gtd']
wb.active = sheet_sf

def main():
    goods = {}
    for row in range(1, sheet_gtd.max_row + 1):
        if sheet_gtd[f'B{row}'].value.strip() in goods:
            goods[sheet_gtd[f'B{row}'].value.strip()] += 1
        else:
            goods[sheet_gtd[f'B{row}'].value.strip()] = 1

    uniq_goods = goods.copy()
    for k in goods:
        if goods[k] > 1:
            del uniq_goods[k]

    for row in range(17, sheet_sf.max_row):
        # if sheet_sf[f'B{row}'].value == "Всего к оплате":
        if "Всего к оплате" in sheet_sf[f'B{row}'].value:
            sheet_sf_end = row
            break

    dict_gtd = {}
    for row in range(1, sheet_gtd.max_row + 1):
        if sheet_gtd[f'B{row}'].value.strip() in uniq_goods:
            # dict_gtd[sheet_gtd[f'B{row}'].value.strip()] = {"row": row, "gtd": sheet_gtd[f'E{row}'].value.strip()}
            dict_gtd[sheet_gtd[f'B{row}'].value.strip()] = sheet_gtd[f'E{row}'].value.strip()

    for row in range(17, sheet_sf_end):
        if sheet_sf[f'B{row}'].value.strip() in dict_gtd:
            # sheet_sf.cell(row=row, column=32).value = dict_gtd[sheet_sf[f'B{row}'].value.strip()]["gtd"]
            sheet_sf.cell(row=row, column=32).value = dict_gtd[sheet_sf[f'B{row}'].value.strip()]
    
    wb.remove(sheet_gtd)
    wb.save('./sf_gtd.xlsx')

if __name__ == "__main__":
    main()