Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BBD6D622D
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECFF10E2F1;
	Tue,  4 Apr 2023 13:09:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE6710E6AB
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:25 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a11so33764799lji.6
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3Fx3sk6Vn5lZzb/pUoNHIe5WMfmNRaGDKPmYFHhJvI=;
 b=GBCLKiFtcawE3NWz82ifekpZfkzi6SZJzphv4ONq67WMTNMc0Xs7+xCHUsy78IhbfV
 kfWpmu9OY52ApNyBeOTfvsOYePmk7TDsx41qsj0T0sa4k/64JxZhzi+Tc1oqtobMmoxX
 b0V4ptP5H/6r7SSEp6YzO9C16yRIBK2M5CUhQ+xFXhjq3lIY4sBmGw5gI1VZnb5zhkfY
 Y5pTmOkApc+LIFaSynPxyOZxjSre3ryWmnZSK2ZfVk3D9pGiFpw80CNUHzBQkkhtMUy2
 ApUMA9n5iFmpEmkNox7ahwcychsRi9kp9tALElZ3oP+hGWQ4txV5agorewOo5mqyNz2G
 U5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3Fx3sk6Vn5lZzb/pUoNHIe5WMfmNRaGDKPmYFHhJvI=;
 b=MHy49hQSY1bBUagAz7LajH8zpohPHFAtxU55WW0hUT4/cLKwWqmOUghl9eY9M+mkxJ
 skmkosNem9Dd4Lr0/dJQ3QKz5rPq8S2VTkW3evR6V/Yjj1Wr/3GiHfigdfLLNGWmAz6R
 OVgQB56BtvWRBHYEvOGwe2l2lwMuzgP28DgKfOPAhqnBT3KOweCfPVrXSFEYw3uz7njm
 nvxn+ByxfpDFl9o1KCOQqarsjqNkzLUKQVZn7ZfwpFEITSRoNXHZDRyaANVwQV9885fP
 tJ1LfEU3t+1+LxU4JzKEzp7zrS8+bXZTv8i1C6X9XnG4LDioC0mtCgSHN+ezlZ71hBov
 IJ7g==
X-Gm-Message-State: AAQBX9fwWcCC5dztKzLed7p06iDWTiBwly4u2AF/+5JFZqD4hLH3eUBh
 3nY+jN0TnBgjUtOcZuAvyHKGaw==
X-Google-Smtp-Source: AKy350YymQmNmYx7ky4qkixUz5KwnKiqsiPqms3ZBxxlMT3nOM/mz6XPYUJkzXNXdJUH3d8I+z6Jlw==
X-Received: by 2002:a2e:b046:0:b0:298:b333:4267 with SMTP id
 d6-20020a2eb046000000b00298b3334267mr960471ljl.18.1680613763866; 
 Tue, 04 Apr 2023 06:09:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:06:09 +0300
Message-Id: <20230404130622.509628-30-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 29/42] drm/msm/dpu: use defined symbol for
 sc8280xp's maxwidth
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
the value.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 39894cbf456d..d30b797e90e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,7 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = 2560,
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
-- 
2.39.2

