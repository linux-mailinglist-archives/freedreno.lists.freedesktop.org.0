Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA464B6E95
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 15:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393EA10E5FC;
	Tue, 15 Feb 2022 14:16:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CFD10E51F
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 14:16:50 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id n24so24217128ljj.10
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SfdH2ncwmJDrVRdbfNY5r2Qh/hOw/XHnUYkKFPYNhyM=;
 b=psXOCZob0jpOWF7asuePKZv4UaAI+c7tjgwZ2VMSWYNIHWrplAjMRglhd1F/GuHwdO
 fvzJteV13aqlfjbm+xe2i4eVNLwUd8aFaQIhG2GYA9eTz9BkfbbO22Fx5dbkvggU1aLi
 4xuBsSnwM8IUTtgnf/F75xhfr7hMYJwdfmhSKdhDAmlQe4UYEzWBv59SwtqdenbMHwRB
 DW9Y+80j2IMssDKy9S8KKt5h4DI7Fs0fYGiaP2ws4ZrkjTs6RiJxvxArBXRzITNEZtMc
 SB2ClYIQm0Q4h/LBPhdBr6mKIXGhe/9qEYYZayPYQWhya/hRYlecFQ7rEq5EGSXh2h8a
 rUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SfdH2ncwmJDrVRdbfNY5r2Qh/hOw/XHnUYkKFPYNhyM=;
 b=gEVDaTuF6K0RxO456/oBeybXJB6OcfzWufdod0QvMPFtmqs8iih30hMAGpBzjUuJ4D
 MzAqcLCsD/EjF5ISROsSYFn7xOLoV7XIvc/HJyGbBu6pLqSR7lx0KvQ80Ov24UhoEt2s
 ki3VG83KqRq/XgPcnzehniyIIBgNbLQxqN5Ufpx7N8xccLxapOs+2sF52GCybHerD805
 kXyzNIGN5/0iUNnMtlSRCwzfIFsNf16GRpgXd/XsXm7OPszlTws9E8TJq9FuNjwhSA8z
 K6GpDxakR7IaGs836tqBxKgdNVB0MvaBFouHIh+qeRQwASVMvnRKmWGHkT0DF2ARwgFY
 /uOA==
X-Gm-Message-State: AOAM530UwyhBJXkjPjCDP+bJRWLhmFc4Ku63ajZIGTXNNUHq6RaD0Ukt
 LXVM0yHhiHqBaf7cALGpk0Zcng==
X-Google-Smtp-Source: ABdhPJy9WjiZJ0f8TLzmTQvnTK3IO2HiB0hdXIcE9BeCBWQlv9dOPnFkWrj64VHMPo/iLYAssw8nFA==
X-Received: by 2002:a2e:88d4:: with SMTP id a20mr2735763ljk.187.1644934607054; 
 Tue, 15 Feb 2022 06:16:47 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 06:16:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 15 Feb 2022 17:16:38 +0300
Message-Id: <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/8] drm/msm/dpu: remove msm_dp cached in
 dpu_encoder_virt
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Stop caching msm_dp instance in dpu_encoder_virt since it's not used
now.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c59976deb1cb..401e37f50d54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -168,7 +168,6 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
- * @dp:				msm_dp pointer, for DP encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -207,8 +206,6 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
-
-	struct msm_dp *dp;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -2123,8 +2120,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
-		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
-- 
2.34.1

