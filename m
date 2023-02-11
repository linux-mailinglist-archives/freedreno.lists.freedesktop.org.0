Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58237693088
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 12:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F8710E161;
	Sat, 11 Feb 2023 11:51:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6706C10E160
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 11:51:45 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id c1so3524621edt.4
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 03:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sLkh67ooWyVObn1J2I1Qu7dXdNbX+Cd0UoL9axKT34o=;
 b=oltznk2rV7cDqVbUdNVtJ8xpjZjQpPXAe0K1+3HPWxtatzOXOJU0Ubuyg6e7SUfbpl
 m1eM9ON4PETCcwFpxrE17SDiVqcgQ4qMA6ASwiLe07mpN+9d9bzDs9zATe7+Xg+3zsKY
 t/Ph1p7W2YsWJorjsNF2YGZyOGu2FKvOehd79IGioJBG2mcvMtjKBYwuAU9pZ6BzxPMO
 tSZ8wVx8O0oVWhRUREjHGe3AacbYvbdiDrqZa+MwBgKjlngPjh42cVTHezvHBh/qgw+p
 KwllStugYL60DK9XlS3dhhhxsAbOIfRRLL27sxg5Xv0eiewLUPW74JInzpF6m4/mOEdW
 +LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sLkh67ooWyVObn1J2I1Qu7dXdNbX+Cd0UoL9axKT34o=;
 b=5exum7afbmTBEJbnkQhZq6PGvF4T5/IC1s3PSuVfbugMXMf3qRXwsJq3/rIok3DuRK
 05bYROYBqO8tETHF8euTrUS9DkHBacXeWmR6XtgEEwsA4vTVe27j0xn3rO7SGoWBZEZP
 xKc+VJoRuvMViW96dMW5ygCwggWkT3uQ+Lu62vxqDLczHfSAQOhQ/8fbgztmY5M1+GHG
 k4/fg4KSUCKToPBSleUiiMsdsHuxaNN5Zz3kjd1yqjEiDYMXHae4C6CLRfhWM83tNIlC
 CJZaPhCIUx5e4zKaL0JP3YHzMOyGpqSlJ0XghaqaskRIDjD2RBKKHVWp59XpR49rqMgk
 1Kag==
X-Gm-Message-State: AO0yUKXWwGvq7UjhXKB7KMH/rJIPAwJ+0mG/HzJgVnFuft3jET5PW9v1
 H/goybd46avTQ6JfoiVXnR2RoA==
X-Google-Smtp-Source: AK7set+FQ8jTth7bS0gyIXngSI7gGV8x5+Sg7Jip1fRYG9F1ouZXXNdruBZInEMV8zMNS8gwStxJpQ==
X-Received: by 2002:a50:8e41:0:b0:4aa:c354:a0e7 with SMTP id
 1-20020a508e41000000b004aac354a0e7mr18903423edx.25.1676116303952; 
 Sat, 11 Feb 2023 03:51:43 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 03:51:43 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Sat, 11 Feb 2023 12:51:01 +0100
Message-Id: <20230211115110.1462920-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 01/10] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The qcom, prefix was missed previously. Fix it.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dac..2494817c1bd6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,7 +33,7 @@ properties:
           - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
-              - dsi-ctrl-6g-qcm2290
+              - qcom,dsi-ctrl-6g-qcm2290
           - const: qcom,mdss-dsi-ctrl
         deprecated: true
 
-- 
2.39.1

