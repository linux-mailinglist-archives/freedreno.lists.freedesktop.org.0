Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47227B695
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 22:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2E16E15C;
	Mon, 28 Sep 2020 20:47:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642026E15C
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 20:47:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so2442692wmj.2
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 13:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QaDlg5umR5Bq6B37KlnZ9oyPSfCM/hAhsQpiLPmGTZU=;
 b=ig1SWwAtJ0I1VGjmzmZ1x8L6Qx9iHAd7GvhIsifd7PPNmAekFI8V8btr15kSOpr66P
 6Ya9AB9WPJmG1GpJWFbvoPchv8iQ9lcyzOwufKaZkl9xs0Hyf4EExaVoH1aIksMS4NJh
 sdVTglFNEDgZV12DqoOb+ld+mu6IrEzbks2MxWMDHu1asaCnC4JFE++xaNmRtdohvXTV
 vQjviJwJYV/i5gIUhkY7y0NtDUcJMgLRGcOmf3cd2M8sGR/pdYp3vToGtTrVLDtsR+6L
 3jfOqTzrEHWVD7xajuiqTqXnvi62XFKA4Nd9fOCg+GFr3vxl+ut2CfQAWOlCmKgRO/D+
 QhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QaDlg5umR5Bq6B37KlnZ9oyPSfCM/hAhsQpiLPmGTZU=;
 b=ABcz3Q7lGHZXvrzG1AbNadmA4NA8q0+t7jJOcAFXhIMuI1b5QUL9M7U8IMfB6xE3J3
 X4MPKvsgODNtreYDgxaAilsl3QM4l6rWfLJbycnOI5hEwKbmrQGmVQSCvmAV5cLqqi4Y
 7+ERa9k3viB/Y7xLPxFOToA1osV4uvr/a5YgvOASd9G09FRaS/nbHULYQcNjD4AgJsC4
 sXTIlJN6zosWX5JfsSUqNh012kgrDrxj8B95Y60l+jva+OQ+EPH1ZvUMoah/rBhFRREn
 26rX/XGtZh+QIB+ypr6GmGfdcK3eZqDbhfIVODE5W/hk+PwLewud2Pp8/8p5gqDehPk5
 N9kg==
X-Gm-Message-State: AOAM530hWlYgM/KVhDdTuwa+JKqHRBj6UkQJ52/8GzPJIntySOMDgr6z
 SBVkOO0pYQfl3WDJd3Uevb4=
X-Google-Smtp-Source: ABdhPJxLxyRLBTsYddKkS0vagFHtgTYoh1tugkQ8sTKZR6M0eDFqGkM+4DqKN/aTT3u3yZMtxk1dWg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr924797wmj.166.1601326038050; 
 Mon, 28 Sep 2020 13:47:18 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 13:47:17 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Mon, 28 Sep 2020 22:47:08 +0200
Message-Id: <20200928204709.45746-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 6/7] drm/msm/a5xx: Disable flat shading
 optimization
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
Cc: freedreno@lists.freedesktop.org, marijns95@gmail.com,
 phone-devel@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 konradybcio@gmail.com, linux-kernel@vger.kernel.org, martin.botka1@gmail.com,
 jcrouse@codeaurora.org, daniel@ffwll.ch, kholk11@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konradybcio@gmail.com>

Port over the command from downstream to prevent undefined
behaviour.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 448fded571d3..6dac060902a3 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -759,6 +759,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	    adreno_is_a540(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, bit);
 
+	/* Disable All flat shading optimization (ALLFLATOPTDIS) */
+	gpu_rmw(gpu, REG_A5XX_VPC_DBG_ECO_CNTL, 0, (1 << 10));
+
 	/* Protect registers from the CP */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
 
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
