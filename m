Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B59F26AF
	for <lists+freedreno@lfdr.de>; Sun, 15 Dec 2024 23:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229BD10E2E7;
	Sun, 15 Dec 2024 22:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hYi23dWo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D5D10E4F7
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:29 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so29429061fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302667; x=1734907467; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Mux+X2T90rARK9K4me0bLNJaTeYIMJC1kTPXh2h86DA=;
 b=hYi23dWoETjOQ52pELdHa1pGz8up7JDBPgHFzxCf8/HYsiTJbbMELbwBQxE1qqCM+y
 uaKHUGxi541VDcuovlNDjqloTBOrz8bkZ9+rEjAaGEF12OZQAr2pIYCB9lEHEuleBexj
 LgBiNHA7NEMP+AU0RkLsocTZLRk+hjtK9azAmGh+xOA/0ejQ4dI8nam4yhM+WspcGsVR
 wb9SSlwETF91XPsaDNmCi3TQVg0WTwe/OcwiK37wSkuhBUmC3S/3vRYRQhO6vEpmkZU9
 DVMiu0hSWk1oNNfoqw8kJr1StPq+9PjGa6b0VtYm9vLf4rZeSpfimucnvN6VlKcQGaNi
 8DRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302667; x=1734907467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mux+X2T90rARK9K4me0bLNJaTeYIMJC1kTPXh2h86DA=;
 b=NRgG8yBOm1kM3RFXaamTGTZcFkUsCL+tqqd4N9JUZ7e0EkMuyFttsCzfH7nrG15VxF
 y/vAUGLjZpBzS+VxU+ncEVD45xPvYHzMDflt9es1vTx9XjC+8zy/PPNm0E7n8uU1ysHz
 4e2cDeXuOnzp98LP6Tn2+Il5coRYvgsm/xAawhQ2cd1GRkirMYT5q3nz+j8Gf1/7l19+
 nh3AyEoVgDcdRCF1HAA8IIqLhoMi/7B+/OKzbaFCOlYBXqlm0IKR8LI2GzxfbIIbtUem
 CqhQtGm9RSEVUK1VHwz4XnyV5eRrVvle/2jjvjTn1ul9HM+q3mylcBwJDoPx07IF1M3s
 xxzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbjOjz8wh8LkjnUooXmEmsoJDokrQEww1sQJV/KizyRNEu06bf57r4HfNVlxI0iFLCwrp0dmHlMzc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX2AVAEb2Xb6gA5j8Vp1RtcSr31nsW6SFhDj7moRJCQj5z53ps
 sBzIywh2B7vM95OJoM4eCZxUERpFmaoV5sE6L5SfrleH1bo7mqnVCE7x6g2hG8Y=
X-Gm-Gg: ASbGncspxHylFh0UHKghqcFLAQpMgdJ03mpnQlY+0Pv7CzUmSC933FTMBymPAPm+lah
 c1ZyNXTF9KPyQi6RfVXs/A7GK2sGmd7Kvkhd5pDfBnWmiXLNlQ4JIHEDJWyB43H0MP/yKS3KL63
 osSDI2ZI22kvIqggLYlGQdJnootG1QcCJC1jO0y43Bg8GGk+I5eqDwMAlOgbuxZ5usAMSQ/bIM7
 4cTrccdyDu8LwZ5fFnRhVXKvVtMrgxKc/iHxqM05wjGKvApBO376IgipkF7seOe
X-Google-Smtp-Source: AGHT+IEq3ZSHhSfGAciD4CoixAdrzoly+2VPI6MLxX5QrDDkNWHI7duVoDIS29ql4JE64rpxz9bIzw==
X-Received: by 2002:a2e:7d18:0:b0:2ff:c242:29c8 with SMTP id
 38308e7fff4ca-302544e318amr26962871fa.35.1734302667392; 
 Sun, 15 Dec 2024 14:44:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:11 +0200
Subject: [PATCH v4 06/16] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uGnZRrKJoZhV4YQRCG927L3JErIL80muN9PIVthRAy0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u5s2V6HYGYWdaq0LWCQVdXUekZ49Bda6Fml
 emCsVBina+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buQAKCRCLPIo+Aiko
 1SHzB/sGEuMbZ3IWUbSZECISEc6h8hHaR6+noAaxl5hFc8WULW6Tj05/3XRUn2Ttbbxt+E3K1Zx
 JLsnwDQisJwq2SKAh1QXWGKzGB/ig7CULjSUfHkIva0u/LTjWXcotaqZCqsCN/Q2e+J4F9O/Lfj
 X6FvFHU7Zeac0iqTCXb1P5zglgQuTJTTYv0sxbuTpFSrZZDmkkz7som662RzaKnuRNUTR8VgfbE
 1SLZxlRk49Hy3Va6DlUxdYEQkGbyiCnVwzhu/Yi9SvSBUIWfcItU5Kw/Z+nS4f7wc1x2LRNQXBb
 ZqW7kCjvnCB4tYe3/T9XWQ+fqA8Sri98Ph0D64z6RF2h0o24
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

It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
driver gets DSC support, it will handle that register in other places
too. Split a call to write 0x0 to that register to a separate function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 8 ++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h | 2 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..354ec834f9357c4797fc08a4532e69acc67b4317 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1039,6 +1039,14 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+
+	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+}
+
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6678b0ac9a67881244884d59487fa288d33d1be7..08bb42e91b779633875dbeb4130bc55a6571cfb1 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -92,6 +92,8 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				struct drm_display_mode *drm_mode);
 void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
+
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9c463ae2f8fae916661fef1c7e225f55c1026478..b9c461fee96f8fae9259ce03a32e1155b42d17bb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2011,6 +2011,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		pixel_rate_orig,
 		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
+	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
+
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);

-- 
2.39.5

