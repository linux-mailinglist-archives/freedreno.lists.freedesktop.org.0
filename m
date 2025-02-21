Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F7AA3F85C
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 16:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D70D10EA94;
	Fri, 21 Feb 2025 15:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wnPd1mJv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A56110EA94
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 15:24:58 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-abb9e81c408so38721266b.2
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 07:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151497; x=1740756297; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2YV1kRNxec3hf47euA082/GCXKE5VaU0R53exCWfzts=;
 b=wnPd1mJvaXkux8UcOESLMKkHzesnFesmnK1F13vlQhMSk1wm9rGLUkygwJC36DRzK4
 XUVc8Iv51Pp3FOzgf9qEl1VTXD4c63RCCQyE6IBtLSoX1VC8ChJtr8XKnwYhH/GKU8CM
 9V2XTgFcc33vcmBW2cEmzxOKWOmjsgos0dgtHwvoRRL8NYclvPz5AZyfKY/g1h7sPngG
 vsvBFQWwPfyUWvmKXZx8QPzaWoEFD5thA7Lw0o+ecA5ie+3vBhK21hBpU8GK6FN8TEWZ
 wsLIxhKTTd4REhneF2mlh+NizMrdVAKnUZH9wF/pHO2w2FuClhrS6qb+Uj9L5BViRgPz
 wsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151497; x=1740756297;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YV1kRNxec3hf47euA082/GCXKE5VaU0R53exCWfzts=;
 b=EUsrTlLXgDLCF1YM3kYAn/zaKptuSYi+TLbwh8jkbosFFrK90yeCqhIVbppmCttllt
 v+uQXZ+k7gN472amM7OOyE2rVL9H5vxQTcdaTDHGchPK0AplIIgWsCTHIyLJ2E+s/gVo
 ygjRR0PjGcjdZYVBR6P8YF99bE+KRkB/zaOhX0QakCOTFRTKZKsps1NYb7n6saKw1/Ni
 8pK4KrPFRh2a+eyzqiLjRI1hVn4uKLjiT6BgVyUKWrDNwTa1uyi6sRobBW+bKLPxoC6W
 EjTVdaYktYrGyQggjMTHE3hauWmE0PwVHHWCC8/UcxDY/19Cf7WPec4oVuUpCQ/fFmMV
 kWmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP2WuVqChSw6Q+eB1exlJCB4eUBbxcHvEFIrhitTLrdnN4rpmtPlOd3NRM57exfvhZoZcwKuWRm4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7WtODTEEc1Xn8FbcOpNwnotOvieCURnoD+x09eknJp823F2zj
 ztuUjmxObWHnJMx8KfqFnp/Pco3QaeEgOmUxf9CGaFGegKnZVn56XztUgCrnL4Y=
X-Gm-Gg: ASbGnctFWgsVrMmp3wlPeRlZquyX6nXLMsOZVRJmmwUd7i4xLTsmwjVAqkLJd8zBShU
 dFLrlshldDrhNjUkhcjct5orImnUh5qAVC4tw73+7RP/JtdwgH+u9PWAQeJLU5+P0rit3EYi9bZ
 yYfnXNr6iNvhp6DX2SVOzS2SuWLSabMWLEYiw2RNheKv0vAUhQmu/Bmis8lzkdEgS7DM+SnSjRA
 TlTo1B2bt622nOQKK9LMZ2W2FrneztV8Z+gddVCJ+59pTEcR4UdPyz5mTiYurFpUnG7J6z/hygm
 7SDiNUfkfAEmUgUr3gfkx/tnQmq30nXsF3CuT5ooB+Bx5RgeMIl3rkGw3wXMEnLz37JAdIJXwZg
 L
X-Google-Smtp-Source: AGHT+IFy7EJuGr6YFVXKBajfG+1j7y8/7XeV4koN/V1krFCJVQBIIqPb4EzGvROCXQyRnjjcFYi9VQ==
X-Received: by 2002:a17:907:1c0d:b0:ab7:c28f:de59 with SMTP id
 a640c23a62f3a-abc09d2deb1mr120158266b.13.1740151496644; 
 Fri, 21 Feb 2025 07:24:56 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:24:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:13 +0100
Subject: [PATCH v3 03/21] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-3-3ea95b1630ea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=g6ZcIsYl2/jMWfZyQs4pXVAtZzsF1td/uQveud5buEk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJquIDPKcX+Rx7v0CVf58SDbQy7/9H36p4/X/
 QyftRnNPe+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iargAKCRDBN2bmhouD
 16XdD/0T1kAqTkR8/1WysMoQpb12phv708f+gdkkG4acV50G9LWjjqz+b2Ded/v8aPyeo+UTkA2
 /t4MDCbN28qtDRJnlqyQfB/SnUxsBePMyNVKJ8J39/4FhyW0EHHm5aFJTGSoBI0WZYJEjoz2WIN
 ouNcGnvv4jN0SSe0abH0SQMf57qDYiDy09m0gVfxJrXCdlZjFaf1KsCy3gQA7Yj0ZskTbRl9up8
 tOLm2OLtDMa3GdZ8DimxLq9iT0qTzXJETfBaCQwptWuW5LbviyZ3YrTH3gz/afgIrjATO0q1p/h
 I4D3ZbeZokDfAvu+bEmXFeHeym1hu3gbSIaBrjMwheSryMTruJfoYmvmtOM1vUTAVupDGg+DLOg
 zk7pAt8Tn2AeuuFVk2qXVjxR4aJYD6AjTUTToZukc1/xeYSJnG1aIDCdKksNufm2LnKVn5DD9lP
 NRU5esfanBdvwmUvDpivrs6BDEFiLY/eHCHhjOTsVWs63nQ+Gf0aV0kvKVjtnJGZIPwTvhsMlM1
 zi7s72NCqzbxD7dHbeS0LOEf9Sxf9m2EiUvFnJeubyWbIE8KwG0MWnBqnEycbBaXiwBMh2BjTZB
 KUKyfNPhkOIRoWP5Mb+mq+i/786xSoWann2Y9gDp4MPmLVE3estoqc2ZcQUrs4swL9N9zE2aanB
 +pisvvLP96aBSaw==
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

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.43.0

