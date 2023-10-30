Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D17DB840
	for <lists+freedreno@lfdr.de>; Mon, 30 Oct 2023 11:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B3E10E293;
	Mon, 30 Oct 2023 10:36:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018AF10E292
 for <freedreno@lists.freedesktop.org>; Mon, 30 Oct 2023 10:36:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40838915cecso34089005e9.2
 for <freedreno@lists.freedesktop.org>; Mon, 30 Oct 2023 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698662205; x=1699267005; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1jJA6FvyzBdV4oaFFbQEfL8vLOpiwYy2jt4W5/R0Bx0=;
 b=JK+2u6asVdl/fl206AqRSY8ASosjbvA26Pu+itlgFF8H+5pbUYrfZSZxO79Qs7HN0b
 CdF1pqWnXd1VKkHN8uO5NUDuyD868ZAyqJT2nGt1ivzojqlAyBGJVP8EGBHqQa7QFKJI
 BvdBJwNAiSaqCDABoQa61XLWDsunNVx+4DyJmFn3Vapv0tynSBQ8g+wgQkuGmIxGZPLW
 CVETUD3601skCLwopOd+ruXuiJ2tDQ3NAM+TbER/uZ3TJGL2wTs+mx+/Y8xNEosZ4f9Z
 uoIygwLDYjSSvyfMe3s1BeA1bdsZruOls60dXNRD3auic/p2d01UjtqVy0PAlidwVctT
 8/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698662205; x=1699267005;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jJA6FvyzBdV4oaFFbQEfL8vLOpiwYy2jt4W5/R0Bx0=;
 b=iutyV38678sE8mNp+1QsPxWYwXZrfmFerw1Tvas+YQksqdkw91OnNXwFBrvDnYJEKk
 EE1PdAf3PplY8drRXaHzElBPJMpmK5cTnj0mqxmuHLvgKd40Y6HZ3nXrYAfkkHBU28Sm
 UPcbW4e1NCsNvjFgSxRrzARqQwxlCaxPQCR3ADjJL8xUVg6Mih8cPYH5x5lUePT/maz3
 +W07ihhQXLe/Re1IZLK9j5RoQ/78yVFEibZ9cX3zC0Twc3DvVi4B8KLQzQYMCNopj5PG
 aFTEyPgJSsIuePB6Q7z5ihwPacUOgSZhCxgVVkuHbZXJ29Tq6MddGZ/O69UpUBYz0Q5J
 6/pQ==
X-Gm-Message-State: AOJu0Yy4fOb+BkC/ijGCc/9ibiTBT65m1k9c9snGf8GhaVD5/4Onl1ks
 CcC4Pqzdm0rbBdFGsN2VAsJmEw==
X-Google-Smtp-Source: AGHT+IEeVna2B4vgqYf3qgMr60NDi22xHHrS6/BBHHXFfgvcpqpbfmjptxClZMjSiCnTSyuKvx8Muw==
X-Received: by 2002:a05:600c:548f:b0:405:49aa:d578 with SMTP id
 iv15-20020a05600c548f00b0040549aad578mr7921279wmb.37.1698662205383; 
 Mon, 30 Oct 2023 03:36:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c458500b004060f0a0fd5sm8783209wmo.13.2023.10.30.03.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:36:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Oct 2023 11:36:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-mdss-v2-2-43f1887c82b8@linaro.org>
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7BNrdKXKV/4oNSNX94Rau4amrT1G6Ff4tZmVAsgnGfc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP4c2KiuBCvGC/0B+iGFp+H3PYmMuJgRbWk6YxTEt
 d5YR552JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT+HNgAKCRB33NvayMhJ0Wh+D/
 0Y/5gtQcRq7vuhQwuHw3AnD0Z3+L21BQKv1jHU6rRC62TGX6Am6cJNJo38ALwbPEI6Cll7FN9Bsf49
 zcRXYaQAEWcfYEWuB9dk9TYazLbdfTtOkvuWPZXAWaYLHpTn8B0aSdL08FUSdRdA6KvAEVWUSpHz6r
 Frzzt9SjZ9VWjcnHXv4ilpHjYE4JIuiQ7/jKVES3pi1CLXfwqR/nv00D5uqGc7iIqXQQrLXE5MXIBB
 RKceLx+1k6HLGnud13rE0ecpezq2EjMkx3yZdha7uXopPs2XzopoHSSaH11/hgp7XhZc6G3k4/2kdP
 XuaVrbh10qQ/2Z8dNc1bnb1crxWhkNSRLUEpHNCjiY0jeHm06aR7kwoSrTpA7xyHcXA7kKw0jUaRvU
 dCS5yUqyXOgzAjZ2B0elg3fvc17V1jmHUmUpNbNQgjfuj6+K5JT5faTMIc5rzOQ5apTI56Oi541raj
 wZdl96EkyURlFGTNVuVN6LWAnODDsRO/TfUDG+hd0f4yuu6acITm6wSlYMGY1K+vIHdBIEjwva6gWz
 tnH4sc0NNFMUrJU+Hr7r/X5QFaVgc8/G5chL23Z+yPgV7wvBWditnlIGIWGLnToxw6YkdV+3hdG+H3
 bsaINBAvJ/Tb9h5oWyquHx7g8WMwagk3ST08WsCdYI0I9+SKQd7LzuReIFSw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH v2 2/8] dt-bindings: display:
 msm-dsi-controller-main: document the SM8650 DSI Controller
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document the DSI Controller on the SM8650 Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index c6dbab65d5f7..24944979d500 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sm8350-dsi-ctrl
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
+              - qcom,sm8650-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
@@ -333,6 +334,7 @@ allOf:
               - qcom,sm8350-dsi-ctrl
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
+              - qcom,sm8650-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.34.1

