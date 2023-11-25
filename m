Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AA47F8B68
	for <lists+freedreno@lfdr.de>; Sat, 25 Nov 2023 15:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD1510E2C5;
	Sat, 25 Nov 2023 14:18:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E36D10E0E6
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 14:17:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54a94e68fb1so5725848a12.0
 for <freedreno@lists.freedesktop.org>; Sat, 25 Nov 2023 06:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700921870; x=1701526670; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eqbb19oWFPD8qDhmzNJu7LExFvnUbJSOuyMJKMhlgUE=;
 b=R75CtYqfl6UjfKKWmOB+YbNM0pU7bRfUNmVFAbrEBP29VkIJZ4HHTrl5xt8RbWTuzW
 n43SW7vzWrXlflfwytfdYhyt9UIbzrxm8JDye8CYtLOr/Y5ILLdZeN25Bzx2LtMovLlM
 ELfTu9p5AyujUgnUvlyZRhvQvhbNIio4dOSoEs2MH6raux2jawk3zKYukP93UQSumHDk
 4VHPsiMPFdCnkBVgpXf1mFDZlRzBf2rpfoomaqtrbLdUlTnQS+U9nQKpULOzmQYYTbyE
 YRSpZzQDR/JxlBRi/ud6JklmdH6JusWIF72rOECc2qY62k7SYkAeT5wjB6ZxeCAqaGZD
 xBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700921870; x=1701526670;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eqbb19oWFPD8qDhmzNJu7LExFvnUbJSOuyMJKMhlgUE=;
 b=EpWHhtLVRx5ECvRPovqGu+cTTEv0idtHbW1eUhLJwECgnguPChc2NSCbhlI4IBKgCV
 U4DJ4hx1Ko0WmbaZ19XNt4XghbfMMXoXyml5398kcZzcMdlsm/5Ny5SIq4eG4c0Gu5Et
 +Bjjrddp3jioHRVyXiKOPonuBSN0E+XPK/pDc8ipAUF0bxowFncjc6iqa/bD+KZAWdPR
 Ol1fAYz3+V9H9gkkwI4oOAMJXChcbJcTmBXJm3Wygua9vETqCkLtHAEoTBjP8jk5ft6a
 IbAAxYST58tyB2lcnktJ761BYxRc7oZz/lzZdIo8lkSVfy7J62Jprl8youTIKmsxquhG
 HoAA==
X-Gm-Message-State: AOJu0Yw8a8YdEb7JANhf1WqP75NJH8LZZW2SCVwkWxXZtLx5a+9KOzg/
 J610b1Be+gmCcgrOAIs+Fz1ibw==
X-Google-Smtp-Source: AGHT+IGR9tBJZuW4Oo7JUrMEGXAjwVM/uMciWDFiip2iKnRP19yE7RUhPP5bwCFjfp39Yo++2RfLfQ==
X-Received: by 2002:a17:906:b298:b0:a06:dd05:d695 with SMTP id
 q24-20020a170906b29800b00a06dd05d695mr5854984ejz.12.1700921870758; 
 Sat, 25 Nov 2023 06:17:50 -0800 (PST)
Received: from [10.167.154.1]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170906319300b00992b8d56f3asm3500345ejy.105.2023.11.25.06.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 06:17:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 15:17:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v1-3-11d71b12b058@linaro.org>
References: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v1-0-11d71b12b058@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700921858; l=869;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xDff6gIDu+CTWuVjzt1GPZpEINlhu/tSsPBU3gWPnHA=;
 b=YmejfvEjbhNqruT3MXv+XMo97zWiskf4GaKaxji8ggapDZtFzdQgC4kASqndzOWm+67Y8bFa6
 0FF93EB3HtBAgsjYb/KgoXzUsvQdlOPj1tPFtCY7pLo2Hh+D+dYuzrA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 03/12] dt-bindings: display: msm: qcm2290-mdss:
 Allow 2 interconnects
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In addition to MDP0, the cpu-cfg interconnect is also necessary.
Allow it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
index 3d82c00a9f85..51f3e9c34dfb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
@@ -36,10 +36,10 @@ properties:
     maxItems: 2
 
   interconnects:
-    maxItems: 1
+    maxItems: 2
 
   interconnect-names:
-    maxItems: 1
+    maxItems: 2
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

-- 
2.43.0

