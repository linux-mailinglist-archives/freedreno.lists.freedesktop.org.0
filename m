Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040966520D5
	for <lists+freedreno@lfdr.de>; Tue, 20 Dec 2022 13:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E2710E3E7;
	Tue, 20 Dec 2022 12:37:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EBB10E3C8
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 12:36:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id bx10so11646569wrb.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 Dec 2022 04:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
 b=AlOKjm0oELLxx+jAkVNSqFql6WmyOmKrY0zPkfu429Ka7TM8KTOFeu5pL4iqSanszP
 z7K4VzLV3SzRee1yY24jMo4UevNeGiqw2suAvaddBaeTi49rp33SSAcCobTBxGFap0Ay
 rSemFk2D29mD075eKojO3JXVDCzUPAo7Tzjri6200GWCC2XEQtjEKbj+dgjNhTRRECrJ
 7WgHNv3KVs3IfMo/mIx1t3xPZeHvVZf1EkZ0RQPLGMNjLLUL8Go2lSK/ZGW9AESd6cVu
 IU5K8T9ypzdhv1elkWQ0uwYiPjZnWPYlFETxLrITDc+0YwqqJed/8n0fBkGjB5nbQUvh
 m/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRPNlaD7hsiz/pUuk0p12dcLjCcNShs9xK43XVBNgQw=;
 b=wYbevV6LWgz+NxBmkWv37FqaYUlv2lHi/EsdRdP226BWKYrs+NR/J5T6JyjKD7GTvJ
 H8AIe4KMXtlxsb4TW/35u6c+T9J8cQjIZ2pqfot8b4rp8bAK5l20W01z8ms8m8i8fzR0
 x23PlfvKR9EzikQn3BAkTn3khEB2vAVwGP6oFD48xlKKxRxv7TSCvqWhqzFDpxOe7Pqu
 RQESvv3V/wUEf5HCIlDOUvIqHxW08h2w/sVXZErYDOD/P8soP759M/DbiNoIR5ayO2IZ
 6k4AFa/CmGWcUbBwLqvSWBnNKaHm/5qqfdcRfmdTSHtCbs6WnqEjjmqroxb5KuktbaB8
 OMcg==
X-Gm-Message-State: ANoB5pmeUOvqt7DTRNtFa3Zj5d3pBjYk+6wKsG+3VXOZKWkqtnRZLRHO
 jnZkNNEAT6US90k9idR8LK7lQZQVlUEETmDHjJA=
X-Google-Smtp-Source: AA0mqf4Qwn1lOj+RanfIZTDmk0766KngiFyW+bGOmLbGxRnfVPSk39xJNcAUZxRbEff+9dYOHJXFRQ==
X-Received: by 2002:adf:ec86:0:b0:242:31ba:1389 with SMTP id
 z6-20020adfec86000000b0024231ba1389mr27047390wrn.31.1671539817207; 
 Tue, 20 Dec 2022 04:36:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 04:36:56 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Date: Tue, 20 Dec 2022 12:36:30 +0000
Message-Id: <20221220123634.382970-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 17/21] arm64: dts: qcom: sc7280: Add compat
 qcom, sc7280-dsi-ctrl
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
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add silicon specific compatible qcom,sc7280-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7280 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0adf13399e649..a437ad4047f52 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3906,7 +3906,8 @@ opp-506666667 {
 			};
 
 			mdss_dsi: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7280-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

