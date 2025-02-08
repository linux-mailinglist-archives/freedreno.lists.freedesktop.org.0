Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2280BA2D209
	for <lists+freedreno@lfdr.de>; Sat,  8 Feb 2025 01:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0451910E363;
	Sat,  8 Feb 2025 00:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RTknOCI0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D9D10E11F
 for <freedreno@lists.freedesktop.org>; Sat,  8 Feb 2025 00:27:19 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54504a6955aso147470e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 16:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738974438; x=1739579238; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=RTknOCI0jdXN/A8857RXkRN/vAsxotmrvkhTi+J4oCFQshilY7CSiU02hccL92YFfd
 u37X9RcRaXakXdqxkPiaoqus81dprbe405SJ3Ss8KIJX/pe03yka1L5XNLU6ardbqgtP
 MoapbwBDiS5EMIApGtFtq0PLGmfED0P06zQk5JQ/wEelxJ2OhwhXB/heJG/BCUdIAtaQ
 ZsYu6VmPx6NVbelmcDHspxBy01sHwuSaHji3wJ9hYTx1IRZGXlyyZpG0fNRC2lrCxvyg
 dfm6eVahVUxNAqrf1weiszd7Ke8xDZA/9ixtZlnbJkk1/MB78XhL1w7tbP97nhTqajUz
 aF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738974438; x=1739579238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=Ra1hQp+/sNzNGTTg6+wyxeVpga4kJNdKunv+/9y9wciiw1E0OcWeBXSQYJDnUR8fD1
 BMs/PYD7TLBFQ+cOtLSX2SaIhs3L3OSndK4j2hclFl+zCHp9SZE4Bxb/RYBv7uFCn2K7
 jNensgqkGfkB0EaLMyTM7nFAMuj3ivWFFd4vzhwG5mZVC5L3KqZdDYHYruFeNftVlVIk
 CXheYU/YfM1VaDlc7FY7ptTRFM/l2C2sw3p/QuwQEXdsyG42qphckjhYDtxJBSFlYTrQ
 ZpxFB75q/JSfFYKSinFXnijklh92T2+6iDw8sy27yD4AwartUvP2e9UQmw5PdegIlS9o
 4Sxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjlvPA2MIkbtzIlhP8v9w3lQm8/E/y5nk8gYG6DUjXJ0lPkEhucL43vraJbtCom8DBc8OOty0V7tI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQvDnaSAgu7OqYICAGwuTXLDjvQ7Fk1bLBZczDnTeN6biX4QNO
 lip+oao8WrQUIvpdU2xiN6EYKjNRUjXmTyKBf00fzSWXeH+r1XZ+vF5jZUIQbHs=
X-Gm-Gg: ASbGncvV+ilCh2EQjA3aPTBeF+BjMt5iZtQ0BYETcMEC2T5vn8wePNZWiNI2URN9i46
 45agHsXkwRkG/QrRAq82IEB5+DdB8WxJKDZkNK258AS+6l+gGpR3yx7AGH48u9Oxy+S/P8Ry+xo
 xVsbB3L9camrvuEiIqBwYDrEHy3JJsPnNbPYm3qVfNKZ56LzmOcCt0+KLqf2np426dGNPhDj2n6
 HN9kIV542KWg3CIMltfm7TzFsyPYwttoRFlmrGQcSuwQinyFhfhJPbfMCzzNxNAnJRCbK0LgbMS
 o+fySvf9cMeX8l6CZ6wt20k=
X-Google-Smtp-Source: AGHT+IH3Y1P8IibRE8PimX3QdIBB+8KzPyv/64NtH7atJbAfIgaIwZ/7O+qYGCTF7buvXpdwnAV/hQ==
X-Received: by 2002:ac2:5ec4:0:b0:545:17b:3cf5 with SMTP id
 2adb3069b0e04-545017b3dc4mr708605e87.47.1738974437603; 
 Fri, 07 Feb 2025 16:27:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:27:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:04 +0200
Subject: [PATCH v7 5/7] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-5-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KlCjBmWN3HQI30P1/iEnVtV7zXNb45CFcF9NRTzfcWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTWrQWEFDbf9CVC9qgdBlK0jVKQGg3SKi/ON
 gTwwoScGaKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1gAKCRCLPIo+Aiko
 1cVsB/0UtRNEVP2jHnQ9VOIFCpqTRWZujCjk3DakRH8sGwjX3o8Ui0S08wOopARizocxJmZ1zYZ
 ScxEmA6sj7kqrqFTXVxj73vdIywI5NsBL7yzMuTIUJKGXxgD4T9jkryGkJ3j1PGOioXSHBsN/AB
 +INyVwx7b3sd28sfgNwbvD2UpXCu5p4aHJVpe8LQoK1Ax7uYY2Pr85JyyqNsPfEWgr59jALGcKV
 hj2oVjaGpYIB5BO3CCCpXOouh7oW1fOah/V9XstBTV4QYNPAeplmL+jBwZ24nzhDECikLHvicyU
 z4T02turhxBUomrV4Lw7j2gE1nnyBCsTkr79X5EzFNAyd8ik
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
simplify its usage in the driver.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 1cf1b14fbd919e041fd7ac8a0731d554d4468f4f..0ebb96297dae80940dc8a918d26cd58ff2e6f81a 100644
--- a/drivers/gpu/drm/msm/registers/display/hdmi.xml
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -131,7 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		 -->
 		<bitfield name="GENERIC0_SEND" pos="0" type="boolean"/>
 		<bitfield name="GENERIC0_CONT" pos="1" type="boolean"/>
-		<bitfield name="GENERIC0_UPDATE" low="2" high="3" type="uint"/> <!-- ??? -->
+		<bitfield name="GENERIC0_UPDATE" pos="2" type="boolean"/>
 		<bitfield name="GENERIC1_SEND" pos="4" type="boolean"/>
 		<bitfield name="GENERIC1_CONT" pos="5" type="boolean"/>
 		<bitfield name="GENERIC0_LINE" low="16" high="21" type="uint"/>

-- 
2.39.5

