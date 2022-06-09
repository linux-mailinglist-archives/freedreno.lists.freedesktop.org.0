Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFABD544BB5
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3259911BE74;
	Thu,  9 Jun 2022 12:23:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAAD11BE64
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:23:56 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u23so37741381lfc.1
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCTRhbt4okJRARx9L2zabx0wSnnKkG9VZWoKlVnWoCI=;
 b=FxBHFuNNV6g2mDYqLVI8qNabQ5bAOYPreZrHx9tNp+QakZlANSFHu59alRdTlo+g/H
 XrwNOWLPsgitI8krbzF0RsDzSOXPKEIDap96kF1MImZpCmIhnpQJghOGivhTxUcCSr+7
 v3/R20+yMbPsSZl4FyEcQqqeYNSZXGzZht07KXmGDPPketkf3COzVgxwHiAiEUAL8lnS
 ARDhM2yNhjOpUqs0z2vzssgCP6QdiTBDTiaxLFsajOX4bR5JP7bi9Hwt/IpCwuVqm7me
 ohZ9Nnbg4C/csUUmokNVdGOCVhKouab2ktRAEFLozXQtryfHglgE1Sx3tgySz8Son8W9
 C7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lCTRhbt4okJRARx9L2zabx0wSnnKkG9VZWoKlVnWoCI=;
 b=qeBJeEEUF5Mo9xFBVEGHFUu1L2vwHPF+dzRlb53fC9Ed3V1FFw3hWCDFAbi+cWTsco
 OEYA2trL5pbry6Ca9wIsE+GiPu9+afxxxGxsMT3lH4+S4EOdTVnUFrF2zDuL6aFTBkVD
 Y9NahgxldXLxUdWV45vszTe1iGmhSJ/d4j/zl2zJ3ILZ77jmgkMzpG2lQXh6dEIUXEkt
 4Fw0JLgX5nv2Bi8WFwn5FYOW3zrWY5KjNcGVJPC0lvsOBZfvS+wkmrVL60Ka1lBxe6B8
 +VnXcoiXC1crP4Q15/iggwR/pu582mA2vIGZbUaQvUY8cHFwX1XFItwMbT9MYdNRiyrn
 N1Bw==
X-Gm-Message-State: AOAM53099wa/+t3tBXs5iQyjo9r32ZpCSO7gfBfMDnhEqf0e8PrpoZGU
 MzmIu2YUpad6liRJRGedY47Ttw==
X-Google-Smtp-Source: ABdhPJwa9xE9mTnD2qCTO5hii7wZiGfDsJYgAE7WCXsQJ9ks73Rt75W2ZMDJfEiduInDO+yL59QUKg==
X-Received: by 2002:a19:7708:0:b0:47a:bff:509c with SMTP id
 s8-20020a197708000000b0047a0bff509cmr3995533lfc.299.1654777435530; 
 Thu, 09 Jun 2022 05:23:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Jun 2022 15:23:40 +0300
Message-Id: <20220609122350.3157529-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 04/14] ARM: dts: qcom: apq8064-ifc6410: drop
 hdmi-mux-supply
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The HDMI circuitry on the IFC6410 is not powered by the 3v3. Drop the
hdmi-mux-supply property.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 2638b380be20..eb6b1a1ff117 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -341,7 +341,6 @@ hdmi-tx@4a00000 {
 			status = "okay";
 
 			core-vdda-supply = <&pm8921_hdmi_switch>;
-			hdmi-mux-supply = <&ext_3p3v>;
 
 			hpd-gpios = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
 
-- 
2.35.1

