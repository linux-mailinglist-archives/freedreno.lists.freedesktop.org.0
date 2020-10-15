Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90C528F91F
	for <lists+freedreno@lfdr.de>; Thu, 15 Oct 2020 21:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FA06E198;
	Thu, 15 Oct 2020 19:03:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517C06E198
 for <freedreno@lists.freedesktop.org>; Thu, 15 Oct 2020 19:03:42 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h6so4851484lfj.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IyCk1ZWUW2yfST0VQTlsdKN7P4gFoDnnFZaxUhGVXFk=;
 b=udF8VfgwCPwP4mDSZHxOTUeoZ+UKdrud+AcDZ7nGlDNmOij56qY7u6O/vOUfoLAlLx
 q99/2Tu5CSl5pBIWShz33MD1FCWuvWmBO5h3je6KlwzUpF/SQJr9V+V3DAvWEkKWW3b9
 WXIMDkzbL8BFrJ+3LB5TtdMWnsVDgd+wsJIf4or0/zGTngtWrgcjm1P3wUSsXEgOjBA2
 2rYOfe1kAZgFvou5mdtN9j5VnZ9QFx0/JSBvjaOkQjGi7f0+YxslntsR+nK1V6HOUifD
 oDfCAXjQa6YSU34Kg5a3WPLBYvNRf8wokKH7+/BARxjlxj4y/hhmo0q8dOqWPvqsTIoz
 eyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IyCk1ZWUW2yfST0VQTlsdKN7P4gFoDnnFZaxUhGVXFk=;
 b=n0YtaPDuCdJGNiPvcmooh+LbPsBHsbIqsQfgjTrSC+Fy4ennwERje9P3BGMsh9w3pN
 mD0lbGyKH4tfCTZCijV3uuxI/i0Hv1LjtITClGAGbfMDRhfxQEeYQWyTnoWsaEnRyo/Z
 fvFro3Hn+VNDU2ETUFixMfCTRo8RayvwNhFYuwsdmE6dCb4ZQvFUa+su9Fcrtc01dxm8
 q8yICV2CmQE0+OD6ceHwTLGf7av0eo5orERHCXR7o6odiO/652ZpzintRxuC7UscXlBv
 PwL9OImv4YmYsphvIfV1ZjpzsEwhiI7g5uVG68XLB6FyrmXJ59vU7Q/wNPXylP7a0hd2
 h38A==
X-Gm-Message-State: AOAM531EMEokxjc9PyaG1hZ2u/HE5lhmNvnUNmXlXdEa9y4CRTkfuN8T
 368K7NO7n2URn/SdV2u6qu0hww==
X-Google-Smtp-Source: ABdhPJxdJHhhA2b0ocyLA0V5KO8bb02eV68EYMcbBlYFjsRhr+aGrSQz9/7RsEN90Os+Uk1n7bdfyA==
X-Received: by 2002:a19:514:: with SMTP id 20mr14877lff.512.1602788620693;
 Thu, 15 Oct 2020 12:03:40 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
 by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:03:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Thu, 15 Oct 2020 22:03:31 +0300
Message-Id: <20201015190332.1182588-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
References: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 3/4] drm/msm/dsi_phy_7nm: implement PHY disabling
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
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 255b5f5ab2ce..79c034ae075d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -200,7 +200,28 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
-	/* TODO */
+	void __iomem *base = phy->base;
+	u32 data;
+
+	DBG("");
+
+	if (dsi_phy_hw_v4_0_is_pll_on(phy))
+		pr_warn("Turning OFF PHY while PLL is on\n");
+
+	dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
+	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+
+	/* disable all lanes */
+	data &= ~0x1F;
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, data);
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0, 0);
+
+	/* Turn off all PHY blocks */
+	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_0, 0x00);
+	/* make sure phy is turned off */
+	wmb();
+
+	DBG("DSI%d PHY disabled", phy->id);
 }
 
 static int dsi_7nm_phy_init(struct msm_dsi_phy *phy)
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
