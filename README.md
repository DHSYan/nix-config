# Sean's NIXOS Config

# Why did I start using NixOS?
It kinda begin with wanting reproduciability. I started with building 
an Ansible Playbook, and introduced a self-enforced practice of "only changing
system through the playbook" 

# Why did I switch off of Ansible?
- It doesn't feel 100% reproduciable. 
- Say, if you installed a package and later you don't want it, you removed it
from the playbook, but it's still in your system. 
- Ansible doesn't completely describe the absolute state of your machine.
  - Nixos is too, but it's much closer. And it is pretty much for important 
  things like packages.

# Why do I need reproduciablitiy?
- I am a student who works with a laptop during the day, and a desktop when 
I return home. I am also a student whose degree require him to have a 
computer at all times with the same development enviroment.
  - That sounds like NixOS to me.

# Problems currently
- My desktop have a nvidia card, so I need a separate file that specify 
the presence of a nvidia driver that is unfree. 
  - My laptop is a framework intel, it does not require the need of 
  explicitly stating the driver. I believe modesetting driver is enabled 
  by default.
  - Generally, there are still difference between my laptop and desktop,
  but nothing major that impacts the "frontend" use of my computer. For example,
  I enable WIFI on laptop, but not desktop, as long as the frontend which in
  this case is internet access, I don't really have to care about what 
  gets me that internet.

# Stuff I have to learn to get to state of repo at this stage
- Flakes
  - [x] Basics

- Nix Lang
  - [x] Basics

- Home manager 
  - [x] Basics - Symlinks


# Stuff yet to learn (TODO)
- [ ] Modularize the config
- [ ] Follow Best practices (right now I have no idea if the current state of 
the project is even the correct way to do things)
- [ ] login not protected by yubi key
- [ ] Look into Nixhelper?

# Sources that helped/inspired me 
- [No Boilerplate's Video led me to discover NixOS](https://www.youtube.com/watch?v=CwfKlX3rA6E&t=484s)
- [Vimjoyer's Youtube Channel](https://www.youtube.com/@vimjoyer) 
- [Prime's Video also kinda grabbed my attension](https://www.youtube.com/watch?v=T58Yr5igNGk&t=555s)
- [Chris Titus' Video helpped me learn how to install NixOS minimally, I hate bloat](https://www.youtube.com/watch?v=_Z32SYFbxpw&t=2644s)
- [LibrePhoenix's Video on home manager is great](https://www.youtube.com/watch?v=IiyBeR-Guqw)
- Nixos Manual, Nix Wiki
  - A lot of people say it's pretty bad, but personally, I think it's pretty 
  good. I think this is because, people are comparing it to the arch wiki, 
  which I have not personally used that often, but with my fair share of 
  usage with arch wiki, I also think arch wifi are awesome. But I wouldn't
  say Nixos Manual is totally garbongo. It still got me thourgh installation,
  and many others quite comfortably. Though mind you, I am not that advanced.
- [I didn't use this completely, but it's an unofficial book, that seems
very very very well written](https://nixos-and-flakes.thiscute.world/)

