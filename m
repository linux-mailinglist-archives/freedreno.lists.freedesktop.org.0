Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F156622BD
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 11:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F98410E3BD;
	Mon,  9 Jan 2023 10:15:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B9D10E3B9
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 10:15:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6232794wmq.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 02:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QlhGmizCHZNPVGwfruBY+PeERtpdL8MSQYu3IWaB+cA=;
 b=j5PWfI7hsNtLqGEvCNPY5JQApEL9P/X1UTjpCN88sltlumSHiIXHyKOBSeLnxieBWx
 AC9XpMdFy2Iv14XmQ4NmW++g6X531fnFHTSLbTcsI2FfwbKZ3+WkCJ/iOVr27BuNFpWg
 7xreIrL7KJf/JKaBkiC1jspPo6o+rcX5MyHfn+2wOcRkoNgko/en+SV1z6/qI9AFI3cU
 joOhqZTK/qzhKFh1hJwWfh19buHL5V0PbC5/+5YENh+EZ9iMETY7Y7acXynhWlmThmzZ
 48TTlRw5xHRHTxUzcywXLKUHpqnAeZmrv3ijT4eBTxHP0ZRjLOhiJKG0rrdskieeGN6A
 WL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlhGmizCHZNPVGwfruBY+PeERtpdL8MSQYu3IWaB+cA=;
 b=mmAevXF0aHMsG4BeHdY7yoEmGxYcp7Rqo38JlqibTDxmmVtvcxV3W5940IFEWy/VRz
 KF5y4MV/NuKJUHEnTIcD7l5qCZINu/pk8ynUO7M52M7H/BsLdtWnY9Sw5GA3hJcZOaHA
 G1w2vLiZ5JWdRUAIQHrMnonZoYzJm+5j9V2VWJkcPMuBcTjjcw5dNnuRpGWM91QhvvTV
 d8pIffzQv1rc5aKJckUKK34OibzFg26BAOxIA5NoKwPEEFMRpsTyLon9DlfkYQhybouO
 2E8NcahTuqKi+/VlRu/XvOxQZD5SuWwOHUtYNnPpTTKNSbVW+U+9IoOrsti0Mr2YpB6c
 drbw==
X-Gm-Message-State: AFqh2kpZ/Kcp0gm1k2OcHZRU3xEJK5mivuEQPp26/IfZWeF3K7cP02cS
 kPld1fDR3Uqub1/ha3MA9QVX9A==
X-Google-Smtp-Source: AMrXdXtDoONLJwlEgCJ4mzpaWkhPvOuI1P7RAAoqCz2lzMDj3a4D3B8uK5HPlPweG/T18A5/NqGCDw==
X-Received: by 2002:a05:600c:5022:b0:3c6:e61e:ae8c with SMTP id
 n34-20020a05600c502200b003c6e61eae8cmr55951404wmr.28.1673259321222; 
 Mon, 09 Jan 2023 02:15:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm15815376wmc.13.2023.01.09.02.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:15:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 11:15:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v3-1-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
Subject: [Freedreno] [PATCH v3 1/7] dt-bindings: display/msm: document the
 SM8550 DSI PHY
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

Document the SM8550 DSI PHY which is very close from the 7nm
and 5nm DSI PHYs found in earlier platforms.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 299751a9caea..78ab8c410ccd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm
       - qcom,sm8450-dsi-phy-5nm
+      - qcom,sm8550-dsi-phy-4nm
 
   reg:
     items:

-- 
2.34.1
