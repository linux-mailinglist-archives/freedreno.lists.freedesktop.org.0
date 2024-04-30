Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BD48B702D
	for <lists+freedreno@lfdr.de>; Tue, 30 Apr 2024 12:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E59210E9A3;
	Tue, 30 Apr 2024 10:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HxXvO1Cl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694CA10E9A3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 10:44:20 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so6987633e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714473858; x=1715078658; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G6FI6Pr5Zw7YU5fITapN3BSMuLEhwI7dVwWigXJEbPU=;
 b=HxXvO1Cl7VgndhV6rdFUFbTJXVnVwxQqUgT6CnhPt7AB1UxU0pAFyKLNpMRWVN/Ujq
 R9i3zND8ymM/l/ECPV5NbgtRrD7zTRyTQ92i6a8xEcZ529ygWlHc7YYzVS7DoPHpVQEX
 CWzXDqNXKhtm0JuP9GsD9++b23hNjitFwE7GS1hDJysX2429lxvtXLZcfFR07vPnQ0WY
 Z8dyblsbx3Km943cbQFcfrmTQVPzFupdNdekDVlA8PxI88NdIPvq23bS3pQxtNAHX5wC
 uYTsjAjXeQybYjSNFeYLKEILI/YUvof8raISfs241iodo9IpADCj+S48UB5g5GqO+AaY
 0n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714473858; x=1715078658;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G6FI6Pr5Zw7YU5fITapN3BSMuLEhwI7dVwWigXJEbPU=;
 b=SibsEPB55wlbNhgcXNBCsH+gUyGlsxJwFaXlWnZ6bfrXudCpa6RLQ0hJj/mEohe+iM
 uR6btRjVdzBqVsH5oAsibwv4j3EKHEEFVG84ngrLLtBtwqSj6wOptqiVo1pz+2AuwBdr
 CvnYeK0ceH2l8QdHickMX1LOZbspnJPg2gUaXiKOlSCxl1NcwmNJeE4Yy6kdkG3Ontbn
 pMin6pm4z+WXTBkZTxLrPf/1UbKNDf48otmzEc8qKQhKmmoc1F25booHIDaTExaDrUvd
 ReTIG9pBC/rmkwQdiRre+okSEIZKyJEt9Z73oVMPLJj5OksfLuZN+ylDw7pePkHvpnuJ
 DOAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE4tED0OKPQomoolADTlHndO0sz9q5SVbYRf7TZCsaZxOfh2PeRlwAbQhGMtOfF07bsWWRxcmzFXL3qm4HNdAtHhKNITLFLaPfxXS32IAQ
X-Gm-Message-State: AOJu0Yw0CsK3IrBTLsyouVkYQMuFSbwaEZ6HLfq8tY8oC89LSrMZUAAQ
 3AS1WvzaBQ2LAym5GYaLvpqIADT5KrfFZhPmz7mNY9POTz3UJ2Mu
X-Google-Smtp-Source: AGHT+IE1/Hq+tFW08EaAqJcX/KieuMNro/vZRtBgruiDeTAF6Szwb0xjPS8W1TwAeFIB9vKcihxQzQ==
X-Received: by 2002:a05:6512:4013:b0:51d:2056:efaa with SMTP id
 br19-20020a056512401300b0051d2056efaamr6845331lfb.32.1714473858552; 
 Tue, 30 Apr 2024 03:44:18 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 03:44:18 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:20 +0100
Subject: [PATCH v3 6/6] drm/msm/a7xx: Add missing register writes from
 downstream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-6-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
In-Reply-To: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=1178;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=jmofaJ3QWKGh4FuQgnidJQUjJ4vAccqiIwWwk4VBoUk=;
 b=ujp5kRgQelCyVGrPXqO7Kl6H4xLU3dtkkFWc1xAKk6SPvxdAcmD/lCjWErIW2i2gG1Q8n+eOT
 XvDBjRqaVWmBj97gf7s7X4XErXC6is+dMOqDznpv0NP0SF0YmjR4s+R
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 52b080206090..24a4ed9bfea9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1953,6 +1953,17 @@ static int hw_init(struct msm_gpu *gpu)
 				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
 	}
 
+	if (adreno_is_a750(adreno_gpu)) {
+		/* Disable ubwc merged UFC request feature */
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
+
+		/* Enable TP flaghint and other performance settings */
+		gpu_write(gpu, REG_A6XX_TPL1_DBG_ECO_CNTL1, 0xc0700);
+	} else if (adreno_is_a7xx(adreno_gpu)) {
+		/* Disable non-ubwc read reqs from passing write reqs */
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(11), BIT(11));
+	}
+
 	/* Enable interrupts */
 	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK,
 		  adreno_is_a7xx(adreno_gpu) ? A7XX_INT_MASK : A6XX_INT_MASK);

-- 
2.31.1

