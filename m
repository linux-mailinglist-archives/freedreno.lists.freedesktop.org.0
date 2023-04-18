Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C16E6BD6
	for <lists+freedreno@lfdr.de>; Tue, 18 Apr 2023 20:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A6910E834;
	Tue, 18 Apr 2023 18:12:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9DF10E83E
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 18:11:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 eo4-20020a05600c82c400b003f05a99a841so298262wmb.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681841479; x=1684433479;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GNLIbIkfDv+9349rG8wTY2HZ2mEpz3z6lx+72T5OpbY=;
 b=SUTeE+ozxQY5RhTCnjTwf3vRx8fch7xurY/TcHvAu3mvNTADJdpe04DhRsrbBXQUqe
 IW5NMdyiwDKQg6xbyZnXi2/jI6AfE450oll3yfEuSqowh3vgLAu8N2rbIrh8ETBv71Lr
 ZX1wXDk1J2+JxCKeDZayNPH7+ROzgquwXBi7tCBwk8CdnXs06GeZaj01b/PN1+nzXREH
 XMoE4qd9GbrjLG2Pkw7zE4V6W4/TUEcG/ThdniegBfyPwhqd/WyWs2NyhMr4kY1tvdTq
 /UUcAo9G65h+3NKUBY/VpgUiEsPNph5iPaivWo9/Kx6O5XgA2Oq94hCaOd/fW+eSVX4l
 Muzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681841479; x=1684433479;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNLIbIkfDv+9349rG8wTY2HZ2mEpz3z6lx+72T5OpbY=;
 b=XTwg926IWXXMAOqiJLmDusWYcCpGZX0m325CqtdoF5KSdUseOTpR6OfO8aSKSlpViD
 99P/7FctYYwfzPRHI+l4XGJ+/jEd5EAMLMnyEBfep2EGjjwETmQK9ZzDUrHZmpItgEyv
 zopeIBaPsLQmsQZT1eqHIbk3/Y1NaorxGi3XPtb0cT+j6Tlbved/PgMKF6XfMo/wmH0V
 41SMWCtzJVMAoS77FuJ65OT8tafoFQgwnkhwDwARiAHdaTGmarrI5xwUCu9QjQlZdC9R
 6ktT5b5GLzAAaaUPfgelsWOMt5ffq4Rh12rf3K/AxxJomvhSVhso4ZtBM9Azx7QUEXHs
 vCTw==
X-Gm-Message-State: AAQBX9evN9tjVnP7njEF9hMW0rdsM3I8hh99pUsrjhQ38R2OLCUPGLp7
 dUl1LN8YSgzkQBge7FMb9uIg
X-Google-Smtp-Source: AKy350Y5K0w4P5Hu/xmAlBYeiNvJQgzuQzVozBZ6pzBvgykN4f1OfOXSepZHQfDqZzGBeqIzYvE8iQ==
X-Received: by 2002:a05:600c:378b:b0:3f1:7aff:e14a with SMTP id
 o11-20020a05600c378b00b003f17affe14amr1848693wmr.39.1681841478783; 
 Tue, 18 Apr 2023 11:11:18 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a5d4e51000000b002f01e181c4asm13727898wrt.5.2023.04.18.11.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 11:11:18 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Tue, 18 Apr 2023 20:10:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230418-msm8998-hdmi-cec-v1-4-176479fb2fce@freebox.fr>
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
In-Reply-To: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=fhrPgtytI/VRf0IiIxFCjsL95vuhTLfx4rQMFZjeLTM=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkPt1CWxkNDZ9xyVgrYUSeHM9gk5iCCYafwuF5k
 Ek74p4mhkuJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD7dQgAKCRBxA//ZuzQ0
 qxTREACDQikHrhslKZwbsvjGDHuH/n8bR1jRpYMGyyM42c2rXK72uLu+mE2oinXZKGo4ge4GyFs
 Vs10d4qYZ+ai2tO0sPWS3VqfH+aV3EUa/45uSnINhdHDCix1v55ns/ct7OIrhqze65zXnFWjBn4
 rIpTwZZD8ptnfu3PD75W/4ednMa5qv4Cq5A+6iTWTDb4SoXJozQhASgIg6s8rw01fkBNnn8Tj3J
 ZTxhXe425Um/gVIvv9kIY22q+WbFunBHcVCgaNn2KxKENqjrr85J+lTHp1/Q7f5GxEE9zAQdmlR
 OO8OQoaWgPrTFdbm0Nif9zIBKJSwhcqUWEkYnwqGQozK+XTvpBH1lAOzw0jmP0yoq2/O1gtPQGK
 8O3MgBGaAjW5WmijllyFMueqo/jxNdQY6CKTwECS0qAt5mhQR+DJHeUNjxQnP/Zco32SE1l+iV9
 gFP2eJe54nL1JTRpGIFwaQtggunIoXcQ6gHIq7+J+G8wDLYQWXgDPEHFrWLRKhgxRJAKYmjefZj
 +zA8frDDKGIihpD46oo0E2Rl5E/CXKB0c8RBPup1sCCjUYsbzucmyn80FAX+c+O5L1QRAKkeM4P
 /6hS1LEt3R4s5hLh04mmfmoNM9eoA+6hSHyyotiVLyOlGnbSji/sVGQiAx80aQvNaMaNqS1Sh3h
 QBWinVFanysKJWw==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Mailman-Approved-At: Tue, 18 Apr 2023 18:12:13 +0000
Subject: [Freedreno] [PATCH 4/4] arm64: dts: qcom: msm8998: add hdmi cec
 pinctrl nodes
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
 dri-devel@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

HDMI is not enabled yet on msm8998 so the pinctrl nodes are not
used.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index b150437a83558..fb4aa376ef117 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1312,6 +1312,20 @@ blsp2_i2c6_sleep: blsp2-i2c6-sleep-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			hdmi_cec_default: hdmi-cec-default-state {
+				pins = "gpio31";
+				function = "hdmi_cec";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_cec_sleep: hdmi-cec-sleep-state {
+				pins = "gpio31";
+				function = "hdmi_cec";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 		};
 
 		remoteproc_mss: remoteproc@4080000 {

-- 
2.40.0

