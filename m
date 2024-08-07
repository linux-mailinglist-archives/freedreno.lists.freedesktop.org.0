Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCA794A7C4
	for <lists+freedreno@lfdr.de>; Wed,  7 Aug 2024 14:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DA410E4ED;
	Wed,  7 Aug 2024 12:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HFMjUXhP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6481710E4EB
 for <freedreno@lists.freedesktop.org>; Wed,  7 Aug 2024 12:34:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42816ca797fso11912765e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 07 Aug 2024 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723034086; x=1723638886; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z1730mRsiiRXYfsgu04nDdv5IB4O4YngwsTVcNbNbzQ=;
 b=HFMjUXhPIhenk0Q8MqWKrIoyEYWEsxE46QwhRVZ1QXHTuyKWHJmPO8S5JdrtqFptLy
 5kKA1aKKmQdt2FGZm/0N5P90UdFa8rcm1sBAoswUMVUTGBfDSPw2lFltxbXtwknr62PL
 rwgq7nN5GbTwyE22iPnhicWwWbZAmcJKSjle8mSMG69HFX47GI2fL7YjQTnBLPNnDN09
 PsVfmtNKaBLgjrro+eZkWwxnX2IWIsjOoIerVP3rg76whuYgSCSPsMSeSuYtK/K/XdN+
 cWFEItvs1U4t+TXDywYUyfwI3VfpCHKyGReJiHGJ/W5be4T3X4SW0Iku9gDuazTKESV9
 QpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723034086; x=1723638886;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1730mRsiiRXYfsgu04nDdv5IB4O4YngwsTVcNbNbzQ=;
 b=BA45gUdRpiR56monr3B5OntLL6u+Kt3Ut5IVfRSRdLRdzm9CMUGucPdscjt3qnRo66
 X4SO0b6bHMhnt9QPA+h8zT4IIIOwcGSLgS5i1VjMQInRFXq3DcqgIrOzteWS1ydO3dsC
 BfWv9wK8Sd2uYUL1g6bQwhQtfeRT3+TzANtfUQJ+ZMtPMpvmOBxsgCW1BnbN4krEd5RS
 QKff7AgnbH3bQC6N3n/qhk0b96yf9g2gpZ7bQTPpKpYX38SnN+uti2tktqfK5vZiuIlA
 qdMGhfsXnCxqY8nKn1ocGS5oIcOOzkH1Kysa2RoUQekkuf/bgj9qok29Z975trgP4rPS
 wQkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3d4blP8DkmAgBRjL8pi4wOMITDt2oIFHY1ravVY69LDKQDVwa5XmkK2UblEhKU/9X7ne/mxmUZbfTBF8Mkhixb5Ms+dC4OgCB0x6/HRPr
X-Gm-Message-State: AOJu0YzfFLwY+lno9Hake2h6Yfgoy4fvZgX5CcSoRlfJvzID8SDvKL2B
 BnqUMWtHdHMa5WW1uVQIQi1e8QYUNoppq7wlJFYrQNtRRkPmF+iN
X-Google-Smtp-Source: AGHT+IF7XR2+0mDDMNwFIrcAQU+gpFvdUP+W3EsW21nzOv/ICGcIgNlbSd5CgeP0CZfoDTem3RkDHA==
X-Received: by 2002:a05:600c:4ec6:b0:426:6960:34b0 with SMTP id
 5b1f17b1804b1-428e6afea7fmr122535695e9.14.1723034085507; 
 Wed, 07 Aug 2024 05:34:45 -0700 (PDT)
Received: from [192.168.0.12]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059714d5sm27198425e9.13.2024.08.07.05.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 05:34:45 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 13:34:29 +0100
Subject: [PATCH v2 3/3] drm/msm: Fix CP_BV_DRAW_STATE_ADDR name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-a750-devcoredump-fixes-v2-3-d7483736d26d@gmail.com>
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
In-Reply-To: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723034082; l=1121;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=8T4wVzkwSHzii8as2XbKY/C9UUv5Tca7yG03x9E+Etk=;
 b=wqIDhuEtX7BuG+jv+vjbRVSIMhMfbRqv//dwO6pXsZU7yoCL6B/Ds++kyG+eycDhzvfmU1tH6
 XiN3OGqFP0nC/FEfH2WvGXWOcXg0C1j09EJ+Y0051f9aU0voy9B3n89
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

This was missed because we weren't using the a750-specific indexed regs.

Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index 260d66eccfec..9a327d543f27 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -1303,7 +1303,7 @@ static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
 		REG_A6XX_CP_ROQ_DBG_DATA, 0x00800},
 	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x08000},
-	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
 		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x00200},
 	{ "CP_BV_ROQ_DBG_ADDR", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
 		REG_A7XX_CP_BV_ROQ_DBG_DATA, 0x00800},

-- 
2.31.1

