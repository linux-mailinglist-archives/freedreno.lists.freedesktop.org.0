Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 237773BAFC0
	for <lists+freedreno@lfdr.de>; Mon,  5 Jul 2021 01:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C353B89B0C;
	Sun,  4 Jul 2021 23:05:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7C389A8B
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jul 2021 23:05:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f13so2318600lfh.6
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jul 2021 16:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kGQc2sDPy1RlhcacoqvnsQtk1TCEx3OXB0l57sVHH4Q=;
 b=GLX1EdopSbQ4ot9cf5NvEcT0RVW1jhZK/SCwFSbQhgSqGkYh0a0SrMmHK9a+mZGqlG
 y/o4b6E35sLe+kkRc06k+61cfUqRe4iDqCMXefLhIZVJPT8rpMSygRK+0xwmoqgENoAn
 MJAFYqWw6/O+w9QbMY6D5WOvxqAftl0qS1LK3Zruk+osNqqIhGjeTBoCqPRqZKtWhkh8
 Q08Lda+Ld+vcl9sLS2iJwBrsgBn75YYz5CPb8MrMzmPc80uEHFGUeeUFmgNKIg7dJ/Ft
 I5Qg8mRK3DnsQsKBMKhm0hgQouds3DgaCWpZwk4jGNAQ4vAOBSJ5Kwc15LiKMR9mPrUw
 dFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kGQc2sDPy1RlhcacoqvnsQtk1TCEx3OXB0l57sVHH4Q=;
 b=GmtRXmb4RRTXrMOy5aQYXTUrikLMPaqHR3/thx6PIHmO1e8qkxXUdXlE/fZdLk3Nq+
 FATlQsG7z/aNl/oErjIIvFywCvxHi3F3O+dJEONtjsNyQ059dgwpPnZMpw8EUYzOSBBu
 dMhQlpJM3iWuMWfcvkbGE2J4OkiexqJA9Ud1hONAskBdDtfYpu5OLGIWSMMZ1rtZP60n
 ldJB53K/6a/K/9YOKH8j+JsC3LvU/CzSRDP+SJsaHJan5cdXLeBtxSNVfO6jcKPPJJQ1
 o6f+lRIcbJmDOIymGI0zsJAZxxvQaJtObS6QlhO15w3O6KcyP9d8fFSasPCHbGwR7Eql
 RTEA==
X-Gm-Message-State: AOAM530w0+cUMvN6/bCMv6HjUweuplYE2Y5x+I27hW/EdUzV95ulT0Zh
 p3+QKkQHa08UECKtAg8Z6WkpQw==
X-Google-Smtp-Source: ABdhPJybpDYuNzRv2N9KUxmLO5VGHYaAHkmmewK62Od5eXqWP8hwGiE4/L8Ti4rlLpgKiiPeM3B9yw==
X-Received: by 2002:a19:408e:: with SMTP id n136mr7834867lfa.412.1625439921033; 
 Sun, 04 Jul 2021 16:05:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s19sm1181859ljj.86.2021.07.04.16.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 16:05:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Mon,  5 Jul 2021 02:05:19 +0300
Message-Id: <20210704230519.4081467-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dpu: make
 dpu_hw_ctl_clear_all_blendstages clear necessary LMs
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

dpu_hw_ctl_clear_all_blendstages() clears settings for the few first LMs
instead of mixers actually used for the CTL. Change it to clear
necessary data, using provided mixer ids.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index f8a74f6cdc4c..64740ddb983e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -345,10 +345,12 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
 	int i;
 
 	for (i = 0; i < ctx->mixer_count; i++) {
-		DPU_REG_WRITE(c, CTL_LAYER(LM_0 + i), 0);
-		DPU_REG_WRITE(c, CTL_LAYER_EXT(LM_0 + i), 0);
-		DPU_REG_WRITE(c, CTL_LAYER_EXT2(LM_0 + i), 0);
-		DPU_REG_WRITE(c, CTL_LAYER_EXT3(LM_0 + i), 0);
+		enum dpu_lm mixer_id = ctx->mixer_hw_caps[i].id;
+
+		DPU_REG_WRITE(c, CTL_LAYER(mixer_id), 0);
+		DPU_REG_WRITE(c, CTL_LAYER_EXT(mixer_id), 0);
+		DPU_REG_WRITE(c, CTL_LAYER_EXT2(mixer_id), 0);
+		DPU_REG_WRITE(c, CTL_LAYER_EXT3(mixer_id), 0);
 	}
 
 	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
