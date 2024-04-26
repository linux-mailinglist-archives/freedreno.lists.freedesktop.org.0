Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020218B3F52
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AFE11A6E8;
	Fri, 26 Apr 2024 18:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b85jCL1p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40699113B0C
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:34:19 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-346359c8785so1970131f8f.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714156457; x=1714761257; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wPGsofIHgWBL1F+g9TnTaPw7aEN5jGWIc3fWppeCwfk=;
 b=b85jCL1pkt2WRb9wmXWik4cKvajPsAy8+g6d3ZuUZz2cAlA3vtFHBp1UB+RpYDLwu5
 6w7MbFwGpUVIREy9tW3/BoQVJtRYSG5bqYPygxksWk8y9jfnaRRKaeiqhrWuNRHQ8GE5
 PIdTQVQS1Qwo3vW1XNk7cNlol4ARMV87HEVThMhVCAF7YwCv51WALapn7s8B+xsRcYkt
 VwaatUtk5zWNfmwtSjVjcPHgVXV2h/qJbaHyiw+lZNmxzjycQI9sGFWvttzVGnyeUj4e
 DQgGhfImjYLGqfw+ymgN4ri+q99VVFiNjgMk54CVvoH3vJOvPOi3CEoDXykM6a45aRSy
 BOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714156457; x=1714761257;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPGsofIHgWBL1F+g9TnTaPw7aEN5jGWIc3fWppeCwfk=;
 b=Rh7mQzmbViRG57EvPwpiCkx5Hmzw9BXhesg6cGxAJfs8CKHDcrLqH/EZQeCS3c/CC1
 /ExuCM1PXWwUquI1veG4z+uFsOV02PIKWgJ/0JjLxL60NZ592heRmoyJFUBIIwLuadQb
 ZEJ9mLxnuLkPHucczHAH2yyLltQ2vn94DlPXve90msl/9Qoe15dfi+8oYBAi00ZuA1WZ
 T2dhq/OUCNV9dUZZzzaokVHbq1nZrElKunjU9rhDZuqu7+IukyGXwfHFy5NCtbxezIXl
 RUqW92JvRvJ5AqIFgdH8tP5NAnAPA6/pK66vNhzy1pmRlYUztAA+Zd4iWQ19zIUU5Nvd
 bw7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzzcjjJaehcMbcb3uatPKL/BKq91RbHOfMQLtlNKaayISe6gysk1grnNyxudH4ci4hpGmi4R2IG/UBfqpaM8ye7qyB4gIMX5wbro+eNi0A
X-Gm-Message-State: AOJu0Yz2cKw8SMwHQ2RydA9XEEfZenjwZu7oogR9iqZtDicVQTP0Z84s
 fULmQJdcKH+xfhV1BvmSJ8LaCej/VQpuioAUF6vIO1WYlKBGrql28ZS4d4Eg
X-Google-Smtp-Source: AGHT+IGNEQRnCcWAaBVV+a1LMH8fijRxR5qN8l+QUkTdo2Pldhb4ntfED6KMOYAccZjPbrSxV2rI7w==
X-Received: by 2002:adf:a395:0:b0:348:1ee3:48fa with SMTP id
 l21-20020adfa395000000b003481ee348famr2512595wrb.47.1714156457381; 
 Fri, 26 Apr 2024 11:34:17 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 11:34:16 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 19:34:00 +0100
Subject: [PATCH v2 2/6] firmware: qcom_scm: Add gpu_init_regs call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-a750-raytracing-v2-2-562ac9866d63@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156453; l=2862;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=N/n5sG6Oj7TiRA/tmfItyZc/ajS5lCwpGG8c+dowMcE=;
 b=gLPELZvLs8tfrH5ezqYstN9qVHFJGVLeX5AmdHQ73mgpmNEylkjAZnQ5jYadP+J34x8mcvY9U
 AL/1y0h7fhWArvEBu4hMsqFMt4qoiWHliAHXC83G2wiXChjNMtTBRmz
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

This will used by drm/msm.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 14 ++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  3 +++
 include/linux/firmware/qcom/qcom_scm.h | 23 +++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 06e46267161b..f8623ad0987c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1394,6 +1394,20 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
 
+int qcom_scm_gpu_init_regs(u32 gpu_req)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_GPU,
+		.cmd = QCOM_SCM_SVC_GPU_INIT_REGS,
+		.arginfo = QCOM_SCM_ARGS(1),
+		.args[0] = gpu_req,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
+
 static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 {
 	struct device_node *tcsr;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 4532907e8489..484e030bcac9 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -138,6 +138,9 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_WAITQ_RESUME			0x02
 #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
 
+#define QCOM_SCM_SVC_GPU			0x28
+#define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
+
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
 #define QCOM_SCM_ENOMEM		-5
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index aaa19f93ac43..2c444c98682e 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -115,6 +115,29 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 int qcom_scm_lmh_profile_change(u32 profile_id);
 bool qcom_scm_lmh_dcvsh_available(void);
 
+/**
+ * Request TZ to program set of access controlled registers necessary
+ * irrespective of any features
+ */
+#define QCOM_SCM_GPU_ALWAYS_EN_REQ BIT(0)
+/**
+ * Request TZ to program BCL id to access controlled register when BCL is
+ * enabled
+ */
+#define QCOM_SCM_GPU_BCL_EN_REQ BIT(1)
+/**
+ * Request TZ to program set of access controlled register for CLX feature
+ * when enabled
+ */
+#define QCOM_SCM_GPU_CLX_EN_REQ BIT(2)
+/**
+ * Request TZ to program tsense ids to access controlled registers for reading
+ * gpu temperature sensors
+ */
+#define QCOM_SCM_GPU_TSENSE_EN_REQ BIT(3)
+
+int qcom_scm_gpu_init_regs(u32 gpu_req);
+
 #ifdef CONFIG_QCOM_QSEECOM
 
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);

-- 
2.31.1

