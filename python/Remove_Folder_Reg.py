import os
import _winreg

dir_path = "C:\example\directory"
reg_key = "HKEY_CURRENT_USER\Software\Example"

# Removing the directory
if os.path.exists(dir_path):
    os.rmdir(dir_path)
    print(f"{dir_path} removed.")
else:
    print(f"{dir_path} does not exist.")

# Removing the registry key
try:
    _winreg.DeleteKey(_winreg.HKEY_CURRENT_USER, "Software\Example")
    print(f"{reg_key} removed.")
except WindowsError:
    print(f"{reg_key} does not exist.")