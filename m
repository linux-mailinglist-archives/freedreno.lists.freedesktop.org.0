Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEECAADEF74
	for <lists+freedreno@lfdr.de>; Wed, 18 Jun 2025 16:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD32410E890;
	Wed, 18 Jun 2025 14:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jamHiHrQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AC310E899
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 14:33:22 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ade33027cbbso100807866b.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750257201; x=1750862001; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
 b=jamHiHrQ/Fii+szyHEse+gxETf88g6prsyWypQ5q3bZg69iYEgmyTG/2CvAdSrqSrA
 ifkX+51f44Jxjayk8Zq+hVV+LJ/RF4JyN9T/A6a7X0d0w8gNjAzchftFLI4rq2r0Ofof
 Yh4LD9GCnCzcr6nCE3oMObhG5f7K1Y1kClouLmB5BDu6rS8C9rnrjFDcO6SPdZ+kGtKo
 1fQBlS3j0amZmtYKKNrLtSjHAy2O//xwi8CTga53SlWEeYLlDBn3noZ93knSYxAgvUqk
 EBmkulZ45xfrUnWywXEIwuLj73ybR0A0oCnTN4uEt8a8lrsVHn+d+nbUgV9wXjENruoa
 0gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750257201; x=1750862001;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
 b=r2wwJ1MgPBpBq1sNi5cQINmSkgYHyTwYXmtx49urDAAsBwgiPkpgBEMPBEsyIgq32M
 TGFYt/ica1hDHZ0Xh1GeX6NPy1Fybi/SOwzSM9hmNaUTFvvsIEsy3uCPtzel38CE9POi
 EueJBFoImA1mEZHLBAyLqfAssCVZpUGcMpIQsObg+JkBYRSfX0A8W0pWDsScX7V9JzGP
 09Db/RjabA8ycykUYsTu2BPwQt/26RxsvlDC3lhI5cS3aYOt2V1ceQoGEsrdAU0slzyb
 YORlBxsLNXAxOWAfa2TFT5MMivzrfA8jx14dt9EpEWndHsipLI0UlUE72JMS01UGq5kv
 n3mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEXC/rTYFcJjslmYpylfYDlhUprk2ao2+fuQIrD2rSuEe3KqzHfYN2T8OhCMSPW0Onft5TUwevWVs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVdZBu6dhKJUhfXe86I+tMlqhwvaARctaINdA65F0y5eA+9q9j
 w/54z5eq3PjZmHMI2HWX75RjQmvT9YXLcmEhmaobNoV74ABNLFq+cNS78FxDY+IHaw8=
X-Gm-Gg: ASbGncsZQdUymLWN0LibzcHJCHKReNFFMz2F1aQEhtHQyB/U6J3O0vbS3U5w4BuAOCt
 HGVtkqcMzMt0DX1sMXC6YEzxJFpWIF2LT+kSsvagiEKOrmx8pxkDamQXQ/r13sVUEsGkCnbm/Xy
 YxT+1oev0KXa02/g/ZWCcqD33qSWyjY3MNPpFl8tKd3cCCEAKN9PZgBjKrRfOiSKVg3pCYpew/u
 Rc0+9ZmONDUSDCQCkc10BqtyrwGJUS3uo+cUiRr0cpZCPY44TNJirWpoDM4JU4S7GateAaLS+Bx
 XhsKPdN9pBkEgZW8fBq/nkHh1C6HODlXzow0LlVxGQVfTGxGVB09/eFmFS4AA5gg4ODpsPt26l9
 lJGZrkM8=
X-Google-Smtp-Source: AGHT+IEMdibLkq69DiCOr764wdvjGhak8IP7M8v8RIPciwuAqhI53vGm8g+t4Rk139lqpyLxospJzg==
X-Received: by 2002:a17:907:c13:b0:ad8:8f5a:9d2b with SMTP id
 a640c23a62f3a-adfad54ab70mr571953666b.16.1750257201215; 
 Wed, 18 Jun 2025 07:33:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:33:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:32 +0200
Subject: [PATCH v7 03/13] dt-bindings: display/msm: dp-controller: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-3-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zXT5KqsXrSGK/lPM3MXSFlSxuq5G3CuX3u2b43D0aEw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4cKUra6D0/CzNaFqDGtiSf8+8T3tvUgBKFo
 C54hMLEb0qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOHAAKCRDBN2bmhouD
 13w2D/9cTJQhudDOWWXktRvkWBy6yv7PGTW9mKIsGxUEKcM9Ypbau9REp0I0qwaYXe+VIwV2g+u
 dXyPakTw2Vcqix3mc/2uQvntRTteTP15BfxlPZLBHSNPRgltijN+BF/3f0glhJuEevikMJaKbfA
 Qa5ph5CSbw07WqYLM0Jsm7+M8aoQx4z7fHjYMHyIuDpN/8N3ltcmW0j2cQJGTp9LrQ5J3hN4rpY
 uOzazHduSMi+6As5syM78sO1q47rd7IrIzyERDUMOQmnDPmuNrMjFG8XaHaGNCvwevTrUGNTYdT
 wu24qkYPGeJpC7glZBB0hVlsZItPVrIlNqMCEMfkg04clzcK8XjjxbBolOjRs1J6yIo0w24QK46
 SBfp9HCRFSZBF2bZYywdQjTPg6O4lsv80HWm4QGGeqDqS1njiYVvb7ICOpOJRaryrYcdTlRJutD
 E1KGzzG5VHinLzjALnMWQAv/eBPsrW93ku/n+Zl8EO/otDlBat7LQK14MHkuM+Lfr0TCRjyo4nf
 G/Zj0NBifUwMrFFBjEtkBAKaA8Y3JBHO3DYTGFi7XE4byPRasA9h4lvZR6kBpZBiMf8KrkbDnBf
 RifKT+s1NPPFVz+13otGmBO9LQUIvlcioTDjqDEPlWPIjck65TsoIcnhr/ERj3h4GYjqyYNeU6B
 3gt7dLujgpQCK2w==
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

Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
fully compatible with earlier SM8650 variant - both are of version
v1.5.1 of the IP block.  Datasheet also mentions that both support 4x
MST for DPTX0 and 2x MST for DPTX1.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Extend commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 246bbb509bea18bed32e3a442d0926a24498c960..9923b065323bbab99de5079b674a0317f3074373 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -38,6 +38,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8750-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.45.2

