CREATE TABLE `actions` (
  `action` varchar(25) NOT NULL,
  `file` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `right` int(1) NOT NULL DEFAULT '0',
  `sub` varchar(25) NOT NULL DEFAULT 'main',
  `id` int(25) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_2` (`action`),
  KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=3161 DEFAULT CHARSET=utf8;
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('AddFulltext','tables.pl','AddFulltext','5','AddFulltext','1');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('AnalyzeTable','tables.pl','AnalyzeTable','5','AnalyzeTable','2');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('AddPrimaryKey','tables.pl','AddPrimaryKey','5','AddPrimaryKey','3');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ChangeEngine','tables.pl','ChangeEngine','5','ChangeEngine','4');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ChangeAutoInCrementValue','tables.pl','ChangeAutoInCrementValue','5','ChangeAutoInCrementValue','5');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ChangeCol','tables.pl','ChangeCol','5','ChangeCol','6');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ChangeCharset','tables.pl','ChangeCharset','5','ChangeCharset','7');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ChooseDataBase','tables.pl','ChooseDataBase','5','ChooseDataBase','8');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('DropTable','tables.pl','DropTable','5','DropTable','9');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('DeleteEntry','tables.pl','DeleteEntry','5','DeleteEntry','10');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('DropCol','tables.pl','DropCol','5','DropCol','11');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowDumpTable','tables.pl','DumpTable','5','ShowDumpTable','12');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ExecSql','tables.pl','ExecSql','5','ExecSql','13');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('EditTable','tables.pl','SQL','5','EditTable','14');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('EditEntry','tables.pl','EditEntry','5','EditEntry','15');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('NewEntry','tables.pl','NewEntry','5','NewEntry','16');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('NewTable','tables.pl','NewTable','5','NewTable','17');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('CreateDatabase','tables.pl','CreateDatabase','5','CreateDatabase','18');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('OptimizeTable','tables.pl','OptimizeTable','5','OptimizeTable','19');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('RepairTable','tables.pl','RepairTable','5','RepairTable','20');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('SaveEditTable','tables.pl','SaveEditTable','5','SaveEditTable','21');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('SQL','tables.pl','SQL','5','SQL','22');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('SaveEntry','tables.pl','SaveEntry','5','SaveEntry','23');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('DropFulltext','tables.pl','DropFulltext','5','DropFulltext','24');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowTables','tables.pl','ShowTables','5','ShowTables','25');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowTableDetails','tables.pl','ShowTableDetails','5','ShowTableDetails','26');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowTable','tables.pl','ShowTable','5','ShowTable','27');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('TruncateTable','tables.pl','TruncateTable','5','TruncateTable','28');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowProcesslist','tables.pl','ShowProcesslist','5','ShowProcesslist','29');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('AddIndex','tables.pl','AddIndex','5','AddIndex','30');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('DropIndex','tables.pl','DropFulltext','5','DropIndex','31');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('AddUnique','tables.pl','DropFulltext','5','AddUnique','32');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowNewEntry','tables.pl','ShowNewEntry','5','ShowNewEntry','33');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('MultipleAction','tables.pl','MultipleAction','5','MultipleAction','34');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowDumpDatabase','tables.pl','DumpDatabase','5','ShowDumpDatabase','35');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('SaveNewTable','tables.pl','SaveNewTable','5','SaveNewTable','36');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('EditAction','tables.pl','EditAction','5','EditAction','37');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('MultipleDbAction','tables.pl','MultipleDbAction','5','MultipleDbAction','38');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('RenameTable','tables.pl','RenameTable','5','RenameTable','39');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('SaveNewColumn','tables.pl','SaveNewColumn','5','SaveNewColumn','40');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('NewDatabase','tables.pl','NewDatabase','5','NewDatabase','41');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowEditIndex','tables.pl','ShowEditIndex','5','ShowEditIndex','42');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('SaveNewIndex','tables.pl','SaveNewIndex','5','SaveNewIndex','43');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowRights','tables.pl','ShowRights','5','ShowRights','44');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('SaveRights','tables.pl','SaveRights','5','SaveRights','45');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowUsers','tables.pl','ShowUsers','5','ShowUsers','46');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('CreateUser','tables.pl','CreateUser','5','CreateUser','47');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('DeleteUser','tables.pl','DeleteUser','5','DeleteUser','48');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('DropDatabase','tables.pl','DropDatabase','5','DropDatabase','49');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowDatabases','tables.pl','ShowDatabases','5','ShowDatabases','50');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowVariables','tables.pl','ShowVariables','5','ShowVariables','51');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('searchDatabase','tables.pl','searchDatabase','5','searchDatabase','52');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('showLogin','exploit.pl','','0','main','53');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('showProfile','tables.pl','showProfile','5','showProfile','54');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('saveProfile','tables.pl','Profile','5','saveProfile','55');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('searchHelpTopic','tables.pl','Help Topic','5','searchHelpTopic','56');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('login','login.pl','Login','0','main','57');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('quickbar','quickbar.pl','quickbar','5','main','58');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('ShowNewTable','tables.pl','ShowNewTable','5','ShowNewTable','117');
INSERT INTO `actions` (`action`,`file`,`title`,`right`,`sub`,`id`) values('downLoadFile','tables.pl','downLoadFile','5','downLoadFile','1288');

CREATE TABLE `actions_set` (
  `action` varchar(25) NOT NULL,
  `foreign_action` varchar(25) NOT NULL,
  `output_id` varchar(25) NOT NULL DEFAULT '25',
  `id` int(25) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `foreign_action` (`foreign_action`),
  CONSTRAINT `actions_set_ibfk_1` FOREIGN KEY (`foreign_action`) REFERENCES `actions` (`action`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddFulltext','AddFulltext','content','1');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AnalyzeTable','AnalyzeTable','content','2');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddPrimaryKey','AddPrimaryKey','content','3');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ChangeEngine','ChangeEngine','content','4');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ChangeAutoInCrementValue','ChangeAutoInCrementValue','content','5');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ChangeCol','ChangeCol','content','6');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ChangeCharset','ChangeCharset','content','7');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ChooseDataBase','ChooseDataBase','content','8');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropTable','DropTable','content','9');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DeleteEntry','DeleteEntry','content','10');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropCol','DropCol','content','11');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowDumpTable','ShowDumpTable','content','12');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ExecSql','ExecSql','content','13');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('EditTable','EditTable','content','14');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('EditEntry','EditEntry','content','15');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('NewEntry','NewEntry','content','16');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('NewTable','NewTable','content','17');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('CreateDatabase','CreateDatabase','content','18');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('OptimizeTable','OptimizeTable','content','19');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('RepairTable','RepairTable','content','20');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveEditTable','SaveEditTable','content','21');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SQL','SQL','content','22');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveEntry','SaveEntry','content','23');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropFulltext','DropFulltext','content','24');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowTables','ShowTables','content','25');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowTableDetails','ShowTableDetails','content','26');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowTable','ShowTable','content','27');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('TruncateTable','TruncateTable','content','28');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowProcesslist','ShowProcesslist','content','29');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddIndex','AddIndex','content','30');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropIndex','DropFulltext','content','31');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddUnique','AddUnique','content','32');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowNewEntry','ShowNewEntry','content','33');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('MultipleAction','MultipleAction','content','34');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowDumpDatabase','ShowDumpDatabase','content','35');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveNewTable','SaveNewTable','content','36');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('EditAction','EditAction','content','37');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('MultipleDbAction','MultipleDbAction','content','38');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('RenameTable','RenameTable','content','39');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveNewColumn','SaveNewColumn','content','40');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('NewDatabase','NewDatabase','content','41');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowEditIndex','ShowEditIndex','content','42');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveNewIndex','SaveNewIndex','content','43');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowRights','ShowRights','content','44');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveRights','SaveRights','content','45');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowUsers','ShowUsers','content','46');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('CreateUser','CreateUser','content','47');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DeleteUser','DeleteUser','content','48');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropDatabase','DropDatabase','content','49');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowDatabases','ShowDatabases','content','50');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowVariables','ShowVariables','content','51');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('searchDatabase','searchDatabase','content','52');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('showLogin','showLogin','content','53');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('showProfile','showProfile','content','54');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('searchHelpTopic','searchHelpTopic','content','56');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowNewTable','ShowNewTable','content','57');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddFulltext','login','login','58');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AnalyzeTable','login','login','59');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddPrimaryKey','login','login','60');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ChangeCol','login','login','61');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ChooseDataBase','login','login','62');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropTable','login','login','63');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DeleteEntry','login','login','64');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropCol','login','login','65');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowDumpTable','login','login','66');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ExecSql','login','login','67');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('EditTable','login','login','68');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('EditEntry','login','login','69');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('NewTable','login','login','70');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('OptimizeTable','login','login','71');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('RepairTable','login','login','72');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropFulltext','login','login','73');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowTables','login','login','74');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowTableDetails','login','login','75');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowTable','login','login','76');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('TruncateTable','login','login','77');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowProcesslist','login','login','78');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddIndex','login','login','79');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropIndex','login','login','80');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddUnique','login','login','81');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowNewEntry','login','login','82');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('MultipleAction','login','login','83');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowDumpDatabase','login','login','84');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('EditAction','login','login','85');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('NewDatabase','login','login','86');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveNewIndex','login','login','87');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowRights','login','login','88');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveRights','login','login','89');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowUsers','login','login','90');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DeleteUser','login','login','91');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropDatabase','login','login','92');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowDatabases','login','login','93');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowVariables','login','login','94');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('showLogin','login','login','95');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('showProfile','login','login','96');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('searchHelpTopic','login','login','97');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddFulltext','quickbar','menuBar','98');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AnalyzeTable','quickbar','menuBar','99');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddPrimaryKey','quickbar','menuBar','100');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ChangeCol','quickbar','menuBar','101');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ChooseDataBase','quickbar','menuBar','102');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropTable','quickbar','menuBar','103');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DeleteEntry','quickbar','menuBar','104');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropCol','quickbar','menuBar','105');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowDumpTable','quickbar','menuBar','106');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ExecSql','quickbar','menuBar','107');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('EditTable','quickbar','menuBar','108');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('EditEntry','quickbar','menuBar','109');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('NewTable','quickbar','menuBar','110');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('OptimizeTable','quickbar','menuBar','111');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('RepairTable','quickbar','menuBar','112');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropFulltext','quickbar','menuBar','113');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowTables','quickbar','menuBar','114');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowTableDetails','quickbar','menuBar','115');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowTable','quickbar','menuBar','116');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('TruncateTable','quickbar','menuBar','117');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowProcesslist','quickbar','menuBar','118');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddIndex','quickbar','menuBar','119');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropIndex','quickbar','menuBar','120');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('AddUnique','quickbar','menuBar','121');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowNewEntry','quickbar','menuBar','122');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('MultipleAction','quickbar','menuBar','123');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowDumpDatabase','quickbar','menuBar','124');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('EditAction','quickbar','menuBar','125');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('NewDatabase','quickbar','menuBar','126');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveNewIndex','quickbar','menuBar','127');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowRights','quickbar','menuBar','128');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('SaveRights','quickbar','menuBar','129');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowUsers','quickbar','menuBar','130');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DeleteUser','quickbar','menuBar','131');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('DropDatabase','quickbar','menuBar','132');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowDatabases','quickbar','menuBar','133');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('ShowVariables','quickbar','menuBar','134');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('showLogin','quickbar','menuBar','135');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('showProfile','quickbar','menuBar','136');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('searchHelpTopic','quickbar','menuBar','137');
INSERT INTO `actions_set` (`action`,`foreign_action`,`output_id`,`id`) values('downLoadFile','downLoadFile','content','138');

CREATE TABLE `exploit` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `referer` text NOT NULL,
  `remote_addr` text NOT NULL,
  `query_string` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  FULLTEXT KEY `remote_addr` (`remote_addr`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `exploit` (`date`,`referer`,`remote_addr`,`query_string`,`id`,`count`) values('2015-06-26 07:09:49','http://localhost/?perl/mysql.pl?action=showDatabases','127.0.0.1','action=showDatabases','1','14');
INSERT INTO `exploit` (`date`,`referer`,`remote_addr`,`query_string`,`id`,`count`) values('2015-06-27 10:52:29','http://localhost/?perl/mysql.pl?action=ShowTables','127.0.0.1','action=ShowTables','2','4');
INSERT INTO `exploit` (`date`,`referer`,`remote_addr`,`query_string`,`id`,`count`) values('2015-06-25 18:28:13','http://localhost/?/perl/mysql.pl?action=logout','127.0.0.1','action=logout','3','2');
INSERT INTO `exploit` (`date`,`referer`,`remote_addr`,`query_string`,`id`,`count`) values('2015-06-25 19:05:36','http://localhost/?perl/mysql.pl?action=ShowUsers','127.0.0.1','action=ShowUsers','4','2');

CREATE TABLE `querys` (
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `sql` text NOT NULL,
  `return` varchar(100) NOT NULL DEFAULT 'fetch_array',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `reserved_words` (
  `reserved_word` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ACCESSIBLE','1');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ALTER','2');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('AS','3');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('BEFORE','4');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('BINARY','5');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('BY','6');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CASE','7');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CHARACTER','8');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('COLUMN','9');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CONTINUE','10');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CROSS','11');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CURRENT_TIMESTAMP','12');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DATABASE','13');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DAY_MICROSECOND','14');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DEC','15');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DEFAULT','16');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DESC','17');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DISTINCT','18');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DOUBLE','19');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('EACH','20');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ENCLOSED','21');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('EXIT','22');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FETCH','23');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FLOAT8','24');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FOREIGN','25');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('GRANT','26');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('HIGH_PRIORITY','27');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('HOUR_SECOND','28');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('IN','29');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INNER','30');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INSERT','31');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INT2','32');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INT8','33');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INTO','34');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('JOIN','35');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('KILL','36');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LEFT','37');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LINEAR','38');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LOCALTIME','39');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LONG','40');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LOOP','41');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MATCH','42');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MEDIUMTEXT','43');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MINUTE_SECOND','44');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('NATURAL','45');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('NULL','46');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('OPTIMIZE','47');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('OR','48');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('OUTER','49');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('PRIMARY','50');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('RANGE','51');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('READ_WRITE','52');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('REGEXP','53');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('REPEAT','54');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('RESTRICT','55');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('RIGHT','56');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SCHEMAS','57');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SENSITIVE','58');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SHOW','59');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SPECIFIC','60');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SQLSTATE','61');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SQL_CALC_FOUND_ROWS','62');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('STARTING','63');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('TERMINATED','64');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('TINYINT','65');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('TRAILING','66');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('UNDO','67');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('UNLOCK','68');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('USAGE','69');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('UTC_DATE','70');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('VALUES','71');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('VARCHARACTER','72');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('WHERE','73');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('WRITE','74');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ZEROFILL','75');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ALL','76');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('AND','77');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ASENSITIVE','78');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('BIGINT','79');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('BOTH','80');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CASCADE','81');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CHAR','82');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('COLLATE','83');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CONSTRAINT','84');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CREATE','85');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CURRENT_TIME','86');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CURSOR','87');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DAY_HOUR','88');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DAY_SECOND','89');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DECLARE','90');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DELETE','91');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DETERMINISTIC','92');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DIV','93');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DUAL','94');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ELSEIF','95');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('EXISTS','96');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FALSE','97');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FLOAT4','98');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FORCE','99');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FULLTEXT','100');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('HAVING','101');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('HOUR_MINUTE','102');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('IGNORE','103');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INFILE','104');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INSENSITIVE','105');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INT1','106');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INT4','107');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INTERVAL','108');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ITERATE','109');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('KEYS','110');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LEAVE','111');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LIMIT','112');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LOAD','113');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LOCK','114');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LONGTEXT','115');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MASTER_SSL_VERIFY_SERVER_CERT','116');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MEDIUMINT','117');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MINUTE_MICROSECOND','118');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MODIFIES','119');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('NO_WRITE_TO_BINLOG','120');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ON','121');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('OPTIONALLY','122');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('OUT','123');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('PRECISION','124');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('PURGE','125');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('READS','126');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('REFERENCES','127');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('RENAME','128');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('REQUIRE','129');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('REVOKE','130');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SCHEMA','131');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SELECT','132');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SET','133');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SPATIAL','134');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SQLEXCEPTION','135');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SQL_BIG_RESULT','136');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SSL','137');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('TABLE','138');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('TINYBLOB','139');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('TO','140');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('TRUE','141');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('UNIQUE','142');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('UPDATE','143');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('USING','144');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('UTC_TIMESTAMP','145');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('VARCHAR','146');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('WHEN','147');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('WITH','148');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('YEAR_MONTH','149');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ADD','150');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ANALYZE','151');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ASC','152');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('BETWEEN','153');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('BLOB','154');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CALL','155');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CHANGE','156');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CHECK','157');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CONDITION','158');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CONVERT','159');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CURRENT_DATE','160');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('CURRENT_USER','161');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DATABASES','162');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DAY_MINUTE','163');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DECIMAL','164');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DELAYED','165');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DESCRIBE','166');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DISTINCTROW','167');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('DROP','168');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ELSE','169');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ESCAPED','170');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('EXPLAIN','171');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FLOAT','172');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FOR','173');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('FROM','174');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('GROUP','175');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('HOUR_MICROSECOND','176');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('IF','177');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INDEX','178');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INOUT','179');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INT','180');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INT3','181');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('INTEGER','182');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('IS','183');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('KEY','184');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LEADING','185');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LIKE','186');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LINES','187');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LOCALTIMESTAMP','188');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LONGBLOB','189');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('LOW_PRIORITY','190');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MEDIUMBLOB','191');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MIDDLEINT','192');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('MOD','193');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('NOT','194');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('NUMERIC','195');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('OPTION','196');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('ORDER','197');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('OUTFILE','198');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('PROCEDURE','199');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('READ','200');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('REAL','201');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('RELEASE','202');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('REPLACE','203');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('RETURN','204');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('RLIKE','205');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SECOND_MICROSECOND','206');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SEPARATOR','207');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SMALLINT','208');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SQL','209');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SQLWARNING','210');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('SQL_SMALL_RESULT','211');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('STRAIGHT_JOIN','212');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('THEN','213');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('TINYTEXT','214');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('TRIGGER','215');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('UNION','216');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('UNSIGNED','217');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('USE','218');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('UTC_TIME','219');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('VARBINARY','220');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('VARYING','221');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('WHILE','222');
INSERT INTO `reserved_words` (`reserved_word`,`id`) values('XOR','223');

CREATE TABLE `users` (
  `pass` text NOT NULL,
  `user` varchar(10) NOT NULL,
  `right` int(1) NOT NULL DEFAULT '0',
  `sid` varchar(200) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
INSERT INTO `users` (`pass`,`user`,`right`,`sid`,`ip`,`id`) values('guest','guest','0','123','dd','1');