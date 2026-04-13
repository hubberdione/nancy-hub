-- ══════════════════════════════════════════════════════
-- NANCY HUB — PARTNERSHIPS TABLES
-- Run this in your Supabase SQL Editor (one block at a time)
-- ══════════════════════════════════════════════════════

-- 1. CREATOR DIRECTORY
create table if not exists partnership_creators (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  handle text,
  agency text not null, -- 'Eyeball Factory' | 'Krave Media' | 'Little Leaf' | 'Standalone'
  category text,        -- 'Creator' | 'Influencer'
  platform text,
  payment_route text,
  status text default 'Active',
  created_at timestamptz default now()
);

-- 2. PIPELINE / OUTREACH
create table if not exists partnership_pipeline (
  id uuid primary key default gen_random_uuid(),
  company text not null,
  source_agency text,
  stage text,   -- '1-Outreach' | '2-Discussion' | '3-Contract' | '4-Samples Sent' | '5-Content Live' | '6-Complete'
  assignee text,
  next_step text,
  last_update text,
  status text default 'Active', -- 'Active' | 'On Hold'
  created_at timestamptz default now()
);

-- 3. PERFORMANCE
create table if not exists partnership_performance (
  id uuid primary key default gen_random_uuid(),
  creator_name text not null,
  handle text,
  agency text not null,
  spend_hkd numeric default 0,
  roas numeric default 0,
  purchases integer default 0,
  revenue_hkd numeric default 0,
  period text default 'Mar 31–Apr 6',
  notes text,
  created_at timestamptz default now()
);

-- 4. AFFILIATE LINKS
create table if not exists partnership_affiliates (
  id uuid primary key default gen_random_uuid(),
  creator_name text not null,
  agency text,
  code text,
  platform_notes text,
  created_at timestamptz default now()
);

-- 5. PAYMENT ROUTES (one row per agency)
create table if not exists partnership_payments (
  id uuid primary key default gen_random_uuid(),
  agency text not null unique,
  payment_route text,
  campaign text,
  rate_type text,
  notes text,
  created_at timestamptz default now()
);

-- 6. ONBOARDING KIT
create table if not exists partnership_kit (
  id uuid primary key default gen_random_uuid(),
  agency text not null,
  section text not null,  -- e.g. 'Brief Template' | 'Contract' | 'Posting Guidelines'
  content text,
  sort_order integer default 0,
  created_at timestamptz default now()
);

-- ══════════════════════════════════════════════════════
-- SEED DATA
-- ══════════════════════════════════════════════════════

