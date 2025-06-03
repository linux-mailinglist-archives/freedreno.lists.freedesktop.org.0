Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8C8ACC0E5
	for <lists+freedreno@lfdr.de>; Tue,  3 Jun 2025 09:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8477B10E6BB;
	Tue,  3 Jun 2025 07:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nABqLkxF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4C210E6CB
 for <freedreno@lists.freedesktop.org>; Tue,  3 Jun 2025 07:11:22 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-74800b81f1bso199604b3a.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Jun 2025 00:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934682; x=1749539482; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
 b=nABqLkxFuGy5pfw3wU7sB+PPlg2Z8eu5ht+JQsB6B/e80FRaCUNlNOuxIJ/V6by4P4
 pZk1gv2epbvR2LVrCMMsZAe6IrxOMmsdPEZRLqmcyrebl5BiV2xTYQbvriFg9vKjwG8d
 Kc7prPmH5B18zAJbIIRkb6z9hX1YJCHdoewLV1+MAppYsb/Lwn8Fb0yMa2rdK5RjpT7v
 QnM0y42vYv2A7RgKH6GjXSNBxPB+5yTMXo3xgLrX2jJamOhJ/Zu6tBsokqxhuuFwFNaw
 toYukryihgImH9hsN6BwG1qa6Qz7cQo5vFOk1IOqfSUyjmtxVEU/ZoDRMU2eu8YUvPer
 nOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934682; x=1749539482;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
 b=ey7QWnEwsjf9NPrhmBfcLBL1ezJDVEniM7NznESAj35Ofg02upWECFq3EsaGfuj4gi
 C28CafmLEC+TgWAJ9x5dCUR5U0YNJSr0Dr7y0CSSCVw3GSErGzelq19t+95S5e7eWglJ
 lccHRIy0qtP8MX85enbvlyagD8hFKUX6Kt8mpTW5eexR7dxv1SBOOta1eoo3zIbj3XZT
 Zq9zoIMMGs1zTsmrIsmPrWDFNHF11y9LH7AdMoiySxCNVyVUY+a7uLRRuEIHXysS9pRd
 zIFLT4mJ8mTLcsO2tcPbcOAV7yEEWQ1YwNJll1pErkI1OFOMrZUPqoWk9KI2s6r/Gwfr
 g1dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdhJjF3PhH1Q9CirfVi2e75ZGs1XF7/KgbUhdzfM5+ojOdbq+NZXglM8HTWF5nQVQWqpAILygDcfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ6HTCU82EsrWDATjG5EPBiXjJ4BADfcvEEC5SB9uLDpSeBBJO
 QDTDs3o1fX1Qjz43BeDGw5rVa2jSFvuKhJKehVh+Eco19k0m2vs3MjN5aKJjjPA8Jl8=
X-Gm-Gg: ASbGncuGxUz5/WzWKXlZEXRvBz4jZ6972Qz9HC7KU+C0Pnq7NjRYtzTjTCLGLZGmWLa
 7+yVW+Ncl50BOPDWqkChsrQtWv/7s7d+Ij6P5OF8qUb/gPq24mTqDX2X87hRTwdL6gjB46RMcgu
 F4PIYVKZ6ABw54DiZsBN3lnFWqrc7k+0utvj+2OW+s+xQqCahKbUl7//N0kpe2/UMu71OoWDAAu
 gjyg87pSXXcKXT7N2Wt+LAqsJg95wvMJ1q8zvwxWigNfxLOnnqj6LeWimCeyzT5MfYqHozAAgfp
 zz+lbGJ5Z74i8zfvlWmCuFWFZGntYk8/eZVquDoUy1xAZT5E62Mt+LWj6Zmt
X-Google-Smtp-Source: AGHT+IH0yPSQUYs3KibIp/x7iu1Nwa/LdAsHJOBdWwn18yMWEz2cHx1TONGezh4asP/Kv/HQW6UCEQ==
X-Received: by 2002:a05:6a00:b90:b0:72d:3b2e:fef9 with SMTP id
 d2e1a72fcca58-747c1c46345mr18149708b3a.20.1748934681648; 
 Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:07 +0800
Subject: [PATCH v11 08/12] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-8-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e1upM+aOdYliO/dIh1k3i/FkzXto3qmBjVI/19UomkE=;
 b=CgR/9p+yyw53c62J4hPQLpiSpKACzV7q2lWs+QQNgAMiZCDbEiDbtB3b+Dw7VJHj5NfLllHTF
 +027St0KrfsDn0M/IkAQ5jiVE64mIN5CYIH8SaWl6j4l0k0+akcU2Ws
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index be8102691b99d3b381476ff844ddfd28fe17dc7c..8b6fa7ef78e2c0fb38daef9090dbf747c7ba111d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2377,7 +2378,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

