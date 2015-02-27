module State
  class InvalidState < RuntimeError; end

    STFIPS = [
      ["Alabama", 1],
      ["Alaska",  2],
      ["Arizona", 4],
      ["Arkansas",  5],
      ["California", 6],
      ["Colorado",  8],
      ["Connecticut", 9],
      ["Delaware",  10],
      ["District of Columbia",  11],
      ["Florida", 12],
      ["Georgia", 13],
      ["Guam",  66],
      ["Hawaii",  15],
      ["Idaho", 16],
      ["Illinois",  17],
      ["Indiana", 18],
      ["Iowa",  19],
      ["Kansas",  20],
      ["Kentucky",  21],
      ["Louisiana", 22],
      ["Maine", 23],
      ["Maryland",  24],
      ["Massachusetts", 25],
      ["Michigan",  26],
      ["Minnesota", 27],
      ["Mississippi", 28],
      ["Missouri",  29],
      ["Montana", 30],
      ["Nebraska",  31],
      ["Nevada",  32],
      ["New Hampshire", 33],
      ["New Jersey",  34],
      ["New Mexico",  35],
      ["New York", 36],
      ["North Carolina",  37],
      ["North Dakota",  38],
      ["Ohio",  39],
      ["Oklahoma",  40],
      ["Oregon",  41],
      ["Pennsylvania",  42],
      ["Puerto Rico", 72],
      ["Rhode Island",  44],
      ["South Carolina",  45],
      ["South Dakota",  46],
      ["Tennessee", 47],
      ["Texas", 48],
      ["Virgin Islands", 78],
      ["Utah",  49],
      ["Vermont", 50],
      ["Virginia",  51],
      ["Washington",  53],
      ["West Virginia", 54],
      ["Wisconsin", 55],
      ["Wyoming", 56],
    ]

  CODES = {
    'AL' => 'Alabama',
    'AK' => 'Alaska',
    'AS' => 'American Samoa',
    'AZ' => 'Arizona',
    'AR' => 'Arkansas',
    'CA' => 'California',
    'CO' => 'Colorado',
    'CT' => 'Connecticut',
    'DE' => 'Delaware',
    'DC' => 'District of Columbia',
    'FM' => 'Federated States of Micronesia',
    'FL' => 'Florida',
    'GA' => 'Georgia',
    'GU' => 'Guam',
    'HI' => 'Hawaii',
    'ID' => 'Idaho',
    'IL' => 'Illinois',
    'IN' => 'Indiana',
    'IA' => 'Iowa',
    'KS' => 'Kansas',
    'KY' => 'Kentucky',
    'LA' => 'Louisiana',
    'ME' => 'Maine',
    'MH' => 'Marshall Islands',
    'MD' => 'Maryland',
    'MA' => 'Massachusetts',
    'MI' => 'Michigan',
    'MN' => 'Minnesota',
    'MS' => 'Mississippi',
    'MO' => 'Missouri',
    'MT' => 'Montana',
    'NE' => 'Nebraska',
    'NV' => 'Nevada',
    'NH' => 'New Hampshire',
    'NJ' => 'New Jersey',
    'NM' => 'New Mexico',
    'NY' => 'New York',
    'NC' => 'North Carolina',
    'ND' => 'North Dakota',
    'OH' => 'Ohio',
    'OK' => 'Oklahoma',
    'OR' => 'Oregon',
    'PW' => 'Palau',
    'PA' => 'Pennsylvania',
    'PR' => 'Puerto Rico',
    'RI' => 'Rhode Island',
    'SC' => 'South Carolina',
    'SD' => 'South Dakota',
    'TN' => 'Tennessee',
    'TX' => 'Texas',
    'UT' => 'Utah',
    'VT' => 'Vermont',
    'VI' => 'Virgin Islands',
    'VA' => 'Virginia',
    'WA' => 'Washington',
    'WV' => 'West Virginia',
    'WI' => 'Wisconsin',
    'WY' => 'Wyoming'
  }


  def self.stfips_by_code(code)
    begin
      state = CODES[code.upcase]
      [STFIPS.assoc(state)].flatten.last || nil
    rescue
      nil
    end
  end

  def self.stfips(state)
    code = normalize(state)
    stfips_by_code(code)
  end

  def self.member?(state)
    CODES.member? normalize(state)
  rescue InvalidState
    false
  end

  def self.states
    CODES.values
  end

  def self.normalize(state)
    return state.upcase if CODES.member? state.upcase
    return STATE_TO_CODE.fetch state.downcase
  rescue KeyError
    raise InvalidState
  end

  private

  STATE_TO_CODE = CODES.inject({}) do |hash, code_state|
    code, state = code_state
    hash[state.downcase] = code
    hash
  end
end
