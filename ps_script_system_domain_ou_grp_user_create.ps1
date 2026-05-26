# =======================================================================================
# PowerShell-Skript zur AD-Verwaltung
# Ziel: OU, Gruppe und Benutzer in der Domäne harrigan.com für Harrigan IT LLC erstellen
# =======================================================================================

# ===============================================
# 1. Schritt: Organisationseinheit (OU) erstellen
# ===============================================

# Haupt-OU
New-ADOrganizationalUnit -Name "Harrigan IT LLC" -Path "DC=harrigan,DC=com"

# Standorte unter Harrigan IT LLC
New-ADOrganizationalUnit -Name "London" -Path "OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Dublin" -Path "OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Amsterdam" -Path "OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Hamburg" -Path "OU=Harrigan IT LLC,DC=harrigan,DC=com"

# London Sub-OUs
New-ADOrganizationalUnit -Name "CEO" -Path "OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Admins" -Path "OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Employee" -Path "OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com"

# Dublin Sub-OUs
New-ADOrganizationalUnit -Name "Internal Accounting" -Path "OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Customer Financials" -Path "OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Admins" -Path "OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com"

# Amsterdam Sub-OUs
New-ADOrganizationalUnit -Name "Central Data Analytics" -Path "OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Data Storaging" -Path "OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Admins" -Path "OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com"

# Hamburg Sub-OUs
New-ADOrganizationalUnit -Name "Custom Relations" -Path "OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Custom Logistic" -Path "OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADOrganizationalUnit -Name "Admins" -Path "OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com"



# =======================================
# 2. Schritt: Gruppe in der OU erstellen 
# =======================================


# London
New-ADGroup -Name "GR_LON_Admins" -GroupScope Global -GroupCategory Security -Path "OU=Admins,OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADGroup -Name "GR_LON_Employee" -GroupScope Global -GroupCategory Security -Path "OU=Employee,OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADGroup -Name "GR_LON_CEO" -GroupScope Global -GroupCategory Security -Path "OU=CEO,OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com"

# Dublin
New-ADGroup -Name "GR_DUB-Admins" -GroupScope Global -GroupCategory Security -Path "OU=Admins,OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADGroup -Name "GR_DUB_InternalAccounting" -GroupScope Global -GroupCategory Security -Path "OU=Internal Accounting,OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADGroup -Name "GR_DUB_CustomerFinancials" -GroupScope Global -GroupCategory Security -Path "OU=Customer Financials,OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com"

# Amsterdam
New-ADGroup -Name "GR_AMS-Admins" -GroupScope Global -GroupCategory Security -Path "OU=Admins,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADGroup -Name "GR_AMS-DataAnalytics" -GroupScope Global -GroupCategory Security -Path "OU=Central Data Analytics,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADGroup -Name "GR_AMS-DataStoraging" -GroupScope Global -GroupCategory Security -Path "OU=Data Storaging,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com"

# Hamburg
New-ADGroup -Name "GR_HAM-Admins" -GroupScope Global -GroupCategory Security -Path "OU=Admins,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADGroup -Name "GR_HAM-CustomRelations" -GroupScope Global -GroupCategory Security -Path "OU=Custom Relations,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com"
New-ADGroup -Name "GR_HAM-CustomLogistic" -GroupScope Global -GroupCategory Security -Path "OU=Custom Logistic,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com"



# ===========================================
# 3. Schritt: Benutzer in der OU erstellen
# ===========================================


# --- London ---
New-ADUser -Name "Seamus Harrigan" -GivenName "Seamus" -Surname "Harrigan" -SamAccountName "seamus.harrigan" -UserPrincipalName "seamus.harrigan@harrigan.com" -Path "OU=CEO,OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Xy9!mN7#pQ2z" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Sean Harrigan" -GivenName "Sean" -Surname "Harrigan" -SamAccountName "sean.harrigan" -UserPrincipalName "sean.harrigan@harrigan.com" -Path "OU=CEO,OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Lk2&zP8$rT5m" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Frances Neagley" -GivenName "Frances" -Surname "Neagley" -SamAccountName "frances.neagley" -UserPrincipalName "frances.neagley@harrigan.com" -Path "OU=Employee,OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Qp7@xT3#vF6n" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Dwight Manfredi" -GivenName "Dwight" -Surname "Manfredi" -SamAccountName "dwight.manfredi" -UserPrincipalName "dwight.manfredi@harrigan.com" -Path "OU=Admins,OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Ht6$wR2*oL9k" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Mitch Keller" -GivenName "Mitch" -Surname "Keller" -SamAccountName "mitch.keller" -UserPrincipalName "mitch.keller@harrigan.com" -Path "OU=Employee,OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Bn5%jQ7&uD3r" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Chickie Invernizzi" -GivenName "Chickie" -Surname "Invernizzi" -SamAccountName "chickie.invernizzi" -UserPrincipalName "chickie.invernizzi@harrigan.com" -Path "OU=Employee,OU=London,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Wp3&nK9*zE4h" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true

