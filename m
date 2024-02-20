Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A8485CB20
	for <lists+freedreno@lfdr.de>; Tue, 20 Feb 2024 23:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135A310E5B1;
	Tue, 20 Feb 2024 22:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TGGwrBEl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D0810E5AB
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 22:50:46 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so505046166b.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 14:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708469444; x=1709074244; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ct5Ne1tMeLUfljWIYAQa013IeOBu49T2Q91/xNCEgqg=;
 b=TGGwrBElqNGXiVObbJtgsB2UL5tpvxoRRjnAhAAQbcH8gcwNIV9gyjEPRI50APD8F1
 RGVFDcFmk4drneByQzpMr4StjqOU+KNEyfd21vdT8xcdaCkDD3WrXf/RPB1E4u03LXQ3
 sjsSIA2w0EOtFymM5zFojOflUMn0Pl7Y9PTr79HU2+Luul0UWfd0qE94dcLpP0VroG12
 OhXHAjnO4AJj6PcjanDqwqu+Ghw3sJQyAyaiZbFEZDpjfcmYXMKrCIAPiuChbtjcUse6
 Jk/ePijiUgTGQZogsjTZbK/sFDn4WSbldzUOsu6bC3/IWtBjPFTINu/58HPQlhzVQK6A
 rL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708469444; x=1709074244;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ct5Ne1tMeLUfljWIYAQa013IeOBu49T2Q91/xNCEgqg=;
 b=uVnIiU2QRWF+Kr3zCPSBWlWlXukXKR7Vspg1tsIkA3DJF9DYx4CoB4N76Y6rNUHHca
 wqWlJrgxImSbkYuglLiFqOsPKXBIVEQNQv0E26SrWcFyc9xd0ZFj+5149mCtPnMfXBkh
 I2IUEm9I24n1pRmW+2NAxWI54ZlFCOktZ7fqF/WZaTyLs0X0Yt0rYZ5H/k1etcIyCZyA
 4xjVIcAHUCMqy/fWu34Vdyz3WsQPdd3pZcaF5PGWFYwn+G7GKj9HuxBrWSkCpe0+Mmlx
 GI+D2O8X73YcV0foZzQzYhnMmAwJjl/x3RIkaP70h4fLXTqtB6IycBmvU2bV9lCuYyUR
 k1iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMr3jJAQbBtglxY3KlNaG477e5KCdrycASl0IZsCqU4dWn0i7nsVtdj4p8nXkMvC2dSRO+n8kd4/f5ghqrZoWiXTixk3zMxdbIh4HomrEC
X-Gm-Message-State: AOJu0YxpEQuob1n+DNdhwkUdd7rA2XlOt2eZmHha2NSpuzLVPhp+MNEV
 pEaXY0OVs48wjYnYV9DCle76OIAr3+dCPuIH1sTYIPbsNdBquiZBtpRL5t6CKFI=
X-Google-Smtp-Source: AGHT+IEPbjEuAMs3AWdNr9qrKRwN3dFaeag375cc7XhNIhuiL0+iZxVkSGS3I4IiNQG5WZQU1Pjs0w==
X-Received: by 2002:a17:906:2844:b0:a3c:4b73:e3c9 with SMTP id
 s4-20020a170906284400b00a3c4b73e3c9mr15646194ejc.4.1708469444059; 
 Tue, 20 Feb 2024 14:50:44 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 g3-20020a170906c18300b00a3ed811cff9sm1601977ejz.154.2024.02.20.14.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 14:50:43 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 00:50:31 +0200
Subject: [PATCH RFC 1/3] dt-bindings: display: msm: dp-controller: document
 X1E80100 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-x1e80100-display-refactor-connector-v1-1-86c0e1ebd5ec@linaro.org>
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=ZcRh/iRQY2q3Fj/sfpbDNBd/2gcxPVTg7LyLYjpCUEY=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1Sy9cQTI8SFd8K/MoqX2osnfbl6r6IB5mn4lQ
 jBzDis6KwWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdUsvQAKCRAbX0TJAJUV
 VmM0EACrw90/As2dkDCOvnZebzmr6cjgxftMv7dtx2aw9nd7bWhYS/BIWxoIS6PP8lf0YdJOBwA
 zLx8E8B0ybX/OCxg7YCkndmk7DuN4vXRJJP0rtX1pFBEAjvBJcH0PtOxAuK5YlNLFMWGlxBAERb
 XVwWIjPNw94CCtwVZw2Hrq7GETIMGU5Dq553HW9NGuFMdUMMDcE+gJHFem7KRH8nBi0UDuuXrWC
 sVX7TWVka383d7dVF+PJeyz8PoDTIMwzkJ7Qhkirfxgp0EJlUzO8e/Xb3KU60Q9Yyvj2BUNn2LA
 IVpbOfz13Nh8qqGEnxjGoy9qJTgZzAtMMHxxByo080kp3+h/+2Qzi3D9+2I5qJcYFdgS0k1B/Zl
 cE0lAe0gO4gowp4O2MfZFjYu2lwh7DP27K/JtCNHK6QoVGS57EKYqLczzJKEWpPegcyXkSonQke
 lQPuaMNWB1ERFaWnkfDSm7vBer7cOkgnSj85BJUUxLgC01ZHwrHmHaJBdfOoi/4HVnnZzPjIaRP
 AQKkkmFaMwTbAkK4Mm4pxiSlzTSgON7cXVGVcZB47LUhi3yaf1am/lCvXpoSODgcOmTv5old7i7
 yUp+H0o/iaoh1tuaF7QN1GsuogtyGglMrH1zmHR5db+4ZVAJ3yYMqSQfAbRKYVY8sCtgqLHg/DY
 o1eGOK+ecF/DK5A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add the X1E80100 to the list of compatibles and docoment the is-edp
flag. This new flag will be used from now on to dictate the mode from
devicetree, instead of having separate compatibles for eDP and DP.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ae53cbfb2193..ed11852e403d 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,sdm845-dp
           - qcom,sm8350-dp
           - qcom,sm8650-dp
+          - qcom,x1e80100-dp
       - items:
           - enum:
               - qcom,sm8150-dp
@@ -73,6 +74,11 @@ properties:
       - description: phy 0 parent
       - description: phy 1 parent
 
+  is-edp:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Tells the controller to switch to eDP mode
+
   phys:
     maxItems: 1
 

-- 
2.34.1

