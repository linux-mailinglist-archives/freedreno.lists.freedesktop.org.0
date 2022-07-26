Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FE958188D
	for <lists+freedreno@lfdr.de>; Tue, 26 Jul 2022 19:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A818B95EFC;
	Tue, 26 Jul 2022 17:38:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E6195F0E
 for <freedreno@lists.freedesktop.org>; Tue, 26 Jul 2022 17:38:43 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so1090031pjf.5
 for <freedreno@lists.freedesktop.org>; Tue, 26 Jul 2022 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65z5UblURAWtS2HSo73KtitpLtnM0+IbS2Ko/ylefao=;
 b=JKQA2DZRhmMHgWDjn9IqsGd1TVfsl2/RxaGpJxPdD+c34DkWDAWNsu9qO/xRlhSFNz
 jTRpE4I/X989DPF2x2DVjb248ibAsnZJAf3O+WByNYpcxeOcUzjim7Qd2uty5uDE1x73
 d5LtxHUT2N3mk77hhhR51bamkKwqf1Z9L7fP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65z5UblURAWtS2HSo73KtitpLtnM0+IbS2Ko/ylefao=;
 b=XeddSaIqzHQ5C5Hu+kYzekLaCWojF+bWmPtuD+XK2fO0KlrCJ6bSJcYtsGgKzHrzBQ
 gBIYLLo5wJXOITmaBfBEw6snTnpvJ2oNQBtBYNoy4CfUPzzZbxGHYXfDM5bkpapHl8HW
 xayPA+mVIQjXs9s7Lu9/8c+b5r4g0zLRRDJBLdyFuwmDB6rDHq7hIF2KKtiJbmJF/nJn
 nN6tVEyxY856zy1mqX3FQKdo6FW6CXuAEoJ3Y9m5V00kdyulb2A35ZdcGC+RXxl0UyJL
 4P9GcyBxm/56CPeyl/NDuSgknC25vZjknJwEqWrP5FJJVtuzwOOHnBgIEm+Sex3fOjCt
 rdRg==
X-Gm-Message-State: AJIora/Cex5OIF3T6DP55Z33blbu7xTa7PPdhriziWJkWIyEBItI1pAN
 7BM7Ud5hf+Y/16gAJNE8S/Roeg==
X-Google-Smtp-Source: AGRyM1vaj4AnRg3w38ziBsA+HO1alVRbJxT5BFBbzuR9W1nR9nbx4to4YrRPWTU9jI9OfC/TAk1BDg==
X-Received: by 2002:a17:902:f541:b0:16d:46f1:bd17 with SMTP id
 h1-20020a170902f54100b0016d46f1bd17mr18371237plf.18.1658857122699; 
 Tue, 26 Jul 2022 10:38:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8693:e9aa:75c0:5134])
 by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:38:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mark Brown <broonie@kernel.org>
Date: Tue, 26 Jul 2022 10:38:18 -0700
Message-Id: <20220726103631.v2.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/7] drm/msm/dsi: Fix number of regulators
 for msm8996_dsi_cfg
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
Cc: Sean Paul <sean@poorly.run>, Archit Taneja <architt@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

3 regulators are specified listed but the number 2 is specified. Fix
it.

Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Fix number of regulators for msm8996_dsi_cfg") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 2c23324a2296..02000a7b7a18 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -109,7 +109,7 @@ static const char * const dsi_8996_bus_clk_names[] = {
 static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 3,
 		.regs = {
 			{"vdda", 18160, 1 },	/* 1.25 V */
 			{"vcca", 17000, 32 },	/* 0.925 V */
-- 
2.37.1.359.gd136c6c3e2-goog