-- CREATOR DIRECTORY — Eyeball Factory (39)
insert into partnership_creators (name, handle, agency, category, platform, payment_route, status) values
('Adeife Faith','@ades.collects','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Alexa Hartsfield','@selflovewithlex','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Amanda Neely','@thefruitfulera','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Andrea Perry','@selflovekay','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('April Wilson','@aspenvibeswithnancy','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Ashlee Marie','@lovelaughashlee','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Ashley','@ashleyafterhourz','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Aylin Vega','@hergirlmind','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Beverly Avery','@i.am.noni','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Bree B','@lucyslittlelifee','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Brittany Sides','@nancysaidhello','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Caitlyn Cowen','@iamcaitlyncowen','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Carly Nelson','@carlyyselflovee','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Christina Kinzer','@lovelifechrissy','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Courteney Fillmore','@courteneyuncencored_','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Courtney Erica','@courtneyemacphee','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Elizabeth Freeman','@lizinfiction','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Emily Smiley','@hotgirlemergy','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Eva Sun','@helloevadinexx','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Fallon Browder','@hersacredenergy','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Holly Rodriguez','@ninas.nancy','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Juliana Cano','@heyjuleshey','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Kierstin Cochran','@in.her.body_unfiltered','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Kimberly Yue','@sexybookishgirl','Eyeball Factory','Creator','Instagram','Direct to Eyeball Factory','Active'),
('Lynzey Lindsay','@lindslovexoxo','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Madison Pitkanen','@selflovewithmaddixoxo','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('McKinzey Cline','@everythinggirlyera','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Megan Devine','@her.fruitful.confidence','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Nu Era','@anuera901','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Paige Nicole','@selflovewithpaige','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Rachel Millison','@rachellovesgoodvibes','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Renee McGerigle','@hironniehixo','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Roxy Joy','@gemmas_secret_life','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Secilia Alvarado','@selflovewithseci','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Shalani Leeson','@pinnaclerevelations','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Stacy Higgins','@sophie.soft.life','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Stephanie Free','@funwithneff','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Susie Abernathy','@phoenixlove46','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active'),
('Veronica Bonamin','@girltalkwithv','Eyeball Factory','Creator','TikTok','Direct to Eyeball Factory','Active');

-- CREATOR DIRECTORY — Krave Media (16)
insert into partnership_creators (name, handle, agency, category, platform, payment_route, status) values
('Sanaea Bubber','@sanaeabubber','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Elsa de Sancho Santana','@elsagervasi','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Arielle Scarcella','@arielle_scarcella','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Cheri Cho','@cheri2222','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Olivia Tuggle','@oliviatuggle','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Naomi Henry','@fithomefam','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Alyssa Luckey','@luckey1ss','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Hannah Brown','@hellobrownfamily','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Aliya Monique','@aliyamonique','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Diana K Levy','@levydiana','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Anchitta Noowong','@anchittan_','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Barbara Kiss','@barbarakissmusic','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Melissa Diaz Carcases','@model.mels','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Lori Hovagimian','@loridemir_','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Angie LeCroy','@angie_resells','Krave Media','Influencer','Instagram','Via Krave Media agency','Active'),
('Aimee Bradley','@dream1ncolour','Krave Media','Influencer','Instagram','Via Krave Media agency','Active');

-- CREATOR DIRECTORY — Little Leaf (3)
insert into partnership_creators (name, handle, agency, category, platform, payment_route, status) values
('Karen Bigmann','@taboototruth','Little Leaf','Influencer','TikTok/IG/YouTube','Via Little Leaf + Impact affiliate','Active'),
('Annette Benedetti','@talksexwithannette','Little Leaf','Influencer','TikTok/IG/YouTube','Via Little Leaf + Impact affiliate','Active'),
('Dr. Tara Suwinyattichaiporn','@luvbites.co','Little Leaf','Influencer','TikTok/IG/YouTube','Via Little Leaf + Impact affiliate','Active');

-- CREATOR DIRECTORY — Standalone (2)
insert into partnership_creators (name, handle, agency, category, platform, payment_route, status) values
('Luci Lampe','@lucilampeofficial','Standalone','Creator','TikTok/IG/YouTube','Direct to creator','Active'),
('Annemarie McGinnis','@venusohara','Standalone','Creator','TikTok/IG/YouTube','Direct to creator','Active');

-- PIPELINE (24)
insert into partnership_pipeline (company, source_agency, stage, assignee, status) values
('Ali Woods','The Millar Agency','2-Discussion','Rahul','Active'),
('Brooke Bralove','Standalone','2-Discussion','Momo/Rahul','Active'),
('The Teen Commandments','Audio Always','2-Discussion','Sam/Rahul','Active'),
('Savage Lovecast','Ruinous Media','2-Discussion','Rahul & Momo','Active'),
('Dr. Amy Shah','Standalone','5-Content Live','Andrea','Active'),
('Sex with Emily','Standalone','4-Samples Sent','Ben Hutchison','Active'),
('Sex Ed with DB','Little Leaf','2-Discussion','Momo','Active'),
('We Are Verified','Standalone','2-Discussion','Sam','Active'),
('WOW Inc','Standalone Agency','3-Contract','Momo','Active'),
('The Liberated Feminine Podcast','Standalone','4-Samples Sent','Momo/Andrea','Active'),
('Djedi Mind Trip','Standalone','2-Discussion','Rahul','Active'),
('Amanda Cerny','Standalone','2-Discussion','Daphnie/Sam','Active'),
('Ian Kulp','Standalone','4-Samples Sent','Daphnie/Sam','Active'),
('Kash Doll','Standalone','1-Outreach','—','Active'),
('Lauren Payton','Little Leaf','2-Discussion','—','Active'),
('Dr. Tara (Little Leaf)','Little Leaf','5-Content Live','Momo/Andrea','Active'),
('Mamamia Out Loud','Standalone','2-Discussion','—','On Hold'),
('IHeartMedia','Standalone','2-Discussion','Momo/Andrea','Active'),
('Live Anyway Podcast','Standalone','2-Discussion','Momo/Andrea','Active'),
('Nick Kyrgios','Standalone','3-Contract','Sam','Active'),
('Krave Media','Krave','2-Discussion','—','Active'),
('Hip & Healthy','Little Leaf','2-Discussion','—','Active'),
('Wynn NightLife','Standalone','2-Discussion','—','Active'),
('Cheri & Clement','Standalone','1-Outreach','—','Active');

-- PERFORMANCE — Eyeball Factory
insert into partnership_performance (creator_name, handle, agency, spend_hkd, roas, purchases, revenue_hkd, period) values
('Kimberly Yue','@sexybookishgirl','Eyeball Factory',24908,1.48,54,36860,'Mar 31–Apr 6'),
('Madison Pitkanen','@selflovewithmaddixoxo','Eyeball Factory',12633,0.72,14,9042,'Mar 31–Apr 6'),
('Caitlyn Cowen','@iamcaitlyncowen','Eyeball Factory',4232,1.85,11,7849,'Mar 31–Apr 6'),
('Eva Sun','@helloevadinexx','Eyeball Factory',1848,0.28,1,512,'Mar 31–Apr 6'),
('Christina Kinzer','@lovelifechrissy','Eyeball Factory',2076,1.23,4,2554,'Mar 31–Apr 6'),
('Nu Era','@anuera901','Eyeball Factory',684,2.48,3,1695,'Mar 31–Apr 6'),
('Courteney Fillmore','@courteneyuncencored_','Eyeball Factory',312,3.56,2,1112,'Mar 31–Apr 6'),
('Ashlee Marie','@lovelaughashlee','Eyeball Factory',540,1.38,1,746,'Mar 31–Apr 6'),
('Beverly Avery','@i.am.noni','Eyeball Factory',207,2.76,1,571,'Mar 31–Apr 6'),
('Bree B','@lucyslittlelifee','Eyeball Factory',230,2.60,1,599,'Mar 31–Apr 6'),
('April Wilson','@aspenvibeswithnancy','Eyeball Factory',393,1.44,1,568,'Mar 31–Apr 6'),
('Megan Devine','@her.fruitful.confidence','Eyeball Factory',424,1.26,1,536,'Mar 31–Apr 6'),
('Alexa Hartsfield','@selflovewithlex','Eyeball Factory',254,0,0,0,'Mar 31–Apr 6'),
('McKinzey Cline','@everythinggirlyera','Eyeball Factory',275,0,0,0,'Mar 31–Apr 6'),
('Emily Smiley','@hotgirlemergy','Eyeball Factory',206,0,0,0,'Mar 31–Apr 6'),
('Adeife Faith','@ades.collects','Eyeball Factory',221,0,0,0,'Mar 31–Apr 6'),
('Juliana Cano','@heyjuleshey','Eyeball Factory',205,0,0,0,'Mar 31–Apr 6'),
('Kierstin Cochran','@in.her.body_unfiltered','Eyeball Factory',253,0,0,0,'Mar 31–Apr 6');

-- PERFORMANCE — Krave Media
insert into partnership_performance (creator_name, handle, agency, spend_hkd, roas, purchases, revenue_hkd, period) values
('Elsa de Sancho Santana','@elsagervasi','Krave Media',904,1.80,1,1632,'Mar 31–Apr 6'),
('Arielle Scarcella','@arielle_scarcella','Krave Media',1526,0.44,1,679,'Mar 31–Apr 6'),
('Naomi Henry','@fithomefam','Krave Media',744,0.91,1,675,'Mar 31–Apr 6'),
('Aliya Monique','@aliyamonique','Krave Media',398,1.24,1,492,'Mar 31–Apr 6'),
('Diana K Levy','@levydiana','Krave Media',395,0,0,0,'Mar 31–Apr 6'),
('Cheri Cho','@cheri2222','Krave Media',618,0,0,0,'Mar 31–Apr 6'),
('Anchitta Noowong','@anchittan_','Krave Media',161,0,0,0,'Mar 31–Apr 6'),
('Barbara Kiss','@barbarakissmusic','Krave Media',128,0,0,0,'Mar 31–Apr 6'),
('Lori Hovagimian','@loridemir_','Krave Media',120,0,0,0,'Mar 31–Apr 6'),
('Angie LeCroy','@angie_resells','Krave Media',50,0,0,0,'Mar 31–Apr 6');

-- PERFORMANCE — Little Leaf
insert into partnership_performance (creator_name, handle, agency, spend_hkd, roas, purchases, revenue_hkd, period, notes) values
('Karen Bigmann','@taboototruth','Little Leaf',13899,2.19,39,30440,'Mar 31–Apr 6','Meta'),
('Annette Benedetti','@talksexwithannette','Little Leaf',12916,1.48,29,19143,'Mar 31–Apr 6','Meta'),
('Dr. Tara Suwinyattichaiporn','@luvbites.co','Little Leaf',0,0,0,0,'Mar 31–Apr 6','Impact only'),
('Luci Lampe','@lucilampeofficial','Standalone',0,0,0,0,'Mar 31–Apr 6','Minimal Meta'),
('Annemarie McGinnis','@venusohara','Standalone',75,0,0,0,'Mar 31–Apr 6','Minimal Meta');

-- AFFILIATES
insert into partnership_affiliates (creator_name, agency, code, platform_notes) values
('Karen Bigmann','Little Leaf','TABOO25','Impact platform'),
('Annette Benedetti','Little Leaf','ANNETTE25','Impact platform'),
('Dr. Tara Suwinyattichaiporn','Little Leaf','TARA25','Impact platform'),
('Luci Lampe','Standalone','LUCI25','Social Snowball / Tremendos'),
('Annemarie McGinnis','Standalone','VENUS25','Social Snowball / Tremendos');

-- PAYMENT ROUTES
insert into partnership_payments (agency, payment_route, campaign, rate_type, notes) values
('Eyeball Factory','Direct to Eyeball Factory','Hello-Momo-5','CPM + fixed monthly','Whitelisting handled by agency'),
('Krave Media','Via Krave Media agency','Lem-Regalio-1','Agency managed','Whitelisting through Krave'),
('Little Leaf','Via Little Leaf agency + Impact commissions',null,'Agency + affiliate commission','Affiliate tracked via Impact platform'),
('Standalone','Direct to creator',null,'Affiliate commission','Tracked via Social Snowball / Tremendos');

-- ONBOARDING KIT
insert into partnership_kit (agency, section, content, sort_order) values
('Eyeball Factory','Brief Template','Campaign: Hello-Momo-5. TikTok-first creative. CPM + fixed monthly rate. Content must include Nancy product demo, self-love angle. Submit draft to Sam before posting.',1),
('Eyeball Factory','Contract','All Eyeball Factory creators are contracted through the agency. Send contract requests to agency contact. NDA included. 30-day content exclusivity.',2),
('Eyeball Factory','Posting Guidelines','Post between 7–9pm EST. Tag @nancywellness. Use approved hashtags. No competitor mentions within 48hrs of posting. Submit content for approval 48hrs before going live.',3),
('Krave Media','Brief Template','Campaign: Lem-Regalio-1. Instagram-first. Agency handles brief distribution. Coordinate with Krave account manager for all creator communications.',1),
('Krave Media','Contract','Contracts handled entirely by Krave Media agency. Nancy does not contract creators directly. Payment goes to agency net-30.',2),
('Krave Media','Posting Guidelines','Platform: Instagram (feed + stories). Krave provides posting schedule. Nancy review window: 24hrs. FTC disclosure required in caption.',3),
('Little Leaf','Brief Template','Multi-platform: TikTok, Instagram, YouTube. Affiliate code must appear in all posts. Impact tracking link required in bio during campaign. Coordinate with Little Leaf for brief updates.',1),
('Little Leaf','Contract','Via Little Leaf agency. Impact platform handles affiliate commission tracking and payouts. Agency manages creator relationship.',2),
('Little Leaf','Posting Guidelines','All three platforms required per cycle. YouTube: minimum 60-sec dedicated segment. Include discount code visually on screen. Tag @nancywellness. Impact link in bio.',3),
('Standalone','Brief Template','Direct relationship. Brief sent directly to creator. Include: product talking points, approved claims, call-to-action with discount code. Confirm receipt within 48hrs.',1),
('Standalone','Contract','Direct contract with creator. Use Nancy standard influencer agreement. Send via DocuSign. Include usage rights, FTC clause, payment terms.',2),
('Standalone','Posting Guidelines','Flexible platform. Discount code must be prominent. FTC disclosure required. Submit draft for approval before publishing. Social Snowball tracks code performance.',3);

-- ══════════════════════════════════════════════════════
-- RLS: Disable row-level security for all tables
-- (matches existing Nancy Hub pattern for internal tools)
-- ══════════════════════════════════════════════════════
alter table partnership_creators disable row level security;
alter table partnership_pipeline disable row level security;
alter table partnership_performance disable row level security;
alter table partnership_affiliates disable row level security;
alter table partnership_payments disable row level security;
alter table partnership_kit disable row level security;
