Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01984C0EB81
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 15:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FB210E4CB;
	Mon, 27 Oct 2025 14:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aPi5h3Y0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3242B10E4E0
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 14:59:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so47942555e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577185; x=1762181985; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
 b=aPi5h3Y0DoP7hWCTaCLogFMnYMs0ZXVEtNh2LmUoNv698KzdHnuGegI09WWK6WS1Zb
 cGmhjyTjkEUGdTUKy6f0t19gq2mCASrtd8CjgO0NriiUWyq2smjFmsGk2XXwWlFMOdjK
 T2JdzQxWCLBUMuf1g5IP3VoZ/p4KAlkplihepvSMcwHtKtB0RJ1xTRYrM+ncVQF1tPHt
 FHl2fInSgPLVrJUEOI1gBTfdHXEHswRHOy4Zl7ySFpyzet9P9mgEC0xZb69i9zH/lAw8
 vrwbReouaQTM9sk7P5C/6sIKGsIiNdT9t4l0Cf76gj5qeHFqVSr67ifwAUFuiKrv7VbH
 h4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577185; x=1762181985;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AqsKQ8///0zondjUQyLirrRSCHthDErDWugJZ18wpKg=;
 b=rtlIjiZM1uRroQiZwmS9ddoA7hhnMIWcsLr935LeYWmYmoNvVj4oiQshoFwGFJeQE8
 2ntJPuJMppibVwJIAm98F98EIefGfcvkEWbV6YwzrfE08W6GekTI9EAmcVIIzfFBZBLT
 m9t9so7S70crK1ZRjk9D4b7OFL/6hXtQxTq7PTPv3gbq7dquRABYvqtLnsDqev54aRtL
 /dVVQxgbNrpQ/oxnNz7PY1qBgb0iEJgn74xzRER3alJj4sMdiujhoMiKhkYaMykinDLD
 Oj9FiPkCeHnC46yqaA8X6pYIASMd3i7DfzrKVtsqwl+7SogpaitiD6wwugagSC50jJc0
 dpWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgIPtbi6f+wMQbBOU32jzLu0ngKgPExBxHcRmfvbif8FDVfDWcJpi3b199CHWOcu1Dct3cfvo4ahQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKG69q4zDTTmBWlmh1pa1COIOLSAvtZtCCqVm8NWAiR5yCt80+
 osU1PA6sNIAOMY0W2GlwS/HOHzH/1c3RIEF0WmYrh51TYYuHqVVrke9fxumR4o3iiDI=
X-Gm-Gg: ASbGncvIxnsVkW6Jcb11VydpOd4AqQP9IrIfDHI3eVwXhBWe1a9Y5lHpTKY+yz0a44O
 AhbD91KLqcZs4XTET25m5aPPjCptgU8MdhfutPmg/bX/STC7Yj+aFyJMm0+OQImdiC7EW9Q5DCs
 WOsHijDSe4c9Dfcou7ZE2kbm174puJuEAk/Uwodt3o31chg5VHFwjNRB1lagHnuh/KoBObU9TfR
 T4oU9lpYHjjZFOyL28D/K0qUsm4jJCK+aIceiIzU6k+PlQPaSYCgkgq0oTUbvW8bgyhtU0UmNzN
 6xNTBPVCMx6coOUgYJOW04GrJthR5WIrjIqAuFUMd8AIhzONdHM4GLBx7vHYfpzuy6Q+245p7KQ
 J0fGKN0v+DEpIhlyJHhv7AE4Zzz1zcG90qhp+602YCalK/eyDWe5lajsNCD7P1ri0o4xQiUTbTO
 1gWys08tz0
X-Google-Smtp-Source: AGHT+IFO7Got2ubevHRfgj5QqQ+su96RPdM4Gxx2kUrMjZfw7k7B7E+Ut+HnbXiTZsiZtBSeBGG6RA==
X-Received: by 2002:a05:600c:83c3:b0:475:de68:3c2e with SMTP id
 5b1f17b1804b1-475de683d45mr63857665e9.40.1761577184642; 
 Mon, 27 Oct 2025 07:59:44 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:59:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:21 +0200
Subject: [PATCH v3 4/7] drm/msm/mdss: Add Glymur device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-4-aa13055818ac@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=m/Ryf+3/Ba7bj8cfGk0q+ZCXj08lxgpxWe3j8JBvzwU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jQBp5H4dDRTqI5TaS3RfQjAj9H1dixDkmAz
 ixmM0LiGYeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+I0AAKCRAbX0TJAJUV
 VsLgD/9+wwEnPPeWGdL3dWWtgOTfnTcC8jpTFqVVENytsh45QdKu9O+0P/fh1WSXFMjpsRrAbs6
 WKbRfNOvZ03Kmw/sVbytPerJ64AkkPGZlGirnte7kXlFkveP0Ecghp2yBfQG2QC09wehxpJz2v/
 PlHSdIQ/2SFYE6cqk5A+Pcf24WkliOJ2qsLI7DORwwZzSD3ThX7woyimkMSVzC1ircRJTIMpeDw
 QlGQUFaTPTuXH+NK1Nr9k86yqaTUACN0Taao4LLRtu9IbruWMZn30BCWHAgdm1+TTpLKVZtSUpL
 y9DPFsoqv08g04uof6sf+iKJ2s6ipoYUHFZESnu8PbB5fV1Zyjuf3mNbC+wbNuZG3XTZN+T8G6g
 rGIQ118FHxRuUOjcr6FlAacjRo+Ja0vq6LSAemYm++pPa3pAR+ArtAvSpq1IFj17O3J90rSZH/K
 zCNy2Hc32837x3/jwgJm2T59ASUNXnJMMyhUiFCkWWsjIsPFMY6Yih++ai84+ft64EQZUa1w7AL
 2mjbDUYfKDEL1CsNDfoKPsUVkPc4D/ILE6LTsQBfr3DLIsbME7fgIh6UPnemG/pSpud0TKg5k38
 yDSl2yyq9Tubt7bwohbnH6rADGfrdlFjIVjkbMmmhTXD0HBdncIrt3bCJeHJm2diXhvfrVdQYeF
 iYhgQ0RhQ/2E6sg==
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

Add Mobile Display Subsystem (MDSS) support for the Glymur platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..60bd6af83a8846f2ad751ea625a20e419c80638b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -553,6 +553,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.48.1

