sudo sed -i 's/^PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
echo -e "${PURPLE}Enter your new password${NC}"
read passwd
echo -e "${PURPLE}Enter your new password again${NC}"
read passwd2
if [ "$passwd" == "$passwd2" ]; then
    echo -e "${PURPLE}Changing password...${NC}"
    echo -e "root:$passwd" | sudo chpasswd
    echo -e "${PURPLE}Password changed${NC}"
else
    echo -e "${RED}Passwords do not match${NC}"
fi
echo -e "${PURPLE}Restarting SSH...${NC}"
sudo service ssh restart
echo -e "${PURPLE}SSH restarted${NC}"
echo -e "${PURPLE}You can now login as root${NC}"
