Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05D79F9DE
	for <lists+freedreno@lfdr.de>; Thu, 14 Sep 2023 07:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFF010E507;
	Thu, 14 Sep 2023 05:07:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B8C10E505
 for <freedreno@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:18 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bfbd7d49e7so8006411fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668037; x=1695272837; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+ElypKjl4wELftF/izO87eGZQ97psAyEtB73ZqIcSw=;
 b=iK6yChlETdb+65rqwjAcQ9h565ItKidE/j4bZtOJwSabHAkYBhUVE96AUeOlnW5APJ
 7N6MCCNMUTa+RtuuSvEYeFYcDUAf0npz/6F2ExkvrGhq6lFuSfkccS9VkYYLPv+bD1Jy
 VndYY8xNYsFzyZsxciVR4+i+sNE6q9Cl8BzEwBRGWRzmVQK2ianlG0wHjmpxgUev+ZHG
 J0BdwN/10mlGqcl0loR9a8waGKLAqfjOYQijqVTAEqbWTyUPCvYZgpiTU228N34GabUu
 yyV6OIvVzUQq7/BEf/am+dwDW53cAWXSR9T0rZoyrGpgwbmu8gooNfK/oC6OWVb3fTx8
 wR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668037; x=1695272837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+ElypKjl4wELftF/izO87eGZQ97psAyEtB73ZqIcSw=;
 b=QxQnLgGZblEEwDSii5xL3i779VsewfM8qhQFO5s2AOO+XUlUxBdwbiCr0Icn+IwVCn
 KMnpOEHDAT8xsybrQawJaKCLXIiQdpBcmsjQahIY4+FttKgN9hixbJXRSQFOL8z9avuK
 ILMyiCy59uF9IjFX7TRIh1xbYfgK6ZI2pwwo2mfUAWTc5bNY9gvujU3Mc5Akstl6G/95
 3xBVZv9KJY9cFcifOCuoQnPg4R+0WmS8OYFAwTQTDrnzST7C6XZEoAmgSTR/Vx5PQNGd
 zByJI/osUewDhNCopUoPbafMObNRg/ZshoDDsFEKtfZQDV6754V4XPcsLI6OeFXz3xJ+
 A90Q==
X-Gm-Message-State: AOJu0YyH3MWNPh7nLh6iPdTnk7Qb98pwESmKu1si1nJOE5GZPWP/BG/f
 GcDmthLTcH/XnWKVGflivwzt7Q==
X-Google-Smtp-Source: AGHT+IEDvGPbRT0zik7IRli68fky9NvvKjzdqsnQ+BZwMjAN/mQsiDTBxTpnFEPlqykiPZEsZjgGjg==
X-Received: by 2002:a2e:9dc5:0:b0:2bc:b557:cee9 with SMTP id
 x5-20020a2e9dc5000000b002bcb557cee9mr4196700ljj.43.1694668036891; 
 Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 14 Sep 2023 08:07:06 +0300
Message-Id: <20230914050706.1058620-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 12/12] drm/msm/dpu: include SSPP allocation
 state into the dumped state
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

Make dpu_rm_print_state() also output the SSPP allocation state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 1b0166bc9bee..e7c142bebab1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -773,4 +773,12 @@ void dpu_rm_print_state(struct drm_printer *p,
 		else
 			drm_puts(p, " -,");
 	drm_puts(p, "\n");
+
+	drm_puts(p, "sspp:");
+	for (i = 0; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		if (rm->hw_sspp[i])
+			drm_printf(p, " %d,", global_state->sspp_to_crtc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
 }
-- 
2.39.2

