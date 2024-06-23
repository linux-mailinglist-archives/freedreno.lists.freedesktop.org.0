Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC43C913A40
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 14:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDCA10E18E;
	Sun, 23 Jun 2024 12:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="haTFACx1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0D310E036
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 12:00:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-421eab59723so25295265e9.3
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 05:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719144031; x=1719748831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D5pRySu+ARf8jWv+YeotUn57i8P3KF+qPMZ7wIjslP8=;
 b=haTFACx1p1xFvTBE67WuaBCq7zDCWwlmGqZUiCQS3fDknEuogt/BlFsxFAjbtV4GXW
 WBtkPlVd+3tFXmJiFKYPU0A1HCtG4pIevuCx/RxwRtj0XGsuyVbTVbtdD5Du8iBf8p4P
 qs2K75Q72aKzla7BHGbUitI5rbPVarUIPsKDRMWgWpNQPs8hOQUeSYAnHOlnGClKESh7
 j4pss8fRsanWTkw27FT+G/GyalHsdOWVgS1O7V2T7kYZZC5KhvLGjNqTCF48kpo2+MoF
 J+ndui26NMmyY2ORNTIGQsoaJ7yo1WVy8rvQtivZpwzRIKkkSK/gjuZOvqkt+Hz7TeSd
 /wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719144031; x=1719748831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D5pRySu+ARf8jWv+YeotUn57i8P3KF+qPMZ7wIjslP8=;
 b=B3n1PitL0qS9NAo8uMPVOvR6zjAC1uXAwFVd8cg4Y+sSU9F/qlv6+BDmO3jI3WX09D
 NrOgn/NNVTFNZeBzqkVJv9ttjXpgskiGg8dTv7k+lnb+yO7hwQXxMa8IPl4URAuqSSt5
 G4Wfb1NDRBz/4EqWy7B5HlG/wUQ7tKGr/SMwkrzeLOlhMqlnw1s4OgInGPwtBnbz/0EU
 rh8A/aLq1yGvjVyFBSZ2Ic5JnHXlPztLOfT6KwV039cQZTFnGwnJA+FZHpPqV3ZYq/zd
 Wws4BgTZqpdGKciO3a0tXc/Il92ymw6PRCF6iI6IL5xiL9o67B3w8jJ3t1jFD3kNJVBX
 hJ1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw4Fm52x16xPfi9oHamYYpFImtOKBzfSjCeGZ8KAyhpoMzQyLoGB4+9tiVlhkgLEo+cxYn7iN82YctpwfzBTXzSyJIW/JHVL6w6EfUuUbN
X-Gm-Message-State: AOJu0YwRdrz07Dpd5iRyChUzvCOpRPRg+mFiRxWkq8SEzR0y9GwYxwWY
 t/PpXFRk4ctgJfMrTKlJYGnfzKNICxX2AfGIe6jWMskROhR7i8bEfJwBCnw0Ty4=
X-Google-Smtp-Source: AGHT+IEXP7AJ8wGYP4P3O8ghUgKEsx/NMem41iq5obFqMs7hv1GsRgZtKTmlmuq84/7vHtVQVzL0xQ==
X-Received: by 2002:a7b:c4d3:0:b0:421:7c1e:5d70 with SMTP id
 5b1f17b1804b1-42489e3ab62mr20397615e9.16.1719144031293; 
 Sun, 23 Jun 2024 05:00:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248179d3basm105465515e9.4.2024.06.23.05.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 05:00:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: display/msm/gpu: define reg-names in
 top-level
Date: Sun, 23 Jun 2024 14:00:25 +0200
Message-ID: <20240623120026.44198-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

All devices should (and actually do) have same order of entries, if
possible.  That's the case for reg/reg-names, so define the reg-names in
top-level to enforce that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 253e68d92779..baea1946c65d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -46,7 +46,10 @@ properties:
 
   reg-names:
     minItems: 1
-    maxItems: 3
+    items:
+      - const: kgsl_3d0_reg_memory
+      - const: cx_mem
+      - const: cx_dbgc
 
   interrupts:
     maxItems: 1
-- 
2.43.0

