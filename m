Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262309691DE
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 05:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5315E10E3DF;
	Tue,  3 Sep 2024 03:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EqeSODfB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894F210E3CC
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:00 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f3f90295a9so54275301fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333779; x=1725938579; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H51nDEtY+afzUBw+OBIFePQrJsO4/hqhDKfTqoHMhGE=;
 b=EqeSODfBQi7DrbO2Ok/7mOVDfiAJsDEBj61g30zGdV8QhPg8X0hYLD3MOZHfvlBAaa
 BsUmdjWz87MldlSlfJjPAcKEXxUV3Ntmrv5ELt9Lnk7n6UGFGC4wFXCnIsZOZScfkHIc
 Pej82peoq35iPsHgeCeg7Aao83DliqfMbWdnjV77r0LsEfuu/u+EaFy2wjrPr7wwKw0T
 e6y/R4G0aFETOUsCKjvJUJaz1LTL3ogjVNVGD2EikVp92bvNrgtoU1NNfBSrVyrPR1vr
 AO1hiVzfK+TbQYFxMO/Stthq9vneqlqOJUl6CyxUe21h/x/HYNax45Py4BAjIxgXlspE
 x5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333779; x=1725938579;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H51nDEtY+afzUBw+OBIFePQrJsO4/hqhDKfTqoHMhGE=;
 b=mnjEtC2bZQuUM8AB0mibphcdb9gsAmPhuOVl1iX+keiUEMSKbWM0ZwleQRdjn7WE9d
 ekHHwCXyWt0tJxCp0QxAviPnMYgl2AFTO6iv1RxV/Ym/xgKFNFmbRcdvevNUg9tOxRaM
 qdF0NDTRkq3dZZFHhkhGL2jZfXYmXCxv0nb0gylq95I8bCJhJJ1eTuOx+x71LqOG5oWg
 ymPUeWsUvyeJTef11iLkrcPGig3YtTV5962gHSeQihWFkMqGjD0/2sKSJPZHVUmk8Dpt
 RfEN0jcIkGY139zPdubT/OdCVRDcARHon50X+JAT1i9iwEQKoUIrhaeTG7z1zm4s0BZp
 F+CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsWb8HpTvsT22VCG9Dp/AIQS7OVVoo95OEngLkT/9NjS2ShpwmID8uEnqB2qnZyWmFod+VicEy/O0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwSPy+P/ehC+0DyXoQGUVL+FqRlpR8ZtQb1HgFp+etiFSiaDov
 M/RJWFxU2nl44itpUSJqkDcseeTBEdauXIM/2H7zPUCSvKI0k2Hh36Lcy5Q89Ik=
X-Google-Smtp-Source: AGHT+IHvR+jurlZsKzIDNM0asSCNRqANs4oGztcoGqbByKt7wGpQYTBtE+sHgm9pv7JUfTEwHa9CJw==
X-Received: by 2002:a05:651c:1a0c:b0:2ef:2ef5:ae98 with SMTP id
 38308e7fff4ca-2f636a7fec3mr30331801fa.34.1725333777985; 
 Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:49 +0300
Subject: [PATCH v6 06/15] drm/msm/dpu: drop extra aspace checks in dpu_formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-6-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/gi8zyo7FWjCT4xdT9G2skDFV4BfLSyAVjvvmb1/W1Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEL5SIIxYpAg9zdiK85yFFvln8osR7Wiviq+
 zJULHAWC86JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1SAZB/9JPst8EHWsbRbm4MesqNi8DzrxHHkAE0teXhnyAJlvKBx4hf40U00LS77SDfEsU8r/p+Y
 yIA1YrHYugT91eLtIgj9+6nHNtLXkx1Lvr6WDPHVxhyp2rL0gYCT35XyZ/M+ejZ3eEhBgMUTeNS
 hWwXLja1YfIy2gVMbH7dc6Py/V3e3Erg6Zkko9Upksr2MiZ4UK06ukLXzesFxR1BAiKkNvkV4Yq
 BPyqa6AO/CgwyDPc+KRu/6vkA1K+8gqQ1li9btXT3Thjxcj6kclGdWNM0KM1Depm5xsEabgZNIB
 3MfnPj79OThmx9FlyrsQcJ7eaj7Snw3nPon9oG3/5eKchRMI
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

The DPU driver isn't expected to be used without an IOMMU. Thus the
aspace will be always present. Not to mention that mdp4/mdp5 drivers
call msm_framebuffer_iova() without such checks, as the whole
msm_framebuffer layer is expected to support both IOMMU and IOMMU-less
configurations.

Drop these useless if (aspace) checks.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 027eb5ecff08..8c2dc5b59bb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -280,8 +280,7 @@ static int _dpu_format_populate_addrs_ubwc(
 		return -EINVAL;
 	}
 
-	if (aspace)
-		base_addr = msm_framebuffer_iova(fb, aspace, 0);
+	base_addr = msm_framebuffer_iova(fb, aspace, 0);
 	if (!base_addr) {
 		DRM_ERROR("failed to retrieve base addr\n");
 		return -EFAULT;
@@ -376,9 +375,7 @@ static int _dpu_format_populate_addrs_linear(
 
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
-		if (aspace)
-			layout->plane_addr[i] =
-				msm_framebuffer_iova(fb, aspace, i);
+		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);
 		if (!layout->plane_addr[i]) {
 			DRM_ERROR("failed to retrieve base addr\n");
 			return -EFAULT;

-- 
2.39.2

