Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE266815D17
	for <lists+freedreno@lfdr.de>; Sun, 17 Dec 2023 02:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CCB10E02C;
	Sun, 17 Dec 2023 01:46:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C715A10E02C
 for <freedreno@lists.freedesktop.org>; Sun, 17 Dec 2023 01:46:38 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-50c0f13ea11so2234410e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 16 Dec 2023 17:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702777537; x=1703382337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6uo5Lzxunvm9Mynn/2j9jUQRRy7PFq4vPnnfrTSaOqM=;
 b=cQ7aZUyTeiShvFha8WeUd+HKevDTCMvp2KAjgavz7jencnmXge0+vCl0nbcQ+y1zj8
 y1b3tlAL/Mss073AiV/h27/LzznRPngRyn/d3iX21kjQB9UCkrz6OH6KtlwcODHWcSEC
 cUrZE0dSniWLxEkDnJWtXMh1oVyDGYNCR+lgJyOD1/WJFdNDYye9I/8+l3B6F3otZ8An
 l9u0FS6p2js3UiUUEwmdakbE6Nn4Oy8saSBtP96fxm69w8sB8MB2ryseHvVaznGp6g/Y
 NAg+ilxHYVD4ImkUi38FbOU2a8HcyvjsvZeZT7HvF5AvvUrJhLq94F1VtFHKq70Efivw
 7czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702777537; x=1703382337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6uo5Lzxunvm9Mynn/2j9jUQRRy7PFq4vPnnfrTSaOqM=;
 b=ekSY7zKX3mCr48KMNE951YOOPdacp+cuevwCjcNb0xhlR0kstBNClt0KOOCFUICkkW
 5E+gEIqFQebpa0knh5J9LKVfiBSBBUWoGgARwYxNQiN2Gglrb9vT2UZZ8mToFQWmDeRH
 AsP7Hf6ocb3IbFsU2hI6bQwsiJjw3awXdMzum83iofu/4ufT8V+lyesPmBJgYhIXkUia
 Oqkj3/V2K858P3RVfXqF5OSlLincHNh50V0iISYjAFWtExETTCCOkg1beCw0KrZR3tWo
 cXUezHZD0lbHCjrCLvYndl9O80MBiXpQolo42J1SwyAJlnSKTJlX6yGbhA6lebB0YJmK
 IW7g==
X-Gm-Message-State: AOJu0Yxqq0uhe62rwdMb6oLOYp6OrUnCuUuDqMXsGBXjybYjf3wF7NkK
 LVAIdzVarNlyJlDGw6zSLZBby9JfaTMKB/feEI0=
X-Google-Smtp-Source: AGHT+IFzE8rG8RHeKf3trBTPvFqBV9VmDl0XIPR+mfv5S97Pwe963Auef5azXGURAwcyY531Rm+oKQ==
X-Received: by 2002:a05:6512:2211:b0:50c:a89:a70e with SMTP id
 h17-20020a056512221100b0050c0a89a70emr7926725lfu.94.1702771319064; 
 Sat, 16 Dec 2023 16:01:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q1-20020ac25141000000b0050e356b61c2sm30387lfd.179.2023.12.16.16.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 16:01:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dpu: drop obsolete documentation for dpu_encoder_virt
Date: Sun, 17 Dec 2023 02:01:58 +0200
Message-Id: <20231217000158.912062-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drop obsolete kerneldoc for several fields in struct dpu_encoder_virt

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/
Fixes: 62d35629da80 ("drm/msm/dpu: move encoder status to standard encoder debugfs dir")
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 83380bc92a00..f2b82ca5efb3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -144,10 +144,6 @@ enum dpu_enc_rc_states {
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
  * @connector:		If a mode is set, cached pointer to the active connector
- * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
- *				all CTL paths
- * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
- * @debugfs_root:		Debug file system root file node
  * @enc_lock:			Lock around physical encoder
  *				create/destroy/enable/disable
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
-- 
2.39.2

