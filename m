Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F367CFD1
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 16:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821610E933;
	Thu, 26 Jan 2023 15:17:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71F410E2A4
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:54 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cm4so2137334edb.9
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CddRwSzocQvRockEdA4yvKkrPdK0c3Dd42RlRLUcF2Y=;
 b=GXmG/u1h816X05sgf8P1FECsAAVuqm7W8uZuzMlJ3yYinH721+FYFN9aDfAmNDTt1p
 X9WWXSUesFBuZNbZ5sXvXaQLbK7szTktWxlPz8/sR7fOQ6jSW/EE1ZexvSS6g58+CAEd
 CaOmskiFbo7tqyydjQV7uLLRxEo/8jf8AsSF+y0cW7iHOMUC9LVv9YTjn2VjVCHDC1uC
 Wn48JLQeSpERIKxWCkbVTLUQ5rD1nve44WQniwh5GbVBrVkkjPvHkoUcyVav3Adia2j1
 IgxcaUYHYDIYJINQsTEg9zm/4L6Gg1nOz4Bzk7kqur55bEQpPoeZhDBmxAhgIXwobgYg
 M6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CddRwSzocQvRockEdA4yvKkrPdK0c3Dd42RlRLUcF2Y=;
 b=UAtbWy+qnSwc3YADxuhx/0y+sP7BdOzV2KnxZ3MiCDB+gn0gN5Ycu9QmjbPCr3lJQo
 6zSMxgp+YrcuNnoaHb4/9zf74jtE85DhPfZ2PAGQYiuJMwHFnIORukBU2aPoAajovOKX
 6HGsRvWdrgdzt+hwy9VJ5wRCJ4+8N3+6cMNbWi4yrnXFnocLuKIi7QRbW+PcBuMgaFEx
 XikZywx59fcwfG0ZZPsW9O+1YxPcieW0X7Er8/sJ0oRdfsjWVISuEhGb8xcJQ6+CPmj5
 OdQ2sMIgKddQ8i3ijU2UZ/h0R70FEK9MaaZqn7xoP6ndxCw7UndBBjB5dG28un1L3LF2
 e2Zg==
X-Gm-Message-State: AO0yUKVVeVktK42sunlSVDv3ZCtXRTb6AFseQUZGPGfBfXSiUwBoifqc
 x+kPMuNJ91Mi6FZV0Y1SzjPkAA==
X-Google-Smtp-Source: AK7set/ykZUSLMStAUNJlo7q5VvG2BHWVGFSh8/CbaVeBRoljyctPOuurEQckisZ2pmnXW2EGweKww==
X-Received: by 2002:a05:6402:430b:b0:4a0:afd5:df81 with SMTP id
 m11-20020a056402430b00b004a0afd5df81mr7170467edc.35.1674746274366; 
 Thu, 26 Jan 2023 07:17:54 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:54 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Thu, 26 Jan 2023 16:16:15 +0100
Message-Id: <20230126151618.225127-12-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 11/14] drm/msm/a6xx: Enable optional icc voting
 from OPP tables
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

On GMU-equipped GPUs, the GMU requests appropriate bandwidth votes
for us. This is however not the case for the other GPUs. Add the
dev_pm_opp_of_find_icc_paths() call to let the OPP framework handle
bus voting as part of power level setting.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 62f504ed7ef5..6d6b71306ee5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2335,5 +2335,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
 
+	ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return gpu;
 }
-- 
2.39.1

