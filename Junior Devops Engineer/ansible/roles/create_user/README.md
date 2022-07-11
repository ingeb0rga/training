create_user
=========

Create user with ssh authentication

Requirements
------------

None

Role Variables
--------------

user_name: default
user_state: present
ssh_key: ~/.ssh/id_rsa.pub

Dependencies
------------

None

Example Playbook
----------------

---
- hosts: all
  become: yes
  tasks:
     - include_role:
         name: create_user
       vars:
         user_name: robert
         ssh_key: ~/.ssh/id_rsa.pub

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
