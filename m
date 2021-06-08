Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860D83A0436
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 21:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D3B6E58B;
	Tue,  8 Jun 2021 19:55:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC056E58B
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 19:55:20 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id n12so17380003pgs.13
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 12:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hpBo4F5IMaB8LprhMFQpECB/Tsipa5HxZ3V5D/8s1RY=;
 b=SM/rbyKXA5uvkVWdxAE6Uw8+XB1YuYpQA87f7imaB/Pa30PTaHSpAPkKqTllciNV22
 PwKRJcjD5sTSzuv31Rv7ssQrJ98YemAWUPDAmY3iA/fsef2ro2Sy+eabRHPGBNSTsV0q
 MSbLDaa0NamNGO9LkS/iku2vxVXiy+9JwGU7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hpBo4F5IMaB8LprhMFQpECB/Tsipa5HxZ3V5D/8s1RY=;
 b=qDUbZSBcrtv+8kMgcHk+07pBPA3mROiWXs92peVDhHw6txooDnF1TmTFVTbKgYpFbh
 97ZpWBS5FGC85euVsjcCHtLPJJ/OdKKOa3PmMCV4wQbZ53+v2KPkYYbFFIH3AYjXoeQM
 lwcz7+g9yzem0NuxVJ+SddwyOHZjf7Qctxx0I+nYrXYzE4O7/KHwrN70DUwG6vlQPwNr
 ISV4RGjnSmduxbKc7Ng4CGiLX//1fa2bxjc2H5qj5+46D13lebGsi9MQRkSsVTwZOsQD
 nADb1ghVe3MwQLmC7WRlKWfkZZnmoDEcOM1Hxmy7M0M8eHPtFj8f9p//zS2+4i2W9ARW
 oGjQ==
X-Gm-Message-State: AOAM530mVFPt/DHvkCJ4uytmKm5vSf2Jcm2bjM0bYuUhGqWo0GBChitF
 GWJP8UtA1dDeosYfP5es2I11cQ==
X-Google-Smtp-Source: ABdhPJyyigapQWlfSOy3grhL9AsA1fpTEuIDZBrnOdvzN/ROnn3aHq7p/NPByDRRtFPjSjbBqPezUA==
X-Received: by 2002:a63:f248:: with SMTP id d8mr24212648pgk.219.1623182120335; 
 Tue, 08 Jun 2021 12:55:20 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:a3bd:e3bf:4835:f2fc])
 by smtp.gmail.com with ESMTPSA id u125sm2590132pfu.95.2021.06.08.12.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 12:55:19 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Tue,  8 Jun 2021 12:55:19 -0700
Message-Id: <20210608195519.125561-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dsi: Stash away calculated vco
 frequency on recalc
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A problem was reported on CoachZ devices where the display wouldn't come
up, or it would be distorted. It turns out that the PLL code here wasn't
getting called once dsi_pll_10nm_vco_recalc_rate() started returning the
same exact frequency, down to the Hz, that the bootloader was setting
instead of 0 when the clk was registered with the clk framework.

After commit 001d8dc33875 ("drm/msm/dsi: remove temp data from global
pll structure") we use a hardcoded value for the parent clk frequency,
i.e.  VCO_REF_CLK_RATE, and we also hardcode the value for FRAC_BITS,
instead of getting it from the config structure. This combination of
changes to the recalc function allows us to properly calculate the
frequency of the PLL regardless of whether or not the PLL has been
clk_prepare()d or clk_set_rate()d. That's a good improvement.

Unfortunately, this means that now we won't call down into the PLL clk
driver when we call clk_set_rate() because the frequency calculated in
the framework matches the frequency that is set in hardware. If the rate
is the same as what we want it should be OK to not call the set_rate PLL
op. The real problem is that the prepare op in this driver uses a
private struct member to stash away the vco frequency so that it can
call the set_rate op directly during prepare. Once the set_rate op is
never called because recalc_rate told us the rate is the same, we don't
set this private struct member before the prepare op runs, so we try to
call the set_rate function directly with a frequency of 0. This
effectively kills the PLL and configures it for a rate that won't work.
Calling set_rate from prepare is really quite bad and will confuse any
downstream clks about what the rate actually is of their parent. Fixing
that will be a rather large change though so we leave that to later.

For now, let's stash away the rate we calculate during recalc so that
the prepare op knows what frequency to set, instead of 0. This way
things keep working and the display can enable the PLL properly. In the
future, we should remove that code from the prepare op so that it
doesn't even try to call the set rate function.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Fixes: 001d8dc33875 ("drm/msm/dsi: remove temp data from global pll structure")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

I didn't update the 14nm file as the caching logic looks different. But
between the 7nm and 10nm files it looks practically the same.

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 34bc93548fcf..657778889d35 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -432,6 +432,7 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	pll_freq += div_u64(tmp64, multiplier);
 
 	vco_rate = pll_freq;
+	pll_10nm->vco_current_rate = vco_rate;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
 	    pll_10nm->phy->id, (unsigned long)vco_rate, dec, frac);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40a12ab..6f96fbac8282 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -460,6 +460,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	pll_freq += div_u64(tmp64, multiplier);
 
 	vco_rate = pll_freq;
+	pll_7nm->vco_current_rate = vco_rate;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
 	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);

base-commit: 8124c8a6b35386f73523d27eacb71b5364a68c4c
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
