Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B0518F29
	for <lists+freedreno@lfdr.de>; Tue,  3 May 2022 22:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2C210E824;
	Tue,  3 May 2022 20:43:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C19E10F4A2
 for <freedreno@lists.freedesktop.org>; Tue,  3 May 2022 20:43:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id j4so32255469lfh.8
 for <freedreno@lists.freedesktop.org>; Tue, 03 May 2022 13:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BZXNy598rjzssFVD4qqnZnAbN1Mi7pj3r4jBP97stCk=;
 b=aFed9C8zIczapSE4riexLt2XAw8h3LYQtY5IQY+ksLkEQDCcFzc3V2U5C6ZMNPZ7n7
 68cmZlUPlcNdgurL+47g3j2gXWj4TOkuqvnfAD7dCX0oaFic5IVB8WTPSo1TJuXuS9Bn
 esBKOdtY7tZdfwmU8BbKO4h4toxuHjZcJh//BAJskyrJWgwIUTcmtNB+Nki2SAt1A0f5
 je/otKYLIQsudjFd94fhdlWhb7X9bf4Xk8Yb2Z319l+5BmthjB4mwdtyMa2U54SY/E8y
 gQJapgBBtiSqPqupZVt0Ly9ligt/FhpgKarnSDDrtt37sqkElSdhHayhWX0I+qS6ni0l
 Tdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BZXNy598rjzssFVD4qqnZnAbN1Mi7pj3r4jBP97stCk=;
 b=V/n70uxfu6FoWBqvxI9Lfa8ndPPxiY/kEQQAKjKNixPtN8GlPcM1iP3nAi8ya5fhw6
 QnvqqoHcLk0KhSsaKto+le4nmaoYC4mtq+bzmgFH7ISkGJ4k0dtYH1kQb2+SgVZCiN5h
 vsrXFZGywQXN11cBaxc5lhw7gddbNwifSMh8Sqni6Ozjv3NNSGC1CLR7FE5d7+NsJ02S
 cR3GsBVvSdL/7qkg8GAHaHYkS/P2yxkyqdBxNBfmktGC4nJpVR9STCgG+qIcowIm+RGk
 +bj5/GF6ljimxT+dotk5ztxUYST9BD05sPSC3XNfhuZrMMOOX1B0+PMQr2AOsJ6WDFPx
 VU4Q==
X-Gm-Message-State: AOAM532r32L47YYoB7RtL9Loi/ptrp9Z6OfFlETyLT7v/eBdMl5cGC/8
 16HjB662JyIr9NhSeKjoows2cw==
X-Google-Smtp-Source: ABdhPJz6J5roxRVpi41gL6zeVD4OzrjgvjOG0MNPEhPP+HQNkQ/eKSYLNbmKQDvh4Lzaa/I+Gt7ptQ==
X-Received: by 2002:a05:6512:a85:b0:473:bb9e:fc51 with SMTP id
 m5-20020a0565120a8500b00473bb9efc51mr278231lfu.31.1651610621680; 
 Tue, 03 May 2022 13:43:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 5-20020a2eb945000000b0024f3d1dae81sm1462085ljs.9.2022.05.03.13.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 13:43:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  3 May 2022 23:43:40 +0300
Message-Id: <20220503204340.935532-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dsi: fix address for second DSI PHY on
 SDM660
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Correct a typo in the address of the second DSI PHY in the SDM660 device
config.

Fixes: 694dd304cc29 ("drm/msm/dsi: Add phy configuration for SDM630/636/660")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 75557ac99adf..8199c53567f4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1062,7 +1062,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
-	.io_start = { 0xc994400, 0xc996000 },
+	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
 };
 
-- 
2.35.1

