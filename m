Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BA7A349C0
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 17:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA9C10EB23;
	Thu, 13 Feb 2025 16:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xbGpkoru";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D631D10EB20
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 16:28:04 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43948021a45so11691435e9.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464083; x=1740068883; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nckyoaf9WMSwIR46ubTH6va+VexZaxBrD6oq84P05tk=;
 b=xbGpkorucW4vWYTacWEOweEpiR0lhlWNkfX3E6/5unwFZh6Ub8C+Befe8Hz+ATobvB
 zpqUksDJmFhQ9aPmWpBdbMvrMhB6BR3eflLpvOkbmnDkQ7zrlbMalTpEMybpE8FJosXX
 lZ7oWQz9GM8bRT6fE+8lkKDkz4LUPS8xiZYO1TRZOXp4F6Zst1xV5ChV6VOPnfkoc/DK
 +RFGDl82aneRpiuOvMa8IL/gwj9+iiQe/dWIDINONgvFjP+s52xYaY+Ro/Qoblas1MZq
 /wgC+8OMxMqnSlCS6prsAAuycuAdl5P2QIXUTFnYLbx5ACTLuF0CZ9SGkQZ/7Ju3RDO2
 KfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464083; x=1740068883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nckyoaf9WMSwIR46ubTH6va+VexZaxBrD6oq84P05tk=;
 b=i4XNTueF9aDxeU7OysQQqYX2Bkby/3fF/5HmKjzE0C3AfcNhDZo0Hk1JsxryT8DhGz
 asDLgN+iwg6N+dWxgd1Q97/eL5MqTEesRfri08z6260WduriJb1jUyfuvxECFOHOwOvz
 pSSSnHoVsjQKS5rBahp+WPG5gPnDepxZaf+n2NUxiuUywMCaftVBoGQnvnZNUxzMoB4m
 sfeZd/KnFDDhT5bZduSNFYSA9wmPr98s9Ya4pYnQqVO8zaQ9IyqWUb4/Vyz6xKOSCu9y
 1CDHsUU8m2RYFH4GZTmJEvtcITE2hurZJVF+DPN9/9ZZM8dobyxOrHj1Su/FEU3T3FDZ
 02WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLe7HbEQPia2v8W9g2nm76pLprg5j6Gdesm8KKuMMLWFZatTjg5c7YyrHp/Nc+tizQaccihywZzfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEmaejein9uRXh/D+iF72IDdhBkbfKpUCPVnqGAmuR0BlOjrZP
 Y6bvBvCPwvp2NY5XOZuyu6zx1Haw0CAiahXaxXEH6E/ETohO7ypaRKeUoETrM60=
X-Gm-Gg: ASbGnctlOoLpiMGCH6Y4KKx9pk0+55unFUpOz+nKtt2Px+Q0CCKHFZ03kvO2TupZWQ+
 ICDDY9npECyYmxk+H1JjLS9FeqJSC3xtfuD1GC1WlMNneVSQFfe5eObo6tAIJxatjWCj9mfmoMv
 njnsv6Jq8GTvv4I1jjscwZvK0q5IY17iV2EKvkkvKHNmxuKWVhNJUa2ldjXPtWPSn5JJAIcncza
 svRFCf3k5wb6KomqCAJ4irU3gz3Gf0jtxyHWG5JW+emPPEDdpN5VXLr18aEqEj0+MIj2v6bapWP
 RDjEgkW2eWoSUsCuVZEfI1ajRJGCFjO7P/ts
X-Google-Smtp-Source: AGHT+IELeKCADQgg3H5ZzZcXql0ZPJ1C4Uvb1zOBpoOn1s+Bz0PEz8ZZ92bF4HPtyxGd27LfKSXksQ==
X-Received: by 2002:a05:600c:3544:b0:439:57bb:2aa with SMTP id
 5b1f17b1804b1-43958166727mr107502195e9.11.1739464083323; 
 Thu, 13 Feb 2025 08:28:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b412esm2274382f8f.1.2025.02.13.08.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:28:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 13 Feb 2025 17:27:56 +0100
Subject: [PATCH v4 1/4] dt-bindings: display: qcom,sm8550-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-1-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oNd12i+2YmkCuPYQliiOZGjMa/GCFMaAOwx4UZry5cY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnrh2PxgSsYod7hW5BPfhjvjXJr3Hpc/Y4nGjmbpLq
 /LWeb26JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ64djwAKCRB33NvayMhJ0Q0WD/
 4qd13mpilaLgIGAOQgbLY3IKdNqPNm5kMS18FEVqOC1wxxdtMXcWQ2TV916MPWxwLWyZ0V+Ogkc7Vm
 wj7AE90w09sWjRWMNFJAaevlVjzFtRj7tg8tLEH2WaojWU91xJZZZxhDjnNImc44IiO4fn0OftaVmo
 2J3PnvAEDJpeDqfcDgBr3MWEm9wHjT/kGPjr6Ahi6f7dKqnFqMKAVBAmXEUx82IxzCaJDdnAoxZAlI
 Dx3TVYX5ofK3S3RyvhvJ9Wj8GwF+I8Apc14DU9RQZyBrtw+1Do6t598lCEFkf5UKGoc2WKNknHRoMS
 VmpNK1g+E9t32NnlryQo/qdHVcNuvEw35dcQe9Xhk2J0gYSiJO1ERiD5D6iCZAoFjwWiqw0JV/QlWk
 ENCrWpIIx3f+xkO2O48CRatyzt/5LHDLM9sprI3wfkgo1IdVeOmjDUzqdgQ6l8P/q8pF6out0DEETR
 apeKJV3LdWurx4UNkET5DYpweh4Gqo4tQLcKHrka/6Nw7/TPoVVTfk19sUnvOgA9GS7U+mkdsT+fqo
 xtRoN+LAo3ESej07wlqYf9wx+qprBUirXwTFlTC3QSOMU3aqiQrC8h5LaoAeYjRswn/7dSfjD+Xclh
 AEW9bbl3X2yhN+fPBK0yTONibKBvxtZ7jAeopKOWiGtzNr7J8t17swEwq47Q==
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

