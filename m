Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C056AD8E
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAAD11B2ED;
	Thu,  7 Jul 2022 21:32:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0290311B2ED
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:15 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id e12so33302068lfr.6
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LmG27VAvPqwLokCgRV28hmE5ll7C/l8IW7AnNAbPsYQ=;
 b=jDaLV0ZBuyPjn14Y17cRatbbTN/Tkwejw4WZCqmEGWAVvzFp01TyY1lb64FKqPlpYy
 eiLpoye+eG9hRhG2corcbLnLmL06G3Wqmp0K8G+bh4rBR9T8hX5Rji1Eaq+Fm+JCK5Tw
 vsUAMAY+2SS0uWh+gmcBL9AatnNo/C3ffGAnS6eAhcW5qOdILnjx6kkxPdVsxCgCPS84
 md7dr7V/DVs2gt0zvyoB8+7rJ25h082E8Ju/0CGiSExSSk/y7QvDUOqRs8QadyMjyw7n
 F7vrk3O66oVEGvZUCZ2hUdvkkVNaUL0A8ADnCYayOxEupDTsERiQioKlE/p40Uw8vFR8
 KUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LmG27VAvPqwLokCgRV28hmE5ll7C/l8IW7AnNAbPsYQ=;
 b=mUYgtXKAUjjWX/jhe0gYT8k5enExTtOejSGuotvKPxY7dp2BqLUV/bEHJdrMPT69rA
 DG8/0dCzuk/K3+1OPH+pl/tbBYSIXYLboKZC8s+S5Qk/f2dc/zEiUSr8dmkdXq8+2512
 9ToBbXcq2DuQuHHSu7v25A7Yk19EUS+8Wmfgl4lNw5BFbSqCPR32GTy1eiCp2dYn0t9J
 moV20AcLo1AT0SDrsHQ9P/vP3lwsjl2ojfZ7KINqpjUs6kwHwyo01AOYxS/hzEfy7uJt
 arIVnuTIRsjC29um++CCP0Q8gMz+/lpP73dXco5x1NFQIQLMPLC9ZDqtMjmAd7Qn62GC
 Kw8g==
X-Gm-Message-State: AJIora8jO9FGlpKUY4vCJP8FrRC5e158TIt8E+KVFGcXeP5J0x65wyy+
 Fl/0+Vi7I9ILBlncMiBOIQQChw==
X-Google-Smtp-Source: AGRyM1smbr0/8AujEHBcLyNC+lvRU2ijM+Qi7JuhUY4++YSEHvrLz3qMQdbflIiMW/6j79iVTBfIag==
X-Received: by 2002:ac2:53b6:0:b0:486:3357:c67d with SMTP id
 j22-20020ac253b6000000b004863357c67dmr128289lfh.433.1657229534248; 
 Thu, 07 Jul 2022 14:32:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  8 Jul 2022 00:32:04 +0300
Message-Id: <20220707213204.2605816-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 9/9] arm64: dts: qcom: sc7280: drop
 address/size-cells from eDP node
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

Drop #address/#size-cells from eDP device node. For eDP the panels are
not described directly under the controller node. They are either
present under aux-bus child node, or they are declared separately (e.g.
in a /soc node).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 21ab986968e2..004cbbb084a2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3740,9 +3740,6 @@ mdss_edp: edp@aea0000 {
 				operating-points-v2 = <&edp_opp_table>;
 				power-domains = <&rpmhpd SC7280_CX>;
 
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				status = "disabled";
 
 				ports {
-- 
2.35.1

