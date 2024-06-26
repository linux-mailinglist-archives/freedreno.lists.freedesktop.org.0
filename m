Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC75918079
	for <lists+freedreno@lfdr.de>; Wed, 26 Jun 2024 14:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0C10E881;
	Wed, 26 Jun 2024 12:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HZkBVsqG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB1210E883
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 12:04:25 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3645e9839b3so5011879f8f.3
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719403463; x=1720008263; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S5OkAuV6GjNT0GJiinYK+CAJG5PBDmAjbuPgVCrya8A=;
 b=HZkBVsqGj0QgVl13rGKNR4hlfrkzuoO9+aCGaLav7cYBJ4hJA/UdFguFymEIH4uXI5
 PfG3uoHwwvZjN5SIuIW9GNONhm1NdOMTrgZNszuYwAto+CslFO1ItHM59aAGGq4YvFkF
 QJlHKECKYWTLznBPL/cq9i3O+/X4RHaYTtPAnhWUbeaMP0KRLWVGZPvL+nUgk3ReEkC7
 Ggt4IhVNRDq1QTiksDqUi93eLOc3Vnt52u+SMAsn1IHw3p5US71m3EwfLk+SADTRgJK+
 FCi31jyDxbSpZCXJjuSOTbnmENp+cYop9FNW7kuqqqelDWxI3pT+zGtKkf+m3Wb53Z5A
 is1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719403463; x=1720008263;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S5OkAuV6GjNT0GJiinYK+CAJG5PBDmAjbuPgVCrya8A=;
 b=E0wzePUHaON8fc+yiukrmex1/NNhRoivk4a+nsvGW9md0cf7eTJjk1HnvtFKIDvk4d
 GecZk4or0fU1HnnG28c/EGFdglrnkB6THnDyuCCuJGMdw7Xks3qE9wpFCwulex0jb3+v
 C/Ii30atoaOGIpz9rru9cPUtaikxqDCTb5q01KR8bDDQu+43+m+dQVqZQC40PpuxuFJ4
 wu1oSTXhd6mnhrRi1ifD91Lny6lcGKH1KFN4O63U3zX1+OnuXTy3urUhpS170ZvNbevw
 NQ9TIxnLo/0ZsP/xxCtnU1H5aaRJHFDanG/GF+acIoVS+qCmYPLyYZpSscqorgw7qsYJ
 KuGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsM9KqM96v633HutSrQrWnjEr8lcOaoxOsC0B3awW01nFa8Fggi0KAG+jDpBjHA2CZbO1gGAqwz0G/5wf6txR/QfdttcavBpQ1vr7m7/J5
X-Gm-Message-State: AOJu0YyZXIQqvGFofMLQ4ns61J5qHxXxwgRz/sumjrZXJuvdMWjfbBW5
 NLghdWGDQIkmhWyN24vmuIn9ezc4ma5IXaqii0XnwVVus/AF28dFFVuhv75S2sU=
X-Google-Smtp-Source: AGHT+IFofuWPHs71z2hIu/xW4I5gmoosBF5u/UMGizJGu3JczUVUDZ4AZKljl7/y0pKzCMg/Fc27TA==
X-Received: by 2002:a5d:4bd0:0:b0:366:57cf:9aef with SMTP id
 ffacd0b85a97d-366e79fdfe0mr6947404f8f.16.1719403462703; 
 Wed, 26 Jun 2024 05:04:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f65bcsm15501250f8f.13.2024.06.26.05.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 05:04:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 26 Jun 2024 14:04:21 +0200
Subject: [PATCH] drm/msm/adreno: fix a743 and a740 cx mem init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-topic-sm8x50-upstream-fix-a730-a730-gpu-raytracing-init-v1-1-fd7e94694ab9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMQDfGYC/yWNSwrDMAwFrxK0rsB1XPdzldCFsJVUizhGdkpKy
 N1r2s3ALOa9HQqrcIFHt4PyW4osqcn51EF4UZoYJTYHa6wz3nqsS5aAZb5tF4NrLlWZZhxlQ7r
 25o8pr6j0qUpB0oSSpKLzFPrRhRjtHdp6Vm7R73l4HscXaFm+ZIkAAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1862;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=NShwTxi1NizSB5J2lYMbBw9A3FYxZdZB1fFQd1dnqHI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmfAPF/USzqFEUMCTCOPVaQ2FIK5s9t5J44UA/tkG+
 9QLDwb6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnwDxQAKCRB33NvayMhJ0YN+D/
 4i+u5rkLI0HH83ShHvENG+dAJ9T8e49pHYbkQ0TNiEYOc61sjxW7cbPcRcNVTOxf2n6FqJ1do34V8e
 trKBX76SLTaEmLsNUUO3ybGQQsiM2QTsNIZWmttWLm1wUy4kJvsmhZFM6NUs63ZjSqgL4z00mXUUMc
 jNW9RWStIOOxpTqI5frp/LPAMIieWWymwrc2eUYf2HIk2g24zB8OOnDj61bU54U9+dnh6WBA13rdQz
 VR8HxXZDjzx0vR68J3q7RfrU31ugtizduL1qgITP7khSu/LGu/bZKVB9ZyCYiC35Seww+6l+1OfxN+
 6gZHXECKhmz47lgBIV5M0Hih0aLuyZGfzgxCjOpOPxfkw8C0n+Q9kCAWbGwGeDRzzlj9g7Yb8Nd54Z
 Ppl0nluf6k1WR4dMe+1T4ZXxMLBGDFInhJhx2oVsAn7YDmdtxlzaKsckpnKw+cTk0riphqYLCccnqh
 kJOE1ZXI6ILZ0s5RLq1Ux4fiiIJ9rqyB9Q1/NANCgaSUervRLv1OpqDtk0idcHdE5X8tkaq5RzOnfE
 11GDDflsQzPP1sbynPADXGbK6mVzxpR3dn2IQEqmUbnrF54HvMFFR92rnXR2DLy0D3np2aX/lwwcHR
 MLNrGgOSQ0Cjq2XnQLG15pjtjJTodefru5tJ/l+S7KOvOLqFPrREY7+oA65Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Disable the call to qcom_scm_gpu_init_regs() for a730 and a740
after init failures on the HDK8550 and HDK8450 platforms:
msm_dpu ae01000.display-controller: failed to load adreno gpu
msm_dpu ae01000.display-controller: failed to bind 3d00000.gpu (ops a3xx_ops [msm]): -5
msm_dpu ae01000.display-controller: adev bind failed: -5

While debugging, it happens the call to:
qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ)
returns -5 and makes the gpu fail to initialize.

Remove the scm call since it's not done downstream either and
works fine without.

Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c98cdb1e9326..3ba45b804983 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1741,14 +1741,9 @@ static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
 					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
 		adreno_gpu->has_ray_tracing =
 			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
-	} else {
-		if (adreno_is_a740(adreno_gpu)) {
-			/* Raytracing is always enabled on a740 */
-			adreno_gpu->has_ray_tracing = true;
-		}
-
-		if (qcom_scm_is_available())
-			return qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ);
+	} else if (adreno_is_a740(adreno_gpu)) {
+		/* Raytracing is always enabled on a740 */
+		adreno_gpu->has_ray_tracing = true;
 	}
 
 	return 0;

---
base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
change-id: 20240626-topic-sm8x50-upstream-fix-a730-a730-gpu-raytracing-init-46ac3f4cdd29

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

