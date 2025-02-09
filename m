Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B931A2DA89
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 04:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E3910E476;
	Sun,  9 Feb 2025 03:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CoUGNnu6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6C310E474
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:40 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso3702688e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071298; x=1739676098; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qmShZr8BhGzfSJcqwOvmipr0+7sVDw+FI8erW52dlqE=;
 b=CoUGNnu6eg6f9weZiGbjzWc2g+rux6CfubFqZFBcSY/WCksZSC6hSaA+bhNf9FiS2q
 A5RWAMIJtc/NrrzOwhJ1YqAGe2JAc7FaMQyr3IEm+0F0TmP3hgqZjbf8dUb+G9mh6/D8
 j8t/owD6Q4gs5gNkC2faSr5YJZmTgbQRrMqrBrmVZ+M3sztX4VrI2BKPQY9VAhvQ82D8
 ICgMILInr2YHM9itVUPIVq1SGsymd4tm6qgSm+C+hcWyINKzt0MQmmIZvQ5jz33wOuVz
 loJlLNe9VTzKizBDAQ3XGx/nqPDSiIhFlES4QCa4JLw68BPGsMsYvUd9pv25esooQBjr
 8ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071298; x=1739676098;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmShZr8BhGzfSJcqwOvmipr0+7sVDw+FI8erW52dlqE=;
 b=ZOUES0SK/I8Y3RZPAxPwYwv9khT1dlO1EyW//FoX+FRTgvH+o1P8cudQcagz1W34l4
 Rm4DV5ytrnU8eCdzZoyURwT9EtuzhzQyvmuwGVxkdUyPoSMFmm2EYGjhThOAgXHZD71s
 AcapOADp2OozmsTMWo5h8pcZeYnk71AGBk20yCC52qdNrmBQn3r79+03nnedSLc430lO
 4J6P7jMRzqVN3mO/bVeCW+Pn3W52Kc4SUcezVVi9i/Gg/EKQCcXJlwd5DvuQnrh2QblT
 1MToNNt9PHgCF2JIh4Slo4an5apHzD6faao82xk5QCXFPIv9HfrP0fRY4w0aIRkBEjr/
 WaYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Q0qUgTHSTZheHu2iE3uBlmRIF7l8qwwtyDrnlgINDXWjeOEF9PiRpAphC6KXK1tsYCufFzoqeO8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg8AXDgiexgZ9uc8+XsOfRySPBoyd/AJukWJ+moAyKpSNfhcLt
 xxd21RJk70h5Jknd6l+wJDgweVQbZ8t6hA0gYNqOYjBeBeyiV5f5y3JQkHyrIiA=
X-Gm-Gg: ASbGncvU9ZPrQJ88hsU/VtRpaQBLZ4+S8nSKd54Cb0fkc6bjnboV4NF+G37nK7ilwKM
 4YcC+GfDaO/SHQy9JfGHz+BTRlSjzQgkBTDd2kml6EhDTxp7F7x64kiP1oCx5YxByQTi5aVn62F
 A2u2D1pb2Cqb2bZh0O5T4JDNfs3GVN0XI6gRXG3kDRjDrpPVJi1vxLOUNRMyV1KEh6LBZ73czHp
 lweuC7M9lJl3IcJYXAxZA0c4L2kPjmUxKqG7Q3B5vvvbkMvsRmWJLKpwrkna3ikjsQV4NX4NGUo
 63Lw0ySAEp1jI4U78xH6tB4=
X-Google-Smtp-Source: AGHT+IF+E2lofGpgEIlH1mo2jb7pOLChFh1RWXSwjjqDj1osaZa4t5hh1hH4/w7xYOZqateCgBxL3Q==
X-Received: by 2002:a05:6512:4024:b0:545:746:f36a with SMTP id
 2adb3069b0e04-5450746f4a1mr738996e87.34.1739071298414; 
 Sat, 08 Feb 2025 19:21:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:16 +0200
Subject: [PATCH v5 6/8] drm/msm/dpu: rename average bandwidth-related
 debugfs files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-6-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1348;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nDUhilGfCQVAayq/I/z8Ob2cdZRV9/FaOC6Z8D7SAY0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8x3OR7Ca1tuaLoz9sFjn4we4MgkSO2z5FnP
 v5kDn4TMNCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMQAKCRCLPIo+Aiko
 1W+JB/9MmL89omNtMkNihdFHUoYIcD93L5lMfDfuVIPuV/sswg2iy/9vE58JLWzYG5w/pQGu0ee
 K1qTLql81r8nyGAF6gP+0Oyp9dk8aJZ7pfMpiZ3nb7HL7Eie8BnCidkr1KZ608reycOrZ4k4ZYJ
 MxkHUpbKLoQRDrcat0MC1KnCZKsmfwXBRSlKMe4zLiX+iHjAI3aBZkt6y1yCOmk5n8ezKP1lpa5
 Ex4fy5+9faQp4jPANUlrrAuDx9O0oRmQvqP85f9hIStcT9HS2KraU90mdEXO++17X8DBoLv9Rgt
 /UdE+Ts0hddoUh/+PAJnw+drsVJCzibrYiARky1igeyQH/bG
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

Rename the debugfs files to match their purpose and the patter provided
by other bandwidth and clock-related files:

threshold_high -> max_core_ab
threshold_low -> low_core_ab

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index b93f7556f187d46b325a689ad01ec177cecbc37a..70f43e8359caee2082f2ca9944a17a6a20aa3d49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -464,9 +464,9 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->core_clk_rate);
 	debugfs_create_u32("enable_bw_release", 0600, entry,
 			(u32 *)&perf->enable_bw_release);
-	debugfs_create_u32("threshold_low", 0400, entry,
+	debugfs_create_u32("low_core_ab", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_low);
-	debugfs_create_u32("threshold_high", 0400, entry,
+	debugfs_create_u32("max_core_ab", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_high);
 	debugfs_create_u32("min_core_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_core_ib);

-- 
2.39.5

