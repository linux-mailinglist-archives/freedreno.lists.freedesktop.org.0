Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6ED4B96D0
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 04:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B60810E731;
	Thu, 17 Feb 2022 03:45:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDA510E1EF
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 03:45:05 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b38so6312671ljr.12
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 19:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/YRcQBG+8CmKlfSNRGmKhbYNFYa0GOg31OmQ3eN8P4=;
 b=JlqKAQ6AUL8g9W9NO3LJ6vb9NdsRoKYoAyf63GcrRH3GnZy7hPS068H52YdeHrYmAF
 XaqrMBVvCQf9LbU+0j4n+SaekNIjKsNx8bnk+TE+3MHPTGX0RH0Nt3zspYARomIBe0Nw
 BGBQZWKMKZjfR4xuvrbUe+oz9UT3DkI2rzP//GhSSSRwT7KM8Ou8uwBy6z88/v4cZZUa
 rBMtfeSJ95LVdF+z3JIVTptiaj1ms5gKUbkLHE/84CnxOSbJlboEkjLamKSKGLX81WFo
 ms1Ytw7jPbIEygTsEyQSiHQymiR0OpnyJtCoIhGuVRF+Bo+vmtgUhVA147ns8LP6arHw
 6amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U/YRcQBG+8CmKlfSNRGmKhbYNFYa0GOg31OmQ3eN8P4=;
 b=Kow1eYVgJ5dujw4RV35XV1PO5EYlLnscdTXt0P8hODrdxf2435vPovBqNZIqyKY8hd
 ZkiIf2NsW1b4GYELMX5UIku2KSCjT8RM/WTsiE/onr+J6Dta2ZkVe/UJ1XzobDn5b/7+
 V0ky+6QHpXkrJMDdk7mVt4v5WHRTVJJ/9ptSu8TtNI/QswjErm+GM8czUxLEvkOEbtRk
 UsxuotNR2KEiYqccuL5wQ811kycndGootRIhkRO0PRSn5VhMxS1noxMknJmCpwN/ubRI
 Gi7pnaB5xEU2e34b4/sYmLlrbxBO+wWyr5cLO2e9BdbVNg39XGRlgsVyqxqfoc4jqqVX
 dTNQ==
X-Gm-Message-State: AOAM531sCgWoOzcYoiK41FhSZVFfHw71eZ8AvqyvwZSlaFMahdBmjJ3b
 Af0Uq43DNTGCLftQ7JOJPbn3BQ==
X-Google-Smtp-Source: ABdhPJxtd7V+S/bnD3Oc615ZGRXme/XvFNSXsqKMmYXNLWx/nQ0uqusSKV6JWhSTpFwOb2DxKZhZgg==
X-Received: by 2002:a2e:87d3:0:b0:244:c1ab:91ae with SMTP id
 v19-20020a2e87d3000000b00244c1ab91aemr820892ljj.277.1645069504092; 
 Wed, 16 Feb 2022 19:45:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c25sm822268lfc.22.2022.02.16.19.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:45:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 17 Feb 2022 06:45:01 +0300
Message-Id: <20220217034502.464312-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
References: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/3] drm/msm/dpu: fix error handling around
 dpu_hw_vbif_init
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_vbif_init() function can not return NULL.
So, replace corresponding IS_ERR_OR_NULL() call with IS_ERR().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 81a35c8d62e7..f8f1bf3b511d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1102,10 +1102,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
-		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
+		if (IS_ERR(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
-			if (!dpu_kms->hw_vbif[vbif_idx])
-				rc = -EINVAL;
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
 			dpu_kms->hw_vbif[vbif_idx] = NULL;
 			goto power_error;
-- 
2.34.1

