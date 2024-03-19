Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39C487FE9F
	for <lists+freedreno@lfdr.de>; Tue, 19 Mar 2024 14:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3669510FAB8;
	Tue, 19 Mar 2024 13:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DRXZ6xIT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC7710FA8F
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 13:22:07 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d4a8bddc21so29341351fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710854526; x=1711459326; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WD7yBNRoaRKt7gkhASL4YuNhAW8aTci/0KYixE/5y+0=;
 b=DRXZ6xITKjQs4xVlQcYd45VX8Jklzq/CIGuB3Lv5t6/yFoISIyalYp+OX9FmJhDuwu
 He+KUhfCr+HlYeE773EKQ3pvaJOXoR1G1TEUfcItdkZPlB1lsQ7gu0eDqlnpSjvo1MHB
 GDeAI2CkXMeyoFOkP2I5TsGYBg+QRCAoj4ItdiLXD1/r0+cohZduvNnyjqo0epmYbVHN
 aZ+l4KJuGs6kKwkd8tUmlC70bu5CuKu+FrK/WuKMW63evLNngz1plGdfhNUvKXHx5soN
 9usgxBUOHgH2jyWJha6pPX+LOnkQjca2y3us6D6qgCKu0GQXEerjv2rbvtNjAGG0CGnH
 +lAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710854526; x=1711459326;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WD7yBNRoaRKt7gkhASL4YuNhAW8aTci/0KYixE/5y+0=;
 b=NtV6Gxbeq0697mfqIlpUKCDlLaHJZof2onOajH2YZJxpJUj8lCoF98+PyQ1wMSuVYS
 eo5b1f/u2O6OsgfB8KOo5mEEXFbgP/4gwfA3cOo9hwDkbl0i5ozQ3CjYytIKMla6Qfbb
 Xq574/ME3Vt88Ndw8k3ipqJEirJte8ZdG7WOXrPqA4nIkt6uOJJSJby4QE9HFvahQ8ef
 TzE3cRZ52iEH2JgPE/1jh5b/qUwoDnLw5DDWB0FW+Yrq8o8H6YaQQBRNv3wSWgsDTR/c
 PjmTgiUrwIW+I3TPI364eg/KCQwJXs4T/YXU0Ij5DNKXJ0Kh/ysbgiv3vqdjKdjZAeqZ
 bixg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN9bYdu058RhhD2DTEdGR1AVOk8dSarREQwBHhd5RNTTg/mok4y+X6OVtOsKxj7VVbsPKX5Y/fh6kgKNj1fCayDk5Z4VEFa/T7MoUP14ZR
X-Gm-Message-State: AOJu0YxL+iASnAhxgNmq4NyYzXte0wfudFR4pSs9ycDQ32yAejZO+xVC
 JzS/iAqePlRmX3Ai26LgYxbyW5JGkTXoJ5mY8b9RYkHU64IoKMUEQvlKCC18670=
X-Google-Smtp-Source: AGHT+IFoBlBXLATJwtn11NwC95jZvMudqneFSyVeHjOITEmsLIkS67V0F62kAvSJefpUoEZ+7NC6bg==
X-Received: by 2002:a2e:a9a7:0:b0:2d4:1700:34a2 with SMTP id
 x39-20020a2ea9a7000000b002d4170034a2mr12647195ljq.33.1710854526182; 
 Tue, 19 Mar 2024 06:22:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:22:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:03 +0200
Subject: [PATCH 5/9] drm/msm/dpu: check for the plane pitch overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-5-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zIBBrMeVyHBOI7xFU2blyQniDBu8Ce/9r1dzS2RD+9s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF4pY/VL46Xa9j61sl17x/W0yJqmKwYdQhs9
 Vw0GposSJGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmReAAKCRCLPIo+Aiko
 1VS3B/9FskmpJEoP55DmNokOoSiMJDEZE3wEQQ6GKqWCsbSnYBkPyUh2PeUgd0O1tBx8HNcRjoA
 rOXXA8utPu6bAYapEPS3PuB8cCeexYbpRz5kY2dTA8n/noQo45XxoShxg+h7fufOWkJpZuiamJk
 9ZtNVutp1StlESc+xfiyiVS4sl3qQAD/mulmH2T0rbqt8BGUcqxz4E21DKB9T8kJEAjEmddeLLM
 GgT4g0Snx2IwzgAxGxTJfzUlwjP3JW8OdBBOWHw0atcGlMIo38UUO3oiyMK9D3P4y4AgmHOy2zA
 ta1g7zqBbm9jyyDHktmmc9i8sQ4cHA2x/Ixrv2t8m9gOkjn5
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

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index b7dc52312c39..86b1defa5d21 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -12,6 +12,8 @@
 
 struct dpu_hw_sspp;
 
+#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
+
 /**
  * Flags
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a9de1fbd0df3..9e57c51f5343 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -790,7 +790,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -864,6 +864,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 	}
 
+	for (i = 0; i < pstate->layout.num_planes; i++)
+		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
+			return -E2BIG;
+
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2

