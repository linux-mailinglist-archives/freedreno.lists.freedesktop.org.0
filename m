Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617CBAA4C36
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 15:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBF510E7B4;
	Wed, 30 Apr 2025 13:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q8DJ+RLL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C1510E795
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43d16a01deaso5282025e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018076; x=1746622876; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
 b=Q8DJ+RLLv+OtEaUzr8zk+Gpo3ON9s/ajUeSshqUU9AhPqPCs7fN3Xz/BUvaYVlK8eW
 iVIiZqBLAnV+w7oUnm2YehaHz8KwvB4xtvwJwuI4jfKkHpS50JHvi8p/BQXpwlkspwve
 KNmDaP0ndymLndnDYfAqjMBx2rrYeZpZ4V21ZcJIp5plFzk+NYU3yUYfYrLrMtDnzSzh
 3e69Cli7gBjxKZUmIZWWQXf5eLsUbv4EJDhtVtMxNBab09IIRyT32PDQI3vxHG+s/dle
 +yq3i7AkmWw236aZO/nrtPMA0kkumK76AYL+5q0YRxh2du0TTu9g3KmRM0ZlKLzvEMRQ
 N4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018076; x=1746622876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
 b=tQnwM/I1BbPHJZX6EbFCAMz+Y7h6ogxiGSKls/+Mct1jsm8zzlFG6ipm4QIQXgogRm
 po8CKpMHDt4YlnAMcBiWLVfFZyzV2z77krfRRmuRI/SHeT1+mv/iToYtfn6uo+Cnr+Ds
 LOUKVAYdGMcOHVDUkXuBra07mXEO8t0Rw1D6JjogBfeTgsZeLst1yNfJ2zBEKcODqdXC
 tAkc4K2gxm6C/rS0Fm1d1B8c3eKcQwyu+03PCcUC3NHa0q2DDq8LnV+inIQkSJXXCHfh
 dJwtPFQUPiP5PsA4Gfw1H9sKSBt1yeVc7nVo8vaRG9UvQLw9+C2kII1mWadpnZEkMRFT
 q9NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyx3w/XT5pVXgu7PymNUwarzlHEdgDq5twE0KC8W/YFN9WiRHabkdqtJ8+vR1qOdY8jfp14XQNoZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMRIVUis2ScGRay4Y+38pKbxWVUv+bDPriKIb8WZDB4Wyq01UA
 P5rZeL/CQ4gPu0yUihVhub2zi9mEpYVjT3osmxdp5IHk6bmso4+HcNahMKa5kJM=
X-Gm-Gg: ASbGncv3qHBJRrz7pjcpqKjy0pH0J5xzlP2/5pFsgd4P3i8G8VI4DNbXlRCpeD87g/z
 2GECghcv09k2ZVrVqj1YhQYQl5NvQNYYO/G0A1ynTyC09Hh6H/4OceXKwgKhWmKFfVi+cnzaOPM
 L8SGCm8CmHEN+3Fi6X5ntIvDvou7y3O1+I7lFvTHhToc7bcPY2XMQFWnQwC5YnkBa8x9toy5Gsv
 DQzRQhFKQ/YOoIPeMsoQfZHF6k/mt2/hLpg6Opw/YgiWoQcrORSBA6gj5+6FSjo2AytJv+sxkmS
 kLhNuhQXii2qExYkT/zPVYPi6isAEG+XPcj1a5RB2dcaMYoxfvgf2QkWZy4=
X-Google-Smtp-Source: AGHT+IE18JTYANDILCbq/VvMcef+4LOGatEO297qJkCdJ+51jnqFQMRJCyhHvokQM2QNs9XBMo3gwg==
X-Received: by 2002:a5d:5c84:0:b0:39f:6e2:f846 with SMTP id
 ffacd0b85a97d-3a09007e389mr808544f8f.11.1746018075739; 
 Wed, 30 Apr 2025 06:01:15 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:34 +0200
Subject: [PATCH v5 04/24] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-4-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh72FpXr2OvUJMdqZsONrKoHxF92CtBzOH/+I
 WqrcPyAtRmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe9gAKCRDBN2bmhouD
 1+MZD/9OF5Hp81jdBQTywFeOv8VerfYbTkQjgvr569Zvd6mUXMgHttCIYZ4RrBdqh5+U2LjGd9o
 yA6suSThzxkiMb7b9X5JAtwcXrNXHTwFyodBiUN3IWd7i8Iom7/LZaHbJ3XWcyiHjFPLXmZ4iAC
 f+W5hqAcKjZRLkTjQOG4XRbVmnZnuhx5K9UKomzZ3MseyCdJgv/4qeiXVRj3vTco/eqCPh4x2Hn
 +fsXYNuJU8tGelCxGIZgQ5uOV8X6YiNZ3dRjQjaajPNbtL10FcLOJyjo5EHhhGCSrg/QIepbrT0
 3hfYRzQaef8mX1/7r9Da8S01UUw3lcVDEbxAFPRUdj9tHr3sn1Ym4tlCWlXprGysGMn+E30fyCX
 J0nXHFAH1HaAbsevaDzc3I0Nq3LAIn0+NMHbxdoAmgwtN8OS8d2x2udAbugBFLZtV3lJK9Zf+pN
 20XKakZvuzlqs7iLROykPYv14kRuBHe/RpUJblAVD6nlO5bbSL2uX/KJ6P8PbOzz9Ji+e2gu++t
 niXHUk1YPckv1HqkSVyI1djubaN8W6cxm9W0uoQdcWcsH3Tx9jkrecK5fZd6vtPyn7K724vnsVU
 mbgSnEGQu7KZ2NsTbNxJ1YC4lWx/ihyAP2i54eCqpvPpz+KA1HD/SB2XFW3CGlBWy+lm8Pk9f7q
 zot22z/xMwkT4wA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.45.2

