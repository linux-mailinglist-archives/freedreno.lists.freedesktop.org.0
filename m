Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF85E8B0B
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815210E5D3;
	Sat, 24 Sep 2022 09:44:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D0C10E55D
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:43:51 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id b24so2460684ljk.6
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VLUu6TG7vJTDj7eA5+6CLG9FwNk8lEzcvUqb2CGKe0A=;
 b=c7Lt7EFWJekW6sL8/GctkZF4qCl7seJm0RF9u/ZjcOgJvkSg+O4JzvWMcEw9wpCZYO
 ZfzlaK9rfmPmthDemNZBdqnIH2RnWB3znIRJcpZzd6X3FzDG1tKWSmgIiFjELL6fifPL
 pnS9su2xrAs1pTXJQxjem0o7+SoopL6ffBa3KZlulHMRw5ZF9gnp6ezglfplmuef86Ua
 k0J169NaRAZko0UO74q+2crXvA9QcgUH2C2p19dQL/E4EBSBXA8FJpSvUieCxz4ay39n
 J7GuRTC4beVwFSvFEzYt8iWaPHB63qINXlzhiJyyqND3w96ZYmzcmzmXuGqRjVIcO4GO
 rcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VLUu6TG7vJTDj7eA5+6CLG9FwNk8lEzcvUqb2CGKe0A=;
 b=rsliQIOCTbcOCc+I9KePcaqczfrFDseg2mfJYhawLp+QK7JnSFWGA9vz2hWf8jdmbH
 meUYvRWue2deG00rGMXazL3aKCYfI5iW5ES3dTwVCdLJJzLYT4zHaiRY+LEztuW798Ch
 l6hPXO2zilT7rNyk0V64TuXDh0DZahUekobqxth5gugTLdd0QB68QMibikzmRjIP1fxQ
 dswwtCtPaKRYNaqAeRxD/hK5ERbioNYTS2vfmCnQBoZ98VqnCEw/fUy/HX3IUc4ZiCfv
 68jyoCQXp6AazzkT+JWFUlaOsCqB5RlbNBLPGQ895isnMQTAYCTYqtvsFzHIBLqnZymr
 En3A==
X-Gm-Message-State: ACrzQf2CEhaiVbXCNAhuNaFOxD/5TrcMj7/V70tU8BZb7O4oxDaeT0cm
 TV9IG/eS92klCi5IPzX7DYTzUQ==
X-Google-Smtp-Source: AMsMyM7eJ3B+KjC4+09vRqENmm7Tm/1KaexhHEQKtn3a5aJl5ftNc0zf+rMYc8NffYuA9Ch/ooyO3A==
X-Received: by 2002:a2e:a544:0:b0:26c:6abb:866d with SMTP id
 e4-20020a2ea544000000b0026c6abb866dmr4362216ljn.9.1664012630224; 
 Sat, 24 Sep 2022 02:43:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x13-20020a056512078d00b00496693860dcsm1833347lfr.232.2022.09.24.02.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:43:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sat, 24 Sep 2022 12:43:47 +0300
Message-Id: <20220924094347.178666-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
References: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/2] arm64: dts: qcom: msm8996: change HDMI PHY
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

Change HDMI PHY node name from custom 'hdmi-phy' to the generic 'phy'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index a7d0e5d68141..ed9863854904 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1144,7 +1144,7 @@ hdmi_in: endpoint {
 				};
 			};
 
-			hdmi_phy: hdmi-phy@9a0600 {
+			hdmi_phy: phy@9a0600 {
 				#phy-cells = <0>;
 				compatible = "qcom,hdmi-phy-8996";
 				reg = <0x009a0600 0x1c4>,
-- 
2.35.1

