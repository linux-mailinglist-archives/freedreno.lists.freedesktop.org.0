Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909A474BADA
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 03:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB2510E649;
	Sat,  8 Jul 2023 01:04:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0982810E1A2
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:22 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6fdaf6eefso38893621fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778260; x=1691370260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhEI1lIm+DUmqN/L6yAKAjA1YNlc6k+Vw25GanFRW4I=;
 b=IdgwmdV77LIS3Qf9wLgiOehF2o0nKe1wJx48roRXr4lUKi3GeD+XvlVheVShTEEFuX
 eOB4xmRHS7bBSFgn/2C8JvSlcPWWJEe4qkkYBaTwusl8U/ZODND3RSQkOgG20TNopc4w
 vkGcK73EdEOdQ0rAfPIbG/J+Sy6axeIMT4fso+31CFYdS8flu3O0cBztRy7gx3gGqRmr
 uD+/uyelnPHzKEOWZ/Pvr5kg8Jjb/7AdwzQ0eVatptxge+LLgCTd4Y6OdtCpouEDVCEF
 N5TUGH1PyeebiV8+F0V+zVArdhz93JkVwXUbZN5rh/CsGLfeVlsHoA+kjd75VsS0BkYj
 BbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778260; x=1691370260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhEI1lIm+DUmqN/L6yAKAjA1YNlc6k+Vw25GanFRW4I=;
 b=SGTPt1zBHRqwvqnp2+CDMzKZKeqY5UR30nuJrwJrbg2ltba42MkkPcckbL9CVKFpqr
 Tl79/wLl7GyCP3vuhPWZ8lzR5F1VEM9BQnXZtWQf7QphhaHYhiRb2dWnmwlBGIm4Oqsl
 DJfchLLRcUPepHnCp2IQ0rAwP1m3jGkDn+26OLsW9okoXGLS7WoGv0iiogAoc/xl6Ml9
 9wKPrptI/RlJu9gE4NsAo3fPHiqbXLcOtMZefeGra2ZM/dSiRsIH9H4DyQ8qy+ipfU0M
 585UulooSmWdNYyWei2rT2jz3Ks/xUpnsz0M3Tl11lb9elA7fyRw0PI7rKdtZNPyzg7n
 AMlw==
X-Gm-Message-State: ABy/qLY2ucRfUSnHa3e6P8pFpfHbW/C37W7VnhNMfR2LL9j/aHBSgAUi
 ZZIT7K5zj0k5QlUAH0KRMGrpAA==
X-Google-Smtp-Source: APBJJlGI1MnjiDn7TijmPyIOnYvBL3ptuIpFuRuga4F2nq1AVmD3c0RdD3GmqNDv3xebTxq2pTvshQ==
X-Received: by 2002:a2e:8546:0:b0:2b5:9778:7ce2 with SMTP id
 u6-20020a2e8546000000b002b597787ce2mr4719432ljj.15.1688778260413; 
 Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 04:04:07 +0300
Message-Id: <20230708010407.3871346-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 17/17] drm/msm: drop mdp_get_formats()
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

Drop the function mdp_get_formats(), which became unused after
converting both MDP4 and MDP5 planes to use static formats arrays.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 24 ------------------------
 drivers/gpu/drm/msm/disp/mdp_kms.h    |  1 -
 2 files changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index ba9abe8b3acc..0fe430af9523 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -183,30 +183,6 @@ const uint32_t mdp_rgb_yuv_formats[] = {
 
 size_t mdp_rgb_yuv_num_formats = ARRAY_SIZE(mdp_rgb_yuv_formats);
 
-/*
- * Note:
- * @rgb_only must be set to true, when requesting
- * supported formats for RGB pipes.
- */
-uint32_t mdp_get_formats(uint32_t *pixel_formats, uint32_t max_formats,
-		bool rgb_only)
-{
-	uint32_t i;
-	for (i = 0; i < ARRAY_SIZE(formats); i++) {
-		const struct mdp_format *f = &formats[i];
-
-		if (i == max_formats)
-			break;
-
-		if (rgb_only && MDP_FORMAT_IS_YUV(f))
-			break;
-
-		pixel_formats[i] = f->base.pixel_format;
-	}
-
-	return i;
-}
-
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 		uint64_t modifier)
 {
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index 11402a859574..1b2ccf7e7de6 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -91,7 +91,6 @@ struct mdp_format {
 #define to_mdp_format(x) container_of(x, struct mdp_format, base)
 #define MDP_FORMAT_IS_YUV(mdp_format) ((mdp_format)->is_yuv)
 
-uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, bool rgb_only);
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
 extern const uint32_t mdp_rgb_formats[];
-- 
2.39.2

