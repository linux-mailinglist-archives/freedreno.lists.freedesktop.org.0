Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9EA133B3
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1369F10E8C2;
	Thu, 16 Jan 2025 07:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="flP1hOLb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D73310E8C2
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:26:17 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2f441904a42so1211183a91.1
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012376; x=1737617176; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bQBV9g8vPMf8Uq4Wh2MqOnJmIVXoZ+dnuZKYDKl6oH8=;
 b=flP1hOLbHOznVvnXQcg3YzQesDvGCt7tYPezfABEvTn50EMH7J0I2f+nkaycbKWbAh
 QLO8ltgH46Ev42xSCHALMjwLGup+Ykkjj5zmGoZxZcVlAfe+yDWYeaK8YoKX9WlGatY8
 9Dr9fqZyNd+WxSL8xWYtzH8Vk/3QR4maSz4k4cT/Capbuh4BpLDMp+2tgavjvogd9PsS
 PUzcahiB6kHl8bFr8tkxciHegs8gVfba2cgVzJjYWAykgix0S2/7F9cxX000hixz95Nt
 EaEwV/Xb0rGu5eoMOeyaFMLsDRBNriBFbOXYjrpu7rXbR0qWtNQmn15xqgxZNS+FIcld
 jhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012376; x=1737617176;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQBV9g8vPMf8Uq4Wh2MqOnJmIVXoZ+dnuZKYDKl6oH8=;
 b=Hlmn5/8bpJuT5uWZlBYe0/eK3f8tf1Na0aw3xBfg2py8SxOSMEEWwcI2oqATBAH2hQ
 X3CdknRnm66gOdWZpepbFxh5b9EFL3/TIlN/lea0rdu6feeooGHiK37NiJc/StoP7FVk
 6W3U1/aakM0CnjiQRFRq5WZ3p8wHDMZWAkxI3o1SEnWiHgWSG1wZ/PL96LIpQPig/gMt
 HXn1jVAta/my7yuFko9MnXhk/2BXDzXTbtTLMNKwPR9rGra74Vj3SETupsxNAknDoCWf
 jXs6isITiiPhLLmsR5PkoSDFLDrImYPA98xgke2TqC8j2GEAY5yGtH0BeYE1WTLWc4jf
 /JTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKM2Iryzg5eVF9VEI5qPgEwL7oz2lU5UO3KOFo5lNd80lyrn6r5W0tYAlU7kqI9ZIU+SNYwk0ORqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWPE39hF8QRPmKRNJFMziaiWI0uGe+EJnhxjaKHt2S2qHAaZfT
 1/mVH1IWDsAv5Jjj8Lwrtf4DaRyoZUybKyWYwWC6x4O3ZG5p+RQL6Efxbb/wny0=
X-Gm-Gg: ASbGnctZ+PqmM26+86bsbZl5Mqk9ieEao67w3bFQNsGzq7x5L9x4Yk4WRjJwYs2nU+u
 6/PZBMWTM8/2ps1/L2nlZIubtq6MpZA1x0cxsOff4gQk73nVryJLfu1WCJQAWCY6Q2rcP5Ikr6A
 WOPK2wNzR1i9UJIp024XLevI3lgf/cKSjhiM46vNMBi0lpQ0eyLrIYRHbQLYEGj8iJIKkMXAdTA
 0no7qdwOrrkAmoiWNcos0Xl2K83LIL+nzgNNTrLEbvgOj44LEkv6g==
X-Google-Smtp-Source: AGHT+IF00SipaBn5NPWzgB5ZXnkdSOutUT9Qtc1tzeasYpsYLXBSfDlP3UkZIDf63uh/CeUtkd32rg==
X-Received: by 2002:a05:6a00:1942:b0:71e:6b8:2f4a with SMTP id
 d2e1a72fcca58-72d21f7bcccmr46697624b3a.12.1737012376528; 
 Wed, 15 Jan 2025 23:26:16 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:16 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:51 +0800
Subject: [PATCH v4 02/16] drm/msm/dpu: Do not fix number of DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-2-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1814;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=u2GFE12qLfx13hrjSJDIvSRgATGg2YWsZ6oSOw/ZiU4=;
 b=B2zJX6OxJVLb1nrnneDJA+HhPR1wU8/wgPl7b3y+aZsPSv5T//cZ1Jt1PN18xaQ2mrJoaqZBN
 5jJJG51NEgnAV9vF7u6k+bPJ9d7rg4hiMBWYlezra+R9lwvwAnGaIVL
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

Currently, if DSC is enabled, only 2 DSC engines are supported so far.
More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
get the real number of DSCs to decide whether DSC merging is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eaac172141ede..c734d2c5790d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @num_dscs:			Number of DSCs in use
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -204,6 +205,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 num_dscs;
 
 	bool wide_bus_en;
 
@@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_enc->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
+	dpu_enc->num_dscs = num_dsc;
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||

-- 
2.34.1

