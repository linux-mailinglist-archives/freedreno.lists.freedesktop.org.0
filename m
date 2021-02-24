Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21264324756
	for <lists+freedreno@lfdr.de>; Thu, 25 Feb 2021 00:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAF56EC05;
	Wed, 24 Feb 2021 23:05:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D8E6EC04
 for <freedreno@lists.freedesktop.org>; Wed, 24 Feb 2021 23:05:31 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id d24so5634915lfs.8
 for <freedreno@lists.freedesktop.org>; Wed, 24 Feb 2021 15:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RlKikzIt/rONQFY4pZWTu3Ycq1cfYGrrRaic2XmO02k=;
 b=MzOp94cSmfjpzUawBnjMSye+NAvtXmGFYcpJw12vAjojlYfUUv0Wv2wWyXZBP9Yjg0
 7cJ1Pj76XmGaR9u5QOaIk4Dqh9IhMnY0PJEt356JmFijQQrVlYXs1/hNfZdVSxI7KHLZ
 ZILg+3nxMnwA+TmLtEvlcoQQOmfGSb0BAcpzszhRRp4TnNsrpJYbtOMirN4A7StPWcyV
 Nd1hpgpA7KOjz25aRlKhTowffmA1PnWOyGLsJBCGri9khSEYrO6dclcx5i/xv+Y/1z9S
 upXNXFQSy4bOrUZ12V6ebgkH0ToFg5OkyA5jIHWkImj9KKH8e7Mj+8OCiTKQbb7nmFF7
 nQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RlKikzIt/rONQFY4pZWTu3Ycq1cfYGrrRaic2XmO02k=;
 b=X2t6R9+8FuXEJ6Ky4NfS1YBRdKICoPqduflX6CLl/JrKyWZdGVu8bD2mUW77yP5f62
 OvyV9p7xeViwg4++Kjl8paDJiZ7FDntNf7DVsmKYoIskNann7BSKwqJ177hVTNVQsCqT
 caqV+RgWG3oPyKO7GNh8Gt7TTuCpmYoIz81rg704OBVYoHHFTv9e1GDn8G5piCERM8vT
 62gaKihq3IbTp55/5V6wjJQJ9fRa1/n+i7P3sX5lPteyfRu1AsePK85mbrY1rsN0XaQK
 BqbKEtLRHTjsSE4zUg7wuU0Xd03cyFrAA8UlqmI03r1UgBbxHECqu3AJYKU9GQkA0vI/
 +J7g==
X-Gm-Message-State: AOAM530ulq/gjPHivQsqMfTmySaoeCFKZj+TN91sSYjJ0wZ6XFIkCzDZ
 sI3z0d4FjgjlPOzXxeEBBK1pDQ==
X-Google-Smtp-Source: ABdhPJwUERX5nQ+xjx77ee9XxWTPYrpU0fvjarXhqh4xrXuFrfdFUwpDWEC4dmNfM9rI7Tn8uVFbBQ==
X-Received: by 2002:a19:ca01:: with SMTP id a1mr186246lfg.372.1614207930020;
 Wed, 24 Feb 2021 15:05:30 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b28sm776114lfo.190.2021.02.24.15.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 15:05:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Date: Thu, 25 Feb 2021 02:05:28 +0300
Message-Id: <20210224230528.1216677-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dsi_pll_7nm: Fix variable usage for
 pll_lockdet_rate
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

The PLL_LOCKDET_RATE_1 was being programmed with a hardcoded value
directly, but the same value was also being specified in the
dsi_pll_regs struct pll_lockdet_rate variable: let's use it!

Based on 362cadf34b9f ("drm/msm/dsi_pll_10nm: Fix variable usage for
pll_lockdet_rate")

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index 0458eda15114..e29b3bfd63d1 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -325,7 +325,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll)
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1, reg->frac_div_start_low);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1, reg->frac_div_start_mid);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, reg->pll_lockdet_rate);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
 	pll_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
-- 
2.30.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
