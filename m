Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D528F923
	for <lists+freedreno@lfdr.de>; Thu, 15 Oct 2020 21:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE616E199;
	Thu, 15 Oct 2020 19:03:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3266E19A
 for <freedreno@lists.freedesktop.org>; Thu, 15 Oct 2020 19:03:44 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d24so4232865ljg.10
 for <freedreno@lists.freedesktop.org>; Thu, 15 Oct 2020 12:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vhaZDdXwG9Htyy9xDjuNDYv8IjQyEGy8Xq6PwirKnX0=;
 b=EUNB8eg9424Pz3MhNKldl/Gb7ORKJB2IZF7A8HYSeXEkaXV1kyQYBUtA4NmwOfV2GJ
 C793nDdbvoFHUoSrofe6zkCe07kKkCOAXemj0ShENkt5VkAfIj1xJleAwSi1+QzlKBCN
 /VfsFU8ZZhlHu0gGnebxXcfAxvRMIWFL71Bo8nPSeFEWxzsd4jis1WuRXCRGIlLcwyxY
 HO8QoSjxBXYUVoWGmMhV77xRQF6q/m/Mw0U8xgItOHrDTMjcu4HFFcbN9KawKqv6VTqC
 ynuSUsoXiNMlzCO5Ds8xnCmY25YSDikVX1MU3aqHfkZu18+5A7wScX48zL6Nm92x6RJb
 ObIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhaZDdXwG9Htyy9xDjuNDYv8IjQyEGy8Xq6PwirKnX0=;
 b=bOXOxQkX7V24IQFe1C6r/5hePDkaoUk94++SEENzxswT3uKT7tF8+tWgo4onE7c7Dh
 Og1hLnP15qJ+B5PmXq78P2MMZRxky8wWnnPnOdlql6fe7E5TNjgTRVOae0eimWKj5SdB
 3jV9EbxTv3dD3cICWDfqP+axLgfns6Yle1Dd355HBHFPCiBe+avd1hbUlvwad2MFzeEA
 2f1RvjRW6cH7fHJAr0LaD2jPWzJTXi4mvr5GPE1ShpI3NGzIMXqcdvqJZfzCY+BIyLrv
 bQ+E0upeiWjNNlq2hbYKhRwvd5d9RsU2DBnvO4s+1Zr2OPxm25P4mAxojz8PH5iNiYVR
 OF9g==
X-Gm-Message-State: AOAM533M+l/rGUoVX1nikESOzvTsovN9lK9kUnIrrMPEYI6I3rtjZ+lu
 ZfCtNOFE5ekvav6p+tYm7tS8rQ==
X-Google-Smtp-Source: ABdhPJzOf/yetyToCB83zvZHrgJDHli/yZIfn5ryh53Ru5VXPFtzWszJqI2El1p0VvHgPBFP3Tt3XA==
X-Received: by 2002:a2e:9242:: with SMTP id v2mr62953ljg.115.1602788622679;
 Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
 by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Thu, 15 Oct 2020 22:03:32 +0300
Message-Id: <20201015190332.1182588-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
References: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 4/4] drm/msm/dsi_phy_10nm: implement PHY
 disabling
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Implement phy_disable() callback to disable DSI PHY lanes and blocks
when phy is not used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: ff73ff194060 ("drm/msm/dsi: Populate the 10nm PHY funcs")
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 47403d4f2d28..d1b92d4dc197 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -192,6 +192,28 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 {
+	void __iomem *base = phy->base;
+	u32 data;
+
+	DBG("");
+
+	if (dsi_phy_hw_v3_0_is_pll_on(phy))
+		pr_warn("Turning OFF PHY while PLL is on\n");
+
+	dsi_phy_hw_v3_0_config_lpcdrx(phy, false);
+	data = dsi_phy_read(base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+
+	/* disable all lanes */
+	data &= ~0x1F;
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, data);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0, 0);
+
+	/* Turn off all PHY blocks */
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, 0x00);
+	/* make sure phy is turned off */
+	wmb();
+
+	DBG("DSI%d PHY disabled", phy->id);
 }
 
 static int dsi_10nm_phy_init(struct msm_dsi_phy *phy)
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
