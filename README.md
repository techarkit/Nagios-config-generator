# Nagios config generator

Configuring the Nagios Core would take lot of time. 

Generate Nagios core configuration in few minutes, i would say you can generate 1000 Servers configuration in 5 Minutes.

# Steps before generating the configuration

1. Install NSClient++ software in all the windows machines and ensure NSclient service is running.
2. Verify NSClient is reporting properly from Nagios Core Server
3. Define the check_nt command and update the NSClient password in commands.cfg file.
`    define command {
    command_name check_nt
    command_line  $USER1$/check_nt -H $HOSTADDRESS$ -p 12489 -v $ARG1$ $ARG2$ -s secret
    }`
4. Create required contacts and contact_groups in contacts.cfg (who will receive notifications).
5. Update Template-Windows.cfg and Drives.cfg files
    use TEMPLATENAME (should already defined in templates.cfg file)
    contacts  CONTACT1,CONTACT2 (should already defined in contacts.cfg file)
    contact_groups  GROUP1,GROUP2 (should already defined in contacts.cfg file)

# How to Generate ?

`sh generate_win_host_config.sh`
