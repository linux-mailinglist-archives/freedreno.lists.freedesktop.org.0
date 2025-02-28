Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9860A49015
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 05:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B129E10EBEE;
	Fri, 28 Feb 2025 04:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dZLxY13O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F6A10EBF8
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 04:14:31 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54527a7270eso1639585e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 20:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740716070; x=1741320870; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k3kLn8+jQchoUvHapCVtAnDT2HhczV+P/3nKNxhd/mI=;
 b=dZLxY13O/hZRYzE6UMONL1yRaqf5CLmGbInOj4Y6R2w7luIHqDJJxlOKILzBP0Me/s
 VHUwhRpBpxid2DGN4OHewqyxxmQD5bQwxrH065XtMiV5qsaN20Zf1IdpUMXt7rdEDjvE
 d2UW/F1NiSwWXR/EKKOciRgoJoV/rlDNsEjXm+P1frzeUDz/f3mmbua/C28kK7GL+NSZ
 SsHx5K1jP7LXutR0hMud1wg50CPlnMP+MA5gY8sSOLVDRgNGmNfUVbKDhRJSw9VWDer6
 OtzoD3VwGrsiPfJXhcxI/hsbXOng0WFcD5TnWbSOJkQV4Pbz/gfslFjRBUY6GMS/7OCk
 wrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716070; x=1741320870;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3kLn8+jQchoUvHapCVtAnDT2HhczV+P/3nKNxhd/mI=;
 b=cd9Syx6jXye8XJMz+UZq3OSNZbyCqtnQkj9tGsSN4zDQdqhCoMMyBkXVBui013fHjB
 w60tkaCt89cip0vsllqsrSRRzDjZeH3VevhWLacSu+/McoLRoRaqJjtv5QHEVDPVR8mr
 ra2DhEY4hJEOdb+iU8dIb79Wb/dMMsBpfupkENQHWZAd34xEfUZBC54XN1SZ3j7Ldszi
 ML5rFrP4lYFPI1QwVTPsDY9LQnxc7OSXEddwWOyc9Kzo/6PKWS6PF8Y4JrxxNBdGdMO6
 dQ56sZO5LoBwmZNX7Hu5/Bu7pqwOLspC6/Q4/obBL5gl99VfvJ8MNeAC1YUKUUfEv+Ke
 G6SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURnWblXXHxD3wutC/lF9YlCWA2v7A5nzvXNsNm98F2cTRnwVpXHnEdZ+uHi/2cNGXe337HCI4cA50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwRR32EVeo0SbZ1py5OylkPfEH2lOKgNlYU6QRXX+VRRqM/JtR
 WxLq0QiHuE19wGIrzAZah/QqsOY+vM1Cq1/t7bTStxXiV395f2TXf64JsrpGNKs=
X-Gm-Gg: ASbGncubcyihOUD/LDjbAzAMMTT6aEw5AGa831gbgKJUMiUoq81NS1xa5LrEAQq+qQf
 hkt9n+vT8qZMy5GG0dqklD5RlSYFpk9rJ5kxEVj0wGMyd3u4HlRcllOnX38anVn0AP13P17as8f
 QxakjiKoW+15dV2A1pHaD5ewDOoSXnETjiDugO9FqhEmqamOtVJ2He3uSFQRMvWXFSL6yX7GnMF
 2TMjBCZDdLLZxytXcFreQFgcPC6UA/I4dTOI392ghLSm+E01L2t7R9WJuEzu5S8L+uXUgIKYZlT
 d9yQjuDJShnppjAIOflrRI4No3Ny13IC4g==
X-Google-Smtp-Source: AGHT+IFDSc3I2mqP5qdXMpIRdHJvwKMmhG7fxY3oSiaLL4XJ56Lr0lDFiJk8seHX0EAq0LMWQw0Tdw==
X-Received: by 2002:a05:6512:693:b0:546:2a27:ec35 with SMTP id
 2adb3069b0e04-5494c37d6dcmr634988e87.37.1740716069990; 
 Thu, 27 Feb 2025 20:14:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:14:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:12 +0200
Subject: [PATCH v2 8/8] drm/msm/dpu: drop now-unused condition for
 has_legacy_ctls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-8-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gbAmmg7YrMzJ9XNxwCPOatERTxM1Dbe3+ajpkL6KPO8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgPgCbq+XDOYj4H5rvYaOVt6Lx/s7AaC8vhi
 DkF7csW16yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DwAKCRCLPIo+Aiko
 1arGB/9gEroWlk0T+tDjWT0IrtdxlhHsIIkLIlfrjs+HlEfUh1WEodAZTwZ9DWE07tG3DNCmZpn
 c3YEYkngaozD/ybdEE51nsh1lEdop/cJhejr/tusiBpBB3fvZ0M1nfUxsKfVut+XDfA+VaIqbQm
 sGNHgulMZGb1AX+2QY8LAxfVbV4MXZLt4GSmh5ZJhFqPxRHP3LqNh/yAoGYdYQoi6P4981GJwh6
 ZZG3Vq65duMphoVG53KKXxs87SPOdjM68WYAVpfclLHF4DyCHtBoPlUPxPKMpDurxwKVphZSete
 e7/Ks+NJ6bjmi2liXy02qC0fUERYj/Dr8KMxiyyrWS4tvvUe
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Now as we have dropped the DPU_CTL_SPLIT_DISPLAY from DPU >= 5.0
configuration, drop the rm->has_legacy_ctl condition which short-cutted
the check for those platforms.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Note, it is imposible to reoder commits in any other sensible way. The
DPU_CTL_SPLIT_DISPLAY can not be dropped before the patch that enables
single-CTL support.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 4dbc9bc7eb4f151f83055220665ee5fd238ae7ba..2557effe639b5360bc948a49b0cccdb59ee35dab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -410,8 +410,7 @@ static int _dpu_rm_reserve_ctls(
 
 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
 
-		if (rm->has_legacy_ctls &&
-		    needs_split_display != has_split_display)
+		if (needs_split_display != has_split_display)
 			continue;
 
 		ctl_idx[i] = j;

-- 
2.39.5

