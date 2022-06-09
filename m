Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED45544A43
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 13:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B7711B1E6;
	Thu,  9 Jun 2022 11:31:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1AC11B1E7
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 11:31:51 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id s6so37471707lfo.13
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=osPC7nggXKqJCgggBesqx8Y0buQDmZALkohv6+cRgp8=;
 b=rxgaufoYydqleVu0MBrDVaOwUv9VSuk7YDRyq06HxJQJcY/RrJTzQBpBlj+J+CiX+W
 ZjtUS5e21LzJ1xBtgSH+YVwtBTsfH1pQBIBz7nQNBekVYj2tLH63RN2Fn7/QczwGC+OK
 arFI7LP/hK7lZmEKDiEKuAyWz95kXtrQZ3gInOAacjD0XncyN7v5pPTSoZMGZwrf77bq
 ojnKCnMZQaHDHpB1O0Prjyo1ZBAko/CF9Y4ZnCpRYuEKpfZSLOOhEfaUoBOkyl0hfbYH
 /y0EbMsU+WTvOPTeLUkUb/GCaUkM+hogrvOPr0aQ+lQO5LZTKrowtWpzOjhUoQbnJkPE
 q+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=osPC7nggXKqJCgggBesqx8Y0buQDmZALkohv6+cRgp8=;
 b=vzkKjEopTIZG/UQXrIcrff8/P5WuEv8F7Vg7OY7fu05uRWkTq8AQQlrSFnd7TQuLGW
 SidYLUzOg3XKzH9roc+SPwA2VW4ngvWjSqvhLH6LdpNV6RTHbxRyepCEWA592Z7EI9/y
 h+OMF364+ZhWqw8m3InnPWwGCwIQbf1rcHYl6uY/rCyK2DOaf8TrqC07zLmp6UP6sbeu
 5xzzSqe7XdebgOpzZgUcx+WgsDDvWNhorZo9EOLuh5eGeO6Fxr3CSA4J/eUlwcVfYB9/
 LMMR1ZNtMSFpza85byzBtifByt+48DHwkGNQbZElQukzC35cS5JhbPaVYF4VWKIeAXD7
 ppZw==
X-Gm-Message-State: AOAM5324Cqc3UlBKha/nQ3pZgF0zkAwm1UsRwMQRDptn7yTJcwkSSXmN
 DFjto8VDT+4+BcFWbvCi+UYcMw==
X-Google-Smtp-Source: ABdhPJxW6RZmoRdg9h0UIzsoBpR2KmQ5DeD1hic3gg2SxUODs8OxB0D6TTPV4Sd5S7S435+Z44zw3A==
X-Received: by 2002:a05:6512:4004:b0:479:1d77:4e43 with SMTP id
 br4-20020a056512400400b004791d774e43mr18757090lfb.537.1654774309942; 
 Thu, 09 Jun 2022 04:31:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d29-20020a0565123d1d00b00478f2325fbbsm4180147lfv.282.2022.06.09.04.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 04:31:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  9 Jun 2022 14:31:48 +0300
Message-Id: <20220609113148.3149194-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/hdmi: fill the pwr_regs bulk regulators
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Conversion to use bulk regulator API omitted filling the pwr_regs with
proper regulator IDs. This was left unnoticed, since none of my testing
platforms has used the pwr_regs. Fix this by propagating regulator ids
properly.

Fixes: 31b3b1f5e352 ("drm/msm/hdmi: use bulk regulator API")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 992d29f75008..c66e857ef20e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -180,6 +180,9 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 		goto fail;
 	}
 
+	for (i = 0; i < config->pwr_reg_cnt; i++)
+		hdmi->pwr_regs[i].supply = config->pwr_reg_names[i];
+
 	ret = devm_regulator_bulk_get(&pdev->dev, config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to get pwr regulator: %d\n", ret);
-- 
2.35.1

