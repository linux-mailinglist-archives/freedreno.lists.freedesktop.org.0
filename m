Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A7CD0EBE
	for <lists+freedreno@lfdr.de>; Fri, 19 Dec 2025 17:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D7910F03D;
	Fri, 19 Dec 2025 16:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="lybjJlsJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C96C10F040
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 16:41:21 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-64b8123c333so2251559a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 08:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1766162479; x=1766767279; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mFh6b7zgZI1HsA8s8Bqqbi9ow8eV3Aoe737Rsj3OItI=;
 b=lybjJlsJ9LeUB281MTjTmTCQ72cqUPgd/dCKNH+V9kcRyWWMGJFUTrKHJa5LVeQcVi
 TUjP5pNoW6806OJjy0xThnUbRsvxPLxTr7AT5k9q4AaZI8XpEmH+Z2RYdq0ax/2lZkE6
 tx5FmjU3H/BcYdyhwdL0BnTocoN5uIvunktVnArwQReMilHLjONIPIJJrwrgr+BpV+ol
 wmfD4BxkJ53VVu6eS8D/gkJ9CNGqfsOO4DJ1AbE9DRcUWr5RwaxBwM6Ie863wPNj6vKL
 /EEYZzXpLWIdScsx/3guw3QJ8YWe3q0Em8H/8cXucnF30TFcyB98wDzL2LsAzoCrhFUp
 m2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766162479; x=1766767279;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mFh6b7zgZI1HsA8s8Bqqbi9ow8eV3Aoe737Rsj3OItI=;
 b=ZSIeh9hYrs42ERSILwrGiEnXLXBEDAwII82quR3+hd80DVu6ES+nfIltaRoAhYJHU2
 8IH1CiZpq6XFRu2kpdbosSM0zpRjwh+7R3NuFNKbWBHT1fxPwvpKu/OCbLm1OAzpUYqG
 dLhY03yGgV2aExlUKBau+7adbpoRk21YyRM0UxCYqpuOS5HK4OwiJyx8OmHWT0e6ZEq/
 T50PxGO1b2G1sdOBmFZYP25MqX3Kn2JG/ab11SN88NhgPmldfsSMAptcWOILIppCRU8y
 s4giFjlrf6br8yMXCXIR7i5Lo5kZOQz21WBt+UZR49BhCPR63F/zELU3/BwbQ6O3ybKP
 fPQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu2ru/buah5IDhRbp44DBABLsy79RaQib5dCPArYzyqNXXN4H9xH8z6t1sgBVVXtjXfmQZOdcbeEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCHR/HYm5sA5a3jBmcg23q5KhQBCixZxQa7UsCOb4pdrVB4Yfq
 4UrEOJVJXRG2FeV4pa3f53WWe3J9Nn/w7NjRS+KpHh8wn61AjyvvEuyb3Nl1AzHGkBE=
X-Gm-Gg: AY/fxX5Vs+ducsFNp30Fs0PvB+m9lFVSd+wYQ4MQNOgE7jijkPxyhmt+pfJNgJ85K/B
 1X5cLHRYMNFWdzXlsQexPQ/vzxzvXHuc0JC5Q5g7aXo5dbr9cmSy60BGY+GQKZl88CVuuwxwHFJ
 UrJ4PAr4VnYmxejP02JJOyP+SDRIVEUDbrDRrqcAbgsaiDN/ze+VcFoN9zDgbac55BBo28fyHfp
 uS9ogOE6D+SzpnB9cz7C/9QGrYHN6mqXU7v46o+bOma//+izgQDfhCpInY3q16d/6j8GH0to67t
 PEs1FY5+5n724R9MIyWM1X5J3zBLk+dRdJ4n71KMjsiv38BmctUjNdYIw2fumE0FyiVYHvBQ3F4
 KZz76/u6Jfo5l5l/+lOcTBXHsghcH8djg0+VFYeKROjQ3JL8IUCxYDLvqT+k4wXCx+/ZPxjtN/8
 bncNiyOYolxP5FN4H04Q9E3iFGT/c6a1iwNEx5fnq4FXieHi4q1FezxwEmJYt1PUAb4+uXt3Smw
 yHv2DblFClkL3SZI1xw33mCgMgiTJmuE5U=
X-Google-Smtp-Source: AGHT+IG5xQQDju37djeKp8Zgcj7rgGU7z6CWHlLL/w7AfRHVUi9V/ccXZ3Gb0icbkIvDeWOUnP8NhQ==
X-Received: by 2002:a17:907:1c1d:b0:b7c:f77c:42e7 with SMTP id
 a640c23a62f3a-b80371d37b9mr396657766b.43.1766162479431; 
 Fri, 19 Dec 2025 08:41:19 -0800 (PST)
Received: from [192.168.178.182]
 (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:3b89:c600:71a4:84f:6409:1447])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 08:41:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:07 +0100
Subject: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=1527;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=t5HFnNXhnxSLu0HbcMB5zyaLqy0cPi/BThYL9zb/2sc=;
 b=EoGcG/sMLsZ+n/tQW2JV/CykTnYFk5wscZuExCSdKs6oC1UTb3wWbgCcx7IrWQcQSUcMonII5
 z2uIyuCf5hSD4AWSUC+TFtP5nwTgjA9IkL9CUto62zfEZhNtEBAZwyD
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Describe the Universal Bandwidth Compression (UBWC) configuration
for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 15d373bff231..790e67c7db3e 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,17 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data milos_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -223,6 +234,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.52.0

