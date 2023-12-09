Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22280B768
	for <lists+freedreno@lfdr.de>; Sun, 10 Dec 2023 00:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C109310E309;
	Sat,  9 Dec 2023 23:21:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123FF10E2FB
 for <freedreno@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:37 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c9fe0b5b28so41241381fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164095; x=1702768895; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iqjo5dHisDRwrhKSHqJTPFQ5wOEs+diDPVCxtZ4wynw=;
 b=gcJVMkuSbXIRebUE9/vFSG1nxs+svuHFq2a2LIlyhz0fPhH+Wrj5tBlS9kxiCnfhge
 /9UPKN/F+M8KEiQJl6NW/LKWi2rs+H+WVZ39W3mlY1hH9YjR8uvTkPNyoBirQOAQnVU6
 m0ioW5juP5ArVTHQ/JQBE8P56MaXF/eCY842DbmQAu6lZPGG6bWJfnVAsRWnsUjMpoyA
 /9hEouhIMCyReWPmtDUbUl8JcUyABVTlrOya7gZDpgRtJd50iqbtRlrV8Eq+SsiBPcco
 GKdWE0WsKalBWh3ZhxA5V0CgycnZzl2w9bMM9Fz0E2MdzrR3ta+MOMFFprDIgBh1BLVs
 6big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164095; x=1702768895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iqjo5dHisDRwrhKSHqJTPFQ5wOEs+diDPVCxtZ4wynw=;
 b=QPt9E7PJB9stnMDqFfk78LiyVfRUlapuwgiGSxIN4S4bQ9bAbojBJdbKeq27Hw4ek+
 yyU/RKdmfmch3diTR3qSGGNcQAPZQp3aYDCWivIH1IqZyFmMye5AyLTdTFVvfrZJCYfo
 BCKB43hBGpA9RALEJtkNEg5JXnm2Nb/kJSQFpEid/Gx4xg4JsCsm4kty/CwfN4T2bG/f
 exN/ZGesWZ/8y395fTul0Ayio/1cdGnVQw7WMJfYXa0/tEkpo5lYHJyaD1gIMtF/9V8P
 DL9XINn6Sg5wfgNgtSkTwKjJfH5jPkpxL/1AbTgM44eQ2U6KBiFlaA5Guk/hiH6LIGBT
 a/sg==
X-Gm-Message-State: AOJu0YwLKAdMgZcQw5U3PIFP50z1za4tAdZ6MMh5DtmO9YzG6QwIfXjm
 tKv69+Pjl12DOuIrOYMBV3Xqxw==
X-Google-Smtp-Source: AGHT+IGjlkOAdxRdEwuOXcdWZKXok3jGpK1DX0l0Bpjd6yJvBkJ2iYlPDjshubK+uz0Rkd6Z2bFwFA==
X-Received: by 2002:a2e:94c6:0:b0:2c9:f6af:300a with SMTP id
 r6-20020a2e94c6000000b002c9f6af300amr895710ljh.39.1702164095380; 
 Sat, 09 Dec 2023 15:21:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/9] arm64: dts: qcom: sm8150: use SoC-specific compat for
 RPMh stats
Date: Sun, 10 Dec 2023 02:21:25 +0300
Message-Id: <20231209232132.3580045-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The SM8150 platform doesn't support DDR sleep stats, so it needs
SoC-specific compat string for the RPMh stats data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 3cba87e00123..fb41f91cefc6 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3950,7 +3950,7 @@ aoss_qmp: power-management@c300000 {
 		};
 
 		sram@c3f0000 {
-			compatible = "qcom,rpmh-stats";
+			compatible = "qcom,sm8150-rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
 		};
 
-- 
2.39.2

