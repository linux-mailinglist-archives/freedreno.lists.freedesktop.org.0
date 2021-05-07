Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592793766F4
	for <lists+freedreno@lfdr.de>; Fri,  7 May 2021 16:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C946E1FB;
	Fri,  7 May 2021 14:16:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2186E1FB
 for <freedreno@lists.freedesktop.org>; Fri,  7 May 2021 14:16:58 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id j3so4865650qvs.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 May 2021 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CrsCAQJk5ZnVE8tHLcfB4TXYodmjeHRejfnH2DA3Xwo=;
 b=gNmi0I+4CIYhNbZW0mjW8xkLfbDle3nmeSHl3j6E8TPjhsuWwRmnSwbeE6MHpKhUI7
 mc2Wo5bRyjZUO09n3MPdnG8XOfARJg842Eez33T8q57wX4PY/bDUrzlhrKP73P8CuJKJ
 ugEs4LCsqjhO3wOEkdr7TYYl0RsHgIgNJSl8vvNQ15o5BCyHaGf0Q+aqq/NlIjL/nt2O
 5zIx1jTVT7Mqd8GXWZ716NkdOOExYzd1lTr/SAUQmHG4WJ1f5cGH0oPcckrBxup9olDF
 R9DgA9WquRKw/btJaBOmn9iMnIhzDQa1ZQN7xv38apNm5nPHQZ3zQ+V+AhBSIIlsBJS/
 hhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CrsCAQJk5ZnVE8tHLcfB4TXYodmjeHRejfnH2DA3Xwo=;
 b=T9WgSQsC98YW+S50opqNwTQ+0pcVtAaxU5FdBgUqnBfkGskaU4e3SMNRyF8MUvWmxx
 /r1uQfVXjECnRpECwKq7LP2YRKus25D/BxKvHSrS8TFJKnCAkeYYOm77Qf9s2D4xidfm
 Js6Uw8+6i++cFoU+0vRKaKUW1tPV2XBoX6jcJbt+tiViRG6Vdc0NiZykkuHvD0Ncwinl
 qrfYYLg5xHNYaUWXoD52va5arBPrcS4D5LvFDuVycOJOtaly2+ht4C3Y8Z8W+KcQ08Qx
 QK4/7ChqD6iCOeuBQBq+uk9o0reEI2z6186G/Onu3eJA2JmNR5Zc+HZlBBWW/akNZGHE
 TpBQ==
X-Gm-Message-State: AOAM532CVsJhi7cu9NFWTLFfxpJch80ui7hpZJD7AoTpE+T9NUxFP0A4
 a3I3oIf7U2f6YaZc6bnpkDP7BA==
X-Google-Smtp-Source: ABdhPJxp56tr64aqcM62OQw+TwL3qUEpuXjmL1PUPxM/z2GmPIuBhQjZC4jfARWKPzrg8mF7L12rlg==
X-Received: by 2002:a0c:dd01:: with SMTP id u1mr10179642qvk.32.1620397017195; 
 Fri, 07 May 2021 07:16:57 -0700 (PDT)
Received: from localhost ([172.58.157.149])
 by smtp.gmail.com with ESMTPSA id r8sm4642098qtc.24.2021.05.07.07.16.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 May 2021 07:16:56 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Date: Fri,  7 May 2021 10:16:43 -0400
Message-Id: <20210507141651.2887-1-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: Fix uninitialized var usage in
 dsi_phy_28nm_8960.c
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch fixes the following error:

drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: error: variable 'parent_name' is uninitialized when used here
[-Werror,-Wuninitialized]
        snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
                 ^~~~~~~~~~~
drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30:
note: initialize the variable 'parent_name' to silence this warning
        char *clk_name, *parent_name, *vco_name;
                                    ^
                                     = NULL
1 error generated.
make[5]: ***
[scripts/Makefile.build:279: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o] Error 1

It looks like the allocation was inadvertently deleted.

Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 582b1428f971..86e40a0d41a3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (!vco_name)
 		return -ENOMEM;
 
+	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
+	if (!parent_name)
+		return -ENOMEM;
+
 	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
 	if (!clk_name)
 		return -ENOMEM;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
