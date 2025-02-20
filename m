Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D604FA3D611
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 11:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EDC10E913;
	Thu, 20 Feb 2025 10:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LaUh438E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E4510E918
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 10:08:47 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so1138959a91.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 02:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740046127; x=1740650927; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=meTtqveZhiyJw9ezonjEpVoABcseZWYpFPvHUuAWv9M=;
 b=LaUh438EfKUDMOJTu2j1P4cLtnL/8pbk8+AUqFGFTtfpwaWpivniTaN3rPoU4aCAuf
 ysqekkFMjVRdJijEfDDufnAAWjlEWmeD4F82GIRwZgyaWuZNO2wSwH3QVQ4u7xQ8Xy8S
 GrvN105lcCzl2rAlQI9Pjdjh8vUooUCOiY+v6ZM2/+/jkmjcyCVEcv8GID9RcBnXJhXm
 XNVgsZhhQ3CuF799r8vg25yxlTlfJk3YeLCZi7KGFO493lGpmjWv4oZo4Mmg0T2VLd30
 YHtXHEUjvhxEEfJT1844lfCyup4pvZB0b7xS4KytW0P9J6/jF458qyx+Ze/FlwMrNX6h
 HgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740046127; x=1740650927;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=meTtqveZhiyJw9ezonjEpVoABcseZWYpFPvHUuAWv9M=;
 b=kCoLCGc3Helt/p/7XQ7gGI1B9x6n243aK4pfDe1fWmPJCP3YKhja8ldhxb9+Sm6yp5
 B+R2xBsUzo4zX9PnxPTQ+NvhMQvYaI5YFmXyoQP/DCaIZrQEWB31bDD5Ww+A/AZX/tHg
 JUpsTJo38JXq7A3Pt4WWv6G+vJaiYZlVLnwXpr565fbKo6CMStlsClTlC7uQE82b9zgK
 BPJWjQ9zLY5K52g1bXLCVzJXNlifuJEjyzNGQt6A5D1kCVSZCiR6rDD2b/Pc3n8WbXw/
 aqzj+TW99LpSLs9n6OPI45Hr+GiGTMEAXTmMkTx/jLILATJ4Hsx/WWpWLcsMnZbfpj+I
 3w6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUobVJquQqTklnb2uadDbRXIyKOOigPO5CujslwJeuJJJc92oO7OzXzkVTbvqqIOEvDFiXUC20MBm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN+uGtJ8OvtOE2eCWjUfsVzPHrSFmWQg95ap5GoKogEkBzClkP
 cBQWIKvKHkJjwzALVovivbNdhDkiIdd8UZvIzp7E52vM+m5ljAMYUr+NCN6uey4=
X-Gm-Gg: ASbGnctquq6MOPyq+S15i1K4tGbaDnilQusCA7GKkCXKmffIyk0p8e1zje+NPlEMzU0
 l2cYRk3FlufJgtSPbJrHyKXoDJXm6g1SWbKRh9bP1QXQGQZJG6Y6tDo4o5MuY2xRpjI2mezpntU
 Pxf3RwgvFYPi+EvR0lET0WeojjWmbofGsrMOv+Bx6M+s0xgfYPckUQbJalswE3TYHhJSTnHs6Ml
 j2IRAak/tUhT9SJkT6LBaouv5dqDBiucX0uUB3HRpPkIC/Q+LBoAg8KnrI65xCZbKpNJbhP3HcU
 gBFe57B/aBDa
X-Google-Smtp-Source: AGHT+IGD8wqaCpXBwdzW85qDe+j1va1f9U+T7g4YEj1TqycqH9bnYqKAjfpfwmdIfdAez2gbLo1Zwg==
X-Received: by 2002:a17:90b:3b83:b0:2f9:9ddd:689b with SMTP id
 98e67ed59e1d1-2fc410493acmr28089738a91.22.1740046127187; 
 Thu, 20 Feb 2025 02:08:47 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:08:46 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 18:07:55 +0800
Subject: [PATCH v2 4/5] dt-bindings: display/msm: dsi-controller-main:
 Document dual panel property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dual-dsi-v2-4-6c0038d5a2ef@linaro.org>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
In-Reply-To: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=1495;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=FgJVBSjYusgZgNG2tQQqs/1on/o8VH1/MQqBVN+UdAQ=;
 b=oaEXnf20Cz3Ju+1zO2v+vtkcbrG+X7KDJR0PpZRcUkf0QC2Lo0cvU97aOJrdgq8tfBzlaNeD0
 vvilHqVr9BpDIW2cesJxDngRIMCexsZ2QgBOnuum6tB6wsLrIJuhgMm
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

The DSI interface can be connected to a panel that has a dual DSI channel,
or to two separate panels, each equipped with a single DSI channel. To
prevent the DSC configuration for the dual panel setup from disrupting the
current configuration of a single panel with a dual DSI channel, add a dual
panel property to support the use of two panels.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ffbd1dc9470e2091b477b0c88392d81802119f48..e3f2eabde27609a66d6d81fafcb14e1bc014613c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -88,9 +88,15 @@ properties:
   qcom,dual-dsi-mode:
     type: boolean
     description: |
-      Indicates if the DSI controller is driving a panel which needs
+      Indicates if the DSI controller is driving display device which needs
       2 DSI links.
 
+  qcom,dual-panel:
+    type: boolean
+    description: |
+      Indicates if the DSI controller is driving display device that composed
+      with 2 independent panels and needs 2 DSI links.
+
   qcom,master-dsi:
     type: boolean
     description: |

-- 
2.34.1

