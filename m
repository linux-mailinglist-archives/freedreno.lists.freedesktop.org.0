Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C835B797
	for <lists+freedreno@lfdr.de>; Mon, 12 Apr 2021 02:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446CE89F45;
	Mon, 12 Apr 2021 00:08:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07C589F45
 for <freedreno@lists.freedesktop.org>; Mon, 12 Apr 2021 00:08:36 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a1so13228575ljp.2
 for <freedreno@lists.freedesktop.org>; Sun, 11 Apr 2021 17:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ieepqs9ZuSvUUPxw9eZKC0f238LzqGVu9bKoapQmr4=;
 b=WZ1Dgb5fCpEqjax+Dm3uS2ehQWH+ccKnQRLlzUVlQgcVbvwrjOaaD3ZXGnY1hvvVNT
 ukZ6BMmFsw4n5iYPzQMINCzsyiLBR1mZYXEAePhRmZSuoOuBDWcMjbEpu2mXvPriUxu5
 CaUex8/DHuQRKUqEsBadYK4f/WjCf3gMdZD5oDqqIJA65pFGmWQPTYF68IxxQZcucRXj
 bYj+GVQU73fQODjiOgqDYD3OFB/OMjuAp4JeFMLFswI05ikCo8BJApjIMbRuYCXTNUkb
 wOVlzYSRRxL2GOVRe+bbBGrbFKPNkfxJTaPuM7qg/Mzd4n7Yffl/i80nbxHihpj4LUD4
 ItBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ieepqs9ZuSvUUPxw9eZKC0f238LzqGVu9bKoapQmr4=;
 b=JRlfh9zIekpBbd1tURIApKo9vIFj+jxJ5gw0Rt/3Qo/FFyiu2ovHAxU5sTk+k4iDEM
 vVd10LkPA3DDIJQHoSH5KdvycsGmPAQGcFoNc1Q7pAhQMwpf8vRkdM7cNkKcYBivMcRf
 goXSWGPQjhGBQapqY3DQzcVydt6H5ejwzVKe4wBqCc+5pDKCrNlpX9JcxOzFHj7rPyqy
 jrEWxmhC1RYkX5IvWLRF8YimO73Utnn09bJYeBW8beGfCWHOwZdDRi9sv06HK6yi3Nqe
 GUZH0YVGfkVvtuqzAj7RQ6paIfE/YT+AvkJOFgZyZ8HXcn4LbpFmbQkYIoLK9hjGOmDb
 tDJw==
X-Gm-Message-State: AOAM532yIc8IK0Xz6iMdu4TYjvMuW1tfvy5bZidPEBGs3K23tx0j6juE
 wRpf/XKY3ewMNUH937k2L95fP/9z83GlLA==
X-Google-Smtp-Source: ABdhPJxRcOvXWuRVRVYNfvjK+PXibkRkqkrmDe20XRjGgJnbBjs5+YX9rDuf7nsmo//tp51W+1EHrw==
X-Received: by 2002:a2e:9f48:: with SMTP id v8mr3334597ljk.302.1618185720064; 
 Sun, 11 Apr 2021 17:02:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c1sm2288633ljf.85.2021.04.11.17.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 17:01:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Mon, 12 Apr 2021 03:01:58 +0300
Message-Id: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dsi: fix msm_dsi_phy_get_clk_provider
 return code
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
return 0 instead of returning incorrect -EINVAL error code.

Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f0a2ddf96a4b..ff7f2ec42030 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 	if (pixel_clk_provider)
 		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
 
-	return -EINVAL;
+	return 0;
 }
 
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
