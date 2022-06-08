Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A58E542FCD
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 14:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C141610FB16;
	Wed,  8 Jun 2022 12:07:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CE110FB22
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:39 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c4so844376lfj.12
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJk/SikG5/vA45QkNSVMmjHsA7wDjKxXh9SBvVTqBUw=;
 b=sV7t8YmUJotbqhmny0KXLae01QlXJrO1YBHx77u9k3QFfh+3zqvPItyBJyaS1FSv7n
 zofVscq7IFaRIt37QtUg3Xah/S/2x5BMa7bt5TIsFxMVg3v9WsuE2gmGUQrKz7jfteZb
 LxpkyVpOdjs1wgqiib7kPuH29KShJYz1qzWB7qr2fDY4oCeeLt8Y7J1TC32OqBr5sik4
 LvHn0NljE/1m1OCvzbP68KOKpqvV5Tgoy35yGPZUblvdRh8i6Jifb6O0do8lrkwasnEZ
 /J8MC/UF9y286BcUe0J/rS4twQRemKlVO/7pONjdufzYWOzlIMMGgkSppW52k6Crup6/
 hAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJk/SikG5/vA45QkNSVMmjHsA7wDjKxXh9SBvVTqBUw=;
 b=sI+v5bWmGnMm+9QUlkGeaYxEBGcBs+dRlYT9lrpqd0hsNpRGpU8t+jtsXvXEbHBo8B
 gCDgQdMricZw7OwVFhBtUdr6bPLKDcZw0i0zqe1mIFaMwTxcm73dt1dHUxuIt2VL8ymc
 zNOI301xgJKxYYGskmte5cp4l+LWKeGbkvEOIcqzyt2eb/JqVsCoEv2uY6aehA3w83l1
 UvbHu5azIEHRdswUxDSpTEhUot5UTFHqz7P9PFnT5X5ptfRQIC+3s9sS3bPsxOFDJhg2
 jahlmagNe+vbWMPe63+adFneimOSqczHGF09Gw6wDrZ+oOcHhMgOZqTgFKhPgHYt4V+T
 6+dQ==
X-Gm-Message-State: AOAM531orHv8Kp6wx3z2IO7UbgT8PNKHZGZIeOLdnryAhz3ZV8znnfdd
 +nan3egpbEcNoS2C5wUy4zdK6g==
X-Google-Smtp-Source: ABdhPJwLAAPw1s0RFNSdQ2kbvtrB/PHpfA5nUjCe4dgJOTxGw02vXyxc47pFvRGLPzW0518hV1Di7g==
X-Received: by 2002:a05:6512:15a9:b0:479:56e2:6f1b with SMTP id
 bp41-20020a05651215a900b0047956e26f1bmr7015597lfb.219.1654690057808; 
 Wed, 08 Jun 2022 05:07:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  8 Jun 2022 15:07:23 +0300
Message-Id: <20220608120723.2987843-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 12/12] drm/msm/hdmi-phy: populate 8x60 HDMI
 PHY requirements
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Declare that 8x60 HDMI PHY uses the core-vdda regulator and slave_iface
clock (this is the same config as is used by the 8960).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
index 95f2928cb2cb..1d97640d8c24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
@@ -122,8 +122,20 @@ static void hdmi_phy_8x60_powerdown(struct hdmi_phy *phy)
 		       HDMI_8x60_PHY_REG2_PD_DESER);
 }
 
+static const char * const hdmi_phy_8x60_reg_names[] = {
+	"core-vdda",
+};
+
+static const char * const hdmi_phy_8x60_clk_names[] = {
+	"slave_iface",
+};
+
 const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg = {
 	.type = MSM_HDMI_PHY_8x60,
 	.powerup = hdmi_phy_8x60_powerup,
 	.powerdown = hdmi_phy_8x60_powerdown,
+	.reg_names = hdmi_phy_8x60_reg_names,
+	.num_regs = ARRAY_SIZE(hdmi_phy_8x60_reg_names),
+	.clk_names = hdmi_phy_8x60_clk_names,
+	.num_clks = ARRAY_SIZE(hdmi_phy_8x60_clk_names),
 };
-- 
2.35.1

