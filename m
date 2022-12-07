Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AAC645131
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 02:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E63810E185;
	Wed,  7 Dec 2022 01:28:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23E510E167
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 01:28:08 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f16so7579088ljc.8
 for <freedreno@lists.freedesktop.org>; Tue, 06 Dec 2022 17:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEqiDsYEiDO00tgdMLKsNoJpUA3u2krxNv3MdZBB8lA=;
 b=G0uDtaqnpjqEiACkFVKZCraxVRQrMk/rZm1nfwlPs65OWyuoBrobv5X/u/hlQUcucR
 j1g8gl6WpIXhT533NK7lthLs9X30KPV7sS/KUYXuTY3pa17NWjE1zS6e2BOOcHkpu/h6
 CMB/PI9fnhhtMlRKbTnpRrbLJOLLZBIBODRdgDdilBGIOFSJjdoPNQBpkkX7Wqat3SvD
 G6jy5aRrxzgJN8/4Kayb1Z9NkE1eT1UkQmc5NYihcXC+l6ufcy+5XwzK/treWeb8YeHm
 RloHHMxkwTzQzuA0SxyYqPRT+xEtJmrsIosHh76rS7y8BqKVAfm6X6lyzuo/81s12M56
 qAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEqiDsYEiDO00tgdMLKsNoJpUA3u2krxNv3MdZBB8lA=;
 b=N/BGNCKqf3EPvMm8xNB5mJOMtvecZNYqRQQnE3tWmMAN2rWXL5ryBgOQTuG98Ax93B
 tG2prq3aHr8p0SKAMPX+dMH88Y9VIXSC4cbLtePRIPKEZSDc0BraUd6dRhIzOirGLHUv
 UH0BiQ5y00ZrvmbGS5Te1ByAMM3q52KyAS97CqnM5O/J80RkY8/Nb3L15MZXMZ1F6uRS
 dkOALFGw9N86ukC684JCvQ5Nc+ZZDRSmZtlwtnAQeKaZTCGke1RrKoG5c7NLDc8h1BQ5
 4MJ6hxQfVhaoclo8psOM1SExSXo4w9zilNtgc5EMUAj6PfY1MGYvlTpAuO6Pn+FfEqJf
 70/g==
X-Gm-Message-State: ANoB5plzVFbXzkqCwSrqDq13w+P6o1FZoJiOYQOL8z6Wwx5Ig4TlfCoo
 N9GpU1WS1epVl92RuWE4BNlRoA==
X-Google-Smtp-Source: AA0mqf7c0uKsntHOJltlxGrMcnxIVrv8u68i5Na5JvQUurmk+KeB+JFW3mi912o36YvbVgzny3MvxQ==
X-Received: by 2002:a05:651c:904:b0:277:210:41d1 with SMTP id
 e4-20020a05651c090400b00277021041d1mr22583401ljq.507.1670376487040; 
 Tue, 06 Dec 2022 17:28:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 n26-20020a05651203fa00b004b5626ef9f4sm1461157lfq.262.2022.12.06.17.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:28:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  7 Dec 2022 03:28:01 +0200
Message-Id: <20221207012803.114959-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
References: <20221207012803.114959-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 3/5] arm64: dts: qcom: sm8450-hdk: enable
 display hardware
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

Enable MDSS/DPU/DSI0 on SM8450-HDK device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 2dd4f8c8f931..75b7aecb7d8e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -349,6 +349,28 @@ vreg_l7e_2p8: ldo7 {
 	};
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5b_0p88>;
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 	max-link-speed = <2>;
-- 
2.35.1

