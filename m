Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C44B53224
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 14:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD65A10EB07;
	Thu, 11 Sep 2025 12:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KOZ3b7X8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F41410EB07
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 12:29:28 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3e249a4d605so727884f8f.3
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757593767; x=1758198567; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rK5gauka6WJHEkf+0ee8itGvW8sd0sVeeoCYGXwGtNQ=;
 b=KOZ3b7X84iUE8FT+DNNIJc7Ws4gwK+tqE3JFIa8ipberRx7PrT3nEtrRDJMtfWgS9J
 LK0KD6xx0sulQExHmgfTwMlK2Vc2DcOREFQTxDKGaxE/56M0wfnXbO5nyV+0c0ppmTcm
 HJGEyH498tQcfNvRO9ZEg+xk/Sxd8lkhKt/mL/fxdDvCGz5U52Sz9pdXvSlO0dO4qA76
 mVBIMT28IdikZyLlbdeNAniWo8ES062Pz9VKKMdUYg22k1gQy+Kfzi9LhcjyPjtQqh3f
 k3nkFLIeUAJm2EmWsht16Ni2nVTJrhb4fG77a/yRMKRKBICQHcM3WXJhMrPoRDkDgF5+
 Hq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757593767; x=1758198567;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rK5gauka6WJHEkf+0ee8itGvW8sd0sVeeoCYGXwGtNQ=;
 b=R7SvzY/YyKpi8kY/vw9d/x95F0/1R5LuNxG2PeJdmjuqaem1HpWNzYOIfxze15LPRu
 mx5JMc4HtVstqbxMXezECL8vD1EJlDAdWl/8jbAG+hezhO+OydQ8li08i0f9fPHwFV2x
 oXHG6cuUU3D8mm8ArcuQlwKZyCaJUMvjBZGfd9z4yth8e7oLE7JDIQdtMla8TC4AC+Vr
 7Fdv3seLBi+FlsD5d1Dcm4d8DMM5KkGWviUqVAjO2oR6AX4nCfFxSPWN55IlJqhkgbPF
 4ovzgd9wjX1swWmuBmS+H29KrShhy+A9PJA/HDJd9/VT8SDP+LpoyPpLWv/Ld12iSPm0
 RVQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgG0rqRseMLDIv/PstX3NSbY5xDoZfTd7Ahylef49DXdr6pfn9qnCyE0UpZpAjcGS9z2j62U9G3Fs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCX/7E54vHHwOwIB5ofMvtilHF0tUOw6zhk6Zm2LlqLNUF6J1t
 UmBMPc8pBO2PR+OPzCJMwh0XLJQPZUCUIRCdqtqpCZo3NnNjAvyDebyPAwBtBiOK3l8=
X-Gm-Gg: ASbGnct/P74tAn27RkKeKNL3eDFiKZZ6gDMIyszU3eehVhD+aydZokJQlPctXfFBg89
 2QxPI3DhDyWiXy0vi3knMTyWSf2+HKE6a1qsHr1vaIt9LWZvK4uURoczDinlGK0WPqcNMtG7cfE
 UgsIb3s+5seRZ1MJz36X6b173LNji6pcwSeeGTiERwSSDT7+OMQDZ6020YhK0mQYQiZBZXD8U3q
 RTbUZCpV2TwVQqw8MQZw4yNN3/XmwbM9S9exg5WsLmGk2keM/OtEsOc7N8el7N6HAOJ7zW9WUmf
 lsnUniPkae/AYtsF5Go/+lA0mocOGLC1V0QMIm6SUIZbjXFIcOzBQBhz0t3O8DKFpJEZen/aUs0
 k1HiGpy/Lul0vdv1v0hzUv1wzk6IO2WvZ4w==
X-Google-Smtp-Source: AGHT+IE1cC/g8IOGUUpBkwH6C0EwoEtNLSlV22sbFAF6cIH/wjd9irgm7/iYj5aVuHtsstJb9iHmsw==
X-Received: by 2002:a05:6000:2c0f:b0:3cf:3f1:acc3 with SMTP id
 ffacd0b85a97d-3e64d03a044mr16590630f8f.60.1757593766805; 
 Thu, 11 Sep 2025 05:29:26 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:29:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 15:28:53 +0300
Subject: [PATCH 6/6] drm/msm/dp: Add support for Glymur
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-glymur-display-v1-6-d391a343292e@linaro.org>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
In-Reply-To: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=yTtr23lhqbScJlmUZX3cbsRwsRc0pG1apQVh15j5H+4=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCXXllfZnncjUx401LCYZHaYbpDX3c6m2/21
 U0nyQGiUlSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAlwAKCRAbX0TJAJUV
 Vm9kEACp8OBToeqBuXF1mK1YJ1FPkcHUkIU+HxqB9KpAvinTrIYTMv5IZa/QZCD3k68DovOSoMC
 208JSw/Y4yFqgt6VaoEe036pfLuNh0xDjutfo1XNXGW5favOIO2TIZemDdvn+SNzwfPwP8qiLw4
 xby9+umqV7Ndxk/+7THWqvfSow6FWT9AQ2roJ5QPT9Z74UmRsonZgL3t8wNdTzxWWW/x6gOY4B+
 TI2YjWXpr8TxIiB/Z74+p7A9iCFD505EUbLCo/gCx8U0P7X6SVwOXJCdvzCz+wGZo2koxXnvXbO
 22TTZZBoG+p4KQKFeYRreXlvu/JozLoIQ70S7mR3FyX/09SXinLfV/nXmP2Zrs2R1gxgDfM6Gkd
 KOC4dctiBsQPXYXGGNQvDhM06Y7nYBkNZXnADL/snmfWRBMpDnu+cDqfVeAW2PBMsldotiVGgu8
 5YGfGeAvCKPHB93n3lyYmvoYlTITv2CN8RtUDhkYDx8krwVy4HONBjoBKFH3qjn2ShFLKD14w40
 0FqpHbzkJvvlFN4VQt7kZr0Rx6Et+/NbYJxxYgxQLG4ifQzj4Tfp+IzbtKtyo2GWrvSsJHMOtSO
 OkfpAV742Cbv1ukc5QbbGXowNlgIDi+FuZuRJFmoxyjqkHXf2v1dahCAP6ZGbxuGn2NeILwr1nb
 U8YXvWMFTS8AUeQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

The Qualcomm Glymur platform comes with 4 DisplayPort controllers, which
have different offsets than all previous platforms. Describe them and add
the compatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..9bd9cd5c1e03cc17598b222177b6682bbcd89f0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -130,6 +130,14 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
+static const struct msm_dp_desc msm_dp_desc_glymur[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0af64000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
+	{ .io_start = 0x0af6c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -187,6 +195,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.45.2

