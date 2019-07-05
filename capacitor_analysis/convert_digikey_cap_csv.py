#!/usr/bin/python

import numpy
import sys

def process_line(line) :
  lo = ''
  quote_count = 0
  for c in line :
    if c == '"' :
      quote_count ^= 1
    elif c == ',' :
      if quote_count == 1 :
        lo += ','
      else :
        lo += ';'
    else :
      lo += c
  
  return lo

def load_data(filename) :
  f = open(filename)
  lines = f.readlines()
  f.close()

  processed_lines = [process_line(l) for l in lines]

  return numpy.genfromtxt(processed_lines, delimiter=';', dtype=None, names=True, invalid_raise=False)

def find_float(f_str) :
  filt = ''

  for c in f_str :
    if c in ['.'] + [str(i) for i in range(10)] :
      filt += c

  return float(filt)

def close(val, target, tol=0.5) :
  return (abs(val - target) / target) <= tol

def range_contained(r_min, r_max, v_min, v_max) :  
  return v_min <= r_min and r_max <= v_max

def range_contained(r_nom, v_min, v_max) :
  if type(r_nom) is list :
    for r_n in r_nom :
      if v_min <= r_n and r_n <= v_max :
        return True
    return False
  else :
    return v_min <= r_nom and r_nom <= v_max

def converter_class(v_in_min, v_in_max, v_out) :

  if close(v_out, 5.0) :
    return 'A'

  elif close(v_out, 12.0) :
    classes = []

    if range_contained(12.0, v_in_min, v_in_max) :
      classes.append('B')

    if range_contained([24.0, 36.0, 48.0], v_in_min, v_in_max) :
      classes.append('E')

    return ''.join(classes)

  elif close(v_out, 24.0) :
    classes = []
    
    if range_contained(12.0, v_in_min, v_in_max) :
      classes.append('C')

    if range_contained([36.0, 48.0], v_in_min, v_in_max) :
      classes.append('F')

    return ''.join(classes)

  else :
    return 'D'

def convert_data(data) :
  entries = []

  for d in data :

    e_vin_min = find_float(d['Voltage__Input_Min'])
    e_vin_max = find_float(d['Voltage__Input_Max'])
    e_vout = find_float(d['Voltage__Output_1'])
    
    e_class = converter_class(e_vin_min, e_vin_max, e_vout)
  
    e_i_out = find_float(d['Current__Output_Max'])

    e_p_out = e_vout * e_i_out

    e_eff_min = find_float(d['Efficiency']) / 100.0

    e_p_diss = e_p_out * (1 - e_eff_min) / e_eff_min

    dims = d['Size__Dimension'].split()

    e_w = find_float(dims[10]) / 10.0
    e_h = find_float(dims[12]) / 10.0
    e_d_l = find_float(dims[8]) / 10.0

    e_vol = e_w * e_h * e_d_l

    e_price = d['Unit_Price_USD']
    
    e_p_cost = e_p_out / e_price
    e_p_density = e_p_out / e_vol
    e_metric = e_p_out / (e_vol * e_price)

    entry = [
      d['Manufacturer'],
      d['Manufacturer_Part_Number'],
      d['Mounting_Type'],
      e_class,
      e_vin_min,
      e_vin_max,
      e_vout,
      e_i_out,
      e_p_out,
      e_eff_min,
      e_p_diss,
      e_w,
      e_h,
      e_d_l,
      e_vol,
      'Digikey',
      d['DigiKey_Part_Number'],
      e_price,
      e_p_cost,
      e_p_density,
      e_metric
    ]

    entries.append(entry)

  return entries

def write_data(filename, entries) :
  fields = [[
    'Manufacturer',
    'MPN',
    'mount',
    'class',
    'v-in-min',
    'v-in-max',
    'v-out',
    'i-out',
    'p-out',
    'eff-min',
    'p-diss',
    'w',
    'h',
    'd/l',
    'vol',
    'Vendor',
    'VPN',
    'Price',
    'p-cost',
    'p-density',
    'metric'
  ]]

  f = open(filename, 'w')
  f.write('\n'.join([';'.join([str(field) for field in entry]) for entry in fields + entries]))
  f.close()

def convert_cap_data(data) :
  entries = []

  for d in data :
    dims = d['Surface_Mount_Land_Size'].split()

    e_l = find_float(dims[5])
    e_w = find_float(dims[7])
    e_h = find_float(d['Height__Seated_Max'].split()[1])

    e_area = e_l * e_w
    e_vol = e_area * e_h
    
    e_cap =  find_float(d['Capacitance'])
    
    e_cap_area = e_cap / e_area
    e_cap_vol = e_cap / e_vol

    e_cap_mult = numpy.ceil(600.0 / e_cap)
    
    if e_h > 8.0

    entry = [
      d['Description'],
      d['Manufacturer'],
      d['Manufacturer_Part_Number'],
      e_cap,
      e_w,
      e_l,
      e_area,
      e_h,
      e_vol
    ]

    entries.append(entry)

  return entries

def write_cap_data(filename, entries) :
  fields = [[
    'desc',
    'mfg',
    'mpn',
    'cap',
    'width',
    'length',
    'area',
    'height',
    'volume',
    'cap_area',
    'cap_vol',

  ]]
  
  f = open(filename, 'w')
  f.write('\n'.join([';'.join([str(field) for field in entry]) for entry in fields + entries]))
  f.close()

if __name__ == '__main__' :
  fn_in = sys.argv[1]

  d_in = load_data(fn_in)
  
  out_entries = convert_cap_data(d_in)
  
  fn_root = fn_in.split('.')[0]
  fn_out = fn_root + '.conv.csv'

  write_cap_data(fn_out, out_entries)
