Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44D56C3CCA
	for <lists+freedreno@lfdr.de>; Tue, 21 Mar 2023 22:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EF210E2AC;
	Tue, 21 Mar 2023 21:36:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512BA10E2AC
 for <freedreno@lists.freedesktop.org>; Tue, 21 Mar 2023 21:36:09 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id h25so9229650lfv.6
 for <freedreno@lists.freedesktop.org>; Tue, 21 Mar 2023 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679434567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BDa7nKMtXb7S3BjrifS1ahAFl7WEVFVrO1TP6BvYQW8=;
 b=HygJVWLJQYQZzv5qKjvJmDNkHdctvMuXyb5WW+Szi1sbR0fCUv2Tb5kL2qWEFlLjxq
 Onl2baFYfm7n857a0DVCwVyr6TpeVkmg9s8vk14GaL394coBZtbSqRSutIFUdqKGrzuw
 P5YcVMeYFIG5D66Z77S1qRV8busNsX1apl7Gq0Edpdf15NbtTtDNC5um4zP97/fRi1Ct
 2Qr/3UJ9qLRgha30++4X7M/1HO2ApQ3CEsykXpAy+DuJ6gJr6iO5n3R/LNn25nhqi4m6
 Qm1bUbW81MHQUToYOdQ/2zg9UjrMwyCX9MOXxwvh/ygj3MCPSWedvtxaIlE2uA76wpRY
 MD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679434567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BDa7nKMtXb7S3BjrifS1ahAFl7WEVFVrO1TP6BvYQW8=;
 b=lUN2/0WBgC17ZJqbiXoX7mIGSerc+h2BBFh20wEjNfNW+M3ojLwo3K60BFLZ+FwT9z
 gOb5AJTDPwolnuha+kHKqE7q2n5QqzuWJkofG3A0QqCOyu8yq0BHT65gUOAFz3AeNgo3
 kM+VxW0U3f1pn/WqkDLgZXZafWu0n1BjkdL5HUnONM9oDTET4xX1ph+ilITMay1BBd7V
 6JdaiNzEaLEfYUyIKGNM3nthhj+ITAAlACi/cw2Rz96QpyfSnJBL4m7WnEeKl7+3uLjW
 Wqa44vBh/qw7GEWSCvi2wefOR6bSpCFN2CgMEAKunNwIPIfKbA5IHagDZpBkS1lOKy8t
 ExzQ==
X-Gm-Message-State: AO0yUKWSwLG2ZpsR+xRWRof0qBsc5Qb82rOAwn4/GIy2BMB2/tYiKPS6
 nOuVA6kvw1RTpv35crlSiQPa5A==
X-Google-Smtp-Source: AK7set/KwCx7+18m5if4fSBoPJCV6gjU21k1/n3wZtbtG6AVFjcu/qxY4/gwTtP4iZ9QQAPQ+znOBw==
X-Received: by 2002:ac2:5544:0:b0:4e8:3fc7:9483 with SMTP id
 l4-20020ac25544000000b004e83fc79483mr1339983lfk.23.1679434567543; 
 Tue, 21 Mar 2023 14:36:07 -0700 (PDT)
Received: from localhost.localdomain (abym238.neoplus.adsl.tpnet.pl.
 [83.9.32.238]) by smtp.gmail.com with ESMTPSA id
 j12-20020a19f50c000000b004b40c1f1c70sm2324628lfb.212.2023.03.21.14.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 14:36:07 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Date: Tue, 21 Mar 2023 22:35:56 +0100
Message-Id: <20230321213557.1737905-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] dt-bindings: display: msm: sm8350-mdss: Fix DSI
 compatible
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
Cc: freedreno@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The DSI compatible changed between patchset revisions, but that wasn't
reflected in the bindings. Fix it.

Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 4d94dbff3054..79a226e4cc6a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -64,7 +64,7 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-phy-5nm-8350
+        const: qcom,sm8350-dsi-phy-5nm
 
 unevaluatedProperties: false
 
-- 
2.40.0

