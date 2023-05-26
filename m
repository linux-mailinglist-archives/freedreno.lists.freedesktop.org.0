Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A551B7125FE
	for <lists+freedreno@lfdr.de>; Fri, 26 May 2023 13:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F8910E1C8;
	Fri, 26 May 2023 11:52:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A67B10E7EB
 for <freedreno@lists.freedesktop.org>; Fri, 26 May 2023 11:52:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30addbb1b14so67246f8f.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 May 2023 04:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685101924; x=1687693924;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=94lOxsLEFjNeUwsBx4SaU5IrAwgtw5WWI0FQECJPg/E=;
 b=QR7LsiBBs85Pai0DwtnlFfzUYDkkQShckxJbj9SwuLSADIADR2i/l3xHaMffLEBgTl
 R/k1RCTFIy/O+2RwsmkE3olt01XOPwMziGfMhCe/dpNWkAvP+C01U4YWkzYjnH+m9aUQ
 f1UK1ZLyeilbWyknk6yf94kITZErWvpbTiQmKvOvUjoniQr+HZO2HYNdBdVxQ01u58ob
 jtwXybedyR8jCAkpeP7ZtnAtJeRv7PBVjck+frZlndqi/n7wCpVBXHchYmmIZfIqT2KT
 tsnfKDqmIuOCXMRukK5a5r7NameVHM3ElYDWEqS9sRzbk/hBTAfIoTmPrTmsjLmBXhME
 PxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685101924; x=1687693924;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=94lOxsLEFjNeUwsBx4SaU5IrAwgtw5WWI0FQECJPg/E=;
 b=e+v6cT3IvIUgSlSa2KkHg61giYpcpOw/iFdlY0qnOPFd+2+iUsTfYA1Oq3WYHqBMWp
 zbxXjnbm5sf5yOjLL69RP/mi3QehGI0GcCjUUQZdWMDmWVXQotLY5GNtveJY5NyHW7b7
 R5QvPrBfArL3IqBQ535+mR82cvwFfS6gOfv0betC64/QQQa6pZtoA4IMkLCKMgNIR5CN
 aWDP/53MOm8SQXHOO7R+9b/jiPb7MXjs3ncq6ZtHnxsSBpnqRjRNj8invRsXioP8P/7F
 EoBXkidBnQRp5v3PLQB6VZ/VDSRbL2KbA0jCuX61MJYRKbbiUTs+Bg4nO+DCaTecsLCJ
 mAIw==
X-Gm-Message-State: AC+VfDypT23VczPQBjdLbYFcxJuptTycXM0CFfG1BUKMRu0f9t/XrIW9
 nkrdiu2Nj/7Zn5xCVXQr4pDIHg==
X-Google-Smtp-Source: ACHHUZ6/7YDYu2DrYFOko7cae4ceje+2MQW67ePdGrI9Wdm3un67/ARE6Gcse9uzeVtUdeAVlrmvkA==
X-Received: by 2002:adf:dcc4:0:b0:306:2b5a:d8db with SMTP id
 x4-20020adfdcc4000000b003062b5ad8dbmr1112003wrm.23.1685101923983; 
 Fri, 26 May 2023 04:52:03 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d4a4f000000b00307c0afc030sm4920185wrs.4.2023.05.26.04.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 04:52:02 -0700 (PDT)
Date: Fri, 26 May 2023 14:51:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Subject: [Freedreno] [PATCH v2] drm/msm/dpu: clean up dpu_kms_get_clk_rate()
 returns
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
Cc: Liu Shixin <liushixin2@huawei.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Static analysis tools complain about the -EINVAL error code being
stored in an unsigned variable.  Let's change this to match
the clk_get_rate() function which is type unsigned long and returns
zero on error.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: In v1 I change the type to int which was wrong.  This is a different
    approach.  CC the freedreno list this time too.

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..25e6a15eaf9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -979,13 +979,13 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
-u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
+unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 {
 	struct clk *clk;
 
 	clk = msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, clock_name);
 	if (!clk)
-		return -EINVAL;
+		return 0;
 
 	return clk_get_rate(clk);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..961918e5a5b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -201,6 +201,6 @@ void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
  *
  * Return: current clock rate
  */
-u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
+unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
 
 #endif /* __dpu_kms_H__ */
-- 
2.39.2

