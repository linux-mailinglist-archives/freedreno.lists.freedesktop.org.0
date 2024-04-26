Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054908B3F51
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC40F113B0C;
	Fri, 26 Apr 2024 18:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fqIrJGxH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFF310EC50
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:34:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-34c0f5f5cd0so1689507f8f.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714156456; x=1714761256; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LHO9+s7dwYbcvg43RH/XhbKltbb5WXC2wNCdO0hOUOg=;
 b=fqIrJGxHwRP7x67aKtM5ahZVFeP/UlBl995/DxM2P6k20/cqWiII0RqozU8D9JxRig
 IHezyFlJaRUKHaHQ9zeR8ueJFaPxft5jgayAmd5SKsGTkyeyNHLbGg+KS86R+ljbcSy/
 7aBCXf3z4XdxJDPwPY5L8/+leSmxQQobPsks68iruH0+lwqMkZOxDn4VaZ5Sirtzlt+h
 VZX9XYT9xkqdsRsSgIJ9GaOGtzWEmdGDqrPCSzEcHtQ6K2SFBpRXMBBXSxPXoz1Lbmok
 KeMuDfET8DmcopRRBoRzGa0slBk0Mx5PkShNvouETA/HawACt606RTM3ENeDsz0gqTPw
 2VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714156456; x=1714761256;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHO9+s7dwYbcvg43RH/XhbKltbb5WXC2wNCdO0hOUOg=;
 b=XF/Yg43OQ3eUZU2fpMFBz0nh0/JjusKL+SXoMdS6aKzh8IQK9K1rJqBRCS/uj/O41w
 KGcqtpe2RVG+mqziba4NET0FvbFVsg7cUHwA2jL4NTQ4lgKDlVoRERUNMh/xGP5iXgxo
 GXxE5o49jIVkC7UILRTa9cd5+/7xStch7/7t55xme+pA1LJE0zZW0IuCqmEWSzN2GcxN
 jxJE3ndRc1gghgNByV91uLJPOuN1RqNMbKig1La7JDzj7MjHMqK6+qN4ogUrygluiL2K
 74JVBp0O3tbFGo4+4BqeJvd9Piq4Pssc+IZqXI6I9e6gjzTrthuLCOySeYTijqwVkMHf
 CB2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB1xkzBuHMfhYhobxlh2PWtHFnVwxsb0cCdNwcPu/8DxJsrSuL1UzuU0x7lwKh7a/KgoorGoE5HA2O2ofqjtKP9WurE46gJImLt343IW0b
X-Gm-Message-State: AOJu0Yynf37TlZHTb2+/5J/02/0BHpJsM6hKHY/Km9BGnjqNW3V0LBlH
 4Kz3kDqXdlxvkSaPiaSECMeopE4aJTlSXQ1rZnIAmYo51hM6/c9p
X-Google-Smtp-Source: AGHT+IGxvOS371JZ578NXDpkxx1Yp7GpdcbmBlSgZtXYx84NZcLNH1r2vDIeMNa63gFlwJSCWfet6g==
X-Received: by 2002:adf:f007:0:b0:34a:74b7:3d43 with SMTP id
 j7-20020adff007000000b0034a74b73d43mr2330713wro.21.1714156456299; 
 Fri, 26 Apr 2024 11:34:16 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 11:34:15 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 19:33:59 +0100
Subject: [PATCH v2 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156453; l=916;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=FgrHStJWxmpAEZMZ2wgWBGQcbCI/vHyX2Dufg6pXZPQ=;
 b=m7MzYEAOpzrakl0SmAdytTqsZxLHqiZxrkiMz7wap9RAwiDRYGRd8S2J3FJ9jrabgSw/PpAxC
 LCzkL3UFGbmDAQrltzOWNnlW7GKGkiOmoWj+wSgdFnEa0GoNzcDRMqp
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is doubled compared to previous GPUs. We can't access the new
SW_FUSE_VALUE register without this.

Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 658ad2b41c5a..78b8944eaab2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2607,7 +2607,7 @@ tcsr: clock-controller@1fc0000 {
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
-			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d9e000 0x0 0x2000>,
 			      <0x0 0x03d61000 0x0 0x800>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",

-- 
2.31.1

