Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBBEA2E7BA
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 10:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995D010E4DD;
	Mon, 10 Feb 2025 09:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="htvkrwKv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99BD10E4D8
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 09:32:49 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43937cf2131so8370065e9.2
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 01:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739179968; x=1739784768; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B7Mf7/b8tRR9xW5dgasegab0Mde3i6bGZYAhw62oPdc=;
 b=htvkrwKv/1WXO6q30QPTEHcmo2B1hKmHV886mMmXD5yu1k4zlE4u/cG0ftYeve1BuF
 Lvmg/2CLRE1tZSmBF11eX1qpDPAgaOeATipA5UXQmq+Gmjea8L2WXZeLdG71YG/uwbO8
 oEuwI9pRcqUZHW6ndnmBTewzhvV8LuAjJf+mlBG43qvNQ5UG6P4RTVYAkh4Jb5G2AIYF
 5lEozxL7b52CfFKOHo4sQ1EQHipQzKjLhHUMPTb/OJR75gxxRRlFFwYCNIyA7falyEz0
 PG2Gg4dUG/jIAif8+nElXTuxbdnyBCDfKOuULRznYR8FYDdefXrwmKgJH3PvtqiFBoXz
 DfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739179968; x=1739784768;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7Mf7/b8tRR9xW5dgasegab0Mde3i6bGZYAhw62oPdc=;
 b=sLt/ImG3dlC8yCw6G9PUuxY0vlcRhWrH4+d7AuFgdMNDrHjfaEz8+pKBpsqy4sZVno
 n6VZnftH+vBiVFUURZYCp3PiFb84nfEhNecu/XEeEX07g6VYyffb0XtkDxK+OKGqWj57
 0EO+aAkmY/1jsFbdWZO3FwqKrGbtU6MCDdbGIR7IujPNgsWUbIWoB/AduB+nKwSECAKJ
 2hvrych+b9WWN/60mDCXdycyHEh+nUTsggYV/5uOLDkVsz3Q7brm0KePt5JYWMXUSEUB
 aCGSOOiXT88MCt87cgurbBa8SOjhH+1tzOOSTKtRR81Dirj44DIRvBnZwbIvp2pDRHUc
 T22Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX80Cqy084xJOSuNPo7KIkch+F/LWFrtgjCeSVzFaLSuzwzwMo5BbZoAQmaOjbzKMijEX4jTwCra38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjkyboiZef0FeUkI5+wumiCiTzooCUrRF0ejVfxBdLGje930vd
 eVylGZbuEZoepy0ETqg5nvujshYYSYm2ci7ZIHe48ZMqdRstUTV7DMmDfy1RXcY=
X-Gm-Gg: ASbGnct3LU05coE0RjQQt9YgSHQ5arm9kGCnkgwZg+iMUifdQxuojYiHKy/g5xejPX7
 QkNGTu/tiOHYDJ9GgDtCquelsUN0sl7Dm6iYEqdWnKx7NJ+rXuFBGCQLCIuq9MfZSmBwcg+SZcT
 5IRjg3E1g2IuGx6+sf0Xvf39C1B8PFI+6+q2fsX5GcI5QwukFBwWoXGNjZXpBM8utiJ2pmpsZDK
 oVH9KK/rcEmQoIrR2OegW8P2cs0g/JRm1QSSpF82YToDGFvBCkLDx7FHw1rDR0qKX9Y5MUAAAYy
 /QpkpWZDsErhrhgoekdAOnsZTc9iy1S7chVw
X-Google-Smtp-Source: AGHT+IFTndcSWfI5oaRE/Yk4AmwYCk2TTxoLS17TnO045AWTTpQhU8hrDcvXFUIacIha8y9Rh24cjw==
X-Received: by 2002:a05:600c:1f81:b0:434:f767:68ea with SMTP id
 5b1f17b1804b1-4392497dbdbmr113510775e9.5.1739179968306; 
 Mon, 10 Feb 2025 01:32:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 01:32:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:39 +0100
Subject: [PATCH v3 1/4] dt-bindings: display: qcom,sm8550-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-1-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6FKLI8BR9LrbuUjWiYTQpzeLNsesqx1ffA2+NHG9+q0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce8QdvaOHqukMQloNHxUMY3QOwnJoaYNNprKn8N
 iY0JjaiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvAAKCRB33NvayMhJ0awED/
 4xRW3wc2J0soAkiPwhFBNDsJS+LFpMnO+8t6ChgyXGIyn08CvVELsbOi+xAcxvvwRDbVHnmxioHgqe
 DhNQ5BRTTwzEIHmxPG7/zc4C60SYZX9RvFfbRaVdQqjuto4OWub6YRQXL9pAqFvvh+542UdwssFL9i
 RRf42lG6RQzryiDSXipivC3g4/xiwVdUx3tRkFR5prIYNb8I/4hIPYNnv+EoXqtCJySmZZunDFePRL
 9V782oINlu0BjFzGfNiXPeVoxbHMVwvnMXUYGJKF7EGpHyur4GUvITQu/Nz4jKfPXo5E3gWMm11ENe
 ZJrOaNTo+k7YLqyzpuxrtWGtVRhqAqtdFVywFRG8Z486z376yI58tPCmnGzwBHmKmMWUJcIcpVnG/e
 7hNiHuDxIi2vfPv741Csxh/X7aZknzhet5lcWsQ/YhZmiH4LlQUb/fgN2t06ejihgBVKZ0LR22rzFC
 HCBv2pJpJgsTzmWNI+6NpHZz0D2DMWX4ZsG9WBRrdPGa6DPjbR2QCZDcozpnwrR0F7uSHLceZmmzf4
 uQFkynLNOZnGqI23oHoIChySVi6XcrFNnBIz591bTB0lPPLVMlSM7zLuoiEzKZeFbvqqLVU0JStL1f
 oT73IMjDltqsvzNqU+NAA42pAHtC9lzaufAcGosCpfBbzDnaf9Ao/0KkRoHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg is
required, so explicitly document the mdp0-mem/cpu-cfg interconnect and
add the cpu-cfg path in the example.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml  | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..59192c59ddb9c126ada43ada1430fa7569651f99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -30,10 +30,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -91,9 +95,9 @@ examples:
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
-        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
-                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
-        interconnect-names = "mdp0-mem", "mdp1-mem";
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
 
         resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 

-- 
2.34.1