# --- Dublin ---
New-ADUser -Name "Stacy Beale" -GivenName "Stacy" -Surname "Beale" -SamAccountName "stacy.beale" -UserPrincipalName "stacy.beale@harrigan.com" -Path "OU=Internal Accounting,OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Yd8!bL2$qF5t" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Margaret Devereaux" -GivenName "Margaret" -Surname "Devereaux" -SamAccountName "margaret.devereaux" -UserPrincipalName "margaret.devereaux@harrigan.com" -Path "OU=Internal Accounting,OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Fk4^cM8!rT2j" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Susan Duffy" -GivenName "Susan" -Surname "Duffy" -SamAccountName "susan.duffy" -UserPrincipalName "susan.duffy@harrigan.com" -Path "OU=Customer Financials,OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Vx6*pR3!hL9m" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Karla Dixon" -GivenName "Karla" -Surname "Dixon" -SamAccountName "karla.dixon" -UserPrincipalName "karla.dixon@harrigan.com" -Path "OU=Admins,OU=Dublin,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Mn2#eF7!qK8z" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true

# --- Amsterdam ---
New-ADUser -Name "Oscar Finlay" -GivenName "Oscar" -Surname "Finlay" -SamAccountName "oscar.finlay" -UserPrincipalName "oscar.finlay@harrigan.com" -Path "OU=Admins,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Gt9$kN3@xR4b" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Harry Delaney" -GivenName "Harry" -Surname "Delaney" -SamAccountName "harry.delaney" -UserPrincipalName "harry.delaney@harrigan.com" -Path "OU=Central Data Analytics,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Pk7%wS2!oH6n" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Jan Da Souza" -GivenName "Jan" -Surname "Da Souza" -SamAccountName "jan.dasouza" -UserPrincipalName "jan.dasouza@harrigan.com" -Path "OU=Central Data Analytics,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Dr4!zN8*eQ7t" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Richie Stevenson" -GivenName "Richie" -Surname "Stevenson" -SamAccountName "richie.stevenson" -UserPrincipalName "richie.stevenson@harrigan.com" -Path "OU=Data Storaging,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Lh2%tB9!kV6y" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Vron Stevenson" -GivenName "Vron" -Surname "Stevenson" -SamAccountName "vron.stevenson" -UserPrincipalName "vron.stevenson@harrigan.com" -Path "OU=Data Storaging,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Sj8^mH4&pT2q" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Archie Hammond" -GivenName "Archie" -Surname "Hammond" -SamAccountName "archie.hammond" -UserPrincipalName "archie.hammond@harrigan.com" -Path "OU=Data Storaging,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Rq7!xP5*zL3n" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Jaime Lopez" -GivenName "Jaime" -Surname "Lopez" -SamAccountName "jaime.lopez" -UserPrincipalName "jaime.lopez@harrigan.com" -Path "OU=Data Storaging,OU=Amsterdam,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Hw6@jD9!rM4k" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true

