# Deobfuscator
The Repo contains code to deobfuscate different types of obfuscation across different languages.

### Powershell_event_Analyzer.ps1
First run powershell_logging.ps1.txt file in the VM environment
It will create %SystemRoot%\system32\winevt\logs\Microsoft-Windows-PowerShell%4Operational.evtx file when any powershell script is ran

Then run  Powershell_event_Analyzer.ps1 which will analyse the events and create different files by grouping the same events together.
This will help in analyzing malwares and shellcode and can be used to extract the injected code.
