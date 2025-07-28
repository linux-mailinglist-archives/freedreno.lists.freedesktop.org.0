Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2981EB13B20
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 15:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F398410E501;
	Mon, 28 Jul 2025 13:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HZGDm25d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE2D10E50B
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:15:04 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-74b50c71b0aso2523323b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708503; x=1754313303; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=HZGDm25dLP9kMNs3Zka5tJKKfu23o6ulUs0Tfk+v1lZKsa1DbzmEHuDWwj+N9P5v0j
 8lAtazxvTLBpa+STyAPvFZGtgiF3Qfehbo9Zsm977P7q1k3fao26ggfaIL7865c0GNgG
 MDTkxU6XDanRxBBsCjQPWdr7LMZQaU9A3PSFIL0UiSTsbdEEb+NmD9DNMFB4xEM7B89O
 wuprQfzAYOnW0Q8OeUax4IybtX8qmNGnqxuQ3sAuOlizW9KaVLIrUgo+reH7tqOqrZ3W
 3LCZR6CwEBe4S4EpQhQqr+jfMlcb8Fv06nIEp/SVs4ZOmeLVpjpOnhbIbmi33f2hBXXM
 DoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708503; x=1754313303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=QtAfLerd270LlHE1tnDF1ZkYnD3onHHc7CBmzoB9Ng6Gb7WXTQ+smWUGm5YpKy3807
 QC9Gr6oGnNlxB1ddsG2QVVgzRLGTatEWROCIPfKXmpfUQUD034Q3bdnyJX9obu7Ssvjr
 cBeXhB1BMi6nRE0iGoeIOI/k/H6bJmfE3m/UaTQt1KNx0jOajjgbhLqVaOiJTbxFdzDl
 g7MzYeTSBMyFYmP1pkK5kvCP0saiL2fTe67ZlchuFIkhZ/V4R/3baMosUwGKXEsBTx/I
 dZ0r3rMSoeCm5AWpi67145nmFm8cR+S/j6Mmwoi/BUXwfxST6ci8gnOLqLaJp3QfuHEK
 RcLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUle4cD9XzcfXrT1BfKis6hZI/7+WAiBg0qLyRgTQWsH0mvRdSAKQOC+tsGzjaz8NpQoUUxMvQXqOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxahtC2CgCoxWGbW4x091ZQ740OIcRw2XsPGWGxvxKWKnrLDYNv
 uFMNf7vxap/9ngh7oS0zCIYYB2ptZWgp5r6uq7hvgIQ2W2K6lL1vAso3MwYsZZ//Ej0=
X-Gm-Gg: ASbGncv/jkgqiUoNUJJDIx253jth6pB+wkFfq6iMZ0aGBxP5SzcuqVV3bZo8D62pZ5s
 rLOTkrND+akUwOIBxMBXqz4/1OiaEJHEDCPaWE72G7Fg02T6R2vvD4JGTWkKnwzfCHryf+/hY3l
 E5CoXi52eiwnYl/nWGdTkKGbAgAhKaw/69I5KaZ1vNdo46jNWmw9NlHNubd+IoWXO/lKjPGNPla
 CKoPt2WI9YUDVkFSrVPLQqCTZmA2RSIx+jXxqpFAab3LTMzodyopD/pkOvNg05kXnJBAcfz1lh0
 Khv1S4K+DJ9/bsFUwX0H20Ww3aDQfqGZodsPyH5EyMG8MvaaxREklAHX7EHHdQkeOI6UZwSzrxH
 54dd8r25QeVA/SBC30g==
X-Google-Smtp-Source: AGHT+IFj2E3U/6YpkOvYCA8ArMdplIVsCoa2oY8AWe4ZUCEotDWUm+laRMwrkmmmmbNPtBLZanSIFQ==
X-Received: by 2002:a05:6a20:a121:b0:23d:54cb:2df6 with SMTP id
 adf61e73a8af0-23d70052901mr16496549637.3.1753708503406; 
 Mon, 28 Jul 2025 06:15:03 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:15:03 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:27 +0800
Subject: [PATCH v13 03/12] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-3-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=1mgRp4HOTSbHr7EQxPhuUonHpasr6Cq6GSUykYOQvvzIjqlRzPVAefXzpymPuLtdRZmR0RIlb
 ZTopy74UAxhBMLncqhnjq7wEJ9ZjeYT4uM658ifKa6cUe5E0h6w6SJ6
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..3f344322b7f214d0050986e675b32522f8eb0ba7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -374,7 +374,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1

