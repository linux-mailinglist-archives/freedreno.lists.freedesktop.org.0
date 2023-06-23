Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A570C73B74B
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 14:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A375F10E128;
	Fri, 23 Jun 2023 12:33:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C298010E106
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 12:33:01 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f86dbce369so701766e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687523579; x=1690115579;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YQEt+HP8sI4L5ceVsraX+/+4HYSW3NhOd+s+bdmhIO0=;
 b=l6qOUu9Wy6NI8a2BsY7qxJh9ZM7gCeKMEjKVqz5DRXTWv/37OOltM+ggF+Q+xxIAJO
 NZ1dWxnmKi8QObu+JGNeHY/eLpmeri7YBVmodnEhfNkZxUUrsXFp+iLdS1ge0q3GFIrh
 68HrGF4mc51qyUc4jPY3iFCuVW/1xNf5PtLc1b053d5wXCBNiC3yM9fcJwmy5wdlmHck
 YwuGuqfql0Jjada3/P5ZJXoVM5RaayVIpzPz1neaqHmqcAEyQiyQ1VBe4CpgILNY/MHh
 X7Vt3x527v8Nqo1MNVGBuW341NEb/YDpom5IoXm9OEOeDCyOM73Ghy+VZjHyOx9KJuWc
 UcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687523579; x=1690115579;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQEt+HP8sI4L5ceVsraX+/+4HYSW3NhOd+s+bdmhIO0=;
 b=Vv/vF0bShtWtd+f81Ah0pEDZtULgieKg/XmUh2R+1U2vkytACPYWnE6aCFRQfsFF9F
 iM6fMKnM9Zk0OZAsymBaQv8r0q4s8RicQFPdWPu6taCfyxHjZgqOge2gJNBtrn421rhM
 LqBWtUrdXqVCRzNhnvdi4sGrGXnhEiGWy3qlc4ZP+XPw5qpbkXxajZiKGWMl6Q0Cw1uR
 OSJuJXrg/+VAHDXJDhe7PKf6Ig6tkzLDd8ZtUUG/wUA6I9P/fo92MDwdkj+msv4WBFo+
 nDZlDziohdb+vO+SOFX5GyHfDDBVIuGWsHuS38ZNWu0oLs/e4rwmdAyRHW1K0iRzQQDe
 hIaQ==
X-Gm-Message-State: AC+VfDyQj+KceMqvJeWAgSwZtfskNKt2bsGKhqitfW1UyaYW481jiJyX
 6iIa+HlQyDhIXaNgghUNX42t2w==
X-Google-Smtp-Source: ACHHUZ59xE1E3KPbbKuZYI6nc5xHFowkkmZ1A9Q1puNUkod9CZX5v7gb1W6qeNmDhHnVzqH1BqO8jw==
X-Received: by 2002:a05:6512:60a:b0:4f8:5635:2ccf with SMTP id
 b10-20020a056512060a00b004f856352ccfmr14471842lfe.8.1687523579366; 
 Fri, 23 Jun 2023 05:32:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003f91e32b1ebsm2228105wmi.17.2023.06.23.05.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 05:32:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 23 Jun 2023 14:32:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-2-733ed383f6b6@linaro.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v2-0-733ed383f6b6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZmJML2xSNsOPOsp/SNxJ/3ST+yhOUDBTapGit81JMzk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBklZD2D71XGkraqcbQktU9SlBC33uKbTxh7T3prZzj
 RIsrdkqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJWQ9gAKCRB33NvayMhJ0WR1EA
 CuMeJ2Ji/gHnLA8dGL+Ait87jNVNdLYWQM3nn6NOB2Q/Ye4nHaNm8E8dy0ud54cXok5hN4YH4NRRMA
 aCNoQ0Uv0+h/IjtT48/8IGaD0RCS6vBaCm3jAvGrEFpewUTzxRAYf8X1RyNfYuoHnjpWHl3Wds2TN0
 rxGpdu0JOi0veMsrQTGLTVAdgEiTUuWtpZyu6JiA7ZoVQV5IFRFEsFFD0WCv0ELQRtDvJCxYsaonML
 wnA2VvEtFMgI6/OeXMgVFYef4r5VH+CqGFdn4ytF3LvDJmKX1FcvMp25hItVU91o06GsvtOM06kDTI
 ukmMspTGlE6wk9XzhYt0YjfzzY19tRf8iGNaT0VImlFOxA+67QRa3Vr2i0FMaf1PEoRMhy5jT/5hkN
 3a/OCfjCQ7cigQ5J7WJjhcXD+hHeR4AVIKWAkaQUoCakcrG1RPoAqXrRLj3xa4VRSDTpUScp8GaS0t
 huyT7DXSo/DJ9Jq5Y3Xh4onZUN6bGuBbaS76feXpj/6FkrAaU6+IH8K0QyeNG4oY6PKXZG9YeWXucx
 DgrdsdIbmUaoh0/g0tPIyztSQ+MvBBGqu/ey6CwLFU1KuH2+Pl9tySPNAPhoQ3HlFNj4mq+QnXX8Kc
 82m57oJVdIAwYAaKhAbBeeUxqTGbecJX7c4ztrerzqvCdoNFLAA9SEnxqOig==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH v2 2/3] dt-bindings: display: msm: sm8450-mdss:
 document displayport controller subnode
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
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document the optional displayport controller subnode of the SM8450 MDSS.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index f26eb5643aed..494e2a080e99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -42,6 +42,14 @@ patternProperties:
       compatible:
         const: qcom,sm8450-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm8450-dp
+          - const: qcom,sm8350-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     properties:

-- 
2.34.1

