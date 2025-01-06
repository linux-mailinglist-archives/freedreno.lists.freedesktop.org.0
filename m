Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE32A01E1F
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 04:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6965210E569;
	Mon,  6 Jan 2025 03:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j1/uyo4Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDEA10E569
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 03:16:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso2598719166b.0
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 19:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736133347; x=1736738147; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d59Z3qrLfT2qIqzs5o3r/0E9tuM8fjfJdM+IihJasEc=;
 b=j1/uyo4ZbEcT81GadnDl2PVed1HZAxyE59xRigvhovDUxaxSn3INCuDC1QqGWslfsc
 0SKbsLu+0bu9Kos0laE0Htu6wFxevXinJccUAseuIb7gOh28jjIJ3JScO6y3CdJH55iN
 2/bBAF394FNA6niAkSe0NhVnYprPUkFmhTX+0hqYyqVtrpu7vcxjz/W3sqO/vHkjgpZw
 Ec3xdAtNcwIAMx9kSGXlPGujF3FW8LnUpJ9yhNI88FDdOW/jYNt9PIxzyGAKEIdS19N+
 UuQcB/cff/1pff571hJH/2Q9MGkxT9l400wngIegNwCW7JYyQdQPz7f3hCU0hvKrB+iZ
 ME4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736133347; x=1736738147;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d59Z3qrLfT2qIqzs5o3r/0E9tuM8fjfJdM+IihJasEc=;
 b=deosFHVW9oNVxI9o32NKOze45/rsszuDVvMlRUqjuwExPbSUdJzEag2pP9aH2rKAje
 dSLddFs2wvYh4ii8ddVw9OqO/IV882O1A7N2G4zaJc3yGxYStr38/LgLXDwOWZ/fb/UO
 UJ2TZxTw03VeCf2RLwYT7EjH6Qxib8cVoKbC2dkuNvSln0UIv2yqCmmlxbu1PIAiSuuF
 UYOlKtTupoacMClEcLG3zo/6sH3lyuSh227vn4bDAxSx3AN0wm0cf7n8JYkeoJ2vWnKb
 DaN/HXF2v64BckMImCwtJ7K0OE23tU0mjBOKnvG8W6Q952TrrJP2FfuYK3HceZBPhNrD
 jXQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNBMOpGs+Zt+WpT8FOcI4cxDD0jh8WWzPdCPEuhHdau6dfz5eRspLZLvLt7ZdWx3Sp0sU++uYsaPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3YY+Cbgyat69P9vslSrvGey9srPjh1sCjIK+i2s/4jVMgeMoB
 Ee0iHiMZn2RCKfBDqKawlOC3n6Emcw+5P+z9RdeifVCefQV00ioe3E+HYnD4RAk=
X-Gm-Gg: ASbGncu+XFgekrso5fr0gRXVLDVcaoX2kTGqk8iHN77lhBEX+kBWs66ECqUoRc9EOkj
 Pnjj529/AZONpT+UEy8d/vLAHwK1nHpqHqd9ZEGzjO5Je17PgPL8e+4erkkoapY+/y+RQZFpAOC
 +lkotgD+KaBV2k2mxmJOYd7OrJ4YS9guT9SOzR+w2DKb4ugWQBfltjVZ0FfmrGRsIluB2ipgtYx
 hmVncsjFq5pB+QJvni+1o5vU3FLAWNlRfxaAzP9l1poBOiSGqady/eVhHA+HWUZ
X-Google-Smtp-Source: AGHT+IFKzrJdZbp0VnGmVQddnrS76dcPqx2IOwskz9x2OymOvb0Kcx3KnUojFYk6Yq6nsT7bEn53Og==
X-Received: by 2002:a05:6512:3d22:b0:540:1fcd:1d8a with SMTP id
 2adb3069b0e04-5422957afa2mr15539769e87.55.1736132873732; 
 Sun, 05 Jan 2025 19:07:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:40 +0200
Subject: [PATCH v4 6/9] drm/msm/dpu: rename average bandwidth-related
 debugfs files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-6-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3GO6BKanzbIFpcGY1492/FnGV+oGzdC81viLdgF4XKU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5W7DE/CqwnIGp5JjlR3b+5azAW4JhRlYR6
 23i+RdJ8RWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1YfJB/9R2mnaUTtPtDTK/pDYG4hf85YzZerMGxPbZ/HA9Mx3dw0AQY5dAaa+YHc/xw4zay7CshX
 StUPZEny53hjKaiSUjY1mm/dgtLpiFd2wqFGIoUAyewCCLarWRzzunyexzz/TOa7A3vFRDH0nW2
 omoYghdwkQLSApGVE/Gg2vSrpIL/8MC+H+Jze9O0ujL8e83QLqHF9MSByLxZKJ5fY5/QpyYcsUV
 XpjEeR0KkaWLLZKV9izhb4F9Wbe8P2TUwHgdH8YvaxwxfKSJsa2B/2+8fQXgc5oQ6AnifuDO4Yt
 tvFgPS5AjR+kCokydIdwAROQuzTzNNOtZE0s1uNHCiVatmC+
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

