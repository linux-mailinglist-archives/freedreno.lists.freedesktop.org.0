Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A30A1BE0A
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2025 22:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3357110EA36;
	Fri, 24 Jan 2025 21:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UJgBB7IH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BB310EA31
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 21:47:57 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso2730271e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 13:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737755276; x=1738360076; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=UJgBB7IHSJMsQbylR6vk5Y5k3ft7rHz3cgdNQVroLevGJi1mr3PcF2OmAd4AZ4PDlU
 xOiG4Vn1JMC5PHll4p9bdZqjnBy1swdmox13jkN61AsgnxWYIYASDY2YQIQ2HL/CPyOJ
 1VrAXzegxWtFDiy5urTlBmbx2ueSvvbOWbrzFmq9haUXQ7zJ3+onPqiftNe6LY9JNivP
 pGWYofUZDgZrlMBFKXabNdZ70JUiKiDePjqkqWVOAhp4dm9Y2tYd8LgjyXftOMHlF1EN
 Y+32ILXut0vbWrbH6eOjsxJyTen38KU9HfPU0YFCprg9bu92sk2p9MGKEXJJFqBqxUTT
 BCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737755276; x=1738360076;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=POW/rUq9wErTftwA9VxuPW3yM9//OoLn+5wpEPe2mipu1R4sQnqZZTOxbjlXHJJXxu
 RewJv4NyqtfuNdVl7hJcacouh9wKcPuPSSZQHHnLpvVQrBR4W7HWh5kq85kFL187OeZC
 Yw1vJ1s5givfE2gba+Me7d5XpWEJVeNZdEFeBYeq4MtFURoBKNglDF6ryDLkkIvSAeJJ
 1XtPngLp3hGkU3FGe8Crv/82LDrTNZ5SLngBvDNI2UW0Qvtz8BwiYoTrd7v5PERPDlZ2
 i81tiibN2YIb4BBaODhN2Epf6C/YwttsEI1ozy/VQisNVVSZL3PF/VVJeCEvFCUYcVvK
 Gy7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIbxaASHZwzCV3+VnddQ0ji8tHg6aDzxjHgAQ3B0uXPkKxnzQadP3bFZ/6XSLbQUsNzCBvBxknZBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrBzNczU9VkMuqQBG3duzcKmTK5NQrIcJtUasEqh3nmAbStaGY
 SEmysVLHWksJfMRDy3IAAT6LltQG1bdxnVSLD7YQQiety0JkJ48IJdsR4NmrQiNYg3dGTi0gxVm
 3Kjo=
X-Gm-Gg: ASbGncvMi8MpSN2qNlBg9GtsMNJT5kOL2LkcwHrdHY+RY1MVUNE7vEuAFzgcYU7mR9n
 6tq+0iEmq+WJNWqsqPyP8YkfbJXoRsuM1y6IWz4oDP7SvRXm+EOD3I6ihKJPNUA0iyQOPkSDqgP
 1ZPkgK0tIWGPOjdW2Ijwi8brRxiOTjoq5mlB6fIgba8Kakz/J82YpLVhV2NYiv+VHMcei9qV3La
 bVzklcmcre1G03HCYQVFKtmTfwPm1QKJ2/UUFHSJCEQ/kvo468TqvZ0z/SbrxxZeaiBOfdbxmM2
 w9psAdLzgjJe
X-Google-Smtp-Source: AGHT+IFpny/zo/QvD2GXtlBH9/Wtg+ovbNpfKxp+xQf1OkquKUpDU3+qItxFEm0+BjAibqtxEpoQgQ==
X-Received: by 2002:ac2:442e:0:b0:540:1d37:e79 with SMTP id
 2adb3069b0e04-5439c249e27mr10731792e87.27.1737755275629; 
 Fri, 24 Jan 2025 13:47:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:47:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:45 +0200
Subject: [PATCH v6 5/7] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-5-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAqAj2Ty2fi86x5S8vz38vRE9W/qq6R3Kx+j8
 s6w/jwMhVyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKgAAKCRCLPIo+Aiko
 1XyOB/sH/E/XcX6vWytKMOGonps4x1gxBkl4bp3Jc6yHxcVJse0xCsVLRWkTZmGH8H4pTNGlvjw
 0lh0iM1h749lSc96XOQQ8YIZhoKyEy5VXPbZNbO+bXx4U+VLRjN2N7ISWrn49lk7ewlg+DaJ9i7
 fWcbAteWQMWfcNlIE1llxXe66A2T1RZ/P8hohJIwgl8w7Xqw9BPp5oLgqW2XZazB94IRjNxz/w5
 FrMw4/ngqacRX786m4IcsJUIc2+v7SYRgg5QzK/DbiHMa30YHHAIjD1mEp4blSC514ctkr43TWB
 nre1TR8wD6n6w+1y+Z5YqHm+00nzHwYB/eRWUjKRZGsMKH3b
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

