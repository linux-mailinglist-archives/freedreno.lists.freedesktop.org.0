Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA139FB940
	for <lists+freedreno@lfdr.de>; Tue, 24 Dec 2024 05:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B51C10E28B;
	Tue, 24 Dec 2024 04:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YM3qKJ82";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E021910E28B
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 04:26:28 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so4314995e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 20:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735014327; x=1735619127; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3CSDGB69QriY94B5b6A1T9MEsmUWimXhm8siF3IuBBA=;
 b=YM3qKJ82hvDhzj5Es3TiP+rVkyNPGCOAkA1jQLf4tyhQ5iy1Ei2Z4afbNBxGvt0lzb
 TMNlM2o8px7GsuiSAyPO4h7QbLl+ufy6aw3tgA2PqEfnMo8asx+g8ezqiSo8KhAW7s4e
 jehWAm6gz8D8Z05WEkU70jila2Op+xFjlM4t6ZlSWGrdaX1uOODysRTsGE1ZCjF+MZPA
 PLMTUlwDW7WBy1YeYLPJ1kPg5m7zuW9cMlKeW51ISJs4ngf0G29gULAaK8DIubwP8MMv
 5xLS7fsDAfOWS3M4rYUuwiDm6F0ogbFNCJkLedc8URVMpIajaXoCwMoOtcDehf2SULmS
 87Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735014327; x=1735619127;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CSDGB69QriY94B5b6A1T9MEsmUWimXhm8siF3IuBBA=;
 b=B6PFA04KRYgwWhr7jNuqzq3m5n320L8YbHYzfmfMz7wKnQeQLyTneL8UnUsB4NFs0U
 jOdwBjy8TCy4U9APjjnW+aB39+z0tjtpYE38zUaAehhxfweLsFcivd8cv2HdJSHfernv
 r9HogULuKRE3nT3OLh6bbu3RkUWdmJ+QaNG8foM5Os8MPr8K+/S/KCzGJJAXRimhPcdS
 usxAmggwXteY1HBUrJ7mGxYf7fVqD4BdmldA7KkOEWwOl9/begHjPDFfaOW9MiauPpct
 jIVqqQ8SgX5jDBAcHTknD9C50GqFy11qd204rAgfKWl3/JpSG0pZd2UhQkF7fJJeCoh2
 mqHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjQZj+Xo0g9Qtr9IH2kblCN4EtJdoqvhSAT92Nw/h5dhUv05F0GhHCHrMcP5zEJjM4pdP5RyQswys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFzUtZVsK5yvxoIcJbiu/2ZbRNbtBTsNRYmf4lNgSUEUh+Fkka
 QJPGmRC2cfgQaGOy9Dc2zifwXG3+IPWQy45LJ9CHS7XaEewHEoI9fALvNEKNNKISLEqRLrFiiTq
 Y
X-Gm-Gg: ASbGncv5JydUsvmXHpZKWTAty4MrLFu9PLhjG3khmST4OXyQF+iYlPMA6EpsNcz7p/Y
 m1Khez2rTKKOvgwSsIoq8s7cQmhwbFjjrXj1BAVOG1mk5k+JUXmfrgyOSV0A9jaFbCYDUi0pCte
 hsAC6wS1Tqk3RbNqjpxdTUJodXYlLg6/p+4Gkru8ex3OMy6CUs5WdO5J287J06ZCoteSJSRU6uq
 tkB5D6k91JOK+01u+FlAKKiGIw0wLnG0DYZPh9xIxJqFUxTezoM9JBtKDXoYqi5
X-Google-Smtp-Source: AGHT+IFIMXnvY310fiuVucPefEzpRGs5Kpa2L9uUWMq4mZOqFrsrgLhrdOkMgkhW4cJzykbkMvG4tw==
X-Received: by 2002:a05:6512:318e:b0:540:2ef4:9cd3 with SMTP id
 2adb3069b0e04-54229533377mr4811759e87.20.1735014327301; 
 Mon, 23 Dec 2024 20:25:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:25:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 06:25:19 +0200
Subject: [PATCH 3/4] drm/msm/dpu: enable CDM_0 for SC8280XP platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-dpu-add-cdm-v1-3-7aabfcb58246@linaro.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7H7Miw4Y9xtaEfOBBtk2QI7k72SP13qbxE4Ugq17sLU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnajet5hOr2ZF19/TJ/9lFfZkAHlqBDSdoMxLSY
 6Bx11ZzMSCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2o3rQAKCRCLPIo+Aiko
 1d8CCACrv88H28PCpd6FXnqQQwpcyYhVxMwZPrHp0Xsdy67xoQ0BoLVJtNlax8w3kbaiacfNyL0
 3WmcBpDQOW4Abt91L3TaB7SKT3ra1SDXVIqGuCpnizwSdaGRGqf3VV2F6qkExOtf6lX3RXYEZyk
 N56ZOzY0j73b526EE8+5XQnoxHgRXN6r0ZCXwGBYG9MaS44A08Lu/D2+cpxB3NQBid1upYoRwut
 NGLNtD5LarpUcf7DQ7SPron0G3TxfHCkVyx/ZDCQUzbpTxJTnIsv6ivzgiJIHdhWl+54CHVnpka
 prrTUFR+tyXQ9lUSQVhMFiVcMsq51AYx8VbhfX6n+JaEpmGi
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

Enable CDM on the SC8280XP platform, allowing RGB to YUV conversion for
the output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0d143e390eca964b1c81f835d0904a2079b0b941..e407cd8084923f5ac356130036f342c2794f3815 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -435,6 +435,7 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.mdss_ver = &sc8280xp_mdss_ver,
 	.caps = &sc8280xp_dpu_caps,
 	.mdp = &sc8280xp_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
 	.ctl = sc8280xp_ctl,
 	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),

-- 
2.39.5

