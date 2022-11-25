Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83E638A1E
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 13:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E900B10E766;
	Fri, 25 Nov 2022 12:37:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8896910E750
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 12:36:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x17so6573369wrn.6
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 04:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tY9zIcCRGEu7zo0/qER9MM7m6z693FsbNLfr6+dvuHk=;
 b=ZSLy4qHvgNHaSOLMFdFVsR6P3+qRyposmSpnHI6bQ2a30+YjTv6aTr6o/nlED6PHqR
 UivB7wOoUw2mmRUdl2zjHW2DjMDfXO0q1jNvRoDYs7i/foe0qU3sgTcv/FEBCrPsYyI8
 ac/xGfjOsY1jWX7kSuSl3yX2iIdsM7jp84lh2S3f83rNmMRrlzctmSiwBkQlFiqQ6ujI
 vh6e+WAGd+b2LZhFR/jGSagj8XfaiMZXW0iJ5CF/ML/GYZSQJ2Es/O0ogyPA9w6haNjh
 BMJBUGnWdJpj/+SMHMpYg9fvOQqRDMhXSgEMtYAdosN2+V283KSSYYjCrA+HYKdw9yzs
 5g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tY9zIcCRGEu7zo0/qER9MM7m6z693FsbNLfr6+dvuHk=;
 b=OHzMU+YMDhh5sNBvRJDiRYoZTPzIFOA/VF0/q2sRIuAEGNWSs0d5Qvgn4OarJANNnZ
 k8rbQtimrN26cbGEeKltWZhABVIcY9RTGXPe6edSqnUtsg05M2LcqC038g/DuNdjWBHX
 kGhqOD2FX0+jNLU4nVpPBRadXCH5Gh20uAvmN9a0TRfR8hNcn16RDVg9EKzx6ooYZe/x
 2AG0hNhp/ocyxcwNYEMYGBz2E41LwZWFUsL42RNTJ8tSQOnE60tYHYhiRmgDY65Vuszg
 B0g0ZMAu9+1H1lkX9phq2NcPOn5VwaxGviCbLNluY/xEYHR4jseWuofKbRrCR0Yhoq3I
 /0/A==
X-Gm-Message-State: ANoB5pkOfd8zjf8gZkz0cuUElmbDS0Gkq6591o1y44uBsQNPc+5tSo9v
 eDvZjmOtWAXanAVO3SFDR3I8yw==
X-Google-Smtp-Source: AA0mqf5H5wyHrYk+YwktYmfHx+vQya/3G/BZfVLyOMilrqcgQoMp5LoGcH7f7deb/hiaH+d+191QwA==
X-Received: by 2002:a5d:5948:0:b0:241:ea80:878 with SMTP id
 e8-20020a5d5948000000b00241ea800878mr8252875wri.124.1669379809131; 
 Fri, 25 Nov 2022 04:36:49 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:36:48 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Fri, 25 Nov 2022 12:36:26 +0000
Message-Id: <20221125123638.823261-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 06/18] dt-bindings: msm: dsi-controller-main:
 Fix description of core clock
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robdclark@gmail.com,
 robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There's a typo in describing the core clock as an 'escape' clock. The
accurate description is 'core'.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 88aac7d33555c..0c09b9230b7f5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -40,7 +40,7 @@ properties:
       - description: Display byte clock
       - description: Display byte interface clock
       - description: Display pixel clock
-      - description: Display escape clock
+      - description: Display core clock
       - description: Display AHB clock
       - description: Display AXI clock
 
-- 
2.38.1

