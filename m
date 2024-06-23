Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85746913DE1
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 22:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434210E1C6;
	Sun, 23 Jun 2024 20:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AHmjOiXb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA4010E130
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 20:03:32 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so20924735e9.1
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 13:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719173011; x=1719777811; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5ow/UhD/hlWMO1wQnP7yw4KEZ9Zhh7chAKMjsQ2L54M=;
 b=AHmjOiXbMHugvC6YjILuKpvyB0ZBaPZB/pfuctu6XJIni0OzJmCaULUaEIunAbLKr3
 T+AauzLydM93OKAZm04kliYMriAiUOKcSi7PXLMR84S0yG7JHg8eijkm7TPq06SoOx7o
 sucXbjDMI2vAOA3HewP8d0D1z4z22XMzGzKydnIXx1LRDk+HImYA5g830NsjafkuwRiX
 DZ/80BzKlY9tdfIzXSkpXJTSeeUDoHZs3rZMBoZGVOKsWZPVm3edUPeiN8ofgwL6sWKG
 udMumzIFMdrNumlTmAgoKXiT5jAOaSG9UZq1y8jQd0VknvEMFhyOU+QjdF+JalNva4Me
 RkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719173011; x=1719777811;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ow/UhD/hlWMO1wQnP7yw4KEZ9Zhh7chAKMjsQ2L54M=;
 b=DrGw1eh6z8vSRzF0OK00ZJOJ6FJ0E3zKkf+LekpxN2LMw2EoKB9KoG0uweUJ4uiHM4
 33T7xAzWoIhxO/BuRGcrPgwOvKzfPkhnqN6Kc0wsgwPST9LerXLqIIDyQd5/geli81ON
 LjMonD3WsWhjMK+TPKPtCWkTQsGwctZtl40ouEHcXRU9ZPFF3vb2sTdfQb3aAXzJWeFm
 9k+MLf732misQnlknmQUde/W520VqgORSpJy0LedkUpA93ylLuQ6oMhYI7tKGt6hPFa/
 Si+2X5Tct4YfOj5wEZbKd31Asm8LFoe8lkOQz3HwQeDS8gTpLK+mWgXUDS/RgIwGdzZ2
 MDrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwKPc1ST7xbj3NV//YIG7Qo4RtccATaIhWgpNbyTe13pR/4gzae8JvGpkfPyl6ORJDy0O2k3Ji1Lit9fGNt8k/LuT3o1Ah+c74lcdGGpag
X-Gm-Message-State: AOJu0Yzl/rTePdI3yZ25Y9aVrh2ObAPfLB3hMbhC9hPVzoElbH676lTl
 Cy83GQy7mSv8Y1ujcyH48QS7uWhHj/Turl85yP/EV0hJBAO1EAtRoipHSoCW5lc=
X-Google-Smtp-Source: AGHT+IHrrG07tlhKq0T0Q79qbLjtMFRHlvGdVpaV7mYi8SG2IESOG+UD+fskJ99LX6kwwDcvImU8NA==
X-Received: by 2002:a05:600c:511a:b0:421:b906:8088 with SMTP id
 5b1f17b1804b1-4248932858fmr38166325e9.0.1719173011286; 
 Sun, 23 Jun 2024 13:03:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:03:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 23 Jun 2024 22:03:03 +0200
Subject: [PATCH v2 4/4] dt-bindings: display/msm/gpu: fix the schema being
 not applied
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-4-9496410de992@linaro.org>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uYQQZshlwOKHfwbC3/MKr6ThTNfJ0nfXfyifQvYX5aw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+JCn5CmF8odDAYUWyh3ZfkGfRdXyfcRPrJC
 IUygQKvOO+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/iQAKCRDBN2bmhouD
 1+3WD/44hZ2+Ejzsx7aMXg7D/6Ygl8Izp702yxIeltA13k0IeWn+kA+5s2BTVil3rTgt/eg87Ow
 pNEQEF2kPTwsKyWTK0Bwbx7IK3JSLwM3aO2Uj1616luFBxWM9iVZwbuzBB+QTZi9EkOA2kLNKqb
 cbaBPJnQanCj2mWNljqDNzqTdKI7jQz//kb3+lwgiyUUQAdlyJ8ADEWhIyzi7UMdJ/zxtPkOkM5
 o5HLek/GG/EHEUbmwfDVCbf5pY8hvvSN+67LfWH4bVhHuwWohjw9HyJZtKgsYGML1sgywvSxW9v
 pNp+lTs5c9YNRSZthyT/h3WaAM/l/8Jtn9jappiCgUVs9GZr3A8O2wt+8d7HhSWZC9d17JCVzVp
 Uop25wBsZd/YFGz8kpUcbhfkWl+1Sv4th0n+VRnKamr2a0s8sxRssNagsSIeqb89dUgxhDexXbA
 zeNwrh9uuRvimJXbSgDGsYEYUo1ElgfTAz+pMCwNEliycnK3lhhIVswP4dIIT4iAKHHO/CLldnn
 pO5RPMxBKYpHl5w9i+Y2uEG1JM7h/5AxcWKzmfhY4pnSrEBqnhcjS0YShfrTBOzjmXZebLKO3qR
 jmrwZayAczdOZrTwDuHNN7p4irlhLZqBNytEjqQJVghirPOHu/Erx6xpbOtHu7zanf/Q9sP8Xss
 vcRgKjFhttepKyw==
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

dtschema v2024.4, v2024.5 and maybe earlier do not select device nodes for
given binding validation if the schema contains compatible list with
pattern and a const fallback.  This leads to binding being a no-op - not
being applied at all.  Issue should be fixed in the dtschema but for now
add a work-around do the binding can be used against DTS validation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This will uncover issues with DTS, which is expected and fixed in:
1. Incorrect AMD compatible:
   https://lore.kernel.org/linux-arm-msm/20240623193420.333735-1-krzysztof.kozlowski@linaro.org/T/#t

2. alwayson clock:
   https://lore.kernel.org/linux-arm-msm/20240121194221.13513-6-a39.skl@gmail.com/
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 03aaced1abda..6ddc72fd85b0 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -10,6 +10,18 @@ title: Adreno or Snapdragon GPUs
 maintainers:
   - Rob Clark <robdclark@gmail.com>
 
+# dtschema does not select nodes based on pattern+const, so add custom select
+# as a work-around:
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,adreno
+          - amd,imageon
+  required:
+    - compatible
+
 properties:
   compatible:
     oneOf:

-- 
2.43.0

