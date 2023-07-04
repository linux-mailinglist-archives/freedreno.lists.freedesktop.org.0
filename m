Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9942747602
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 18:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8A210E2F0;
	Tue,  4 Jul 2023 16:02:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD0910E2E8
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 16:02:31 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-766fd5f9536so425214885a.3
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 09:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20221208.gappssmtp.com; s=20221208; t=1688486550; x=1691078550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vGounWSX2Ta3v2i79JYImPXzwvWuhBfpeJNjehKi004=;
 b=rc0Z7y7TRSX2d+1KPwiGFAhYt8WzwvmJqI3TYwOtVT7uvUJyHaeN5LaGt1mKP6LKnC
 uKq/8vW9itima9B31SpAz2mexuJEkJdzIMVLK3cmvR/s+Y7cz9KbMRjSAgMJ+7VFtPVG
 dIJu6aXSkK+O7myNN/V/OfAmFqOzWcohTDSY287Ugp/Fag9pxnuwih1IXXP6cNdp9XKK
 lmXRumrxbC3Uemv/foXY+rq8vEePWATO3BKLYjB3LRWaqrVZhwfReNd4+XXK5P6fmFHk
 ikG+Oh3DBXvPMPhfFoQHTQiPEtlhp2z93JMi/J6KDiEtY7ZJC7WpFdzK/n0WaokgzzGA
 kRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688486550; x=1691078550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vGounWSX2Ta3v2i79JYImPXzwvWuhBfpeJNjehKi004=;
 b=Y1GeHobeIG7glIcRqPs3QyVphjFan3RjhmbyCz/1RviIDhxS1rQNofZLSEt8thct5f
 VrX1FJXEKS8ifPMDUmHd8ujFR1DxLd+bH/JPx5R2pcrCxg7UiID7wrfNCHzOOQPD41QP
 LUgEM6psIctNz5FGIRyBFONq12l2Yo0HixWHY0Rx3x4nzhF3jO40S/2NjHydkaZd1Zdw
 Er9/1xx8/HY6Fz3FZPg+mRK7gSOoYoaITP65mfc/R+T6W2uGcLYO4hlvqHzbNuhNppQh
 i8PqipLA7USbL5M9k1z0ezPHrT2DWuIwMRKH1BmdfF1msrbIAoQTA5iTB7PjyeFkwkWd
 dYyw==
X-Gm-Message-State: ABy/qLZ/gVpdiUAm0FQ9Uem7iKs7VKt9R1dsxLVZn6MeN4OJjxRL6mTN
 mkTMB5BXSjHQxBoFGQxLZPaj2Y+AgVgpBlOYVoM=
X-Google-Smtp-Source: APBJJlE+NmKZaXt8xrhE1cfKOONdr0uQa7f/tA9YGQWR7rwjnOqQDPa3QaGrSLMkEeuqZM5bZwMHBg==
X-Received: by 2002:a05:620a:4096:b0:765:575b:415 with SMTP id
 f22-20020a05620a409600b00765575b0415mr17754462qko.24.1688486549669; 
 Tue, 04 Jul 2023 09:02:29 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 l15-20020ad4444f000000b0062439f05b87sm12659236qvt.45.2023.07.04.09.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 09:02:29 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue,  4 Jul 2023 12:01:04 -0400
Message-Id: <20230704160106.26055-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: add missing flush and fetch bits
 for DMA4/DMA5 planes
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Note that with this, DMA4/DMA5 are still non-functional, but at least
display *something* in modetest instead of nothing or underflow.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index bbdc95ce374a..52222af5975f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -51,7 +51,7 @@
 
 static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
-	1, 2, 3, CTL_INVALID_BIT, CTL_INVALID_BIT};
+	1, 2, 3, 4, 5};
 
 static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
 		const struct dpu_mdss_cfg *m,
@@ -206,6 +206,12 @@ static void dpu_hw_ctl_update_pending_flush_sspp(struct dpu_hw_ctl *ctx,
 	case SSPP_DMA3:
 		ctx->pending_flush_mask |= BIT(25);
 		break;
+	case SSPP_DMA4:
+		ctx->pending_flush_mask |= BIT(13);
+		break;
+	case SSPP_DMA5:
+		ctx->pending_flush_mask |= BIT(14);
+		break;
 	case SSPP_CURSOR0:
 		ctx->pending_flush_mask |= BIT(22);
 		break;
-- 
2.26.1

