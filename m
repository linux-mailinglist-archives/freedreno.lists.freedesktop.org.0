Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25409E8F9B
	for <lists+freedreno@lfdr.de>; Mon,  9 Dec 2024 11:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8289D10E48F;
	Mon,  9 Dec 2024 10:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jmqUpixO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297E010E48F
 for <freedreno@lists.freedesktop.org>; Mon,  9 Dec 2024 10:04:29 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30037784fceso23046171fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Dec 2024 02:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733738667; x=1734343467; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rmWxFsC0cXeaHocQ2mD5SsVuM9dd3gaFPe/qAhBEfRw=;
 b=jmqUpixORF+ov7NpjyQ341vIVeaKKJhgAGLoQb/QX/4D+FZs0jDMXBePz8CBWsrpvm
 2a/HkSpssWpogvUUxEP/BW3+Ml3hLMt2DMbEeMIZVq0H60garvjZ3CNst3jOiUhobBNp
 6gRiQ7kLp1d6So9q7VzlftoRT+VAoB+g2tSrVIYAA9vsWVjs2ObeH+/8MXXxfjy7vJoq
 wR4l5SiDUgimH27LwF3FFTRugNwhHT1HQEwhuds1h9cvJwz9PTVZpGUseYysnnNxdvMD
 UyX1ctJIbsFErmYq4X6whJ430KhG79YpfPM64irzz3bkE8Drl5ARPmhOkZVJlYOw+ifT
 OhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733738667; x=1734343467;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rmWxFsC0cXeaHocQ2mD5SsVuM9dd3gaFPe/qAhBEfRw=;
 b=skIDw7rJjLQLkNTt8Tq4O4jfRH699PyE/+KeKXu9X78AC/f0jtsPTeqOegQ1X4WQdG
 oCTWnTp7PzKk1+tpjNBi/0dXCpkDb6JmewRWsukjEP/KoRGmLf5g9r00vZoSHz8AKd+Z
 z5dwj4li663jQ773cv+LyLHE+NI5tp2xLQuq+V7Gq5PTbRquDChCeXsM3gRQl/ifX7Ua
 MWEoHhGPGkOPHCF48VlqLk8n1sUl0k1bspkr8D27SWkHVIMgLZ+taDerFf0D500c3R78
 FzuamXzvWpJs+utCOo8C54208eAbOBuWStoCZr1AzRyCdZJTsP/q7WcRN5qzT/79QwCT
 AyMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbOpXcaXH84dBdL2u0O9nxoLiya1U5YHptFT9hJ2Oinzmg/msB9xEnP1vVajt+UVn3sJUC0s0hw4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyovv0RmwQZHwZDx6c+FmiPBm8FE7pbf5KkRtGXJMzsLrv59uC9
 Wn7WXETB50zglPUZQXtSrVNJ8c/tY30V1WFkbxVCpve3E1ijVhdrRpkS3kYxa54=
X-Gm-Gg: ASbGncucq5KiD+XFk93BGDs+KNZhaaODa6EmGyvKJXly0qXKnh2DkOBRDbC2dgBv/aA
 WFiAen9Acrs1p132VPEDwk9UJeAatdmUgk+XHBuHqdouNw4rF2zvQC7SOMBhFi+AEzA67LFkJvC
 xhP7fIkDVy9fZUz//prTXSXcsbtKcGGtSuRV2PEnmnaju/xHmPXI9m4Tmo7fEfYHbZeIJdGtaGC
 s304rB+XwhUs0IhvFWncQCMSkeHu9/0gngFzPX8M493ngqaP7H9L59F0A==
X-Google-Smtp-Source: AGHT+IEA2GYxmDBoJ502nhZ16cRFkhfaqap2OWSHilCKRJ2N75D188EFfdgljBH1J1ODmQJpCG9YTA==
X-Received: by 2002:a2e:a9ab:0:b0:300:2d54:c2ae with SMTP id
 38308e7fff4ca-3002fc97f7bmr61678071fa.27.1733738666847; 
 Mon, 09 Dec 2024 02:04:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30226a67ea2sm1876041fa.67.2024.12.09.02.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 02:04:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 09 Dec 2024 12:04:24 +0200
Subject: [PATCH v4] drm/msm/dpu1: don't choke on disabling the writeback
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKfAVmcC/23NTQ7CIBCG4asY1o4BSltw5T2MC36mLYkpDWjVN
 L27tAtNo8tvyPMykYTRYyLH3UQijj750Och9jtiO923CN7lTTjlgtZUgRvu0PgnPAxU1pU1Fmi
 Y5CSDIWJ+WWPnS96dT7cQX2t7ZMv1b2ZkQEEIWQhpGiesOV19r2M4hNiSpTPyr5WUbyzPtkZtF
 RqJUpU/tvhYxqnc2AIYaOawUhaFZtt/53l+A/DSKt0dAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3165;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HvzRy8I7qIhgbnNkEXgHJ7c/6fH0498enq7qcWDIymM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnVsCo1otrThiFKBxfGVywT0U/P8lNlp0sgAoFs
 yvoXA7m952JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1bAqAAKCRCLPIo+Aiko
 1fcZCAChAoJdoT7F0d/6QTsPBk8IT5e4HF/Ss5EzzMJGjqh/+L6zSIQnULAogk2+TkwvekhIV5W
 pR2UR0IPmorIPSzHVDKpbxh5Duc9Yc20M6fP9LwFpxgn6x8YVCYx5iStNgeRFrUnpIwtduXMdb7
 yUwJpQVZ4K2Tu6uKP2gr06E8ORewHdnRUR5Q6Tkkr7MiGO58/fTed41/aVxqYyvwoVELNlkpXk9
 gnf02UyCqCnBu6TMiOZSk014nuA6kheL01F1HsBZCtQyaHcys3eksBFtsWZjUFEw9DMYC3vdHsH
 N1B+Z6memFX0PiCkiSXGNUnhMfY2iQENm329sbPT3o0JXlDW
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

[dpu error]connector not connected 3
[drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)

It doesn't make sense to check for the Writeback connected status (and
other drivers don't perform such check), so drop the check.

It wasn't a problem before the commit 71174f362d67 ("drm/msm/dpu: move
writeback's atomic_check to dpu_writeback.c"), since encoder's
atomic_check() is called under a different conditions that the
connector's atomic_check() (e.g. it is not called if there is no
connected CRTC or if the corresponding connector is not a part of the
new state).

Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
Cc: stable@vger.kernel.org
Reported-by: Leonard Lausen <leonard@lausen.nl>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
Reported-by: György Kurucz <me@kuruczgy.com>
Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com/
Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/
Tested-by: György Kurucz <me@kuruczgy.com>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Leonard Lausen reported an issue with suspend/resume of the sc7180
devices. Fix the WB atomic check, which caused the issue.
---
Changes in v4:
- Epanded commit message (Johan)
- Link to v3: https://lore.kernel.org/r/20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org

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

