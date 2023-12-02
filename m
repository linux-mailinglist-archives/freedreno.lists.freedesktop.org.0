Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E31801ECD
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 22:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A3F10E224;
	Sat,  2 Dec 2023 21:42:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142C810E0DE
 for <freedreno@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:21 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50be58a751cso940544e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553219; x=1702158019; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jxwDCoOR7ZNcOAZH2cumKGd3jy5cB2n2pA+0b3i0ZRI=;
 b=ao2WGGacNHisHUhZ99MUUJtoASTdVFy7WUZ1m/aSJ2D/cGU64NaDzpryOz1wLZsU6j
 m3HfUiw3DYWGh5UOxIyA3A/QuP7wvQb7Norh85B0kALDp6pssxjEX+lYldAmdufSeHQx
 OvMS2mGY0MYAKgCrA6Ow3xfE3Eml/hJO2DgZAIImEWSmYcXo+pflwO0BwzUvPOXDVN9k
 HS6axXJL++zA1cWwx8wEbd5dZjiq75e4gAIJnT1By9JCBswaGhlPskcF2ePuOSFgyh+X
 xzYFQnLyuHFf13TrYKITfql+Dnc13JgGiretfxwJ7iiiOouWLvOR8lwQGiJidtEAEZXm
 yzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553219; x=1702158019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jxwDCoOR7ZNcOAZH2cumKGd3jy5cB2n2pA+0b3i0ZRI=;
 b=Y3wWBapBlGbg4OrEL7DgrYO5skJKE0owQLBxHHTxxM5hIWnAZrrXCjLtst+hwWf4e0
 vvhWF6puxzL8Y+vGe00y0sy6R31zDjC4n8SFg1HRQM293Wt7DWPScDQfkSgPsGn4CsS4
 WTuVUFZ5GzvyJn1UnsHEfnGeL0KbzninVW3tMbjQC4dIDnEdvFc6vyiBdZOXjA6QE3XQ
 D4YuaYwjMQjQKqdpO4a3zXURDJiPA8iQD0+vZChWWwpscMBHy8gkrDF+7N8hM2b9DFV3
 nDN2vW9XyXPeguGnBfGqZKXd0BgU/Oq6ngfAeeBwy4u1gAsJDqejIZfb8boUrvq0UE5K
 b+yA==
X-Gm-Message-State: AOJu0YyL7JmsR0ZVtFuWGzptycTffg6EDP7r70YdKvrTBx2/1j4Yrstt
 cyfWS3E3EfDPPbiM5uFCR+dFrg==
X-Google-Smtp-Source: AGHT+IFuywgdglJv3/9MQaAbNBR2CeJFSzfl92kTlEKKfRLv9ergZGA8nr+WaRDOeLPGnoLQJAOQ+A==
X-Received: by 2002:a19:7618:0:b0:50b:c1d4:d41b with SMTP id
 c24-20020a197618000000b0050bc1d4d41bmr1752437lff.20.1701553219094; 
 Sat, 02 Dec 2023 13:40:19 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 00:40:06 +0300
Message-Id: <20231202214016.1257621-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 02/12] drm/msm/disp: add mdp_fetch_mode enum
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

Pull in new enum from the mesa registers. This commit should be replaced
with the registers sync with Mesa instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_common.xml.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp_common.xml.h b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
index 5220688727e4..2fa333bab3d2 100644
--- a/drivers/gpu/drm/msm/disp/mdp_common.xml.h
+++ b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
@@ -107,5 +107,11 @@ enum mdp_bpc_alpha {
 	BPC8A = 3,
 };
 
+enum mdp_fetch_mode {
+	MDP_FETCH_LINEAR = 0,
+	MDP_FETCH_TILE = 1,
+	MDP_FETCH_UBWC = 2,
+};
+
 
 #endif /* MDP_COMMON_XML */
-- 
2.39.2

