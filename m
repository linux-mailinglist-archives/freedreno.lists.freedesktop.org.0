Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9F6B3352
	for <lists+freedreno@lfdr.de>; Fri, 10 Mar 2023 01:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B525210E947;
	Fri, 10 Mar 2023 00:57:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1004B10E931
 for <freedreno@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id s20so4597559lfb.11
 for <freedreno@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DtctQiWrw8CF1uE+qEucLKjdvnucdXX1kHffuJTXWDs=;
 b=ivbbPNo+0F41iY5fOEQhvhupl9Zhw9V/A7fEtKvS1Gn/ZZPKzYhfsYZPDZBv3j9n27
 wn/DUinRiAGnh393jsm3Y0K5XQYVLo3ol8f7rwm64mUsjhdSACn41ovi9QY3RzOUxdqO
 G7YTtJBX1MARIkAK06yLQuB89Soa5M7KceP2X+gpAT8v4YXByomtv4f8Kcz3WFhC0hvl
 7ZzXXnDWWZH1G+P36z9luFXlHIjydgvzNuVwwzPF3/X+C3Mmqswxh2IecT5qjPGkn9K2
 UygLsjuMofP5kNSiPbM9k9coV335DnWphbabSbULu/eOC0tvi+CndmyPJFeJGmCALlVy
 Y6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409853;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtctQiWrw8CF1uE+qEucLKjdvnucdXX1kHffuJTXWDs=;
 b=OvO5VG0Ms6Tw7wPtr46z9Z2bf0/RIbtSze+p17rGWDl0qmDDyphtc7JibCU65N0ZpX
 sHatv7CP500tj4yBghBAsasYtjT8nokr8CZml6KnuIeytm5f0DmlYvpQ7YtVZqEzbi4k
 wlPwGyjVvwtTaQ2H+X5w61Loh8EQlRtZrJD3f3VGp+hDHIyhLxkNqKLH0zcPpJAYIvpb
 V3fGGG3EwtgMi11PqFF2mNZHBpvhGGi7PFM5TDLc6FfC7teYOIVKXQsrmUJjIaQpwidZ
 30/0ZiIUiwXQtEYGIDYESLqACunqs4Wq0DDxop5KKb4k5s34yIJbK0iMDfIrtNtPEpNN
 DEsw==
X-Gm-Message-State: AO0yUKWxjOgx8yEgjC1T/wV7QngSbdfi7CWfetPf9y/5XHA6nXXIoiYi
 RehBvT4yquCvk5kSrMYt85YJfA==
X-Google-Smtp-Source: AK7set9ms7ls8e1csmugiFJ2afVXO0bUtPWycKEbfjyxli7nqXJ5JEGGfReHnEwDVuityeIrrmzMRw==
X-Received: by 2002:ac2:46c9:0:b0:4cc:9736:3551 with SMTP id
 p9-20020ac246c9000000b004cc97363551mr7590619lfo.31.1678409853615; 
 Thu, 09 Mar 2023 16:57:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 10 Mar 2023 02:57:03 +0200
Message-Id: <20230310005704.1332368-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 31/32] drm/msm/dpu: log the multirect_index
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b748c4f17c90..96ffea069120 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -425,12 +425,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
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
2.39.2

