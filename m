Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08FA4ADDA
	for <lists+freedreno@lfdr.de>; Sat,  1 Mar 2025 21:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D4E10E112;
	Sat,  1 Mar 2025 20:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DwHUodYQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFC710E249
 for <freedreno@lists.freedesktop.org>; Sat,  1 Mar 2025 20:39:51 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30a2d4b61e4so27798011fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 01 Mar 2025 12:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740861589; x=1741466389; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gcEPpUecbQnXiS5K2IATdiHhzAIF4FnvVg3Y9Uy8iSM=;
 b=DwHUodYQZimSiOiLwx6RTaxbvTfbFPaacrhu3IQ4DymFgwwxBlCxD0sljhd54UgtQC
 H7LOeXF5B2jK5BNaD8sdOTO1K+r0Eof+oY22O7Z5BDqXCJ0YflMTQrYHSc2XuA5n3odJ
 e+aM4VU1JJwvCdf2c0FBIZ055y4hHTxikBuamR+y3TTbCxOJ/aYBaBw887QcrYviBJtF
 RHIuYDiNMg95o1iJ5z6D0tpknwCTMUKZj+3c1F+1oC2Hd4EEtTieMJHPN9tKFPAPFIZq
 0Unaf0Fbu3Ipqas9ShZghMrn3ZYJ5PSQnvpNU5fRSjl2orQ8CwujUTTaSjC+Xh3y8D/A
 tIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740861589; x=1741466389;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gcEPpUecbQnXiS5K2IATdiHhzAIF4FnvVg3Y9Uy8iSM=;
 b=ohBNkOk2bURn21pg1RS/ySn/1O95/cbB95PLkjXwokZzN9MUuqfs9rO824aNhBpQfj
 eMIYEeeFD/HAiprp8fG214/d7gp/pcO4u1TUAjy+3EQqS4ezrdsivYKuA87pTlglO/ww
 1R/xH3a0zYPorqY/WhEgsKQgjsZ2whDarYLTVSvNMyVl60MvksHULd0TPlqQPYQ1df15
 unxJA0xTmlnz9iJKzhB4qiWvOsw/0KUduN7qR2GHVRYhaUOcVT5AeLzo9GxMlfYU5F8B
 YpC1ErFfrfzDXtdN+Sis3PqOUeQDOWy8y3KHBEpPI+Vfowt8/e7TFE1EQb+zFAGE7LlT
 zOKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP+bntRi+wDsa3+Zdw/7S4lAWUYsGDV6PRVP4kPjLMeOQOGXOae70wey7jMPMI4wYrq9xHYuIulbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYrzwehrAIeEIb1LBBPEkigB9l04syZIB5rmmybkBZ20M5Ed5e
 IuWyLxoQB04Ey50uZUo3rKQn1nxvXJZMIBqUu/nSLsexY0HA2IY7rlXTHJMT3ug=
X-Gm-Gg: ASbGncvSNBJsTpT0w9kmw5VzTf5Q3TIkQFfSf9QetXpqSi5BepgRDPvhilD+8HMyOKK
 8crJmOjb2yF+vfy07VRYHZd9WizJaGo4tY388FBtwkFB31CzXrhMpfy8MxOYN4ae8JPoCfOIIg+
 Ld+tTijuOnxHxd0QlAP1DdLH2aWJDZb4FgVyy93f30Pkg4ELJFOYhokciPA1VMBs0QXhTDe3L86
 S0+XvvOZBnkGp78+hpGcAsRdRT2Qh7PE0t0JN3pXIwvpBvaDDE3LVm/fU0lIpLRwy4KGVbrzSxs
 r/jg3QzZpsnmdxhjMzCONF6H21A/Sgl1Jh08MhYZ1a4RawTX3eWe
X-Google-Smtp-Source: AGHT+IFbIBFxy1B6SY0xD2HgvbsOY0hx7R3yAueDBbzal97DNmUgO5PzUJvmVDdNOItvYmjbpnMuQw==
X-Received: by 2002:a05:651c:503:b0:30b:b28d:f0a7 with SMTP id
 38308e7fff4ca-30bb28df324mr1085351fa.18.1740861589428; 
 Sat, 01 Mar 2025 12:39:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b931524efsm6668921fa.60.2025.03.01.12.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 12:39:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 22:39:36 +0200
Subject: [PATCH RFC v2 1/7] drm/display: dp: implement new access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-drm-rework-dpcd-access-v2-1-4d92602fc7cd@linaro.org>
References: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
In-Reply-To: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6615;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NgOVGdCmTC+8UjqfiO/VMFR2mESsUZ4pRU644XqkABc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnw3CPwOBSZDyus3kp03MXdqlegNWQAa4zwNzmJ
 0cZIAcuGLOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8NwjwAKCRCLPIo+Aiko
 1aRvB/99tG7xDSt1Yr4yCrGCTSBYNU9Ye0p7gfAblguluBCoNXaduaIX+1zoQzVkeZ+GVrzK/Xc
 4pdDdnxddbCt3Vm6yoKmAVR0v5tgM5iCnS9Tgt8b22zgZCPf3GFQyDpHWSPNpaOAcCxPYntqFUq
 AfWvGTmt7fszWiM1wFvlZJ6cZtMJuLhaCth1m64pfwIOJQzTfSphoJyIKTq4Zvgdc8g5ZKkXeEQ
 tfRrv3yAPq0duIxh/WY3hAcuFRkupFNc5D4HaDIr9I7Fp4FBhV2FeaCrTPmDkpa5M2vu6s0d27E
 1EkuVR1kj5ocWPst+uTg+zoz7U6QawXu8BwJMs/N1+znS1Xq
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

