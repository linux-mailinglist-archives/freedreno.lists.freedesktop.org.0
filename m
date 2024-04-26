Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8BF8B3F55
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89C011A713;
	Fri, 26 Apr 2024 18:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="boON5MrL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D4911A713
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:34:23 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-34b64b7728cso1959698f8f.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714156461; x=1714761261; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sJyBvG9J4gH2TAxw4m3BlgMY/XSDT0D6YjsSlCyMHaw=;
 b=boON5MrLWmsyV5BbtBJSH0w9s7qSCLmBek5LnhZwLfnZVsQ0RLP/EVDKQ5yTN+uiz3
 Ktqc2iBVdD9aN2+3eVQGVITq9yKRo0JPt2KSOx+G6fHtdQK5eB2byccD8blwO5OJTBLy
 /SUTJAg1I6P/Zjv+NRtAWlq02VHqGNJyKESXQUO48rS4vOFX7xDE2S5XoPv0vNUY/N/V
 VIzXIxjz9QF5Xvr0k8wqL2lhS716/Gm2215w6+Xn/EG3WK4LsG/KTyCIMIRH2+VtJ7+L
 BUFU4mOBEowuKz7js7CLomxtTn+g9fG/VoPC2i4/PdaTnCiG8ghatE0yY5DNP35mI6Bt
 CTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714156461; x=1714761261;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJyBvG9J4gH2TAxw4m3BlgMY/XSDT0D6YjsSlCyMHaw=;
 b=A3XuE1Mr9NGG71epOhcT/zAXZihDawdPygT6lqXqS3wzWrWg0B5oAF4dW85BGV5Qse
 5u48LRO7arxXn3yp0VxJY8Hxvbw/WCaJcU9eR3SadJPgojg5N4s5aJ6vo3nCiT10Rpuu
 fOLtXJGFNxh38LEcTQgPrTMb2FgIm1pZD7xEiwHti2AMdX2YicFxy8tUe8rILttCP2uW
 cOazg7Iok078PnCi4PvlbREg+YZPdxXY/BW9vDuJUqSKGC7NsBLGt69oBynUCm+EyUi/
 hNmMA5rzEf3G0XWczF7oW9Z+MqFOJLfnm9P7j991uiYh+tQZdNpZuK2p3D//rOJe+OMF
 TCWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU55IjRST6+Os+Uy7G1ADDvvv1tGtdiDnk6TqEibPWrG6tgB0QjnusFLrucAZr59thpA3wAjZTkbaFaxWwgcN2kTP2DRKq8XtD4KvVS7Wm/
X-Gm-Message-State: AOJu0YzZ9htOtNoWGwR0IyhV2a8e6fFDHOf/O/+CLvlGT3j3172zhI3W
 dG45tFWiEjGQt9xx8CP+xLXOoIZ3FVY2UvYz5JVxTcZkvB3hsf57
X-Google-Smtp-Source: AGHT+IEVG9WYS+/yKdEmVEps+doMTQcvCtbzG6uHCDr704EIXoq2oU9o7Vx/JzIwA9oDttvf8SkerA==
X-Received: by 2002:adf:e5c6:0:b0:34c:67d6:8dec with SMTP id
 a6-20020adfe5c6000000b0034c67d68decmr1590607wrn.6.1714156461460; 
 Fri, 26 Apr 2024 11:34:21 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 11:34:21 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 19:34:04 +0100
Subject: [PATCH v2 6/6] drm/msm/a7xx: Add missing register writes from
 downstream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-a750-raytracing-v2-6-562ac9866d63@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156454; l=1002;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=egrZvhM+VJXYHLqq3OZ5q41AGIhcMaeNPTkRYlBKH78=;
 b=o9fdkDoS/YkfV/V0z0h6hIhKhzcieS6htACG9eESo5iKjrx59eF5rnL36c8VHWB1sjdqAe8SZ
 0bXPLzO+8TPA2QIcjD1TetNUU4Znb1gyCaMCVQ6xIQbko3Za4x7ryPO
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

This isn't known to fix anything yet, but it's a good idea to add it.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4a3b12b20802..d88ec857f1cb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1953,6 +1953,14 @@ static int hw_init(struct msm_gpu *gpu)
 				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
 	}
 
+	if (adreno_is_a750(adreno_gpu)) {
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
+
+		gpu_write(gpu, REG_A6XX_TPL1_DBG_ECO_CNTL1, 0xc0700);
+	} else if (adreno_is_a7xx(adreno_gpu)) {
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
+	}
+
 	/* Enable interrupts */
 	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK,
 		  adreno_is_a7xx(adreno_gpu) ? A7XX_INT_MASK : A6XX_INT_MASK);

-- 
2.31.1

