Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B0EA3F85B
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 16:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A3010EA93;
	Fri, 21 Feb 2025 15:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u1RSmE4v";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CF010EA93
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 15:24:56 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5dc5a32c313so409379a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 07:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151495; x=1740756295; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ve17j3mm/abtdUOwnmohJ1b3/R5tZ1e+gOy6d8tNk6E=;
 b=u1RSmE4vWWaevnJULdD2FWAfnj+u26XVdKM2GLavdX6mAHYHnPsczm0lF6H65N5LN+
 tdN32mNv93O87REXTh4HBrqALz2Kk5pF0awHMA6JGCz6xnwmU0C+S5FDf2Fg+8ozRSXn
 Nw/08cZGpSezZ3k/JSzU00bmD4S3VXPJrdYcgA8HcBBZ3sSmq5ySZxaSU7i4hLe6LlSA
 qZV/GvmHc2yQVVS9B2D+eQXgXRb7PtdHbg+O+LkG8/I29FDZE2FXtejpJBGIBe4OMrDf
 UNoWyS8tfUMxrEsqUpIWI23YzdsPKJq9+qV85YyX0VeZY2RZHLYgv5OJJ2URQfJe3CjM
 3ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151495; x=1740756295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ve17j3mm/abtdUOwnmohJ1b3/R5tZ1e+gOy6d8tNk6E=;
 b=hDVjLhwcj8siDtnHTmQAo5+IBEBDOa1B8q62Oq/x61Z6OkcIHn9gTegVwfc1OyBACD
 sV3PO5A8NyxuFsfMK3EiEOkRPLOE0GEzGQ2IVRBgGgJIxn3fZ5gNLk8lVPNhc/a5sqQ8
 F4ZsAsxkl8HGXN9oneEUrGY7SmHosXEk6FqUxoofgl2wJbO8Dy/2S6+fi3Hsv+mFHhOh
 jqWJNEuumElAFB86C9JtFJRB7pg/zTH0S1m48ZWNSdGjonw6yAruNC9mWYCTkmSwodXS
 cCql0PSoIe0YoJYaLo6O5DTIAU8RR4iHeLg4ahDdSDB2t2PYGGCSGX7K1XEMJ/njiE/O
 TCOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQS1u0NBHeMy45iQYHmWM6SLw1MHXF+xNnUPzAL74pvW2v+feaeObuXSlGqNLB1UJSl7Z7Wy9rTBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySJiABP0XZQjwZcpvCfsRXrm137FDZBcydYsPvZXMcH2D336SG
 aY1tGYr23iSkwFsfk6BhC+w1unzsOVGd5u29FhVzCyB848knXWPjSZYlAPVpMbw=
X-Gm-Gg: ASbGnctmw3zF/WfNmLvXJf+CAZbehjfqyFCLnCIBkLF1mrsT6JVagY9gUZe5oDXSXxs
 dMpUoZe1W1bvEToy3cScxgUB4aTqstWISyZSD/mlCAYCQKicKpzDSUiAxdgCQkhV2omiAxY/9rk
 KBvsvKW6vpD2sejka6IIO+szg/Gy7UlkKRVob3lMNJ3Ssbu5y8AZYCJ/eywk0gxsJJJ9hIVQzTz
 QWf2Vc6l7OtQrIrublgsP7z9tyXHMn6ARbwn9FIFTftG9NXs6NFc/A3nWzRm10yn3BztiJKRF1T
 izLU++2Vo0xIU2TfjTlJKdk6Ky6UxBBP9356JD+LNMKdXNGtLWkwQvIQpdGwGRRjxkoQjhH4hwD
 d
X-Google-Smtp-Source: AGHT+IGThcFZG5h6nyf0Wo4R9pbuzagN/g7Q86hCwRQ07ocY0fsI/LnRjCQ+ln/jckB/H3+qTrieVA==
X-Received: by 2002:a17:907:7f17:b0:ab7:63fa:e35a with SMTP id
 a640c23a62f3a-abc099e1dafmr140767666b.2.1740151493681; 
 Fri, 21 Feb 2025 07:24:53 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:24:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:12 +0100
Subject: [PATCH v3 02/21] dt-bindings: display/msm: dsi-controller-main:
 Add missing minItems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-2-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bIJmVQhUPgDWhOxkXZXr441zWOXIC11HBHyQtQ4C9AI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJqtl/dJu9saPm64cDkotdIPNx/NMuosAvWNm
 I2ba2uSO8iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iarQAKCRDBN2bmhouD
 168UD/4soLQMowTp96PKFERzDIPLIBRahxZNBzCNEQBX0rlr1gS10d2jJqUplfH8osgbTis/4sU
 R3B15+PKFAy2ol7Fb8eO9svK7dbJWZ3aNLVQ1DjHKxryodaeai4UhmRFSEe2mVKoVncQ5Phdzi6
 HF9gJdr0ptsIsalibfNCEiXevMyu5rBtcz0TsmeY7BimEG6qWlsuWYyfclVjAlkXHMsV4LYl6kY
 RbqDDsatU6wIw/ft8Z7Rt/L4MjKrF0LibxtmKdp5hTXi10by2V2PS05ysEJ37QUzFvTntouZMPs
 /35sGIrCSBFtujJ8THjXdc3n4dL8ifDigHXraiOa10Qbe4C46tEFP+saQYBKMwr4I0KMLG9g4Vh
 PhhSva15QOGSw+83ZVNv7Ozu8sZDcwd3OYaeMn8tK5bONBjSKCJacXk607YFllITGbV//rJl05j
 J7sUmaG1jo1AYlUeGRv8QkFNqh25b/z7Ir/Xnd8F4u53RnOjAnFCBIIQuk1pB5e/hAqXvyfCrxS
 hm71NzAq7XTyR9gU06Z0Sl9lJAnoEkGUck4PkrzQ99FRsOrUre0qDqe7q5Zyai9viRPuHnAyfSk
 vYnIZyjYq3lg6Mr3SvySVbMx5blM7ZgW3u4rjbA9XOyciLbs2m4DdeLuBgket3YHcCEaY5qeMta
 87c/5O7v0NKq0mg==
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

Specific constrain in if:then: blocks for variable lists, like clocks
and clock-names, should have a fixed upper and lower size.  Older
dtschema implied minItems, but that's not true since 2024 and missing
minItems means that lower bound is not set.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e496e5430918d54b2f07f1d5b64de85d29256951..2aab33cd0017cd4a0c915b7297bb3952e62561fa 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -231,6 +231,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -253,6 +254,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -273,6 +275,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -293,6 +296,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -328,6 +332,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -347,6 +352,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:

-- 
2.43.0