Existing DPCD access functions return an error code or the number of
bytes being read / write in case of partial access. However a lot of
drivers either (incorrectly) ignore partial access or mishandle error
codes. In other cases this results in a boilerplate code which compares
returned value with the size.

Implement new set of DPCD access helpers, which ignore partial access,
always return 0 or an error code.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c |  4 ++
 include/drm/display/drm_dp_helper.h     | 92 ++++++++++++++++++++++++++++++++-
 2 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dbce1c3f49691fc687fee2404b723c73d533f23d..e43a8f4a252dae22eeaae1f4ca94da064303033d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -704,6 +704,8 @@ EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
  * function returns -EPROTO. Errors from the underlying AUX channel transfer
  * function, with the exception of -EBUSY (which causes the transaction to
  * be retried), are propagated to the caller.
+ *
+ * In most of the cases you want to use drm_dp_dpcd_read_data() instead.
  */
 ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 			 void *buffer, size_t size)
@@ -752,6 +754,8 @@ EXPORT_SYMBOL(drm_dp_dpcd_read);
  * function returns -EPROTO. Errors from the underlying AUX channel transfer
  * function, with the exception of -EBUSY (which causes the transaction to
  * be retried), are propagated to the caller.
+ *
+ * In most of the cases you want to use drm_dp_dpcd_write_data() instead.
  */
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
 			  void *buffer, size_t size)
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 5ae4241959f24e2c1fb581d7c7d770485d603099..c5be44d72c9a04474f6c795e03bf02bf08f5eaef 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -527,6 +527,64 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
 			  void *buffer, size_t size);
 
+/**
+ * drm_dp_dpcd_read_data() - read a series of bytes from the DPCD
+ * @aux: DisplayPort AUX channel (SST or MST)
+ * @offset: address of the (first) register to read
+ * @buffer: buffer to store the register values
+ * @size: number of bytes in @buffer
+ *
+ * Returns zero (0) on success, or a negative error
+ * code on failure. -EIO is returned if the request was NAKed by the sink or
+ * if the retry count was exceeded. If not all bytes were transferred, this
+ * function returns -EPROTO. Errors from the underlying AUX channel transfer
+ * function, with the exception of -EBUSY (which causes the transaction to
+ * be retried), are propagated to the caller.
+ */
+static inline int drm_dp_dpcd_read_data(struct drm_dp_aux *aux,
+					unsigned int offset,
+					void *buffer, size_t size)
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read(aux, offset, buffer, size);
+	if (ret < 0)
+		return ret;
+	if (ret < size)
+		return -EPROTO;
+
+	return 0;
+}
+
+/**
+ * drm_dp_dpcd_write_data() - write a series of bytes to the DPCD
+ * @aux: DisplayPort AUX channel (SST or MST)
+ * @offset: address of the (first) register to write
+ * @buffer: buffer containing the values to write
+ * @size: number of bytes in @buffer
+ *
+ * Returns zero (0) on success, or a negative error
+ * code on failure. -EIO is returned if the request was NAKed by the sink or
+ * if the retry count was exceeded. If not all bytes were transferred, this
+ * function returns -EPROTO. Errors from the underlying AUX channel transfer
+ * function, with the exception of -EBUSY (which causes the transaction to
+ * be retried), are propagated to the caller.
+ */
+static inline int drm_dp_dpcd_write_data(struct drm_dp_aux *aux,
+					 unsigned int offset,
+					 void *buffer, size_t size)
+{
+	int ret;
+
+	ret = drm_dp_dpcd_write(aux, offset, buffer, size);
+	if (ret < 0)
+		return ret;
+	if (ret < size)
+		return -EPROTO;
+
+	return 0;
+}
+
 /**
  * drm_dp_dpcd_readb() - read a single byte from the DPCD
  * @aux: DisplayPort AUX channel
@@ -534,7 +592,8 @@ ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
  * @valuep: location where the value of the register will be stored
  *
  * Returns the number of bytes transferred (1) on success, or a negative
- * error code on failure.
+ * error code on failure. In most of the cases you should be using
+ * drm_dp_dpcd_read_byte() instead
  */
 static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
 					unsigned int offset, u8 *valuep)
@@ -549,7 +608,8 @@ static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
  * @value: value to write to the register
  *
  * Returns the number of bytes transferred (1) on success, or a negative
- * error code on failure.
+ * error code on failure. In most of the cases you should be using
+ * drm_dp_dpcd_write_byte() instead
  */
 static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 					 unsigned int offset, u8 value)
@@ -557,6 +617,34 @@ static inline ssize_t drm_dp_dpcd_writeb(struct drm_dp_aux *aux,
 	return drm_dp_dpcd_write(aux, offset, &value, 1);
 }
 
+/**
+ * drm_dp_dpcd_read_byte() - read a single byte from the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to read
+ * @valuep: location where the value of the register will be stored
+ *
+ * Returns zero (0) on success, or a negative error code on failure.
+ */
+static inline int drm_dp_dpcd_read_byte(struct drm_dp_aux *aux,
+					unsigned int offset, u8 *valuep)
+{
+	return drm_dp_dpcd_read_data(aux, offset, valuep, 1);
+}
+
+/**
+ * drm_dp_dpcd_write_byte() - write a single byte to the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to write
+ * @value: value to write to the register
+ *
+ * Returns zero (0) on success, or a negative error code on failure.
+ */
+static inline int drm_dp_dpcd_write_byte(struct drm_dp_aux *aux,
+					 unsigned int offset, u8 value)
+{
+	return drm_dp_dpcd_write_data(aux, offset, &value, 1);
+}
+
 int drm_dp_read_dpcd_caps(struct drm_dp_aux *aux,
 			  u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 

-- 
2.39.5

