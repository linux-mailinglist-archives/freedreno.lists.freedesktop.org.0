Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D01A8949BE
	for <lists+freedreno@lfdr.de>; Tue,  2 Apr 2024 04:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4561310F81D;
	Tue,  2 Apr 2024 02:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zyumc83y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C73610F830
 for <freedreno@lists.freedesktop.org>; Tue,  2 Apr 2024 02:57:20 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d718ee7344so44902441fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 01 Apr 2024 19:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712026638; x=1712631438; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6VOgcgkaIZJPdQtGGmGZo4U58vKcHPUrdkYCQrx6McA=;
 b=Zyumc83yxTMQH64zhiV6+i5wpDVtjjNDw2SQE4EJbzG/XQFdNHjWrxNsZ9cxQSqK0b
 Vjm6dyK/77/o0ByE0gfXmPWmYrnsuPWoF7Vn50vz2c9lgn65RebQkEEYB8CObZqvqVmE
 0/l7qv2R/z50QwQ0QaVpO2nLCWkAPmGDeZ5O7huQCV8T/FqzVmB0ARy3R80vaGUug298
 zbOh0pxzh2Nr8K+TA64vcAEI2kONo2MAugsztqLk073kc4dKSXTYQ6AFVhMv//3vnAX+
 y/iAvDK6bvlshcWtuN6MTzVGbgUWDVCXBSMXSTZN/HD6sDp9RDpsomtT8PlVQjxN5+nv
 7wdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712026638; x=1712631438;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6VOgcgkaIZJPdQtGGmGZo4U58vKcHPUrdkYCQrx6McA=;
 b=K1uJzBCMvAP85f3Cqg3PFjNw0jy03pEtb6i65IqclBhg79ObTu0SAmPtRuUsD+4mx2
 StGspGlFhI9tV9Q0Hrhbd3mfjiwYAlx04/v8yZLE4/CPo609JXDZZQfYa8LQKGPHVwF4
 pat6GvZCsyrsbaGlx695PQ6zUlfG93nvf5h4GHTZusM+Hl90q/qN/S+G02jqfzhVRgIo
 pgByEOpMj5b/t0pPhnW8EBuy+vdhS2KuMTg+UCWdh+ur3zs6FPvQKHuCjcLAPb1jIjRf
 shhtr1Mjjpl5+4U2PUZQcIgvnG5H9p7RNIy+t4I993F/boImNN7ObAUe7nq0MC2uQRR7
 MZgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM6iZo6SSTYnQtNU+pd76sx4yhBJdN5N0On+S+kJdFBbkIvU1I9PLxCpZ9BYTKTOjP1DxMzhtWvV+uW3U+R+TTojGPJXCUSDk6AC9dmBB7
X-Gm-Message-State: AOJu0YxPxTNdeO/kO6pOYfm/WcwCj7vAobVy5PjQCCAl131ykJyrsCCk
 wPkPFCvWvvnsgX73uhvuK3F6I69Cv5gIgpQfFs6VgnYUYmFqHIucPThuHreieSc=
X-Google-Smtp-Source: AGHT+IEkINumfK8SxM5FCtANDChexxpXEf6jtZE/nxDH/3YvjzYUTz6kLkJnjajI/U+Kk39mLyWteQ==
X-Received: by 2002:a2e:95d5:0:b0:2d6:8e54:80a1 with SMTP id
 y21-20020a2e95d5000000b002d68e5480a1mr6559994ljh.19.1712026638094; 
 Mon, 01 Apr 2024 19:57:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 14-20020a2eb94e000000b002d48dcd10a9sm1562356ljs.86.2024.04.01.19.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 19:57:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 05:57:15 +0300
Subject: [PATCH v3 1/4] dt-bindings: display/msm: sm8150-mdss: add DP node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-fd-fix-schema-v3-1-817ea6ddf775@linaro.org>
References: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
In-Reply-To: <20240402-fd-fix-schema-v3-0-817ea6ddf775@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KMg1zVt6u7qSGUlmtCeLG65sjglE523+Su7Duek1JJw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmC3QLQ+jLSEnIbBzL89+IDgEsCnbZyBOGqsm6u
 eiOKixIszOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgt0CwAKCRCLPIo+Aiko
 1ULsCACMbZyNHRFgqlrjhSLCD6zsjSBKMtiHB3Y4Sxxdzm138l/jFxoyLg5zD8wdbq9BW+Xw2L+
 cCJLYS8zLgr/Ci6iHhegJeU13GSnjlbLt/jbRHE9TGv6f4XPz2oxAedxQE6lP4wKQTPUcnW7u4F
 wo6Aet4hhSqyogFC/eS1kJ1BA9jLPzTl1Optq26Gaw0SrVJ8yyacEjjLdvgVbjixk4uPyhcdQVa
 LMYEwa7oJIdoChz5BmWFQYkPI/ozGZnnHO5AgL2DarN7S26VXKEkVCqzUTlSuyGQg6Acrz2eYNC
 evkg6njzolTOL9X15ccasSHEI1lmgHd13wjUoB1KXLegZ0uP
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

As Qualcomm SM8150 got support for the DisplayPort, add displayport@
node as a valid child to the MDSS node.

Fixes: 88806318e2c2 ("dt-bindings: display: msm: dp: declare compatible string for sm8150")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
index c0d6a4fdff97..e6dc5494baee 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
@@ -53,6 +53,15 @@ patternProperties:
       compatible:
         const: qcom,sm8150-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          const: qcom,sm8150-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.39.2

