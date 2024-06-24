Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C58915886
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 23:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E160810E57F;
	Mon, 24 Jun 2024 21:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fm9vdAfP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BDA10E0BF
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:49 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52cdb0d816bso2513347e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263627; x=1719868427; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4VRgd5asHo3we7JJsAH8XR2VQncsaeqG+/tWCDM9GWs=;
 b=Fm9vdAfPG6U5Y2ZZCbKEuJ9kVgGiRg1R9REE/s8jMLwVmZtGPSl3YFX+P6d3hHIWt6
 RqUEElwA4f90tInO8McnB1gjfMEVGPmz2qIALwnR8jigWRsYav/x4n7AIR/x61d+w+eK
 iHMBP+aaXmVU1D+f0gx+iJhBFJ20NwztpcJl7MTrINv8GXmPOQIdv7Tqd0miQ4+sCpqB
 YJO51QSBVfEUqkCWOYIigSZxS55o56DF3mHCjr/rwrqPiz6MeBDfVwIOHWWwFyE1WQKj
 b8XjcdJpPaqJvpfYcldGzfbZMvSdn0zwyItY+2HXP1tNJQFjKTp+Lu14UnpBsKSt3vJZ
 JzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263627; x=1719868427;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VRgd5asHo3we7JJsAH8XR2VQncsaeqG+/tWCDM9GWs=;
 b=R+9Vc1ff9Jh1Ssd2I2B17arP90bCXh84LyC4l9xQ0Z4BDi3VQLbVQXq51U+jm+cDTn
 AAn/UWu6oU9PEKUcRAdNHE3XwWk28qgbveGpHaZrC1m9+V5lLcVlf7RGg62nhnJyHtHs
 0SD6XD68fMyHPdT9Iuxi5i6GV8Zuf/Xj03Y2h4p+1CBvJJmfdiI7FtW+imV1zLTzu6AH
 MqqPpne3SYzd8oTdvAIUGcWDd+vgyUbkMQyE9tu8GehX8Brx9mXvBCoGsPYKmY96sHcR
 3VqQM2aEOrVPcjZKOksjX/LOrJo10TF0zJUOXlwIAzwGsiabJuqVNqX8MeLDaejzaSii
 l8vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi3Ve/nkurFiVchUblNAeQMmvp4MghYp+MYD3ZF9/fDIhmx8aESUath99cLpu8LdXtGIz9Hel5HDxOx0VlSzvgeGGLHEvU6a/aW8+gFJPv
X-Gm-Message-State: AOJu0YxUo52b5hivhq4phoBrEY+vsU4jopPvuY5clVUVMpg2VsbiHxzT
 L+PZ6+xfd3D7wXnMJZ3j/gyC9C/hCUbMI87JWgJ3SJnJ//Loq2I+qI0b5CEonfSb6YCmQ19H8yA
 /C/0=
X-Google-Smtp-Source: AGHT+IEwwnEhYl95QqDTbCLmeV/4bzp4M63Zy4b8eegGdrh8TiiSCNUzZrU/Jfb+Oa1fUkPxJX3HBw==
X-Received: by 2002:ac2:4474:0:b0:52c:86e0:97b5 with SMTP id
 2adb3069b0e04-52cdf34655cmr2015909e87.16.1719263627711; 
 Mon, 24 Jun 2024 14:13:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:42 +0300
Subject: [PATCH v5 02/16] drm/msm/dpu: fix error condition in
 dpu_encoder_virt_atomic_mode_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-2-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7vP7o0FochLbD0Xxzl9C2B538GRcwP3COb8crkPmUOU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGHjmcqZL5bh8Vey1taJSCXeNBj8b511MU54
 qCCasjSnJ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1TINB/9xlBhS2fVzyaXFtuw9d8tMN5rB0L2hhdoYdifhgvf4g/MNWuwlgGfwOPl7jKcNblqMqj0
 ozKXND4ugksr3fPBlRlaxtITj0/rT7jqcPvijl7zBNupG8Rulzw4jrhdR++cdnmDLeouYrfVDed
 vhgZbrlmhmkBvZOjAaQkvVT1/+PsKsj9QNz4X0ZmMIpkPuMwgmPKXf2U3XH3oRfi7eCgs1MG6/T
 kgcCRney7KT+mzmT5MxbeC6xqa2IwmSJyr0WXXgm8i/5on6A5vad7zwpBK/QywGtEV8uFUX+NIB
 3VqiUXUYZllOU5c3R+PrDwKz6T7XQcybosxQm3E2nij78o8w
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

The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
zero-init of the hw_ctl array, but didn't change the error condition,
that checked for hw_ctl[i] being NULL. Use indices check instead.

Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5d205e09cf45..7613005fbfea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1186,7 +1186,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		if (!hw_ctl[i]) {
+		if (i >= num_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);
 			return;

-- 
2.39.2

