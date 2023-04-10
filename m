Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 744406DCB2F
	for <lists+freedreno@lfdr.de>; Mon, 10 Apr 2023 20:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5761C10E220;
	Mon, 10 Apr 2023 18:52:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B186810E220
 for <freedreno@lists.freedesktop.org>; Mon, 10 Apr 2023 18:52:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id d7so18595535lfj.3
 for <freedreno@lists.freedesktop.org>; Mon, 10 Apr 2023 11:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681152747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SQDITOMHIdfEo/UfLKkF1WdLVbzkIyAXvUaZR5s1k/U=;
 b=Ivmqu5bIp+mbLQPy3x/hBVyWrIYlLoGbw9PcoOVG2GVUhhpzaKPleLCi6n8WflwtXV
 dv7cUrvm1vQalJtzAK7Pj02zT2bg4pbMyU+aYQMJN7th3+PiTGGGltgdjcSRvLq2cCMh
 HsPVSmpSxtM6QIK/sB+78VK1SSKvd+XyAwClbySVmAHgyCHC493TK5i11Yhx2Tb6MlvA
 0b8Vb3KkiUyqlwCUcStxjthndkRxElA6irjXIkxLTV7noJCurXll3qCmTt2p4A4b2BsU
 061sY4kze9XhfuQu9qedr+AUIn/do1gekozEFuPV+oerXGDx5LLMC+cAci1a6uDt2i4w
 py2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681152747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SQDITOMHIdfEo/UfLKkF1WdLVbzkIyAXvUaZR5s1k/U=;
 b=xax/vhymucV5/RfoXStidIF69tVI5k8cH9goOwOvKxKDhS35xBRc24NEpUXCXhy6mX
 pZa0Dhc8gzfKWiK5+oDSPY57YVrBQSNNX0qOh7jRCZCO3pVoF7uVTBzAynkgw+vuOrE4
 cum+xv6lg/XElwJeSl5ENgEwdbKU02/McyzI7DYkA7CQkCzb/qnNgQjnQM7SClmvt5/D
 rQg/vWJmytTuqdpsJWyLelqlNW/uuGf5jYMY0mrMBU/c2ZewKLdOkopBGv3WR+p5UboQ
 +v6Dej8FsZY1+6HmehF1NxVZLdhu32jAB7Z13WsVC9fAFnMEnG7jxgkWaYmiYsRkGWRK
 Fr+g==
X-Gm-Message-State: AAQBX9etlVB+FXx57JnJEyO9Y1YMmLULc6ZSTbzLdHaiRSqKyWUgtGV7
 ZmZSUn+7BavWR3E5F2I8S19DIQ==
X-Google-Smtp-Source: AKy350aGrUuveydvpkrghVrLY36vZoiLW9cBAE9U5SUeV/1oxrX4oGggzYQQPGwewToBRKFwNVEuwg==
X-Received: by 2002:ac2:4563:0:b0:4e9:bf83:11a4 with SMTP id
 k3-20020ac24563000000b004e9bf8311a4mr3030321lfm.7.1681152747494; 
 Mon, 10 Apr 2023 11:52:27 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q27-20020ac246fb000000b004eb2cc16342sm2222550lfo.21.2023.04.10.11.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:52:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 10 Apr 2023 21:52:26 +0300
Message-Id: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/a6xx: don't set
 IO_PGTABLE_QUIRK_ARM_OUTER_WBWA with coherent SMMU
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If the Adreno SMMU is dma-coherent, allocation will fail unless we
disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
coherent SMMUs (like we have on sm8350 platform).

Fixes: 54af0ceb7595 ("arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes")
Reported-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2942d2548ce6..f74495dcbd96 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1793,7 +1793,8 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	 * This allows GPU to set the bus attributes required to use system
 	 * cache on behalf of the iommu page table walker.
 	 */
-	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
+	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice) &&
+	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_CACHE_COHERENCY))
 		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
 
 	return adreno_iommu_create_address_space(gpu, pdev, quirks);
-- 
2.39.2

