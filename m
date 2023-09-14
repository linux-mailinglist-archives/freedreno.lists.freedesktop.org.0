Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7AA79F9D9
	for <lists+freedreno@lfdr.de>; Thu, 14 Sep 2023 07:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227B410E4F9;
	Thu, 14 Sep 2023 05:07:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0500210E502
 for <freedreno@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:17 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bcbfb3705dso7887791fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668035; x=1695272835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vs/sONTuFxT7d70u1Gf/NsyWFVFvMq5cvgFjVG2LwcQ=;
 b=yVlkhchEjBq3cUbhKHPdcPh6sxoYe5xlsBDnh4+bUsGBQFvxxYuxs190zF7XWMN5kz
 oN9W6J3J9ioMm/3WPOyIP7ERbKzmP4oKB/iUqWswDEc50UPeqj8i/vhV5kyLicAe0JBl
 GZTKiZOovBPxOXoeXV8c7bhcCBT0GX30t6VzzQz2ENfS9zWRAnOsUNgofl8+XT8y0RfJ
 CTOBjrg8jY49gb65qw4GDZer5SeVLGKLif345fpF6K/xootiW5Q3opWkxUQmh83V12uf
 9/T7g6PEasmqAIm76K/LXGs8aVkSGeukMnUyaNslFxHX5QBtxIyvKhF0aLWQ2jj/Vav9
 BujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668035; x=1695272835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vs/sONTuFxT7d70u1Gf/NsyWFVFvMq5cvgFjVG2LwcQ=;
 b=p+tmlrhhlGIj01QjkTs9d5zRcM9I9KUsdG6UtAlnjToFrwGLviQmjX9AO6UxL5G6w8
 ++K5kXe9m6RmrANg50w/5PyeanGtVcF/mET+nKW1UsunI4I45yeOvc4qB6/rBfAsKX3u
 uJW9mDabg9Jrs/YW3JocYnfdP1QnNPjF0QHF6n/yZvr+/35+lEov0FT+rlSYoLIg2IGm
 QClhfeEwVYdE71L9pNzTUerREiPcRld9TzaV0cLBN9ddJv9E9ZWY9A8zC6eUxSI51P5E
 M+7P+Mxi/ZBkDsSa4ffeKjOm6yvsAsG+9QkU+JXxB2Oa/xmtZmB4VQNR43VxHwXn221X
 a2gg==
X-Gm-Message-State: AOJu0Yym093AWEsuL/k3tiVPB6me2kNAVw8jjQnxgaN+nwUc4H7FIXQ2
 3lDRlL1YXmVOrFFWstj4ts/qgg==
X-Google-Smtp-Source: AGHT+IH6O2piTZHZwFIo2Fwlnt1svDph1VIWIMOW7X+81g9pVSFKKiUOqkbXGM1zyqhxiI+oTigCGQ==
X-Received: by 2002:a2e:3602:0:b0:2b6:e283:32cb with SMTP id
 d2-20020a2e3602000000b002b6e28332cbmr3871107lja.23.1694668035351; 
 Wed, 13 Sep 2023 22:07:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 14 Sep 2023 08:07:04 +0300
Message-Id: <20230914050706.1058620-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 10/12] drm/msm/dpu: create additional virtual
 planes
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

Since we have enabled sharing of SSPP blocks between two planes, it is
now possible to use twice as much planes as there are hardware SSPP
blocks. Create additional overlay planes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5106abe366a3..a6cd1346b298 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -792,6 +792,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			primary_planes[primary_planes_idx++] = plane;
 	}
 
+	if (dpu_use_virtual_planes) {
+		for (i = 0; i < catalog->sspp_count; i++) {
+			plane = dpu_plane_init_virtual(dev, DRM_PLANE_TYPE_OVERLAY,
+						       (1UL << max_crtc_count) - 1);
+			if (IS_ERR(plane)) {
+				DPU_ERROR("dpu_plane_init failed\n");
+				ret = PTR_ERR(plane);
+				return ret;
+			}
+		}
+	}
+
 	max_crtc_count = min(max_crtc_count, primary_planes_idx);
 
 	/* Create one CRTC per encoder */
-- 
2.39.2

