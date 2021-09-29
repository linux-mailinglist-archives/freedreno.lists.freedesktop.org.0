Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658A341C321
	for <lists+freedreno@lfdr.de>; Wed, 29 Sep 2021 13:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1706E1A3;
	Wed, 29 Sep 2021 11:02:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Wed, 29 Sep 2021 11:02:16 UTC
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5306E1A3
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 11:02:16 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 47D6540658; 
 Wed, 29 Sep 2021 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632912898;
 bh=YOZiyetPPMC5PNnyBKeg3t/QdWNAhWHiGFM/sM4glVM=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=wANz101VligmwN3KD5B2T1VyV0Dpv8QeSwMCuZDnMOFdTcimpF511kYoFEVB2mYVV
 8o8iAqesljHE8T81NfGebrU0G3JYsEZSjhRAXMysBns6c7Y6fbhGe4TEtw0a85yY2l
 jsH9He1ISdV7InwNUpmb1PupzIFXj7hb3DVZbmnUiSrWqkYFWWFQ9TAw1Tx3clZZ+X
 +LI8D+xaPkppvtZ3wlGEMi2OLwqNAXvp9QEyQfx0oqi7BU9V7IODDuVfrHmoisiIp7
 y1UDaXfonsK5NiqEDFChN/qStpCksFcGC/xCyxYpM/aZ89bGMMHZDdRnRcrEUOJxgs
 9kmgkxX0UwgVg==
From: Colin King <colin.king@canonical.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 29 Sep 2021 11:54:58 +0100
Message-Id: <20210929105458.209895-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dp: Remove redundant initialization of
 variable bpp
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

From: Colin Ian King <colin.king@canonical.com>

The variable bpp is being initialized with a value that is never
read, it is being updated later on in both paths of an if statement.
The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 2181b60e1d1d..71db10c0f262 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -234,7 +234,7 @@ u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
 	struct dp_panel_private *panel;
-	u32 bpp = mode_edid_bpp;
+	u32 bpp;
 
 	if (!dp_panel || !mode_edid_bpp || !mode_pclk_khz) {
 		DRM_ERROR("invalid input\n");
-- 
2.32.0

