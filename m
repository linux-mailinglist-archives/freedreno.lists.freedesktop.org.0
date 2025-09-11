Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F12B5321E
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 14:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D8210EB02;
	Thu, 11 Sep 2025 12:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZizvmaTk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9E710EB02
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 12:29:24 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3d3ff4a4d6fso540811f8f.0
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757593763; x=1758198563; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FYKFAdjOYASo/WjabAdPI3Sw4noi+10vn2fGFK6NGHo=;
 b=ZizvmaTkIalNPv5NJ6wHNRCC58bGZNwvwwqQEl5Q+kHOXKNZoivf8HHIl7sCK6ojU6
 wRCksXNehhe/eew5qSEGWHJK8oaGy+pi7/Er+knb/hSZ9GmeAR5T14JacVfHwQW5YKSt
 3OcajMKz+MPKBixaQRzFYS8HPUm0YEe1CS2ERxA1yJabcLGg7tEz21XFhbkHp67Pmp8Q
 3E0KbolRula7EcYGf1Uxi9B/qp1j6HB2RkFxrE+gqbEoM5Z2W6W8TQ5PEgrXSinrQIAu
 qyGycD4ziJYFO/V/EcSoZAAeJCg88bqyuOAe4zZ/4CV6fyOQ17ua1T+GeJkR49kYptVy
 M6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757593763; x=1758198563;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FYKFAdjOYASo/WjabAdPI3Sw4noi+10vn2fGFK6NGHo=;
 b=wyjFyqAVE2aew3lhL3AzvVTZ//zsFcxobdxdjT1GzOs1yVPtBMRtjTmnFb7To6ajQp
 7e6YkU0tP1Uf2oX3jgjM+3WMghShYLK5fkPjnXKHpM5BRYJ28PMHVA00cPT/4+FQcj5/
 yrrX5sCBAK3wJuXU+0g5lBy0njZ0QfhTZ7ERioiwK72VmH8z0qo1iV9hnzkV3MNpuVM2
 Yptp6venHfGeL1IV3ftXCkgGifIZoJIJus2x8wFRUyiaUfF3cVJe/01oF1o4TJSwDvUC
 G/zRfWRwo2nft3oDdI83Xeu6mQ/xHgzD7xBoz6ox22PAdkQpJ+3xWIxTPO8wHXgf6J+2
 FOjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNtdA5Ogi3G3DfQCWLw3iEgi72dyS1zDavVXkDtoqKK/Dk36gWl3RNTQjxb6fSclBsRrfsBjxwZ3Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyNvSjlrLmiR5KAYyTFK5GDbnXo4gbZ9SMoLCDWCBWdxx3Zgvt
 XVaJMeUscFemTkr8eAalWRmE2cTfjwb78Z1bNkTUahWzkNQOpt8yQSFJalpxtZWPJn0=
X-Gm-Gg: ASbGncvGjzwofXMprCnPQ1Mp1/hTwlVnW7p2WaNY1ZuWtcxGlSf6FnT26Y1oMoJDY3j
 MwqzWeZSU/eBsXqT7F4pQmUMcS4AJND//512F0QT56fppUWZMRuNqlfhOnul0bnsTDYdApuDnVV
 n5LM/h1oyHNLhr1EMG2dh3HbDMNtjLB8mx9qW4iGEs2ymXT8xVRsjF5qytQuMs/88X9jkmHTfXv
 HZanY5KiKMrnIGF/gYeQDGWJYsVH95xo5hlCQumrEY1dlxxQeDQKNslUqLyx4sY39GmsPt1KMbL
 eIvf7nz1o3eMJuIz9Z74ajXJXk9XeFU1SA4ZTh7Xnj6wszcgZ/YZUztHu1zHc/G3KMYtTLabKTJ
 sGSOiC0FsOfSe8UKWAej2AwSuKr9f32vNkQ==
X-Google-Smtp-Source: AGHT+IE4wZnmN0HF5vilM8y4TE0lu9yYsqD43OkvBy4fyb1qhM9Qox4fLexabkHws0JYYvrRpH+fmg==
X-Received: by 2002:a05:6000:3103:b0:3dc:2912:15c0 with SMTP id
 ffacd0b85a97d-3e636d8f8e9mr16633511f8f.1.1757593762609; 
 Thu, 11 Sep 2025 05:29:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:29:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 15:28:51 +0300
Subject: [PATCH 4/6] drm/msm/mdss: Add Glymur device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-glymur-display-v1-4-d391a343292e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=VIaFKqE75CM+elK2XI4KYXHHvaxVuznQBropijUaKvI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCUdGmh3ForSq9QMyjokksSbUSHlc5VCaSEp
 Z/TmI90GCWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAlAAKCRAbX0TJAJUV
 VqhRD/98jWD57j5rtDVLUAmyM7r+QH6yH7G4HtwgYCTfk4b9yqkUtRFB99WCwwyLcSIPW+5vWT3
 G/7lYSdK+6ZkOnVdQYfuzZqmVIgMU0nr8gB3LTHyUAsI3ssZP+0mLTJQxH/5OtiDbOoldMPDDri
 WmGQGY8ChrT+z9LFFdHnG3WytJE1RqkKTChVym0dUCmulLNjeiEOZZa5hXZs0vDeXVq0e/+ZxpN
 18XQXNojihi+l6o6Vom8r5GERiFnptA4aMMs1ksRJmewxwr5zDh3lrzdPsKTI4S5sKNoKCOFa44
 SBrHee4vRiqfhVXgmTNTQDOQl8UapqVlEjozHl8rA6nNspaFJeHT9cM6ZpQstSnQUnBMVW5LVUU
 VHFEM2KTUnG/gvgxjBfQbrTtgyu8VGrB9IVGfZxysai6mdioklApSIRaS1MMYKYMFHNUBDDu/Nv
 ZtgzjHw6HOAbuZtsEhqdJfvAzF1NLJaWLQrXAfTJt1W9QyjGBz/7+CYp9WgbkrRKANOQwL/rvAG
 vEzYT/JwTeusAn/XRifhUPHf2oxMCvGzfqITVgG1au/FJiUqutUn8XKtwNEdb3ATi3i0n+ehPta
 91zyKEzsYhb+dsLm8+d5w4Q8ZLhA6RZ1tnuiFrLH8X1+6xggAaWK9fIGS76n7A2bsKxZTB/tS2Q
 F+cXo1n16s7mPxg==
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
2.45.2

