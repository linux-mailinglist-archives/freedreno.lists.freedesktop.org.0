Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED2558846E
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 00:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3C2987C9;
	Tue,  2 Aug 2022 22:38:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3689D90FBD
 for <freedreno@lists.freedesktop.org>; Tue,  2 Aug 2022 22:37:57 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 x2-20020a17090ab00200b001f4da5cdc9cso195839pjq.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Aug 2022 15:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=m27JGOowCd4CHMBuXr6we9nLLOaaXmb6CU0SMlJjk1E=;
 b=nr4YVt6smhF5lM8TlW5lwPq7KyfS/C26YPxmmu2Zc6EZoZdUzZvl91INVJSUWdzxrJ
 8E92ORrByaq4PXG+1DZ/rK9hKKiA5dibBEeXVcKQUApeyKTltdEp/DQRHmXi2PhNDScy
 zh/7ZisrWQ+I0wLK62Y8uWWFBrR7gqkwXgraU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=m27JGOowCd4CHMBuXr6we9nLLOaaXmb6CU0SMlJjk1E=;
 b=EUdIfKjjGKhPVahhd7f4eDuLukB7IFkaEvisLHeGQoWXuMHIor+I0s7B/nZMRMVPCI
 1K+espjEMTkNuyhqdojHRnWculnuWuHDh4gAgqnfAKC+uVVl2IEiaC5unHMucVeIbQCF
 5mc4y9j8/s8+/Suszg1/D0Zm766pkW5y/UcTQduQE7T2eW54FhpnZq7vaIM/CmYGNBE7
 qRLUa4tkkepMnR9Urc8ZknQdUhvAwdaiWXcK8icNhuJn26yHoKMvEUijWW0VnVVV3x4s
 HqHghwr1/LKpz7evzUzb1Wv5ohbdBN7PJhEqkO872Pw4p/y5wtyJLm6S9eG6IJjyAic5
 lqnw==
X-Gm-Message-State: ACgBeo2vrAsyOVDHgWNN2+Sm3cVp6e3v1YpLkC0o3N6CgwBCdF12TFRm
 QvG0Mu9m+EmTIchL48BlqZRWAg==
X-Google-Smtp-Source: AA6agR5D9D9Bbr2PRxppp0iSLjlvHwVkEEUtnwO1UdHI0WhJ+VGHyudMevUSLb4M649mJJwVSTDlTA==
X-Received: by 2002:a17:90b:240e:b0:1e0:775b:f8fc with SMTP id
 nr14-20020a17090b240e00b001e0775bf8fcmr1756001pjb.132.1659479875832; 
 Tue, 02 Aug 2022 15:37:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:31c9:9937:c6bb:62f5])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6263c2000000b00528c066678csm11353030pfb.72.2022.08.02.15.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 15:37:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue,  2 Aug 2022 15:37:36 -0700
Message-Id: <20220802153434.v3.4.I7b3c72949883846badb073cfeae985c55239da1d@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220802223738.898592-1-dianders@chromium.org>
References: <20220802223738.898592-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 4/6] drm/msm/dsi: Use the new regulator bulk
 feature to specify the load
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As of commit 6eabfc018e8d ("regulator: core: Allow specifying an
initial load w/ the bulk API") we can now specify the initial load in
the bulk data rather than having to manually call regulator_set_load()
on each regulator. Let's use it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Update commit message to point at the git hash of the regulator change.

Changes in v2:
- ("Use the new regulator bulk feature to specify the load") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 13 +++----------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9df278d39559..a0a1b6d61d05 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -260,8 +260,10 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
 	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
 	int i, ret;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num; i++) {
 		s[i].supply = regs[i].name;
+		s[i].init_load_uA = regs[i].enable_load;
+	}
 
 	ret = devm_regulator_bulk_get(&msm_host->pdev->dev, num, s);
 	if (ret < 0) {
@@ -270,15 +272,6 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
 		return ret;
 	}
 
-	for (i = 0; i < num; i++) {
-		if (regs[i].enable_load >= 0) {
-			ret = regulator_set_load(s[i].consumer,
-						 regs[i].enable_load);
-			if (ret < 0)
-				return ret;
-		}
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7c105120d73e..efb6b1726cdb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -515,8 +515,10 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
 	int num = phy->cfg->reg_cfg.num;
 	int i, ret;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num; i++) {
 		s[i].supply = regs[i].name;
+		s[i].init_load_uA = regs[i].enable_load;
+	}
 
 	ret = devm_regulator_bulk_get(dev, num, s);
 	if (ret < 0) {
@@ -529,15 +531,6 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
 		return ret;
 	}
 
-	for (i = 0; i < num; i++) {
-		if (regs[i].enable_load >= 0) {
-			ret = regulator_set_load(s[i].consumer,
-							regs[i].enable_load);
-			if (ret < 0)
-				return ret;
-		}
-	}
-
 	return 0;
 }
 
-- 
2.37.1.455.g008518b4e5-goog

