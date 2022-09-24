Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3515E8B09
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22DD10E5CE;
	Sat, 24 Sep 2022 09:43:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5005D10E55D
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:43:51 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u18so3711951lfo.8
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GQrdTdBofDL5vf6PRkXejN2E9BKeZSpZtMQfMhCaWUs=;
 b=RIfYj7SRavWfZMzce6bmkEVpfSm/5h09Mcb/GDa8d5KynU82xmd5OS97tdw9qpIe7l
 b4t5JSElI63QdqUgYBqJbmTPn+iDY7evsyqPsAw5lmgMCild/B/9up0gjYgFvh5OpyUs
 ePlTRURyeg+0iOLLPtIHRch0RrTmEiwFDdeP/su2LSvqjEanpvFldlz+6rAQujeOQzMZ
 Uh/Cox2JcOAzliigBscmVxDWn24xfnAH2Gq5DvRTM6mIRFXIHq3JGyHX89aXXX811c2v
 1R+OkSQizOstk46MkhX2+C6ixhkpkeDzf88Y//LCXeBcs4ZziUq6kL8/GN0cTNjZAdiu
 NqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GQrdTdBofDL5vf6PRkXejN2E9BKeZSpZtMQfMhCaWUs=;
 b=DqprgwXgpKeJoNBWRzbaAuO2mVsBHz7WOTGz++c+gQrgQ6lhYHN+hWG21zr1Bnr93E
 guDF9g+/yB+e+KZizmF/prb1ygqJb7osMZM8T5nHMrLnHf51PLe4VqoUwomvYTqfjUCP
 5ovU2uU3DBme9n0G4fjxmadSves6Wg14OnvgpwOQ7medZ2sXDjkF29NARIjiOF7kMceE
 sHGR2HgnMWx//FEzASUDNOkNWUUYFifieeDI/p5k4I4a0jwvdzfQRfrYx//ydjnmcxqD
 bEm7vodUaaGBElnAKv5oXdrkzM6hws3jeuK1NOJ9OiJlLex9JpoDqA8Y9xeTCICKsxun
 MfRQ==
X-Gm-Message-State: ACrzQf3Vk6lHFe3H5vKuL0Yw3oJIUjd8BNGK8WsjCQxzBi7pfE6CDF3s
 vwjoRbIg/YnMnBH+4XAHFJAyXQ==
X-Google-Smtp-Source: AMsMyM5vcoNWuoc0ZWuZz5bZdSFqh+BZ/no1YdJLhxPL6pyZw/m43F2jNZseTa05AxfgYkOCMV8ugA==
X-Received: by 2002:ac2:4e10:0:b0:49a:d44b:426 with SMTP id
 e16-20020ac24e10000000b0049ad44b0426mr4990054lfr.234.1664012629416; 
 Sat, 24 Sep 2022 02:43:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x13-20020a056512078d00b00496693860dcsm1833347lfr.232.2022.09.24.02.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:43:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:43:46 +0300
Message-Id: <20220924094347.178666-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
References: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/2] ARM: dts: qcom-apq8064: change HDMI PHY
 node name to generic one
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

Change HDMI PHY node names from custom 'hdmi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 0322cb88d448..497c4012a65b 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -361,7 +361,7 @@ endpoint {
 			};
 		};
 
-		hdmi-phy@4a00400 {
+		phy@4a00400 {
 			status = "okay";
 
 			core-vdda-supply = <&pm8921_hdmi_switch>;
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 1b704c7ea890..58f239218639 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1453,7 +1453,7 @@ hdmi_out: endpoint {
 			};
 		};
 
-		hdmi_phy: hdmi-phy@4a00400 {
+		hdmi_phy: phy@4a00400 {
 			compatible = "qcom,hdmi-phy-8960";
 			reg = <0x4a00400 0x60>,
 			      <0x4a00500 0x100>;
-- 
2.35.1

