Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58632324744
	for <lists+freedreno@lfdr.de>; Thu, 25 Feb 2021 00:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025DA6EC02;
	Wed, 24 Feb 2021 23:01:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AD86EC03
 for <freedreno@lists.freedesktop.org>; Wed, 24 Feb 2021 23:01:46 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id e8so4357350ljj.5
 for <freedreno@lists.freedesktop.org>; Wed, 24 Feb 2021 15:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JWazTQ/6PwXeBKQ5AHtcslmYVVFr0X7rQ3bwRNkLBQ4=;
 b=m8MeP9RgTHfK0oJ8o9ojw9reVRo40AHAx9ZzYGHPC0gEmpmWgPEPO/O9JeWslY82zI
 sKiqDko9RY9cOIrweUbRxWZVjFq50Ge+/SFckP5LQvfuysIT68G/bKXgWUXuAxhkdmg4
 5x4IDAEum+tvpyIKyykBuWR+6hlcjIwUPv4wlgLii8wtavrTHZFb+/TY0GhrHJJqAoEJ
 OEL319aFwTMvsXGYVBUwNfRRHdUvkK6301N5dp8JHDYMqd/nZqINh0YKW2W/y2VmigEL
 eovRDofitUKj42GNEW9iFi1lrQP+herSPzNo7LRa182aKKwF8P7UWzQBfCLuNtGmWq7f
 ZGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JWazTQ/6PwXeBKQ5AHtcslmYVVFr0X7rQ3bwRNkLBQ4=;
 b=JZsRNXW0GbN3gUk8Vv/R2U8duCYt1odSnrqYTfhMpnE6zVACnIRAZ2Kk/tyNPcELIM
 C9D1Fqj61cBhqwQvQSnrbiWh30GsHrDqCcFdZQBEXplVZ3jzQI/lbUapcpcBSQmME6+m
 8UHow4hq4cJRJMVmAnIQgBOO3JxFZCRUaP/kmgM6g9wTvreLL6k4dQBg8bEneb+4aGim
 hquYpGllyyEx/00pcN/PST79H28BuHHAnuMLev2Id7dvm44Bq5PuzfgchROLb7Gci5+m
 vMrzIeSkZT0+NF5Bz4ZZ9DyoiSipow3fnNnsdzhjqcC4HBdIzIBq7/OMY7NHp2BazWyN
 IEgw==
X-Gm-Message-State: AOAM531iGIkt+Zm7Az2JENKzPndZH8OJhWwhAuYvpYcrLYLgY2AcV57A
 Hav3GblGDG+SCgc+epTRNy1BSQ==
X-Google-Smtp-Source: ABdhPJxzaH9J5CMg5MHT2YGXigBWhsYbLIVpW4igifMX1z/lnFHGn9sQCmobgSKen59v6zddfzhquQ==
X-Received: by 2002:a2e:8849:: with SMTP id z9mr50547ljj.478.1614207704266;
 Wed, 24 Feb 2021 15:01:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a1sm757790ljm.73.2021.02.24.15.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 15:01:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Date: Thu, 25 Feb 2021 02:01:43 +0300
Message-Id: <20210224230143.1216118-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dsi_pll_7nm: Solve TODO for multiplier
 frac_bits assignment
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The number of fractional registers bits is known and already set in
the frac_bits variable of the dsi_pll_config struct here in 7nm:
remove the TODO by simply using that variable. This is a copy of
196145eb1af1 ("drm/msm/dsi_pll_10nm: Solve TODO for multiplier frac_bits
assignment").

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index c1f6708367ae..0458eda15114 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -509,6 +509,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct dsi_pll_config *config = &pll_7nm->pll_configuration;
 	void __iomem *base = pll_7nm->mmio;
 	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
 	u64 vco_rate = 0x0;
@@ -529,9 +530,8 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	/*
 	 * TODO:
 	 *	1. Assumes prescaler is disabled
-	 *	2. Multiplier is 2^18. it should be 2^(num_of_frac_bits)
 	 */
-	multiplier = 1 << 18;
+	multiplier = 1 << config->frac_bits;
 	pll_freq = dec * (ref_clk * 2);
 	tmp64 = (ref_clk * 2 * frac);
 	pll_freq += div_u64(tmp64, multiplier);
-- 
2.30.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
