Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A7F68B36A
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 01:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA2810E311;
	Mon,  6 Feb 2023 00:27:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259DE10E306
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id mc11so29811554ejb.10
 for <freedreno@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
 b=K2C8OmmYLDe9OgSRVG/UAqx6U+TulXaGYzBLcl9ur5siVQWhXdNbBvv+dRKGNwRUyK
 ON0vfsXGVHAH4TdIkBpW3RMMb7G9Cz25ktOBos7BwcBe1pptKBrGjbcQqSPx2RL7TMb+
 Rmp0PvidYYQZdADBlzSxdGfQou9/hylKnWYfd6Uudp/khcn8EGJ4yNmUS33lJWZeirIz
 ND+V/1Qj6PSSwkRweyREeb+5RQRTA4/d8n8IyEpLk7mawYCKKa9Ul22cm+8QSnAU0R3n
 vlRYgYmRZVQXRzgmmhsjeqGeK/vBb3rc9PwbBLR0C7/IPSoihk2+oggcgruNU2Mgv+w8
 lRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvpJire9Oix0QZVP0x0MsRm7055RqWG85WNJGR1ah78=;
 b=v4xhTNl3ZdU8n5frKMMsM6JCDuQQJif+YRva/MCfTw4ZvHz+B1j7+8hf4+IS+kXVf8
 DFUMi1P6TpjN6NjZFMwxW4Jpnc9f8g5xQW0zVZ2mlW6nBgJl1AV9unbWhO5MOHP+rL1e
 6ifO1YOxN7hr6Hfcqm5aAGbsfW3QKYrvUd7yzfM/jL9i7N0uoHF58vtpbdXRM8sdP/Lh
 dlhTBIPtLnA9uuzsJNxL5YguOlwTMIofkI1KVGo3ETi7h5ZH+HpqUAky1OeOPhhqs+lC
 YfjwwNEUG7dbjIAek6gQbZBjHU5UHtGmvR5+txtHbKjg41oi08kYZUczEEJnf3LWYVTd
 dF7w==
X-Gm-Message-State: AO0yUKVBuTraqr4DDhHXZC1s24vrCWiX6V/mb9Ajd7Ftz3nZRgatBp8b
 BeCPelA3585NeVMFvvi+eO5T9Q==
X-Google-Smtp-Source: AK7set+19/vKl62cK332+ZCFWeKvlTsYTe6ZjYoKDmCYrN0DndYD9oPU9OCmnl+2iZc/kdYqtrGnNA==
X-Received: by 2002:a17:907:da3:b0:891:b1ba:4c85 with SMTP id
 go35-20020a1709070da300b00891b1ba4c85mr7946118ejc.74.1675643268790; 
 Sun, 05 Feb 2023 16:27:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Date: Mon,  6 Feb 2023 02:27:35 +0200
Message-Id: <20230206002735.2736935-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 8/8] arm64: dts: qcom: sm8350-hdk: enable GPU
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Enable the GPU on the SM8350-HDK device. The ZAP shader is required for
the GPU to function properly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index df841230d1b7..5e744423a673 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -284,6 +284,14 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm8350/a660_zap.mbn";
+	};
+};
+
 &i2c15 {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.39.1

