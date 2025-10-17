Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42793BEB6DE
	for <lists+freedreno@lfdr.de>; Fri, 17 Oct 2025 22:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E033B10E19E;
	Fri, 17 Oct 2025 20:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bMQufVhJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE22210E19E
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 20:01:11 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3737d0920e6so25027811fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 17 Oct 2025 13:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760731270; x=1761336070; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZvamalkucLTXF0UtA58TBlyJrhax3HxRIT0v5R1YbAI=;
 b=bMQufVhJqjrJo/aa4ln43JNL08mIsRAGCcNe/0FLVlaCiCYmzyuMzXeEHjC9Rk4rld
 rYXqlNWFRNfNB1cqLo8zR1Vp53qEIPWXeSCtfCx9ceCtuf3JTGsfD4B4v4BWBf6w37MS
 q+tXlwPPG0c6Sy+mxh3bNo0oYtT/zPNrui+EkmmTP0N3f0DPcAE3vXWjT4uTN779J+eK
 qGfpGrBcimPyWFqad/+YPwa8j8DOmdh08z905UcUfyTie413oiyF8hMo5NoVtok17lwh
 uxTm7KevkqYiDhOYFv3+9VC/pgHKlrI6mpM5trsHsutli76uOe79PccwyFMpe6sZLd8H
 Qa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760731270; x=1761336070;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZvamalkucLTXF0UtA58TBlyJrhax3HxRIT0v5R1YbAI=;
 b=HETZLB0PmWPo9xeDvQwgrnKlm6+n9bvRQ3xqOSI8wlZuOC9MYfrwC/3r3M1kjk7p3c
 sXyj08tPN394G6DFg+Ch7IlI7dVdDFvwF1NZ4T/Xa3hkXT12Pzd0N4TTH9+DAEI1jG9g
 ST8FBdgXr4v/Fw29w47yCGE9+TeY2tnXvNHc2J5kl8yhjJ6aVluVhjefPZkY2JJ2fiRQ
 ZEHPpe85IeFhIjTfYjZOjcu39aKSLEcl3gdqBkrCq6+osc+z7vRhhRxn3uCFMo/e9TiL
 1yf5+6xxBb0ZzNhE1LN4jVUXmV4wCPGrH3fB6iHs0i27ZZhbUWawhQr5SMB9hAvr9IcU
 Ql8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwHk930i5QKk35LK4joLh55Dd7riSQfkfS6T6/gMcVJh1aK5LKjTPJ26K+4z5/qEHxyYwSCLgAYss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRIfIR+jyda0CtToOv5o/6pSUbXUVw5dzfEAIUQaFYUv9lkEI/
 RjsqwlhKHMXBrPNNL4BiupyGlgXwOqqXACmpy/aB5rdqT7g37ktAXArI
X-Gm-Gg: ASbGncvVoMfI8tiQeEGEKMLRu2caZNAV1jnI4sNW3FQfTc4A98WFXmgqx/iHU5XSH4D
 r6wCPXarzn1XWCLo5S4DD+muN+/2e3IMK05sof5I+kukPhX57OxC+fcj0zsS88Hkxbav2k6+bP3
 VXPMxm8tl/9o0A0Gy0d9Kbg/sWvXYbCf9w+KTtgEcabCwawhtv3UN1UFIZGV4JMvJI21QNlDEvJ
 1YSIhXRXY+I+TWtxa87ovTRyLuzkRiUW821ot6G4Sr3vr1fCodMLzuMrWgTCNA2WPXSEHSqL/7R
 PldDOjJsmVXQCwZyqV4P6iEYhRzWDgmatEvS8UBMrGpL9U9fRe8aAdzOvK4dxR0CAcTp91gUwRY
 4uqUwNE/KCGFl2dinVQnk4NSdD5fYamLuRgtDiClMrmPc2xl0A7qDjTu7/DAWfJjF0BaxYyjiOP
 Tgt4HaAGMe3tQsUBavcrqeXUSc/YLs4Mp/2NnDuYvThIWYrgLXk976JHqhO770ag==
X-Google-Smtp-Source: AGHT+IGGkPzUg9+WLDnfzSVIMAOLQOKXgwa2ttL1tbW7RtbDwguoGHJ6HNdyipMTINLcvQ/30wWafQ==
X-Received: by 2002:a2e:a583:0:b0:35f:246:a751 with SMTP id
 38308e7fff4ca-3779781d39emr17282741fa.5.1760731270001; 
 Fri, 17 Oct 2025 13:01:10 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.13.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 13:01:09 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Fri, 17 Oct 2025 19:58:39 +0000
Subject: [PATCH 5/6] drm/msm/dpu: Require linear modifier for writeback
 framebuffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-b4-dpu-fixes-v1-5-40ce5993eeb6@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
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

UBWC-related register configuration for writeback is not implemented in
the driver yet but there aren't any checks for non-linear modifiers in
atomic_check. Thus when compressed framebuffer is attached to writeback
connector it will be filled with linear image data. This patch forbids
non-linear modifiers for writeback framebuffers until UBWC support for
writeback is properly implemented.

Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index cd73468e369a93c50303db2a7d4499bcb17be5d1..7545c0293efbd8f7eb34a4ac56f616b7cadae1c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -72,6 +72,9 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 		DPU_ERROR("invalid fb w=%d, maxlinewidth=%u\n",
 			  fb->width, dpu_wb_conn->maxlinewidth);
 		return -EINVAL;
+	} else if (fb->modifier != DRM_FORMAT_MOD_LINEAR) {
+		DPU_ERROR("unsupported fb modifier:%#llx\n", fb->modifier);
+		return -EINVAL;
 	}
 
 	return drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);

-- 
2.51.0

