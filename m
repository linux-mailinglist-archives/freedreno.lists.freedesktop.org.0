Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5BDC0EB91
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 15:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF8310E4C3;
	Mon, 27 Oct 2025 14:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KxFRcYwU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72510E4CD
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 14:59:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso13072375e9.3
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577190; x=1762181990; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sxgfIdENtrsIjMM2UdQCTeBKGZOKjcZiEo3cUFxAXcY=;
 b=KxFRcYwU0wRBlsO6isGAo92BYGCRCf+vqrdWrxr91uo7P+mJAApwSQyywXYrvjP7oU
 e1bcbuzcDMuDrpV1D9HaDJGGvyBXL2Gv5xJqx9OlJVeDdTSp/coWaaWAqpR2I1Rrc4n9
 FQ+s2qhvbpi3OgUAvOA01StSxHjoYH+C2Y4+Dn4Wd+sj0ioqLR4SeJwofDjCGmgEgINZ
 yAP6fNeoV8fYnDqbjPB1QcHX8+o6im+KQm/JM86V8XxFWffAvLxw74FGlhemWTDq33up
 Cm2LSoJGZp8tZ7xDB+4PNI4FVnsfoklskau1dMEVKD/a+23H64MCphDEJl5C0kfgxvQp
 tG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577190; x=1762181990;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sxgfIdENtrsIjMM2UdQCTeBKGZOKjcZiEo3cUFxAXcY=;
 b=UL6uJVw49Bv6YvmMiH/4p7uid7g5pkthtAPnMAcT+1nZpAwx3ytPREbZt6ClT8NnTK
 XegArhNAmqPfhgOB59o+5TBxmn1l/PVJdVJkipQDHkQQDLe69Ww2AJsHIWW4O53TXV1f
 bRaig/92Phgv/73ICInMW4PI1fGYIKoNbguRAKCJqWBWvWBaemXXJVhi2Vux7IHLNARz
 2++qbspE96wfHZtu+Q4oQ3zX+glT5wuTfiGphWVmTF1J4PECcXUFB0h4kEH41zh6NfQi
 Fs1iTJhOy/jg3SV01IwqDlGGBYe2DtWnr8wXJ8gOfWmcb29bVTRXA+0a5sAb2gQ1lHPY
 wRtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW8yqjRWG3t3gxQ/64mYgyXdUiqB19yOfK+sSMRR5zHwyBnzXLWdeyGXpm0K9mGt38iDK1lJK/sTE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybX8HqnaemejXVHz+dG/9XEIiLr8QjCp1GEiYgVPdROtFNQXe3
 XsstH6qx8Eavu2NDQ4+ent9+9/1OfKmFya9o1VG4AXbS0bTzrb4vQbL+ix2EwSBjEzY=
X-Gm-Gg: ASbGncttXwtXZ+zsdNhqtlP8FqyJQftadtKjdb0MvoSKgGpM1aOos85LsYcLrIm/4yQ
 RAvtfQ8lFXIhZjXzP+s7J3Hs7ABcGQLbNjvvRAYl2ZNMHXOqTpT8YzwkVlCkiM1i5vTKx7Bo+4h
 mGeHrxgXT2ca1fqu/JHBKjQEmubW5J8AnyVb0JQoA2hXBfNBdt602gzd+ERejs0bgFDjyalKibe
 vtLKysvAfrYbiCtRYhfx6psn4qAfauBi07lwuceOMx6zlHk6cjErfwB2zwxuIsVwunkBz9beMxM
 0lfjJs/PcTb5E/Hb7QsfwZ8Ef5fiU6bAR2Nnu6kw30nz7ALjKrCw6GeFW8+1tMK3XKXwjm7uqvn
 t1V/54J6UIzMaWNeY3baDSwmVNTEQ+EH5/ijkVJxKyj3JHqyVND63ljal2MIXglS9/3ZcaSPFRA
 ==
X-Google-Smtp-Source: AGHT+IFI4cGNdhTLrO5Qc68eGANNKGWaZMi+SP3ROTN0APpf5MvdfI+OdXOP5hYM78+QFJFoWJtOIA==
X-Received: by 2002:a05:600c:621b:b0:46e:48fd:a1a9 with SMTP id
 5b1f17b1804b1-4711791fbbbmr291640995e9.33.1761577189636; 
 Mon, 27 Oct 2025 07:59:49 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:59:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:23 +0200
Subject: [PATCH v3 6/7] drm/msm/dp: Add support for Glymur
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-6-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=BDhxfQSATkvz5PZ4qM3SXapXE8VjPOJ1bFOc4+xtjJc=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jSsNQdfZaJPuhDANBhKWGrGuBai9h3fb5GV
 MTF71NO5USJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+I0gAKCRAbX0TJAJUV
 Vm8qD/wNEZMmVJpLmnjuh7sjJSc9hUiNL+mYlGlFqUULl7omP5nSihGm4XLWF0qNFdOx3P84WT6
 UqlANYEjYW2GXOMhs6dbn8jGHwQKpN7rQwWZJEDIWktZfhZ8zwj9FEB+vjz1Ve99neltqNF8pTl
 90iwDmK84agODV99T+u0TmV4vrdaCx+n4H08dwDoimXabcjRAs8REBSw9S2H/NVwOE7syyYD+cY
 ARAiN6jIkkPKB58gFiWg8pa5CsGKFM2Bj3LxROf5nX88iT5LiwBXwP6PgIHd7OuYXhr6BnYONhA
 siLyu645x1ibQ9sHQCT0IjyJQGYHdU27xejBgVirPi2bDhXfK+aRD6yyAHVxaXVma7wRYtN/Vf9
 9iTbegXtr7Bin4b7mD1vin+ve7bDSWJ7AWOoyyfvOXrhwTmj5IAzaPbKiIHNFq5jUSna7ecSie9
 pNXh5FPrEBGBQhEWo7KXEWzYWl9roN2Qa2+ce/u00uzfDbIpiVS2/CsiH4XAWCxpcd5PO78U3Ul
 PqQRVzYex+DAvPqhJkvMu2q8LfMgvq/I7Ii3zQH79uhhA8ayH1IO57Imaiio39bG2C30WAf9iXh
 eNLA8mRxyX9POZyWbX0yEEgxhR845VvyJJADb968LzciDmRR/YMoFjgjoYB3bqQOoCFXjC2tf8o
 snHhBwsIOVs7Ckw==
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
have a different core revision compared to all previous platforms.

Describe them and add the compatible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
2.48.1

