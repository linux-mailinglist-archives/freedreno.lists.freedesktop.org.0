Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0FD696B91
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 18:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDABA10E93F;
	Tue, 14 Feb 2023 17:32:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D7910E93E
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:07 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id fi26so18475131edb.7
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9EA1b5UTex55XllBD6bRoH4DWPyBOS6Byl63HktcTps=;
 b=K6/tdJd6N0v3nJ8vDPKfNTISEMq95ZGjV9FRfudOu07WSeljh+UpcF1v2zh/0MCzL3
 8R0Ay0qWaJ2MBu3EHNgb57mkdTcgC/lHF6Xvnpx8xuxdlUSGsv5PYlVSzFBpblMb7A2B
 agJBMWrqquIOsf7Q63LXMJsQn+iwnPjkJztNMlCLQRASV1WJf+0vMkxonhYkhEYeR2K/
 wg9+P5/vTLAd4RpuQv0+4k0cv2V4ckLiaw1ARY37JE/q413qnyLZx2PC8wu/hcU7Zyof
 kVsbNkakV80AKKTn0il1RM9dYGhoIBhIEFoH75/d0YRfW3UuVVD/GlIA7T7FZ6LKwTa6
 q6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9EA1b5UTex55XllBD6bRoH4DWPyBOS6Byl63HktcTps=;
 b=Y1ilmer0dEntLKPuSw4BU9a3GY4K76tKc3yYcbJ7togtaBNmxwMgsgqdvNbMrTr1kM
 vvFM3e9Qq2oyGruRspNPgmR9uiPvuZy65OtaVT5F5/VXRUSpBhv/LLMNbgFAGfWIIcqM
 kCU0p0ud6jo4a9xJb97eE5AWlqGhOh9VPEj1HeZAZXP6eWZ45Os5/OW6+nUPF29iRIKT
 YV7PYx3UpEcTPtoeFgEiMbkZLuwFiDzvtllsMT44lrsjXXkkivGwcxkF+Ky/zZYXEoT/
 ZWMwKNdL7KK+Q0juXJ3xw0FI5xvz7dwGZzEcz5zSx+eiPiTH7zLHJwGRz+5F3enA5nIu
 cjXQ==
X-Gm-Message-State: AO0yUKVoAIAPyX3c8T7/NuPMAw1vKNZK7Cx6/MmJJ/tutJMFi7tbtnUz
 D7QPlpgewPQcDKw6umhkJegMaA==
X-Google-Smtp-Source: AK7set/sWMkw/dT7MHPH5kLLgzjXR6eUgX+yFgkXAcf78AHU0fCmCXGasaExRcaVeh2r93kf0lOWDg==
X-Received: by 2002:a50:a456:0:b0:4ac:cf29:1a6a with SMTP id
 v22-20020a50a456000000b004accf291a6amr3517283edb.20.1676395926186; 
 Tue, 14 Feb 2023 09:32:06 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:05 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Date: Tue, 14 Feb 2023 18:31:35 +0100
Message-Id: <20230214173145.2482651-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 04/14] drm/msm/a6xx: Remove both GBIF and
 RBBM GBIF halt on hw init
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Currently we're only deasserting REG_A6XX_RBBM_GBIF_HALT, but we also
need REG_A6XX_GBIF_HALT to be set to 0. For GMU-equipped GPUs this is
done in a6xx_bus_clear_pending_transactions(), but for the GMU-less
ones we have to do it *somewhere*. Unhalting both side by side sounds
like a good plan and it won't cause any issues if it's unnecessary.

Also, add a memory barrier to ensure it's gone through.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 72bf5c9f7ff1..75cf94b03c29 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1007,8 +1007,12 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu))
+	if (a6xx_has_gbif(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	}
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
-- 
2.39.1

