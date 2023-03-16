Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 893BE6BD51B
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 17:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F1110ED76;
	Thu, 16 Mar 2023 16:17:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E3310ED47
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:23 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id x36so2258645ljq.7
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
 b=jNU/xGV9uFB/izDACusfDEwcNAs//JOmcKkU+1XUa/tJ9JSfBqcNSM54kembMZQt9J
 O0lxUthyLlkmc6ph4a6/k1ixxasfKAWhdFMQcPnxxCmkPowETYZJ7Y8lVOrQ8CzSYU/y
 nLNPS9e1E62uVKFhN3D7YySqdfG3gwSBLezJiTE7FB5Xc6qdJJ1agpg7eRLTvYdrYV91
 e9tydZynNfYdmZIlAINmfrPMQJAtFBzpKRoHjhfV9lVwFAH0lh3QcYLC03NRvJRTUgI1
 5zvJ1BgSbtNo1+ZDG+3X53+8REedDSlGxEZl/kmmxBooD9pUxleAkbaAAp4UoAyWP/iV
 4WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
 b=6L6EMCeZmSPf2DwHAR1wz1RSEukbOwdyYzghEGg2tL3+iBj/wyEkQiIih4IlgyrBUJ
 c1DY3GX2gn8iYXY1q7A+cLRA73ipWQhAdhVOyTg7rIdfsKsTZjYw1ZaN8X2aeEwJhDXl
 YP3TslgtGnu7mA5dm1Qi/sse5zRw66BaDZdBQYGr8cnTVw3xTog13CssgJSrRfsxZxT4
 g1V7El0Hh7tTf9KN40svLKI9E1B2kOf/PXBGBRDnjrriC5SVSRDNEULmUXsZc2PDvQGR
 I3KsgP/E/AL5RLMwNwAJXnMso/CZ9JPiWMjFam7F33tVkBNNdbUCu0tH0BsJRpDoRlTA
 ZQwQ==
X-Gm-Message-State: AO0yUKXYEBvkhWlOdX3EvebBQXYEto/qrwlAEz6jSQhaoDnmuOhSB00K
 aGn58kO5z1Pr5XbbdQV6RJbjlA==
X-Google-Smtp-Source: AK7set+Z9ralPl6qxNa5CnY/JfCfIOiHvv3XY/6IXx5joRaQH3Lp0PfDadsn8VO3PrpLeZSJI6PUwQ==
X-Received: by 2002:a05:651c:b10:b0:298:9c6c:eca7 with SMTP id
 b16-20020a05651c0b1000b002989c6ceca7mr3059751ljr.8.1678983443015; 
 Thu, 16 Mar 2023 09:17:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Mar 2023 19:16:52 +0300
Message-Id: <20230316161653.4106395-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v7 31/32] drm/msm/dpu: log the multirect_index
 in _dpu_crtc_blend_setup_pipe
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Lets print the multirect_index as well in _dpu_crtc_blend_setup_pipe()
as it will give the complete information of the sw_pipe as well.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 90b406e409d3..508e5b950e52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -426,12 +426,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				   format->base.pixel_format,
 				   modifier);
 
-	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
 			 crtc->base.id,
 			 stage,
 			 plane->base.id,
 			 sspp_idx - SSPP_NONE,
-			 state->fb ? state->fb->base.id : -1);
+			 state->fb ? state->fb->base.id : -1,
+			 pipe->multirect_index);
 
 	stage_cfg->stage[stage][stage_idx] = sspp_idx;
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
-- 
2.30.2

