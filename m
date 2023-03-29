Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF36CDB79
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 16:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF89710EAE8;
	Wed, 29 Mar 2023 14:04:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F79010EAE8
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 14:04:50 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id c9so9941637lfb.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680098688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RHJ0WvwFhiwkNTXEVFAcPy6OADOzAA2uvcs+k52iD3M=;
 b=BVWxz02BP62xHNvQqVawNsr8/34+J8NWKHuzN6MPcgZdTfCDdxWgtB/bRHjQHDLYpa
 8y4U3Ktra2AcImTgh7g9x+808EFuitW3L2kKfw8kqmdWNc58ySzVoa83d6wEY8VHio6E
 AqxwvtzXiD9jvDp4f59y8HlrK2tnynYGSvhH0TfOndIdBF4oX1yloBovV8Ml5qk4tyNm
 Juq82SBIFpKv0zlGiuT5fCdOiA8689mtzuGQOrFi+gzImO6l0ZJA8c4IoQQyUb72dPG0
 M97dP58+YmQcnKNItNAho3iXUafJ6//KvH0pFgRgFa0nxfPM/ysTmv9Y2HZ05jm2RsoN
 C+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680098688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RHJ0WvwFhiwkNTXEVFAcPy6OADOzAA2uvcs+k52iD3M=;
 b=ESfb09bMFd/Ijul0eOsaPMsI95jV7iva22Zu+5yI1EG69Vq7K9UiDQMak32ZFDZgK6
 JkHMjcJtPFdEV6zMr7cxGdBHmQcr/bKYaxkyVCyLSB2QpbW69b6h72Mw7HJTmnS55Xnl
 FvJq44FPzRwHc0MtkM3Z0tEUsylXeyRZOs0iSK1/Rv3PcjLykZ8pwmCN7Bw13i8jGcAd
 WDrEJKt1YnbwcJZD2K28qwqUfXB8B5spWkkI3IBx0QSRsswEOrn+du6fAqITeOhnSSr3
 2TaCm+VYLO1fkc4Qvr/i0D3Nf8vJoRhVlPqBcuRWn5UKjxCdqhZexxnSMgjWitfZrezJ
 cctQ==
X-Gm-Message-State: AAQBX9dzjajvBp3GiMAcbY3x6sNjbXBMN3helHhVLIpnxjLfm7k5bbzJ
 HUAYQSNMVhAXTXUHqBcwRD9v+A==
X-Google-Smtp-Source: AKy350bZjIkvOV30egQBp76DByMuaZbSmTJ1/6zX+9+rZEZvIkolNPlHLICPA3fsY5DWKnVOqEqpzg==
X-Received: by 2002:ac2:4889:0:b0:4e0:61a6:c158 with SMTP id
 x9-20020ac24889000000b004e061a6c158mr5775860lfc.36.1680098688469; 
 Wed, 29 Mar 2023 07:04:48 -0700 (PDT)
Received: from localhost.localdomain (abxj225.neoplus.adsl.tpnet.pl.
 [83.9.3.225]) by smtp.gmail.com with ESMTPSA id
 f21-20020ac251b5000000b004eaf2207a33sm3501083lfk.223.2023.03.29.07.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 07:04:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Date: Wed, 29 Mar 2023 16:04:44 +0200
Message-Id: <20230329140445.2180662-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/adreno: adreno_gpu: Use suspend()
 instead of idle() on load error
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If we fail to initialize the GPU for whatever reason (say we don't
embed the GPU firmware files in the initrd), the error path involves
pm_runtime_put_sync() which then calls idle() instead of suspend().

This is suboptimal, as it means that we're not going through the
clean shutdown sequence. With at least A619_holi, this makes the GPU
not wake up until it goes through at least one more start-fail-stop
cycle. Fix that by using pm_runtime_put_sync_suspend to force a clean
shutdown.

Test cases:
1. firmware baked into kernel
2. error loading fw in initrd -> load from rootfs at DE start

Both succeed on A619_holi (SM6375) and A630 (SDM845).

Fixes: 0d997f95b70f ("drm/msm/adreno: fix runtime PM imbalance at gpu load")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f61896629be6..59f3302e8167 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -477,7 +477,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return gpu;
 
 err_put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync_suspend(&pdev->dev);
 err_disable_rpm:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.40.0

