Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BEBB5321D
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 14:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B62E10EB00;
	Thu, 11 Sep 2025 12:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iUbmW90t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A67E10EAFF
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 12:29:22 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45de60d39b7so5105405e9.0
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757593760; x=1758198560; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/qapoM1NTgjIA32q9aq+b/rv3iqgu/0hG4CK+nrUoPk=;
 b=iUbmW90tfeQUuqRCjtECxWlKOa1QT6F2b96zGwpzO3QM4VtKsGQE6KS5jQB9MMBUUG
 39wuEphqvclI2dJ9Fy8WYKXASIFkvYJ1gB1Rg+cs9QxXIbWOMSJu3Z3s9iB1U6kO40aT
 pLk7qarqz1wyDZ5EUEBfwxqti49amD5kem0cp9UIwbzvEn4KKIABIei8LxvME3sT9wwa
 CpPUMF5YmpX+Wy2My40eP0CPG9sZN6TOy/37WrYxZ8xarH90AsKjpZSvQGiVmTcR6s3T
 qODX8ARMUbFejjTSYmi+w2TD/7V3D9xdivVtSNby3RpG8Z+Q3kX8d0iheK6ZpR8e6a7v
 W5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757593760; x=1758198560;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qapoM1NTgjIA32q9aq+b/rv3iqgu/0hG4CK+nrUoPk=;
 b=kf81FT2T3ImoTDnuV14uoEvUOIZKh9ONO1wbt/nehULegBbUTvvx6Rm2v5uAkcTubo
 9l6zfTaJxxIiXH1qUusBLRW0H0RzQezHd8WcFfsmAVBvjVSSrBEUp/l3KHLSoDWglGTQ
 d2urbw2ezB/s4xLLJgfbdwqmzTx6NkJs2oXiZVH/YpVcNv+QbOxN3fo0esHtW8SyfSNC
 qxUNnLW72yN0ZJsQaqGFVvfl+9l6zy6UeCfHBgxH/dWSXaTybl+Q4iWbXcDnYDIDePwk
 kx3l0veGGBMNtHV3QYfyBatQvg+HG/uqZv/offckw7yDiB/XnQ7zQ3BTGpTzXofQ7vz7
 +K4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPw5WT/dhs3FQDEO7wIlQqPLTxJ8HplFtXWMQ/OKNYvONHTDv3yMitbZdoIICifJbHrgqJQBkeVkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ5pcsc4nSBbYIz4eWz9Hz7OLS8oPIJHrSoZyb68kLuhpp1LRG
 TSz2La55eSQppprbGOFPRBEQCXS5RLeI5p14vSPRLYDOYRua8H71ojrEWtTyRexbylE=
X-Gm-Gg: ASbGncs8eN8UBKGum4+e5wZuyfkkr+g7Cmpc19luq/cKyxVej9U5GummzAKRkYjlwC8
 qMunbyZbkXIYg6boV+z1k/Z4siiqPbRolz14RVeisa+fB5/D2qBo2rJGbSsGPENE8XcAgMAWWf3
 LLifmaxA/t81jjc9AKw77NFEvk4410Breq1Qwz8pDfQo4F+Rk5wKjgO4SioqZtMopgQFxTzwwWJ
 fycL9U6pgpN0EE4CmxDFzoSWzv+3mwl373mYAGSkET4uRdWyWJsPCTBMtpYMA8xZZQFIgWG68yy
 EoiUeqch5Uq070PgTDKpaWOhzi9beo0Cu2flcuGAbPxkqPhDeoQ8OhqSeLTj0oO5bXJ3GiZXFI3
 IU/RJrGBh5+ADmV24jA+a8AUGhNHWdvifvA==
X-Google-Smtp-Source: AGHT+IHX4pfnUjM848MfniCu3WyeScBitJ5E/cygTtxz9LQ8TaGkNJ5wnB/S5GwIefVqEvsl0R9Knw==
X-Received: by 2002:a05:600c:45cd:b0:45c:8e6d:a45f with SMTP id
 5b1f17b1804b1-45ddde868a2mr175690925e9.5.1757593760523; 
 Thu, 11 Sep 2025 05:29:20 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:29:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 15:28:50 +0300
Subject: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=XM0DxWjTAJ/QMdmpyiPJ2nNd+sYznSXNCG3HlohsAXw=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCSN6o0sLnMqNPtT5EEjzg1K5qvo4uAFpJwl
 PtMKaRuoVyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAkgAKCRAbX0TJAJUV
 ViArD/9NsVtmYH33UcA/4V7iCbCs+ZsbfDbtZTAgOkpKyxqbMP9xeZUPpW+b1Iy0mb28FwWvkWu
 jNT33guP64nucvFlvRk02l+4l2w5H/t6lwtBquxf5v6bjaO7RY2aaaDV7wi7QzQSwC8lxrz/YkU
 Ctpsl62WzkFHPScRbvvhcIdqk9UdEu+jsqrZ0b45UbLhhrZBY62aGwjoh34AXcJIQ4KHDmtiQrn
 uhcewa7QX67tKwrOnuxH3mb71Xna/1kWu/VkvrQ66LwsO3KTd2l01TfP8XHBQ+LkIz1FIjpKSnO
 h5JjQ9PG+GBbZRSdE2ocpDSB9UXbd1/HTbgVMXvtZ0sUVeUA28MMMBMzIBH28i4xD0tfw6V+Ey3
 yH60P1rGq0U1dibXl8kZNw0bgpGS+13lZg+IzTdrPj7lgrZKbZlMUKr8qUi4DOsBGfVSAfdir9f
 KB7xCbP8E7C8mVDLnmHzAhpg6SXzJi/9G7+LNzOZ1ayXoE1gOrFyumVZfO8QW0eSNLA8zPx0o+I
 ihEmIRLcF92GKC65dw1r10UhSzdbE9dCE4G9fHZy6GlwPUKSvGS/I5r5tySVkaV9YNswrWsMeZD
 5WIBhxVpwEfL2CmTVDjL23nXkmL9MJjfCtIbcCAo/ohBhEBHO01CZA2mjUDedQtn7pGJ2ubsGRo
 8zqly6wLXAHSRgw==
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

Document the DisplayPort controller found in the Qualcomm Glymur SoC.
There are 4 controllers and their base addresses and layouts differ,
therefore being incompatible with all previous platforms.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..26f5043748c166aa44be4e62445a63106edf9578 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,glymur-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -239,6 +241,7 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
+              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:

-- 
2.45.2

