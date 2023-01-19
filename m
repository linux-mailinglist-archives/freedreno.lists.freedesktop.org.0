Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845676739FA
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 14:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B0A10E934;
	Thu, 19 Jan 2023 13:22:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017C010E93B
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:41 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ud5so5636687ejc.4
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5lFrlvCIHoFB2+uziz/1ge4iw3F4JUj7qisClGGYZE=;
 b=BZyQsTr5ZebjrhxCYNrobbQBYaHncBi9ZTdl09BDOy/d3/0CNMz5/ewJezf59QRx2M
 ijZ7Dv9RVwYCeUMqVQ0vIFeOoEF1lmaJ8QbGGPIT/Ab6jV+maIbW4msr6kY0a5wT6QHJ
 05zkUwIjrOah3leYeVOfngbpKLUhbd/F39Apuj825I0KnSPIn1D/FY1VWfiKzk7U/AlS
 OeY+kljH/TsTD/HmKje0dm7kDrXdiWgetHOy+AL/bD3Jgkw8Sdo+vWPuv/mCfJKhdQc2
 cit750FVs8sscTMuSmiIdKBsj5wfQVLhBpV3aHaKWaJspkiwqvFZzm4kbmC9IJqoaJKG
 POcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5lFrlvCIHoFB2+uziz/1ge4iw3F4JUj7qisClGGYZE=;
 b=5MEfJwwWjLA6SoPeEklrSeKf8LB+yJKPFbO8SNSVQyDfEma8y59WgHF2pwb8df/7SK
 uzaMWfr5H1dnBtZqt7WBCOV7wzfOX54tAf35eFndvLDMIPx7mxAMfY5cM7mX3vlW35DO
 4mAaUSG7gmoM/53b7YaYdJ5ufNqvhR2yih8cMfnBmC7XjsiM+bgcmh4GBApQuyeoHTwg
 bLCwFNntz7ET63YQ8jFCNCXS2ndc6PJ+rQj5xMXIpcDq2xU5HNO87Ot/19dFkFpF4Wb3
 qs9LCzByVbIKayZrqHPDt3oYzISOKlvkRKukAUmvCiUWPNuPbcZznfzL9v+aRKZLSqsQ
 QE5A==
X-Gm-Message-State: AFqh2kq6b0L5K19o1B/Ulu5hTmZjFWL83rP3s5+K4XozRs4tO5qyoTo8
 /C9TaEx8l69QJ5OCoMjhjUBVVsdZV8OTWDFR
X-Google-Smtp-Source: AMrXdXte67q8fD3ofpSt16K0O4y/76/t1vXA+qk0uMaBlzCGEPaAUZSL9km91H6eh7t0eNEap7FqfQ==
X-Received: by 2002:a17:906:60d0:b0:877:612e:516e with SMTP id
 f16-20020a17090660d000b00877612e516emr16289651ejk.61.1674134547974; 
 Thu, 19 Jan 2023 05:22:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 19 Jan 2023 15:22:19 +0200
Message-Id: <20230119132219.2479775-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 6/6] ARM: dts: qcom: apq8064: use hdmi_phy for
 the MMCC's hdmipll clock
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Link hdmi_phy as a clock provider of "hdmipll" clock to the MMCC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 82c795beb8a1..b7e5b45e1c04 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -867,7 +867,7 @@ mmcc: clock-controller@4000000 {
 				 <&dsi0_phy 0>,
 				 <0>,
 				 <0>,
-				 <0>;
+				 <&hdmi_phy>;
 			clock-names = "pxo",
 				      "pll3",
 				      "pll8_vote",
-- 
2.39.0

