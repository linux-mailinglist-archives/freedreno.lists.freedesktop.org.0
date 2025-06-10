Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82689AD3A46
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 16:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B7C10E573;
	Tue, 10 Jun 2025 14:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C5maG/2J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E89C10E56F
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-450828af36aso2629305e9.1
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564376; x=1750169176; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
 b=C5maG/2Jz7SITO8V8NWIORhIFiuuSPWT0fcKileWvroZCS9LXfIToF20DiqL6mjweI
 VeQXx9OeTDMomfvq+r3NJpCM8v1TuoxTGI+a0piwy85oBQv6HWBRU9uNJS8yQ0/wuFw5
 4CFnOOmKizIYP0dbQjbm/GX1HkTcmuWiNK8YSR4ygjSCgwdcIunvuFNrG5oKph8S+Ofe
 qAQoWmqGh2QEiZjmM82bqJ6nbmr96q1I3XCH14IL1/NuW2kY6dq58DyzuZAAPTc0ds5s
 jqR3bXYboczq+oj55f3Gp+1p4dTRHLLoCCNqYL/DpacDHEuH3r89pQ8EkBzqKoVGJ20U
 s7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564376; x=1750169176;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
 b=ojFmcZ0MUMafzutG+dogSqk60Dk0MzZbUTfbGjbul3hRYrh0Bb3lqGj+KfkKYznc+l
 HM/UijVjzB+2WwFu3xSiDV4LjZisUl0q4Egv9kaZqdXEB9CEwetIbChgD/8gwgxLLAs3
 PlXtSoGAcIC+SoJncHeriCtAzsF8MCEnXsBZxCvltexTA9+9HrK1uGuJcSa2hvPGN8w3
 uBHFTRsJMXeSKsKhW2lUzyb32DEB94Dty8ES8PgjK7lBymJOqZ2bmf6VBST6nprE7JoC
 sNEtG8uSQp5m3Y2l47WKkhICTzTzZNMz1fCzpB39AfKpC7GY3Es0va/6f3AqgMkg0t+Y
 1flA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXifEtDB3be+yBruh6O8uAivOHCudBWu4ORL21VeK1MsBu53bh1k+4D7nQYrdq9ekkwjlmAF3J/5Ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFtk9bdUM0MpTPFdnGzO4Yjl/sZNyd+5EgnqBoDta+zY1TaFq/
 JnVowtoBPa2dmJ7gAssXNzXcJN8MfTn5QILSTC3BIYLKzRekROIv4kQJ+wV2CKwUY2Y=
X-Gm-Gg: ASbGncty6bXihLPljH6NMKd4qKfTs37gtwNTgjkodoyMAh7KkhYpJeEY1AikeA9jvXG
 DVmIffve1eGj6/ziVDrYaiZ06iF0avEXytPzINSfuN1+AAyayfCW0ylBubILfxmPM57yT9Xd2nC
 Rj8pJlYBt0SJPnKWHiRgPUOE8W25cx9nkaiejUu4OprTAW1nzrra6lsf6nlOy11XA3Xh920LeK8
 pESBLtWJyv1D4gryY4vU97BCcLB3/QqHicIQxcrYigy5LsrKs7PPsAGD+Uj4yd4nmQ7naRgVVHF
 oVtd8+CkPvbBdJK3PhiIfVm7ttjvRwzs0niG2SmuofPhOCZ9d8x7X7QoP7+XObQ38ML3hv89Wwv
 AU1mXDQ==
X-Google-Smtp-Source: AGHT+IFm9QPIPtKj88kCIYqZXKQx3x9C5G98AeBxEuV4QWyOUJnApYLXqRwTArllLYrUbNaqeStteA==
X-Received: by 2002:a05:600c:c83:b0:439:a30f:2e49 with SMTP id
 5b1f17b1804b1-452014b3cdamr58900325e9.5.1749564375620; 
 Tue, 10 Jun 2025 07:06:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:41 +0200
Subject: [PATCH v6 03/17] dt-bindings: display/msm: dp-controller: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-3-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvBcBnYyTfiL8zs/evhNuS7T+Hr5JIuH05SG
 aYTeABkv3aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7wQAKCRDBN2bmhouD
 1z8YD/9Hu6oG7XIW0TSKmpY6kmKcXGI1YkCyklXDyNvXdkTDAgAHII8m4k/zWtNiKHPbPrPJu+x
 usF+MqYI8h1uJ86crkJCdDy1zM18kr23DKFG5+3yqZfWvSKjl47IEGTXI5/GgXc+kG2a6FdaY37
 aMRmAESSmgTUn2ZEKRbB45pSSKIi2qaeegOP/xNPIIp4ewm/YmRNGvj+x69xfRkFE0BDpFjfurm
 jdsvopb8XV55PqRtyGqWXf35CdZEB3a91avjTgY9UERXzpqMAGdmokzeKoCqIrDgtb5RobQ5T4H
 Nq7rc4co+/qkkYuoSSqedmGU3ed042KVcp8OHlnR7CEP97Sx3FS3SLljZ5OLlcbGIG/+j6m+Lpn
 EBimXHouJrsOev6ogYy8x62VhpUSVCoqan2YSM4pVcJC60AJJEpKZALYUIpIJOrYeC22QYdd1/Z
 V09reHRMtJ62QbYRIM0zDySRN00Ft+b2ouxVTP7M9FSyHsZXorl2lSeM8KR8q86IggLVu4yfwrV
 O5V5IK6/JMwY8yVMzAItlxEAjZ1QH/LEc4F/I2zAc56kin0i5Fzr+pYZRUPa+SrS2T7wE8hMj5A
 VnMP9+5n8V36v54XZg80EriuA8Yjvfa2sPLQofwxtlLLxKVbv7SQfj7gJsLOIpM9Y4R7L3gB38G
 9NhjA0CTiCHMoWw==
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

