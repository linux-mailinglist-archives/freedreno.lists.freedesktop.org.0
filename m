Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A78B7028
	for <lists+freedreno@lfdr.de>; Tue, 30 Apr 2024 12:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D67510E68D;
	Tue, 30 Apr 2024 10:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mpGJWYsP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EF910E68D
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 10:44:15 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-34c8f392172so2349375f8f.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714473854; x=1715078654; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qmr8dTXmjB4R2TIC3iha2y597f6KErUdWQLGHd0Q118=;
 b=mpGJWYsPMDigLIn+UGtabif0/gmTGTwLA4BjDz4BbtrC8d+oqLKpl20weFC9xqv8tE
 Rcqc05trcb9svn/qzuuBdZq5Wz0SEJ6m3JIKgqjzeJA6krj8LIJ7xWU0C0vIBvMDyjzZ
 NJy3yZbKNB252fBLhRL4pH0FGFeeVjPh6FcShVe/GpeNCGbx871o9/Nu8CrbJPnUfwvk
 slJn0V8dOun9ZJSXrAytpngc2Syw0Saf6FGShimN90aR5akzNuHagK/8zT93VOMsil1T
 6sza5sw9NvcDwhB9QKbcPe1igzzOsQLvtE2jKyndecZtu2H0FqpkEoko+0QH9ndZyNg0
 1dWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714473854; x=1715078654;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmr8dTXmjB4R2TIC3iha2y597f6KErUdWQLGHd0Q118=;
 b=eGYuKC+AhjwQOTc3NBJaqxwtHqdxnn8ovktax2drkM/2WMvgeyJr0STZXFAqc9zq+l
 5TG9mR4jpYcg0aB+xP/Gse+zXnoiLXZ+lMh2oPJ9WTazzk0ElYs01TyMt4YbQTLivaSD
 3Q41ymtL4cYATDwWos75momG7uChnxtnjoW1LgKQlMFKaOZnhZc/eQCw3qU9EDetpHRD
 GKcyUZ/GxLn+4GpDt09wVV4lHI5pP1ePXcL4do2BcR2FIHnQgBjSC62mbsKE+Xtq5Sny
 b4m+RIhwMO3gtImuHfGzSmyX5NYIz5Ohj3AtOIC3eYI44ylm69Z2V6tx4wH6x2buHxT8
 EbXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfDgpd/hwkiPFnjc/GmEG0Z1Ikx4Z7KaWurzq/emAu8b7WHyi8mei33EkUrYJUZZLPfb3JiyhtQ/jdVMUZq6pfY39Tf4novZSvaZ9c9TFy
X-Gm-Message-State: AOJu0YxujsCVyWQzIOTQW4e79MREd1fN1lhDbMMhrkBZhhSwNwLSPgi/
 +OoB9YP9ceZp9Qhn+6GQNoRs00UtwAkc2fpkeWOwZadSpy9ZrkZP
X-Google-Smtp-Source: AGHT+IEUFFGWrUGe08CoaGquY4VjJG9mPVI5jXUW4owBwPoZnD3wgvmo/zcbryoI/p0af2SnsBFKHA==
X-Received: by 2002:adf:f3ce:0:b0:34c:5e02:7875 with SMTP id
 g14-20020adff3ce000000b0034c5e027875mr10581370wrp.7.1714473853973; 
 Tue, 30 Apr 2024 03:44:13 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 03:44:13 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:16 +0100
Subject: [PATCH v3 2/6] firmware: qcom_scm: Add gpu_init_regs call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=3010;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=TKn/26YnezLy20U/najOcBKpivRdMFdNQbNQd8UXKNg=;
 b=nPXAL5pTBU3gEo3QipQ3oHu24CwT1kTMGwXQ2e1evASNv9IS9+ltjYA0BdCb76JBdN8yEVw7I
 brgVzcZN8QFATIQo6+2IgaBmyMiijI59GWahL+u1IZxT2C359DGv9QZ
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

This will used by drm/msm to initialize GPU registers that Qualcomm's
firmware doesn't make writeable to the kernel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
index aaa19f93ac43..a221a643dc12 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -115,6 +115,29 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 int qcom_scm_lmh_profile_change(u32 profile_id);
 bool qcom_scm_lmh_dcvsh_available(void);
 
+/*
+ * Request TZ to program set of access controlled registers necessary
+ * irrespective of any features
+ */
+#define QCOM_SCM_GPU_ALWAYS_EN_REQ BIT(0)
+/*
+ * Request TZ to program BCL id to access controlled register when BCL is
+ * enabled
+ */
+#define QCOM_SCM_GPU_BCL_EN_REQ BIT(1)
+/*
+ * Request TZ to program set of access controlled register for CLX feature
+ * when enabled
+ */
+#define QCOM_SCM_GPU_CLX_EN_REQ BIT(2)
+/*
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

