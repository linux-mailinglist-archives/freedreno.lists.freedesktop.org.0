Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7FAA2DA8F
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 04:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E267010E46A;
	Sun,  9 Feb 2025 03:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vHTLnxch";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7A610E46A
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:35 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54504a6955aso836781e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071294; x=1739676094; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YP4MdvoMBcZLNprvBXn4El+Fj4ia9ZTDKakpTuuOOAs=;
 b=vHTLnxchCiSpPI2nLWmBLuQM2uH1l3igvYHkjkkEyRvZ0HyBjp7VtGeLFW9cr3PSpS
 i51L8E3lZpHd0P0x2YX+Bh7BWUaf+cVlFM2exfrYK0FgK8gVJH+2c1w0qIzt+YcUIM97
 0YyEccZwTwWQvbHFP9XiByF7SvGzc43gDxrjl/86DaSePZqIv1MxboWK0/g7VMiJlyJC
 jxURCXltb+9J9MBpLmM22nF1W5pU52wrrpJTPBW9Dqhh1c/B5hsf9UMeJeI13fw4if4P
 fW6/GYOMUqxM5FRZKg3dm3C7hEAuTrbvbV1dIQr9vti2PSDcfRjwE5momIVIOM7Me3rh
 shCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071294; x=1739676094;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YP4MdvoMBcZLNprvBXn4El+Fj4ia9ZTDKakpTuuOOAs=;
 b=QMysmJHyIywHjZ55i/OeLnoR1Wn680jXe1dzVGUlbqEigHelsVBZ5h2jHBaM99z5LA
 gPOgxDJ3ZUX68ieySBrOSjK/x3OTFhrSpbu+IOaRYZdt4N/ixW3vY+yir6nKbR72zQIh
 Iavhs51i4kebdSBOCtq53YSd9ZhTdzHS10NoK+y2LU5oU5SHCgfU8WpdtGQRDOa9OuYC
 LdBcLGKaUhM3J5LLGE0yjLk52rUQxxmNR5E7CrS8vgn6MNybtApNQvSvaOy3ghtejdco
 +0C6vB5GVUHp9aV1B8BhxbfW3DF5jNDQBMg/UYG5YPSVdDdTqNg26Xoq69pVZ5uSSbtg
 wkRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB1aaA2KnY2mjD391zY7wU6b/Dkk2JD/2jvUmf6QpTRUVRKdxUWRW7VbrpzCHcTom53UHpnfcHef0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJfUeOyqXBxhCmA6TIW6y5wMN2dr/qlVwp4Wkjww/IjUyESKnh
 3C8G2pK1LKC8j3GE1JZrUWao1DLBZDN+87Bae7Xud2D/MF5uKITJC1v8Qaesclo=
X-Gm-Gg: ASbGncuOINXXpss/crmfMLgd6gi9Pn4PMQIO4ENZQTEKdnc8WgSmPWYHntIAWowX2M9
 zRkihg1pM71mevwHh+cfK5YcY1MaNRTby6uN7fb9riCvHI1CaGwnpK4iCyJaK4+/0c9N4ZMEMnr
 sBlBcczt1rK2e4r3EfmtZJxrrsD3/ULLGJ4+sPbIvfksIilX4N2BwQ8eduksNqYPuuvJisPszB2
 7mUXpd1+odrLA5Bc25VrK4yesylyppjglCXqBXa92LU6/t6VrC+7CihclaGLwuW7v9GeQkRO/hH
 cz1HqTU4fAxq36mBRCGdL4g=
X-Google-Smtp-Source: AGHT+IHT7nTiAdKWQeu3k8QQPa1bQZIcSiuifSUIzIIZnG12uYB2K3/4y4M3apFaH6OaUNsZa9MNBQ==
X-Received: by 2002:a05:6512:2316:b0:543:9a61:a2e5 with SMTP id
 2adb3069b0e04-54414aa87c8mr3054455e87.23.1739071293681; 
 Sat, 08 Feb 2025 19:21:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:14 +0200
Subject: [PATCH v5 4/8] drm/msm/dpu: make fix_core_ab_vote consistent with
 fix_core_ib_vote
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-4-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2751;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AzzOh5VbF1xgAFQDr0y7LJ2KKNxSxWjiNvu2zCJupLo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wbEoQjB6wQCSSdRKzM+SCwM5gypX8YeKBP
 ui6NfvZgOmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1f1IB/9yXGycsTIgai3Ycx5zE0WAn9SRkd3ZTPGkvT6nN/1olXIWl0yfr5urQEcc/Z627VFf6zj
 4UOdY+5tBukXG79csVVpw2WZqYr8vk734G59APRvZgRCu09G/df3tCXXhks6jNzLzWdfU5i7oOv
 jzk2XQtIApk+SFZau1M2eY5Mf+AitQx5lUGi9DaGaIuo05S6VavA16tjhUDepElFQK2Xl34AbYa
 w0dszxG26uUR1gaDLxGKWwUvcoDzGE6ej2PNsTrjeHKrhEdrzZUDlNzTZ01OGb9R9C5nlBDpvra
 IrBuQRpBJvzpPW0P1LZ76Pvz4Pi14cy4xFMV9IIcLZc/Kkvm
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

The fix_core_ab_vote is an average bandwidth value, used for bandwidth
overrides in several cases. However there is an internal inconsistency:
fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
in Bps.

Fix that by changing the type of the variable to u32 and using * 1000ULL
multiplier when setting up the dpu_core_perf_params::bw_ctl value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbbffebd7c70fc37d9159733 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
 	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote;
+		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
 		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
 		perf->core_clk_rate = core_perf->fix_core_clk_rate;
 	} else {
@@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->fix_core_clk_rate);
 	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
 			&perf->fix_core_ib_vote);
-	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
+	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
 			&perf->fix_core_ab_vote);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e2ab7b3a8246c11f844d25c64354526ad162e15c..d2f21d34e501e443ec89604217929eea476e88fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -41,7 +41,7 @@ struct dpu_core_perf_tune {
  * @enable_bw_release: debug control for bandwidth release
  * @fix_core_clk_rate: fixed core clock request in Hz used in mode 2
  * @fix_core_ib_vote: fixed core ib vote in KBps used in mode 2
- * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
+ * @fix_core_ab_vote: fixed core ab vote in KBps used in mode 2
  */
 struct dpu_core_perf {
 	const struct dpu_perf_cfg *perf_cfg;
@@ -51,7 +51,7 @@ struct dpu_core_perf {
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
 	u32 fix_core_ib_vote;
-	u64 fix_core_ab_vote;
+	u32 fix_core_ab_vote;
 };
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,

-- 
2.39.5

