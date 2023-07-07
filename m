Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342074B9E2
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 01:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5DC10E619;
	Fri,  7 Jul 2023 23:12:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F027110E60F
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 23:12:55 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so4026050e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 16:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771574; x=1691363574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
 b=XiMwUFfq30HoJbhHr/Z5GPk/g1zMJkd4Quu+RHa898+wMhhtx+G/WxN3v95APi79+Z
 ZumxTU01HHXRXCkAH/yB41gRpYP59wqVVIutQTpOKgYWXmHR7ePCyFc4O4cn5JTmu8dM
 BfhRkM/qCviueDuR5vy+9a5zsWAAtC6+8RytTsrIfoXpRj0Gvpz35YGnlWPj4FtKrdMj
 BZIDLdDCRUXNTyPhRMERX4ZSRNooe2XKyVZUtdrjtUqTPDoRA4IOim5ZSKmeFYG7XZvC
 Qf+A/j9ERXkzzAwwDCZNGQ2LKcwQ85DFx0mOQ492nd2KgBx6OP1TS5qK/eMhgAmvwbfj
 TOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771574; x=1691363574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5z5CQN9gQhlBI3rw12W+BY+UTTjPQqcnHrgndY2Aqs=;
 b=NXFZMQV9UATUz7ykCg3bG4LxK1dpkcZnkWLR3J7Tms+JVXRIok0tIqm50E+HPD6ZfT
 Xh/UQ/VLMswYP9J/9GVD6bXLuKMnqcEf9hPzmdKhUXtqZOgwymLWvrjLbtKwBYPn2YW+
 NI89HJ6XiYsfSBDtJOJoIRmf9cASVmjOzMtDmyVEXgbeHOZtFwWksXvMVN++qtFAagBp
 fRsvWajXGIZWhmkZbuiVdiWzev0ufb7bljN9iI3vUEqEOMprgaOOjfjAEqtKGjuQOxTi
 mbVcXyhAuq3wzBOqhAfbxicFVLMd9Gg+X6hlPGvkoCbSpviPGurhYtHLEhmb6VQ+HnoX
 HpjQ==
X-Gm-Message-State: ABy/qLZKG+El2FALbEmw1b1H9hADQ23TDCUSH0kEP+HR4H/5zUEXRMop
 WMbAQXQ1m5HCkQMQawLA2ZW38g==
X-Google-Smtp-Source: APBJJlF0xS8Rk1omO0MKWW2tlGH3W0mgE1ZQ4QQzVULEV9tGu1Tea1XDjP5UYdKExs0/FH82Au1Vmw==
X-Received: by 2002:a05:6512:e9c:b0:4f8:7325:bcd4 with SMTP id
 bi28-20020a0565120e9c00b004f87325bcd4mr5850869lfb.0.1688771574202; 
 Fri, 07 Jul 2023 16:12:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 02:12:40 +0300
Message-Id: <20230707231251.3849701-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 02/13] drm/msm/dpu: remove IS_ERR_OR_NULL for
 dpu_hw_intr_init() error handling
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Replace IS_ERR_OR_NULL() with IS_ERR() in the
dpu_hw_intr_init() error check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e7ac02e92f42..85b8c9cc99ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1096,7 +1096,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
-	if (IS_ERR_OR_NULL(dpu_kms->hw_intr)) {
+	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-- 
2.39.2

