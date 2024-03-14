Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB4E87B5A0
	for <lists+freedreno@lfdr.de>; Thu, 14 Mar 2024 01:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EA710E6B8;
	Thu, 14 Mar 2024 00:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ekHZCNKO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C892910E9A2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:29 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-513c847c24dso616723e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374548; x=1710979348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GfLHKk51yokbHFsUy9rW9NS1Ye+I79+zYu8xgq0djI=;
 b=ekHZCNKOjLuE84GnScgWi0z5Byakvlwoav4ix9pnXvPy54vj3imDEicOU6iLq10bk6
 SA0h/0M8CMyHAt/4UCSsDwIfiYlcsaI0kZ4NXozktLMRox1yoTunCaWdkyWQvZwHYy5B
 rxOwkkFCLXZ8SEZ767aCdUYyYdP8woVBgJuErlcXNvivu2VpQhfhKgY+ZOASMbT7koSM
 3AGQdWDcKEG3zRA+2DfqbgM/Vm87frxNSlZGzRnpvfkvWpCzAr6iNbGOmNiZn7vK4cOd
 lRdOR8oEKDCQESNAmLajPWNd6piAPlB23pzN+NtBrWfB9iutCD5nmGr1A5hwuQp9v4yL
 hWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374548; x=1710979348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2GfLHKk51yokbHFsUy9rW9NS1Ye+I79+zYu8xgq0djI=;
 b=U+FfEYA5T+CIh37wEC0PC8866PWmnW+vDZE4ZoVS+RtmcLhlbl5KGTegRhboQ6z6z5
 qqAVJro6JDF0KaKmDyTfPVMqF/qvhv4ESuGOIulxAT7D/ynvKFQjTA0tuAC9hrNQDHg/
 mtqa6fKuuujmfnIiSF6ibLDmqsx3u1mqE0PcML0rhNVvWBw+iK0bPXFdIWEZuFIsRr4D
 0nznNgR6yqPR538IrthlI3pWlE6YkDOH/fumSx5N9aurOKks/j5iXmnL2Y13KNT/oeEs
 e+cntqQNKc374OBO36laVHbXCtScRTTh3Zr+q9f5mQUyyrrmracYRlhces+tj2jKA5KR
 XJPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdOjE870OnvwA3scfIV6l9OPPA/qDA+SQoEVdxkqzfc+xMSYN2O5QzMpkrq3eUArGEbjT0pNJlBZVYUOlxC6Qs6jSwpdslP35xOWrmuA0w
X-Gm-Message-State: AOJu0Yyc60P82D/OYmJPp/wLdH38sFDHaPAsZY/hCfZNT6bnm/YLrXOc
 4nAekIMUaEsSVVhfS/lOlgQPO5q/qYD8Fc8339UEBW6ZiND5IbtuvtMX0crLRm0=
X-Google-Smtp-Source: AGHT+IG9l6RhjTY3xnURjv28dBhN0Wrft+Gt8dYaSXwfs+xcisrHiNLdYNeZ8YPsIqGLHokWYXweCQ==
X-Received: by 2002:a19:ad02:0:b0:513:1385:c943 with SMTP id
 t2-20020a19ad02000000b005131385c943mr41947lfc.40.1710374547993; 
 Wed, 13 Mar 2024 17:02:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 11/13] drm/msm/dpu: create additional virtual planes
Date: Thu, 14 Mar 2024 02:02:14 +0200
Message-Id: <20240314000216.392549-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Since we have enabled sharing of SSPP blocks between two planes, it is
now possible to use twice as much planes as there are hardware SSPP
blocks. Create additional overlay planes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index becdd98f3c40..feb4d3bae0cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -790,6 +790,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
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

