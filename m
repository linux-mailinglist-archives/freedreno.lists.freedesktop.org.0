Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21256CE3F
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 11:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C39610F4CE;
	Sun, 10 Jul 2022 09:00:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEDD10F841
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 09:00:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f39so4289150lfv.3
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 02:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZs4kXHK9xbLHkrqMGuJyZ5VoLx/pQiEUX4aKEkcY5A=;
 b=NE0ahQ1LMEzRiDmam57ajPEX+MCfHm20NEAFqzHi/YYk76pgWNaUlBynt1fjo/qMqo
 A5T7sD6O3yrfZ+QlLQMO8PtLQxQMwVmJafXTbs7ZuetGUdqlXQh5HTNaVbSAN2wVKGUc
 cMNEjYgeVeYSPiXtMLgVYI5kF7Bqlmycx42OBbb7lYvSGfrmKY5t+YOkZlpsRZIG4I7y
 B4e2VMR639gQv28cRqt+G/I0+5/d+5fFNL/Owvr2JlPJ/Bo+OZH6Thpd/pvl4DgEK5Q1
 vetJToJjxA0y29kuoXjHpUQO9ixHE8maBjjvBA1B52WYok3uv8CkCQY3Z8HTAEaMAp0R
 CO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZs4kXHK9xbLHkrqMGuJyZ5VoLx/pQiEUX4aKEkcY5A=;
 b=NODl4umwdNL9DuzJtjwHEciDyrGa7QJR7P2ID0M+PDI+T3PpfhHWrPcvQ2XtWuNgOI
 CmmEw8tblfJkQygU51Hoos0TW/RetM2PukOpvc0IFr6ySKMHOEu7ISlm3NVsLkene02m
 0VjkHHn57aMViORvDV6gw73ozDP8wdcvxE2jbo0O3VXlVZfSVJ4qBUru7/mPZT6Vm4s5
 uAPuaIs74IsxaK4Kdy6+rfElWmOzVwNyWotPsxvM9bQz/OqJ4vvGdEf+IploxzGRrIGs
 N3cX3zC9BV1vXBSOBLPPtecrW6mq69dly1ROBpIxhVqIyAIMJoPFUhvdVIUY09fCDBb9
 8X1w==
X-Gm-Message-State: AJIora/ehq8XuyoFvHBFQy+wqMB9wzGnP9/g7BirM1PNopN25OPgOGy7
 EwBmH2cX5/ObUakXQ6vclQrAsA==
X-Google-Smtp-Source: AGRyM1vJ2bvlLB+NlRwTwtW/ZZXgTuVBInd2vfmXy7JJPK9tbJTYw/ZGF0qL4Nv+Gv+WtrPPjOt2CA==
X-Received: by 2002:ac2:4e08:0:b0:47f:7b73:c9b9 with SMTP id
 e8-20020ac24e08000000b0047f7b73c9b9mr8006082lfr.5.1657443642786; 
 Sun, 10 Jul 2022 02:00:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056512095000b004896b58f2fasm822881lft.270.2022.07.10.02.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 02:00:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 12:00:31 +0300
Message-Id: <20220710090040.35193-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 02/11] arm64: dts: qcom: sc7180: rename DPU
 device node
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

Rename DPU device node to display-controller@ae01000 to follow the
DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 72994f599825..e63b4515453f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2911,7 +2911,7 @@ mdss: mdss@ae00000 {
 
 			status = "disabled";
 
-			mdp: mdp@ae01000 {
+			mdp: display-controller@ae01000 {
 				compatible = "qcom,sc7180-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1

