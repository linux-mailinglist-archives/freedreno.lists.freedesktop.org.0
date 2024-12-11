Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0759EDBEA
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 00:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F22F10E1FC;
	Wed, 11 Dec 2024 23:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jw1qffN8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24B010EC71
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 23:42:02 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so5084673e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 15:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960521; x=1734565321; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hpZM1bpdXBqMU2u4yvRKwWP1PlueNed0ysv0mPSPR9k=;
 b=Jw1qffN8W5sbtPgti8CyqFjEMN0weUf3C0bIgd+sedYVyP1RVvsqpNfNWHkYucdAyh
 9B8XOR80E3nt3l4zkBh7c1lVDMUHUhUPwDiBmhFcwkk4DolyO3Gdy+wi5Q+lTeahoNtQ
 y3+qCLG1NizHZCz0sfa39BNRdE+UBNZYpyXFNTLrkAbJT2mp0BlkVsIvMpBTYWl4ODTU
 VxcrJ0sizeFPJdFZjicG1vSMdap0oLsZGjFldvCdLtkEJi4+6zjlaiMR9M69Fhyn+SJj
 xSmHpBeqdB16rU96JoEaluTZjlAjO065tN0RHXOAL8ebxEf7fv5FGA+BnNSuun98XUFE
 L24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960521; x=1734565321;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hpZM1bpdXBqMU2u4yvRKwWP1PlueNed0ysv0mPSPR9k=;
 b=WDEJFlIZr50OKq99CWHbJE7S+t5Z0IITRFc+CKYh3r0EXBnFsLdwbKjXogiKJg/kuM
 ICWcdkNtqK3kP45eZmjM0aRHDCTaLL9G1RlF7MAWHHNZJwLCb4wyCxD2lymaqMvIa6CZ
 LYBpXchFGaUXeXTpA6B3FisUdFkbo/cFs3Q6jxoagQc1iNpAHS1iAgqRCVcms4z5X9Vv
 vV+/luKzz5IfUJyxZxKxOI55cTMXXz89lZwzJ4zY7RJ9u0VOje8DYEfCbmEa2dK25ktJ
 Jxn9qil3w1HloDZBG6ccbDP+SGscofPyES/bFjkQkzi5/LKSodoXZwnbYjpze7IXvmxV
 qVmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/35T6o3ryLvH51GTLbJSCJHRUS680J5NVoqUeNSR8OnV6nWQolG9Bwi+cWgAax+pqkXsllgpsQx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTGup6DOW4JV9ex7qHNa1wKdW0v6/uzmsP2EEODI3BP4s1lpgR
 gFLM7kra3p7dc0+NPQ/UdA8BE7lXB0QvrUz6POdqimjn8XailBxH795Wpo8saw4=
X-Gm-Gg: ASbGnctv2ZXiBG7sGfiLgyZay84EAUieSzs8YbzRHkBdoy3tzid5Pv27dAnNlcWLqvJ
 +OWLxHO2zYimmXiFV7UcW8QB8nHXcHupik/7Kax6HJ1KmyuumXUi3I05zYxc+Cd8VXG0Zej/Lid
 WfV4Wo94V7u6UPNVtiB+WfcDl0N21J1elvYqvaXwcfMUYRmGd6dGKzWd+RwxZUlWGfUqgN9HSqH
 V1DxKaAlJtD7/bjr6AA1wyG6conjSY2pNCODcKMgczO01jnslCwyGNKagdQ2A==
X-Google-Smtp-Source: AGHT+IF94KMMYln+//vVqkKbyiyFDtR0AeBqxyI0kKUUa8IlrlXphOtDKDkHTsB4lCtwqMjOCklk5A==
X-Received: by 2002:a05:6512:1188:b0:53f:8c46:42b3 with SMTP id
 2adb3069b0e04-5402a5d3f22mr1443912e87.12.1733960520988; 
 Wed, 11 Dec 2024 15:42:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:41:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:40 +0200
Subject: [PATCH v3 05/14] drm/msm/dp: move I/O functions to global header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-5-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5492;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dyxN4mwTMLFIskYwXXKo80YL4NUA82ROoopgPqf2w2g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM4XqhhSgGwj/4mB+punsl7XmvkvhFWPFAY3
 SWqrWjIXLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojOAAKCRCLPIo+Aiko
 1a8WB/9i21w/CYcuLRVRqhQofvFcNZ6k/tr1xA6ELKn05E86y7atnkbOd6AuIp8ZoCeoJcYxPEq
 6HPKs8rOKb1oEms5btMt/DOf5HpBptuiAk8XNGvOkUFmDYn4QSsIhFQiRNKeGUlU/l2Q629GE38
 ZRWec4x8iBaBAhzo04ZnVUqBrAUL0lTFeakBVYM9Ehl8i4eMdTLCyw/rxUEySgCZZ1/vFA04PQ+
 RtHo1n6Jm70tJGYhkzC3eYlL8q3AAnn35FD5dMGVBzeYy4Khj2sdipllR+SVUm9yo1fI2yu4Xiw
 vJ7+QcLNV/jbwtsC9/QMVSUacL7mPu2Qq2SxYEU4xfM1IRWM
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

Move msm_dp_read()/msm_write_foo() functions to the dp_catalog.h,
allowing other modules to access the data directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 65 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index cdb8685924a06e4fc79d70586630ccb9a16a676d..a4ac132d807ea469709de68bc0b65ef41dcdae86 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -82,71 +82,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->aux_base + offset);
-}
-
-static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure aux reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->aux_base + offset);
-}
-
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->link_base + offset);
-}
-
-static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure link reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->link_base + offset);
-}
-
 /* aux related catalog functions */
 u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 13486c9c8703748e69e846be681951368df0a29e..0505b4be61f4e316f03df1d52ea35eb17e66580f 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -63,6 +63,68 @@ struct msm_dp_catalog {
 	size_t p0_len;
 };
 
+/* IO */
+static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->aux_base + offset);
+}
+
+static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->aux_base + offset);
+}
+
+static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->link_base + offset);
+}
+
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 

-- 
2.39.5

