Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC509FA3E5
	for <lists+freedreno@lfdr.de>; Sun, 22 Dec 2024 06:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993E510E2FD;
	Sun, 22 Dec 2024 05:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EYgk1xb8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B9A10E3A5
 for <freedreno@lists.freedesktop.org>; Sun, 22 Dec 2024 05:00:59 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53e399e3310so3626535e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 21 Dec 2024 21:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734843658; x=1735448458; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1PPE+DKsFPu1B8MZdgtx/UyAZ7+JrfrkZtB47k/Sbl8=;
 b=EYgk1xb8iJibr0HLOF4Au2z5+Fxo3264G1s5EKpZgut5YFv5MQ6Sy3/L6dOdaqOjex
 d5gs+Q8jgnF7LfvtN2Ijp1hq8Srv5T6qI8t05iVr6QsfuhxGMsKo4hwtx+unGvT5UVFn
 5OjarSOzcUhMu3znTyBboJ0GMmpr5oMsr3DRVsEHQ9wYcWjUDp+qUBJ9JeS1hUZMejIA
 tM9JZo1pIXmbSu3RlRiBbjllRz4ZKac4isd71EZWEgbOAcYELHEvR+l0TGtY2skakqbL
 +YD1hPFeOQ7kHraBfxfQlpa7gICcnoP/9xZWVocKc2jVZaa3AL5pLYTXi8VdRLa5pcVU
 upDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734843658; x=1735448458;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1PPE+DKsFPu1B8MZdgtx/UyAZ7+JrfrkZtB47k/Sbl8=;
 b=lnl5byJTLxOFanWzo2+/Aj3e+bUGvkvtLl8MMc0uwvjJRnF2bvQnCgUUd/4w03qSMj
 DbYD0EhKBvbTNfmlwn81nv3PWJhfM4JVEXEy+t9ExyH+BaFyyNGYsxQ0Z/3EH09LRYSX
 U6Mex9JC8FkdpQOm1JikCUdtiKT5BsHjZF72adIvb3XyN/lZR9poE86hw1tG7LdMe8hq
 1x1DXwfYmLQx792l+ON32OEKVHDcwSNlMR3NBimUulbmUIN4EBsdf2lhYukNzoGaq7UX
 n5reK/3SxbGyCie6Z5/2kywT1BZnzTXJE1xNdm7f8GnG1pUFEzemolaFPrpphnRxQcQK
 5AWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXnKAT7eHLNzcMDJNab1rtm/eAuuE6nLoApyo/9Ywko4kQgHHjR/BkE1aTF7MkWQx0oeYgpCU7vmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo9868hWLImkKiDmOt2shUj1l95RdksmfQEAAFtaab0THGOnQ2
 RxOiQM66Vih9vICWh1YCSIHqJGJ6qgGy9zJRH1Fz8br98e5AfWh4PjKLrSUboNY=
X-Gm-Gg: ASbGncvV99D8bWBw3YT65t2d4WfRUKJYWfNEy6KNURGWLZxk0g/wqgesR/+8HNTkWOl
 OBxZHu08yrPl72nBE9NML1Yfo5VzWX0WA7d8PUEXgbO04aOO98pd4AQPEc6AopGExlCDDEE7xXY
 Ik/gG+p4VAtaS3YDj/QeQlWhh6kN4jgKkjyifZZqQISqic6gmgIaNAAEIQhm2wa4Lgck2WKjHKR
 2HC3h141MW1hVOkU+jy+OL3wZT4Eg+opyL8jV36hy8P2y8FK0w8Bsbj++qjh00q
X-Google-Smtp-Source: AGHT+IH+eDvaVhNnPNnX4zWTkXTtQclana7wLSRQrkIgq8aEDb+XrV3w0l4HgTPorE4qdZ+Lvklo7Q==
X-Received: by 2002:a05:6512:1594:b0:540:25a6:c390 with SMTP id
 2adb3069b0e04-542295302ebmr2158713e87.23.1734843657997; 
 Sat, 21 Dec 2024 21:00:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2024 21:00:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:45 +0200
Subject: [PATCH 5/6] drm/msm/dpu: simplify dpu_encoder_get_topology() interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-5-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SDNJAbezzZSsnq7fpawYXa2xRvPpUEjnL/Cth4qzNd8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z71T2yv4R9UPEPMcmIkEaIwmjnLl7Y7eQrO
 nscMp6Tu6SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1duyB/4rfKOpjGWq0scuzKBQewFm9Dx24jvzo3P+DhpeytyRxLzingB/T0inzmmrQOQpwKiWfio
 D0jnRNBHfATPbKdu4OiS6Ki+k+1wH8XzuaK9H1/7DYTAWvssLTPZf+ICqjiMg1/fMVvGUEPforl
 6todMfQE7PWAwSCBq+AvLLppjwzKnr4LPlvWprhU0JjkJameNpPMoYw75JklyVFZF52HgKktBdE
 4YvP3+1DV8EVV2PLOTBqbI5FiINVobD2NbQUdj2uOWPN0/K5NOgiPeFbIb24a52wyKwcbO7XIg1
 IkHrr/ZnBzUs4KQ3Rza6ZJjqFgfe+2R46XD4LIAeqHeJh8G0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As a preparation for calling dpu_encoder_get_topology() from different
code paths, simplify its calling interface, obtaining some data pointers
internally instead passing them via arguments.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 88690191a9c9485e052d37749d1b61f50328916e..209e6fb605b2d8724935b62001032e7d39540366 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -649,14 +649,14 @@ struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
-			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode,
 			struct drm_crtc_state *crtc_state,
-			struct drm_connector_state *conn_state,
-			struct drm_dsc_config *dsc)
+			struct drm_connector_state *conn_state)
 {
 	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
 	struct msm_display_info *disp_info = &dpu_enc->disp_info;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
+	struct drm_dsc_config *dsc = dpu_encoder_get_dsc_config(&dpu_enc->base);
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
@@ -764,7 +764,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
-	struct drm_dsc_config *dsc;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -785,10 +784,7 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	dsc = dpu_encoder_get_dsc_config(drm_enc);
-
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, conn_state,
-					    dsc);
+	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
 
 	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
 		crtc_state->mode_changed = true;

-- 
2.39.5

