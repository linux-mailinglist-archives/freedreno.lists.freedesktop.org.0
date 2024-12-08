Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648509E870C
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 18:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D9F10E257;
	Sun,  8 Dec 2024 17:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="coPtdnM6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF12310E257
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 17:29:16 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ffd6af012eso40874551fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 08 Dec 2024 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733678954; x=1734283754; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/tzoYaJ92Gqbh47fpsJMbKGuzwxMycmsQJXhBU4UoPU=;
 b=coPtdnM6bScHkMgAH5ZvaZMi4LZqBkVwKqVHx70Ide0Y4IJIIiwZrkc93EcHEAI5H+
 /kbncSskG9enZioEu1+IRKUERVUegmpA+tM12nQsnInMY46DanL7kPsr7VuX2ScNRB2F
 VIgu/XbfDt7WnKAHws4P1aE4vwrQpe5udigrP8Bm9/ffTFD9CC20dtlaPJw5d3tBELkP
 9f05L71HAsTnO586x7Xhuiol1Rck37AUJ2rSwpdkPa7i2KWcvcjbFz+a08RT3Qif4BZb
 fRYXc8dmdwmtL523XDnvLeO/ytldNk8wdarsAyH9Geqf9G1b9LwTCF4ML/l1eg+8oOYE
 a+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733678954; x=1734283754;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/tzoYaJ92Gqbh47fpsJMbKGuzwxMycmsQJXhBU4UoPU=;
 b=NVD2OLB5bImBHq/du9gZ6vvrANmMkIriG8piky9rod2eGtpJjVc5fdyfDpI2cW5jJH
 x61gihK7RmFvbIn8dP01JW0urMs3AXznHFsTpMyizI6lvvOjYe3dQVhXw5/U4UPwPyCE
 /+9OSzfVjdrJMKzTwITWcw69wFRAn+1+xJFRxei8V+qjF0MqjaAc5Es08LxOwdDQxlFd
 ZF8/advkV8kPmeWQDmsUX+9pY7d5hGXC+wrDs6v0Xp/YIJb1668aqKv2OQJQ7XgtwytB
 D+o54mW093EUYkGROBV/+Y12U70bNrU+HyJeD+QHof/JTwl9u/lMhe7pfayLK4+PwmvW
 dsgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5xi3E5SrGRzKXf4gT/9mhJJQ0MOHJmU23jyVy+x2QZ/FzLJBVCKtq5C+0gcWW/xE1BSyXkkBf8RU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfIhdyyBO5/1OsqxjknoPKr+IXVqESRaF/Qv2b+sU5mc5V/vAQ
 oS8AukIRbaLgmz1qGd1tcBA3epTq6sSxlxzTXBbxupJ0JuSuDJU6YiqZ5c3vcuc=
X-Gm-Gg: ASbGnctOSZsil8oixwwVWHZ1Zn6048kwlgt4i06goDJkDhjv/ej5rcl/HQg++JiiDeQ
 Hxm2ZYitGzeRpgEgsM7jXjGzRlSpvD7fzjn9xhX4hdXBEKsGAzgjNR3AVo/KtP6BmUTULp6OwP2
 vaQtzsQPBvDpfTZSbks2mz/lVn17cDjFa0aQCkv1P31ov2iXJ9JJxx6myqOh/QgYrYDzUEceO+O
 6Zs92fhqWz2/0TyWDkzHqPl4j1AuaW7RZ2CtXnwuTGFhitaESG5F2d6fA==
X-Google-Smtp-Source: AGHT+IGpl4LZsuCLYc4o6t6jeFwINzov0q8HwajESXX2p2xRlg9YhxiyKZwpcpZtqT6qPbhArxAsDg==
X-Received: by 2002:a05:6512:39d1:b0:53e:27d5:85db with SMTP id
 2adb3069b0e04-53e2c2b1ab8mr3133570e87.12.1733678954527; 
 Sun, 08 Dec 2024 09:29:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3160ebe8sm783253e87.180.2024.12.08.09.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 09:29:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 08 Dec 2024 19:29:11 +0200
Subject: [PATCH v3] drm/msm/dpu1: don't choke on disabling the writeback
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGbXVWcC/22MwQ6CMBAFf4Xs2ZrSFime/A/jgbYLbGIoabVqC
 P9u4WJIPM57mZkhYiCMcC5mCJgokh8zyEMBdmjHHhm5zCC4ULzmDXPTk3X0Zi/DTtZVNUo0pRa
 QhSlgfrbY9ZZ5oPjw4bO1U7mufzOpZJwppaXSpnPKmsudxjb4ow89rJ0kfq7mYueK7NbY2gaNR
 t1UO3dZli/ruPa24QAAAA==
X-Change-ID: 20240709-dpu-fix-wb-6cd57e3eb182
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, 
 =?utf-8?q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2341;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l0e+YjJJLUTTCME2U2RfwtoWLrRTp83OMNrgSpxIf3U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnVddoeaOWxNJOEBGnhGweCcRBMxR3mJut6WFda
 BRnKILovEqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1XXaAAKCRCLPIo+Aiko
 1c1SCACznZ0DjA+m7Xyt+NmXA+EGu7YA91e/a5pV0heywojgc9cKCkh4DnloshzjCdKmzf+Y6r5
 3dMN62m79U+sfGHXhZ9YKSB/7lZOL8lR15ewqPtxcbiyiqG3gC/xBPnIXJfD66fXZGqlUSkrs87
 QLHEPRb8cjqR2Y3Mw4ktwFlFoLLz0ZqCoQ50S+kMRLLZJPsT2qtiTli42NG+9l0hLN7iIIGYpuU
 yBErwWqTg3wON4+gRHEV4wdcjcs+GZ95SzsYvFBKVfaCkisiiDfVfHoxn5gDK1+qFB24fgF663u
 D1BLlaBUdwTfdgtRLOj27qHXQnwSYPaW+n+Np5C9UXzVKEiP
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

During suspend/resume process all connectors are explicitly disabled and
then reenabled. However resume fails because of the connector_status check:

[ 1185.831970] [dpu error]connector not connected 3

It doesn't make sense to check for the Writeback connected status (and
other drivers don't perform such check), so drop the check.

Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
Cc: stable@vger.kernel.org
Reported-by: Leonard Lausen <leonard@lausen.nl>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
Tested-by: György Kurucz <me@kuruczgy.com>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Leonard Lausen reported an issue with suspend/resume of the sc7180
devices. Fix the WB atomic check, which caused the issue.
---
Changes in v3:
- Rebased on top of msm-fixes
- Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org

Changes in v2:
- Reworked the writeback to just drop the connector->status check.
- Expanded commit message for the debugging patch.
- Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 16f144cbc0c986ee266412223d9e605b01f9fb8c..8ff496082902b1ee713e806140f39b4730ed256a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
 		return -EINVAL;
-	} else if (conn_state->connector->status != connector_status_connected) {
-		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
-		return -EINVAL;
 	}
 
 	crtc = conn_state->crtc;

---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20240709-dpu-fix-wb-6cd57e3eb182

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

