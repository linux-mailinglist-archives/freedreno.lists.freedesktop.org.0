Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 827C3792CA7
	for <lists+freedreno@lfdr.de>; Tue,  5 Sep 2023 19:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E717110E182;
	Tue,  5 Sep 2023 17:43:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B5A10E0C2
 for <freedreno@lists.freedesktop.org>; Tue,  5 Sep 2023 17:43:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bcc14ea414so44109251fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 05 Sep 2023 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693935835; x=1694540635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvB2m6jWZ6h3dqLtwhCqsLJZSURv5HFp2WI8WShvmgY=;
 b=k+JntKCMN0OYj7nmAG43NXzEmWQMBFJnnZHHlO9YTQXjjPEVXsz5fWgW5DA+HQ6bVx
 hrN0Kp6PiSv2TjU6/ymR+lI2Ek1O9p6UcEcu1o4hlKZ8d0uDRXLGHA22RhBpotfcCN5o
 PfN2OZh/SLvrq2Nzlg91rYAhZ2UU0VCEfGFT18xRlS+B1PtpCh13Cvo0m7+8D/4oub2F
 3q0nbCoB6YfEU7PJkxabzVCTwU/6HWX7jsBbrpuGziMQxU99PFhHjTgQEzkGIJSnba/E
 D2GdhGwgxxTtumSFsxaTzRZ0+WjZ2YnVgu9sAxcSrMFn5Yh3Ce3CSBfwqsvsqu2mFGfh
 c6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935835; x=1694540635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EvB2m6jWZ6h3dqLtwhCqsLJZSURv5HFp2WI8WShvmgY=;
 b=MlM11lMBTRzXIime3Sejr7vLs9NuFNdTZRh3Ho0uKexF0Ftm3z70V2Zbe99ztp1ljA
 SVPLpdzpFd4/BnSNw4qP2VrBj24YXT22/VxR3CaapxlRg276rtJkwgAtg6JGlN4U/uyJ
 GgQJJIMghdfE7jtv0MDaNa+fzgevXKDGXEwhLgLSrsm7buL1SKk2+A6R1Fpq1eA/Ydjx
 Ye3CzNEDPmen6d9HP1tKy7bBfTZvoAswOd4fUKsubMJUq8CDEE6ehYq8HSxkMRcHD1Gf
 KqjfOOW1NpOMSfG1Hz2zOoazaFxMSsTZ1/UYK/vhr6CdUcZSQkDs6FrAYxL7FyydjgFy
 IEzQ==
X-Gm-Message-State: AOJu0YwpoQ5ggJCd0TsDGkokpoenm7hOG90+G+bph3HBMl0C4PZhUZez
 rrHKN7AcwFU0waGYMWP3pMsy7g==
X-Google-Smtp-Source: AGHT+IFkuCioqJOVDcvntY39EZiATGhgvVH3wGIf6xuX/1yMeziKkHJcd7MOrZxQqPdTGfNtR5iVuQ==
X-Received: by 2002:a2e:981a:0:b0:2bc:bb01:bfe6 with SMTP id
 a26-20020a2e981a000000b002bcbb01bfe6mr352074ljj.21.1693935834712; 
 Tue, 05 Sep 2023 10:43:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:43:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  5 Sep 2023 20:43:48 +0300
Message-Id: <20230905174353.3118648-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/6] drm/msm/mdss: fix highest-bank-bit for
 msm8998
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

According to the vendor DT files, msm8998 has highest-bank-bit equal to
2. Update the data accordingly.

Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2e87dd6cb17b..348c66b14683 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -511,7 +511,7 @@ static int mdss_remove(struct platform_device *pdev)
 static const struct msm_mdss_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data qcm2290_data = {
-- 
2.39.2