# --- Hamburg ---
New-ADUser -Name "Harry Da Souza" -GivenName "Harry" -Surname "Da Souza" -SamAccountName "harry.dasouza" -UserPrincipalName "harry.dasouza@harrigan.com" -Path "OU=Admins,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Jm5&xP3#sT9v" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Vince Antonacci" -GivenName "Vince" -Surname "Antonacci" -SamAccountName "vince.antonacci" -UserPrincipalName "vince.antonacci@harrigan.com" -Path "OU=Custom Relations,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Tp9$wF2!qL8n" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Paul Hubble" -GivenName "Paul" -Surname "Hubble" -SamAccountName "paul.hubble" -UserPrincipalName "paul.hubble@harrigan.com" -Path "OU=Custom Relations,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Xc4@jN7*zV3k" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Cormac Hayes" -GivenName "Cormac" -Surname "Hayes" -SamAccountName "cormac.hayes" -UserPrincipalName "cormac.hayes@harrigan.com" -Path "OU=Custom Relations,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Ld8^bR6!tK2y" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Jack Reacher" -GivenName "Jack" -Surname "Reacher" -SamAccountName "jack.reacher" -UserPrincipalName "jack.reacher@harrigan.com" -Path "OU=Custom Relations,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Zq2!nP7#dW5t" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Colin Tattersall" -GivenName "Colin" -Surname "Tattersall" -SamAccountName "colin.tattersall" -UserPrincipalName "colin.tattersall@harrigan.com" -Path "OU=Custom Logistic,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Fr3@tM9!xQ6l" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Freddie Shaw" -GivenName "Freddie" -Surname "Shaw" -SamAccountName "freddie.shaw" -UserPrincipalName "freddie.shaw@harrigan.com" -Path "OU=Custom Logistic,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Vp8^rD2!zH7m" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Maeve Callahan" -GivenName "Maeve" -Surname "Callahan" -SamAccountName "maeve.callahan" -UserPrincipalName "maeve.callahan@harrigan.com" -Path "OU=Custom Logistic,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Kx9!jN4$gT3p" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Niall Brennan" -GivenName "Niall" -Surname "Brennan" -SamAccountName "niall.brennan" -UserPrincipalName "niall.brennan@harrigan.com" -Path "OU=Custom Logistic,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Sw6!pK8^rV2j" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Armand Trusi" -GivenName "Armand" -Surname "Trusi" -SamAccountName "armand.trusi" -UserPrincipalName "armand.trusi@harrigan.com" -Path "OU=Custom Logistic,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Yg7^dM3!xB5n" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Fiona Malloy" -GivenName "Fiona" -Surname "Malloy" -SamAccountName "fiona.malloy" -UserPrincipalName "fiona.malloy@harrigan.com" -Path "OU=Custom Logistic,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Hn4@rT8^jK6p" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Roscoe Conklin" -GivenName "Roscoe" -Surname "Conklin" -SamAccountName "roscoe.conklin" -UserPrincipalName "roscoe.conklin@harrigan.com" -Path "OU=Custom Logistic,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Jx2!pV7^tN9m" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true
New-ADUser -Name "Tyson Mitchell" -GivenName "Tyson" -Surname "Mitchell" -SamAccountName "tyson.mitchell" -UserPrincipalName "tyson.mitchell@harrigan.com" -Path "OU=Custom Logistic,OU=Hamburg,OU=Harrigan IT LLC,DC=harrigan,DC=com" -AccountPassword (ConvertTo-SecureString "Zb6^rQ5!kL3y" -AsPlainText -Force) -ChangePasswordAtLogon $true -PasswordNeverExpires $false -Enabled $true




# ==========================================
# 4. Schritt: Benutzer zur Gruppe hinzufügen
# ==========================================


# London

# CEO
Add-ADGroupMember -Identity "GR_LON_CEO" -Members "seamus.harrigan","sean.harrigan"

# Admins
Add-ADGroupMember -Identity "GR_LON_Admins" -Members "dwight.manfredi"

# Employee
Add-ADGroupMember -Identity "GR_LON_Employee" -Members "frances.neagley","mitch.keller","chickie.invernizzi"


# Dublin

# Admins
Add-ADGroupMember -Identity "GR_DUB-Admins" -Members "karla.dixon"

# Internal Accounting
Add-ADGroupMember -Identity "GR_DUB_InternalAccounting" -Members "stacy.beale","margaret.devereaux"

# Customer Financials
Add-ADGroupMember -Identity "GR_DUB_CustomerFinancials" -Members "susan.duffy"


# Amesterdam

# Admins
Add-ADGroupMember -Identity "GR_AMS-Admins" -Members "oscar.finlay"

# Data Analytics
Add-ADGroupMember -Identity "GR_AMS-DataAnalytics" -Members "harry.delaney","jan.dasouza"

# Data Storaging
Add-ADGroupMember -Identity "GR_AMS-DataStoraging" -Members "richie.stevenson","vron.stevenson","archie.hammond","jaime.lopez"


# Hamburg

# Admins
Add-ADGroupMember -Identity "GR_HAM-Admins" -Members "harry.dasouza"

# Custom Relations
Add-ADGroupMember -Identity "GR_HAM-CustomRelations" -Members "vince.antonacci","paul.hubble","cormac.hayes","jack.reacher"

# Custom Logistic
Add-ADGroupMember -Identity "GR_HAM-CustomLogistic" -Members "colin.tattersall","freddie.shaw","maeve.callahan","niall.brennan","armand.trusi","fiona.malloy","roscoe.conklin","tyson.mitchell"
