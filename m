Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2816D6234
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60410E68A;
	Tue,  4 Apr 2023 13:09:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0910E6AD
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:26 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id t14so33780456ljd.5
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=359489BbEgBMxOH05QZQy2H3mPDhw2Q2c+iKHkhCGlA=;
 b=rEdDw+kY+TWJNtp7EPtmpXQkVVXLjvMogXahgUsME+Ach7+BzqxbkHmf0ZvgbpnWFP
 ThcgUo/PRU/F2I8G2id112+Dc+p+MiqY74mP8cWkkp6lxwSIyABRgFppGtj2N21zGST0
 GkBYKfNfilXwMJvgLSiPROqZyGyhzD0AlyLb640RFf+BMLjy2/IiO70icbX2HmwnZzuS
 Sx/f8cMEK5/m+Csrj2voO7Ln4IFa3dpPYNK+2SU9Ai6ol+eDDuxl14wwpqfUP7qnfdKz
 sMZT8ETHdNOgfLjBZndWRhJUYxdj9zjD40Y33jCHHEMTurc+sWSWoOknm1yTq/ln0PzG
 wodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=359489BbEgBMxOH05QZQy2H3mPDhw2Q2c+iKHkhCGlA=;
 b=RkFKChSmxZ9cr8V2Q4vZLN6KK2V0aBz66renDwUSVy94zZj9sc9v6fD/Te9kx5QBo9
 EFkBdrfrHqPfyhuNu+1z3nQ5Z8mMBbk3PYgkE8nLwT+O3Kl43aac/+82D+QsE4p0l7Jc
 8fiTChKKxwGupzKL/slDRnUZlAFwlKC9OX28Wxr2WFVJHAq0aEVL/JrehdhXEZPM/qYN
 tebPUW4BJXGcVvRy6IUXzwaqPpyhtN7sfruReYJPvWgE38uO7zxicNBqoflP7lJCh3SY
 v0rcrv3Fz7stGIT7uEMfWk5iWjFn0pLIHKUj5+mJ9+dKZMFEja3RNEIvcBWGe7Wyyfl+
 ciDw==
X-Gm-Message-State: AAQBX9dLNTrx6tiRe6wXWxIP/TI2J1boTGVFMsWGPZr5XiZGnqSzZ+cn
 y+NcSKqqhVrWffHg6IkAU8Wqhg==
X-Google-Smtp-Source: AKy350Y0Pn2j+S+vaZDaosEubXr/ArO9hoDcQDCNJxpsNun8fQr6SnciQhwI8dqAPjEeTgMuG47pyA==
X-Received: by 2002:a2e:8845:0:b0:293:4b91:eb44 with SMTP id
 z5-20020a2e8845000000b002934b91eb44mr1073215ljj.38.1680613765280; 
 Tue, 04 Apr 2023 06:09:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:06:10 +0300
Message-Id: <20230404130622.509628-31-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 30/42] drm/msm/dpu: catalog: add comments
 regarding DPU_CTL_SPLIT_DISPLAY
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

For sm8150+ the DPU_CTL_SPLIT_DISPLAY should be replaced with
DPU_CTL_ACTIVE_CFG support (which supports having a single CTL for both
interfaces in a split). Add comments where this conversion is required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6db0f64142d5..29bcbc88cd5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8150_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 53a27461da05..233ea66155bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 787d67a28490..a5818878ee0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -41,6 +41,7 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index e7272bc7670a..6f573e28582e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index c7247a5739f1..9acd9fcf39a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
-- 
2.39.2

