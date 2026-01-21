Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEGOCoYBcWmgbAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 17:40:38 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAAD5A05D
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 17:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670A810E853;
	Wed, 21 Jan 2026 16:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R94cCx0d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D20310E83E
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 16:40:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso452375e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 08:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769013631; x=1769618431; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dhACDPHLI7qChDV2w7aC2l8AbJSpZTGzgle7QIcbXyg=;
 b=R94cCx0doj7u02S15p9wVyy/qqRksjVFYejJ4bbRZEqs3TRIw4fKiRvig0vAQKHuB+
 ESCrNuYyXcwwrrtK1WIif8dOAwZ7tBnsRI3/I7oU+GaiJZslwEuT3mEeQ/3WE8UA03jO
 mzu+OQdjrMyX1krtkPb1B/hGKcIO6uBsXYuwIrlfiJgdBkvI0k3SDO0UDZEnBrNZhwaZ
 uv0YnPsPAhjAE4/GnqLK9rVHefkeS15sCnqhIPYl8XuhFmDJqI6zyOHDj6bVeQKg2SXE
 L8oW+E8nyElDFVqB1yllOHr4E/PnygHVW4tsGEpKHluk741OJ29wsLbsqUy75b/DmLHp
 uiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769013631; x=1769618431;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dhACDPHLI7qChDV2w7aC2l8AbJSpZTGzgle7QIcbXyg=;
 b=KanrvqlYotTIX7tsfBurp8oUJMmVKch7yEozeAXo6GgWeZjw6RxP6h6UsEEI81BHfA
 6hVGgamd9MBsfSD0LkmEqAzutVottEaMmZ+EjTvUZ7qpnWsLq6SWyhV4ZiR2kCEd81iE
 8q1SBj4eWokJO3QNNyETU8oONZoO18pGZiO76IHmTf3qelkj2VMtOL+odyJbkEySXsPv
 +ZZCshc8IskxruMQFmqNU0dyPbrN2EO0sW4xRNGRZW3kPxZpo0uwkAjNt64JoSNQiRnZ
 Y36PWQIph5dmLnBNlDVs5cSYR1mCX5PVs1woOydqz78Yink7QVfzY9wOQUMgby6l6Qq8
 iiCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuczjp2rT4fhJ9lE7H8BgkkXAxMrdKB7+oy7PLpPf8wCvJDsYDM7/BMCTeJpJBSumJT+a6XHXiv60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+z5GqcCnmnGzXbEpMPOfylR9BI4teVSBl3e87ZAI71QITlpgp
 wQiC1yszlx9UFGfKw3EgujLLUxTS6McQjtewNmNazgMFATtkjqY5881VU1EZdafHbN4=
X-Gm-Gg: AZuq6aJUXCJimCFexEiEZnSMmkSVObKV0w4ps8Bc8PM9DaQFEfKd3xUBcOMYQRPbNLR
 2VuSxpzitOt0uFnV3nqo6+fjQsRp3lEaQfQGcXUWRZJGNaa19c47UTbnK8zbWKUgoUQZnDEQ9ND
 MY343GvzYo+iVCCZIwrnn04HhLsghUUD+3Yagh2xOg8QmjfCDhjVlCC+xJbos6wr9td8Op6Zda9
 QT9gyhUpIz6js2ehbQ7fWEAbztlUWtUAYYaQvd/GiispfmQ0zvjP1YqBBcjAHdmIuAuP8wDJU05
 s6JaKNmhZcOo2V68EYQoCNIgmihh13ptIsxSAV/9ws4jJC0Gxp4WqoCd8Q2vTnWKZU4a8oVjvfw
 EseAQS+wrMYpAdnsijnlkfz8ban74p7goDYXvNsdJFkAX322u5uaUk7DDaiQQjh1KlT1hTTpYhV
 mWpBcT9N3tP9C8cQeXIcUPsg5tTvak8uM=
X-Received: by 2002:a05:600c:310e:b0:47d:885d:d2ff with SMTP id
 5b1f17b1804b1-4801eb11002mr233352155e9.29.1769013630788; 
 Wed, 21 Jan 2026 08:40:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470287c3sm1000255e9.3.2026.01.21.08.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 08:40:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: dts: qcom: Add support for the Ayaneo Pocket S2
Date: Wed, 21 Jan 2026 17:40:25 +0100
Message-Id: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHoBcWkC/x3NQQrCMBBG4auUWTuQRBuCVxEXMfmrg5iETBGl9
 O4Gl9/mvY0UXaB0njbqeItKLQP2MFF6xHIHSx4mZ5w31llea5PE+gp+Nhy/saByq+mJldXxLSr
 YzOl4Clhy8JlGqHUs8vlPLtd9/wHAH3NWdAAAAA==
X-Change-ID: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 KancyJoe <kancy2333@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GucOFHbEItyyEMohgBU11TPz69Zj2v3jbLe09shtoY0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpcQF73XasjjuPZpifp64X6HcPJr4AO06D8Ckz+ajP
 JePH4V6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXEBewAKCRB33NvayMhJ0cRRD/
 4iPepGS0tsFVCwRjsupRcu4sFNYMd6a9/ty2I6Ka/f/n7Z1xNpM68Vw4+xMcrwEbBE8JTqVkgzz1zv
 P1z+e2gBaeopSuXPa82s1CNoyI9XwHtVJL0hKeYckfUTr2Ww75Y2GPnLOYMg88GHG2CDtCZpyGRXvN
 ajUIggup8QpBjnKbv6O31qJtuHrR2ASilfajHZvoePoWkM6iVruEH2ZcDX0wYIJEiNcvZ0sDerdQwj
 7x6pFUVoptK7yV3HhDrSMsmKR7k/EpAVzO0R7gMOWRlG8mOVn7jTXPcKqN/MsIZprQ5apptApldSsO
 y7V007SVRJgsQoMBzFSzSMRjfvjZ+W5cp7tgzLVwyfZHiSK9Zt2IhkcTIv8W6V3LD242w8vW5XP8jV
 438pgtKko0iRhhZfqhzbEWRkJ9mBIAI1B5fMqyfhBk3TDd55xAbCMlUqHKsi0ocSKJ5v86/bwkgY9F
 R/i1nWZuJ6OSvAHd0tOSlphjDhg+lOZasxehThzcmk0G4iAWCDcwJBEfEjIe7k9lEVkB948N3jpXfO
 U20qhwm17waC9roaPAOSJh/qyRECKf0ba2/SC/U3zrhMPF9OsMnSNfp/7Vgl1v+yVJXOS/SPhkhEkk
 SpHGxS1AFWpzT8LymVkJ3Vfr5/kyd6j4mWOh7qQdAirOkCjc8+AFSBegFMaA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:neil.armstrong@linaro.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,linaro.org,outlook.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ayaneo.com:url,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: CEAAD5A05D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Ayaneo Pocket S2 is a gaming console based on the Qualcomm
Snapdragon 8 Gen 3. It has an internal UFS storage, WiFi,
Bluetooth, gaming buttons, SDCard, 2K display and USB-C
connector.

Product Page [1].

The Initial linux port was done by KancyJoe (Sunflower2333)
at [2].

[1] https://www.ayaneo.com/goods/9344082149621
[2] https://github.com/sunflower2333/linux/tree/master

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
KancyJoe (1):
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console

Neil Armstrong (2):
      dt-binding: vendor-prefixes: document the Ayeneo brand
      dt-bindings: arm: qcom: document the Ayaneo Pocket S2

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
 6 files changed, 1452 insertions(+), 3 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260121-topic-sm8650-ayaneo-pocket-s2-base-05c348efd86d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

