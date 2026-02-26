Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EItkMuE8oGmrhAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 13:30:25 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE01A5B28
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 13:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D4610E919;
	Thu, 26 Feb 2026 12:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B18egGAB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F5710E918
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 12:30:22 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2ad9516a653so3462195ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 04:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772109022; x=1772713822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vX2tPF6zBIVyTh8hqIJIyXQIEwmjYpU6LNcfWWsSq80=;
 b=B18egGABCEG+E005TfQ6ypwtUycPn1vJrAfMpn7L4PmIbUKcHquT7TDo2G6D8+PjBK
 wi1ctao4lcoKZL4VQIOVAek7dIYeCcKPV97ZCYfpzSIwxP9yccbBdDoflT07iSh9Ld5J
 4Q+b35UJSg6bV0TsiF5k22lkUQ0h3zE0/pdSH0UdrEMU+GFycV01ljyWEUGehHTOmpin
 uNBtHggu7xJLJ+C/iObdp3kGfd68b2rmVdXpy/QD2nXPsknoPvlcGlv+JHuSMk4jp798
 vfDk1rKIE1EixyW49fKz2Hj/wPGVOqGtTD9C0HHMUnFekzEr++vPJ3TqQ2u/Ht7eZPLB
 ImMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772109022; x=1772713822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vX2tPF6zBIVyTh8hqIJIyXQIEwmjYpU6LNcfWWsSq80=;
 b=FyWWVWkLAbsv/klAb1u1EmlV9vxOgBNW8OYXzTyjLRaVEbsHGc97/1r3gw4Wk9pufc
 rCKBUy7GkCMzAuEgeWK5CChGRRaEmQ129skiid7WSp5XgFdgaisDaaQKT90cEdp8U0oC
 29WYTTVQtu8GyGdxxR4lEbTgjufy3xOEoNr7DBzspblmuZgFHW07s1zdx+5NG58a/j3t
 mq/WYbBBN946TjFoY0qWufDesophIZtKQrmqv9q+YrN02iyRAqt/QM2FYbmsuELOvNc5
 deW+C0Qo7kjquKvh7YEC81oJN3aTzlEa8keTF7ar0IggdEWNd+0Vedk8TMl37iNq1xFO
 NvMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJTK9Qio7GS8ejD7fwqNAjN4oPHE8UJelRClAxHI+y4MGGQQKQU4uAcMdes4DfSdO+N8z4nLvcTHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydEe3+UNwjLaB9vH63S6OUiXTKwjjx9DVIil1Ykb2E/9JnVSHD
 w5k0SwjhcUMB0J30RM4/V/6GIIcdpuCjxUwbHZ1Yspxhv0hGJELb9FDM
X-Gm-Gg: ATEYQzx7uaviMqTNWmNjGfxZ3pRIqJkZ09MfBPHBTKWgs2SxVK/JKiks0uE8HCeM1+e
 ZP9vPn06/u/3E5txpHstQNx/HpthFGARpb+mengOG27SJbkhxAtsXL0WTVn9L19o86dH7dswbeJ
 YadmAAH1IHYR6tzPtEKlBg6uO9Ij1d1tm615bwfBRbmS6HzJvR1oklNIkMdIzWEKe1WCEIpludy
 xeYP33YVHQHPuVBwscgKyZnRI+sMIhxaAShtjoYIpP5ZJuDee5oakp3UfWL4nrCVnOYalrRScem
 Sc64US9x2i/A5g4q9UnKoX/fZpdH6zMCs1elUdRvbKA1+Hy2JFfzoQRUbeccbSSR4NLLJd9205l
 2CmdlErRSP391hIgl/tfziQKmnR2Z73XLJzvLT6B3/QV08nbrrTfVMlzNFgf6nswOb0fh6NoFtf
 O0iGTztg==
X-Received: by 2002:a17:903:94b:b0:2a2:f0cb:dfa2 with SMTP id
 d9443c01a7336-2ae02e49483mr17925415ad.13.1772109021776; 
 Thu, 26 Feb 2026 04:30:21 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b22e7sm25504125ad.3.2026.02.26.04.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 04:30:21 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pengyu Luo <mitltlatltl@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 1/2] drm/msm/dsi/phy: fix hardware revision
Date: Thu, 26 Feb 2026 20:29:57 +0800
Message-ID: <20260226122958.22555-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226122958.22555-1-mitltlatltl@gmail.com>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:broonie@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 37BE01A5B28
X-Rspamd-Action: no action

The hardware revision for TSMC 3nm-based Qualcomm SOCs should be 7.2,
this can be confirmed from REG_DSI_7nm_PHY_CMN_REVISION_ID0, the value
is 0x27, which means hardware revision is 7.2

No functional change.

Fixes: 1337d7ebfb6d ("drm/msm/dsi/phy: Add support for SM8750")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8cb0db3a9..01182442d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -51,8 +51,8 @@
 #define DSI_PHY_7NM_QUIRK_V4_3		BIT(3)
 /* Hardware is V5.2 */
 #define DSI_PHY_7NM_QUIRK_V5_2		BIT(4)
-/* Hardware is V7.0 */
-#define DSI_PHY_7NM_QUIRK_V7_0		BIT(5)
+/* Hardware is V7.2 */
+#define DSI_PHY_7NM_QUIRK_V7_2		BIT(5)
 
 struct dsi_pll_config {
 	bool enable_ssc;
@@ -143,7 +143,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
 
 	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) {
 		config->pll_clock_inverters = 0x28;
-	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		if (pll_freq < 163000000ULL)
 			config->pll_clock_inverters = 0xa0;
 		else if (pll_freq < 175000000ULL)
@@ -284,7 +284,7 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
 	}
 
 	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
-	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		if (pll->vco_current_rate < 1557000000ULL)
 			vco_config_1 = 0x08;
 		else
@@ -699,7 +699,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	case MSM_DSI_PHY_MASTER:
 		pll_7nm->slave = pll_7nm_list[(pll_7nm->phy->id + 1) % DSI_MAX];
 		/* v7.0: Enable ATB_EN0 and alternate clock output to external phy */
-		if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)
+		if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)
 			writel(0x07, base + REG_DSI_7nm_PHY_CMN_CTRL_5);
 		break;
 	case MSM_DSI_PHY_SLAVE:
@@ -987,7 +987,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Request for REFGEN READY */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
 	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		writel(0x1, phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		udelay(500);
 	}
@@ -1021,7 +1021,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		lane_ctrl0 = 0x1f;
 	}
 
-	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		if (phy->cphy_mode) {
 			/* TODO: different for second phy */
 			vreg_ctrl_0 = 0x57;
@@ -1097,7 +1097,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 
 	/* program CMN_CTRL_4 for minor_ver 2 chipsets*/
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0) ||
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2) ||
 	    (readl(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
 		writel(0x04, base + REG_DSI_7nm_PHY_CMN_CTRL_4);
 
@@ -1213,7 +1213,7 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 	/* Turn off REFGEN Vote */
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
 	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
-	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
+	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_2)) {
 		writel(0x0, base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
 		wmb();
 		/* Delay to ensure HW removes vote before PHY shut down */
@@ -1502,7 +1502,7 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
 #endif
 	.io_start = { 0xae95000, 0xae97000 },
 	.num_dsi_phy = 2,
-	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_2,
 };
 
 const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
@@ -1525,5 +1525,5 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
 #endif
 	.io_start = { 0x9ac1000, 0x9ac4000 },
 	.num_dsi_phy = 2,
-	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_2,
 };
-- 
2.53.0

