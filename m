Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B76AAB00
	for <lists+freedreno@lfdr.de>; Sat,  4 Mar 2023 16:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327D68924F;
	Sat,  4 Mar 2023 15:55:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77C310E185
 for <freedreno@lists.freedesktop.org>; Sat,  4 Mar 2023 15:55:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id s22so7310769lfi.9
 for <freedreno@lists.freedesktop.org>; Sat, 04 Mar 2023 07:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677945346;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R0Z7PCtKUkVqJsivDDGD4tHBvmMLAeq4ZfR9VxFnexc=;
 b=NeIS309oRrzfgN4mcRpjduIs0ET1CsXpx7F6fk9c4qTkRUxXkwIAgBjxR9Y24NA+em
 Id0bIt3Y5P4pUDCjh5FcwPZhIP7Z5mPuOvO+nfRbUESV6+Jg1JUf/+fVYPr3GGWbl53b
 ZEHOKfXgea1Pu5aKgm0bOHCi3csUk4/tIqN6mnYh2fEPhCAL2gGLC6p4ASn7ycwGJ0VC
 kSawh9xsfTcVOKwPdUnmKM40crzSlk/NTkV9P3WCUvGUClE0nu0FcG5PFNjoSEyIoh6A
 azixturFbvDwFXnJV+O5iJO2XQlS0I1K8U3TWe1C00W3oKuN6IKn9bE9dQ7bAKfVODHZ
 Lfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677945346;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0Z7PCtKUkVqJsivDDGD4tHBvmMLAeq4ZfR9VxFnexc=;
 b=0d5TLLTK4VNkIPDbh5e9Zcwjr0mMV6knjow/z6jN0MdK0kgP4fnhTYWihL8PTlRiNO
 VHkPvUxUpvSMULyhvkygFnTjzpMapbVwkmrCJLRmPasBfl0J87ewe9N9I07oQheU0I65
 1alRYEgcrYus+C7r6l7ghq3ODqULc6QD2cY/HJzr3CDHQQ42KrFcHIYHS6UKPBiGXoDd
 n7GXEq3vjVmNNSAzUbPeC2f02rYGZK90Ak3QPpJPvM7vMNrQ+BC38QSoojKe1YfdRY3C
 TEmrWFIXmjby9n36rXSQrWhurM0H7tKbNkrE7QC1GwSednKe2+Cf3zh3cV2jTj5MY5wx
 PliA==
X-Gm-Message-State: AO0yUKVnR3JvtaSvKt5C4ikw15OgCSmxW303lNQMvn0BJZtUVehG+ivZ
 NkdqnPP7TJZ1Ma41ondyWmYhdg==
X-Google-Smtp-Source: AK7set/y8YiW4dmjB5HIHYzfGSUEp60S4ncz2/1dxkl1a9e85GDK8H1qoZ4fCSD2H0mcQi3JvK7NfQ==
X-Received: by 2002:a05:6512:50e:b0:4d1:3d1d:4914 with SMTP id
 o14-20020a056512050e00b004d13d1d4914mr1705736lfb.33.1677945346240; 
 Sat, 04 Mar 2023 07:55:46 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a19550a000000b004b40c2fccfdsm864128lfe.59.2023.03.04.07.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:55:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 04 Mar 2023 16:55:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230304-topic-dsi_fixup-v3-1-b8565944d0e6@linaro.org>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
In-Reply-To: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677945343; l=1144;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5kzj2YWxyC8wUuhDCqozlnQie7hmtcE8bSzx7ndtKT4=;
 b=olX0NwynmYUDEuRLxQzz5x+tMQUX0Hk65zsshFPLVTSumrfcaOfAj0K/vUwUoug6uYb6Jh7ADOy+
 SZb+1LQvAIb7B91UXDsBmx1I1PihC85gXkyLh20jXAsMg46ih3lx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 1/2] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated compatible
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
alone. This however didn't quite work out and the property became
undocumented instead of deprecated. Fix that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index f195530ae964..d534451c8f7f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -35,7 +35,7 @@ properties:
       - items:
           - enum:
               - qcom,dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
+              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
         deprecated: true
 
   reg:

-- 
2.39.2

