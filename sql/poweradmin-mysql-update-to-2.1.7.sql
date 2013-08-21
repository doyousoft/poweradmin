ALTER TABLE perm_items ENGINE=InnoDB;
ALTER TABLE perm_templ ENGINE=InnoDB;
ALTER TABLE perm_templ_items ENGINE=InnoDB;

alter table users
      CHANGE perm_templ perm_templ INT(11) DEFAULT NULL,
      ADD INDEX perm_templ(perm_templ),
      ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`perm_templ`) REFERENCES `perm_templ` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

alter table perm_templ_items
      ADD KEY `templ_id` (`templ_id`),
      ADD KEY `perm_id` (`perm_id`), 
      ADD CONSTRAINT `perm_templ_items_ibfk_1` FOREIGN KEY (`templ_id`) REFERENCES `perm_templ` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
      ADD CONSTRAINT `perm_templ_items_ibfk_2` FOREIGN KEY (`perm_id`) REFERENCES `perm_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE zones 
      CHANGE domain_id domain_id int(11) DEFAULT NULL, 
      CHANGE owner owner int(11) DEFAULT NULL,
      ADD CONSTRAINT `zones_ibfk_1` FOREIGN KEY (`zone_templ_id`) REFERENCES `zone_templ` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
      ADD CONSTRAINT `zones_ibfk_2` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
      ADD CONSTRAINT `zones_ibfk_3` FOREIGN KEY (`owner`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE zone_templ 
      CHANGE owner owner int(11) DEFAULT NULL, 
      ADD INDEX owner (owner),
      ADD CONSTRAINT `zone_templ_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

