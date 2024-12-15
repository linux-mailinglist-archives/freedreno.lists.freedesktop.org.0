Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784C9F23D0
	for <lists+freedreno@lfdr.de>; Sun, 15 Dec 2024 13:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F57610E386;
	Sun, 15 Dec 2024 12:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cen4na8x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E3B10E386
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 12:40:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-540201cfedbso3260739e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734266429; x=1734871229; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VKqGEI95SPDDmcPKpKKR/7dRWUBLgzZRIDEydq7WGYo=;
 b=cen4na8xAoZPay8bcMXAUADDvY8q8yWi6+C8B/6rt2Mxzg19a9y2uH4vZ+aHrHCBkN
 0O3BJ1et5EaOWeta/e6mvQXxhRqwNcgE1GYk/sayrD+/tnxJ9X0F0FoSVZiwuKwxC8hY
 g0axaCkoUPUotZnRarcEhSBQJoaD8WuteChno1caFqZ+014zSkhfVbeML6F8HBYYeYXd
 zDT8NZY+KanGI1MzMj3n0mUcij06bdnFp8MqhyUQ6YrKQnKZ7+AIacCL3fx64Jk+o4aY
 g0cgi0bfszq/SU3xdVFmeRNL6M7Mk9C0LinD9wx+LJU5yLXlQ/y5rpA8m9Z9Nv4iJaxD
 rmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734266429; x=1734871229;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VKqGEI95SPDDmcPKpKKR/7dRWUBLgzZRIDEydq7WGYo=;
 b=upmetd8Rxq+5Vr4yp/pXE55uDARp1eVqvIngaDjib9I3Hbtd7Vik4RaVNjzgQcyMWX
 gMmurrZ7dqdKn/FCjPdweuITNbC9E2NQkLihjTn2ON344FUj3D9EV6okaaQrh4tDBqRe
 16aBv/XjyqZkVRZSXIjCKC4knZ+UBe76DieciS67kdC+OuVZhIkyLESFmXMtPTYQx5RR
 o2wrtC7hxOGCHkvk+D0oZS4KNBosCRyQy5oIr6VuzbH/MZKKiVtyIk0tJ0adPB9TGAS+
 3uxXncqEg9MaO2E3cklao1nAAfY1iZnGUFez81XXRP5W30yAkFWRbpxZWrc2Uki3Lnfo
 TQ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa01ONH8hLzX1lsz0cyaBLDrSIDtfi+2k/h1/MD+KXqhXf0bAnixga4neuTimg0I1A9OF451F5TIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp9RHKNvovW1XMSmRZgmRyGYGSAfZIxD0jjMebShKXaABpO7/v
 wQIU37zxIvY0u6Fn1n8upQ0KM7rpNQJkogGMVdGdDHQs5FGGaq2gDiw6j3yaBy0=
X-Gm-Gg: ASbGncviDce2+1CkDSds3hYx9Bp+Q4G/WQ+JF50S9ns9uyxQG486sXl8FpSr7p8z5uE
 PFy1ytbl/S/zb31yIgSVQ9AU4H1vl6MILDY/GiPqXx/JyvcFQ5iTIVlcHFhbTFZxzf6sfY2rPZX
 YzWdqCkk0g+dcxfvAP4TktROe7Lsq1Ys+q7DbOblJa05W80NV1rGjjOUXQEdgZq+Jk4ECgMBOjy
 o8u+jLjldRmFtqd3zIDitvFYQ+qEHSEgAuBvRMVBkeh++0AcW9a13RR1Jm5fuEb
X-Google-Smtp-Source: AGHT+IHmwjv0eptuZxFT2gpCHkWuQYV+04StJGmgC+Z4JEQQCD20hv3AqzkFpjgizuTHMQMM+eyw5Q==
X-Received: by 2002:a05:6512:2356:b0:53e:3c3a:2032 with SMTP id
 2adb3069b0e04-54099b72f79mr3223549e87.57.1734266428987; 
 Sun, 15 Dec 2024 04:40:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13be2sm491481e87.195.2024.12.15.04.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 04:40:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Dec 2024 14:40:18 +0200
Subject: [PATCH v8 3/3] drm/msm/dpu: include SSPP allocation state into the
 dumped state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-dpu-virtual-wide-v8-3-65221f213ce1@linaro.org>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
In-Reply-To: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rtLNZvWI4/c1Z6JTypcd/rzPjp3y7gPITQRLIp73VhE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXs4zHmqv+4KEvs+fxhU8HXyTshs00svWF3yCZ
 T6ZvsMWzTaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ17OMwAKCRCLPIo+Aiko
 1a/7B/41SmL6WXZHL42KtlTVJqEfm4JwzZrRiO7+EugrG1qKC+8+k1TQMOS8fjmtA9SfefGuwTe
 qlhWq3y18LWzTMHxLh+BKbguLUrLIP9RsaHzEKF4S6Q5qYrM5BKzKJbYn4AgxOPCKn5ScLAvPqZ
 jj2K93ctOcK01v9sLQp0bdcIvZWqnhc1algDaWSmFrdpv8FBR+5zOXJnM8nzHbhnU9bqkYieebx
 4OvZq2H6wtpipdUTg4Qb2pUkSwjY+ehAhxsL8q07t2SBEfjM7+L53yeF2Y0kuTd/BN0SntNMCSj
 O9byED58fAcpKgEQr/2GVjwyOMcvx7vR9goNc1p/+p4TDG+p
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

Make dpu_rm_print_state() also output the SSPP allocation state.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2c325bcd328aa475cba9b9a2146ee3e009816551..17b5d53297f23169aba3537f85f02f04421ac9e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -941,4 +941,11 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_enc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tsspp=");
+	/* skip SSPP_NONE and start from the next index */
+	for (i = SSPP_NONE + 1; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
+					  global_state->sspp_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }

-- 
2.39.5

