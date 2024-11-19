Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4B9D2D30
	for <lists+freedreno@lfdr.de>; Tue, 19 Nov 2024 18:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2934F10E69E;
	Tue, 19 Nov 2024 17:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BYtq0s9L";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1737F10E69E
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 17:56:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so41470005e9.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 09:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732039015; x=1732643815; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hjXGo5viMHe7/zGLjLLL+XFyV/IDG+n2c4d5eIBcvfQ=;
 b=BYtq0s9LxU9K1zumFOEy/uAbntVp0Nm6UX1Pf3WMpQ/+Pt9W+yhMDFk5FKZCni3n9t
 b5gPza3UvPot9vkUwVQHYlIVKPx1ViL4iSI4Xwd3LOaeq5ECEX2sbCo1YIwBY74qlUpI
 LOomDQQp5dGbzfQQnjcQ8hMUGlFkv7UIp+z9uLn9/t8cEq4j2N1/KvokUQ5MToE8h7QO
 f2heryfQ4SNIoXKA2ErbRFJUxBzUqac8y1eI9Y7JYTUQLIgancxhZzvXRTMh8LUUj+Jq
 F9Vwij+EJwQq92jGlLHB73wGs44Wu4SPy88r8NmA93OHs4yyZQtGizIByw+YM8qxm8mi
 5/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732039015; x=1732643815;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjXGo5viMHe7/zGLjLLL+XFyV/IDG+n2c4d5eIBcvfQ=;
 b=gMUsBeun+8uliDNyfaR1PlzHP+NUgDUrcR6UL5IKQTcvVYT4qivSPplYCCdMf80pl0
 y0yXoP715JyXtsbPUTADcUZRGp0LnA6PJa68CYrqOyR1tmDA156B0tCNkKPHa6XMiQyt
 YjHS9NOvFpUJm4SVlCxQNATZr5Orb7mRh1wv2TDESKHGEBpLRcO8qSWFrukgKyw1LZ4I
 gMXI2x2XWlyoEuaATkNf9W6lJAy1d/vB8Q1XCx8mJbsb4SSYWhsp86XZyqUXsxoteDsP
 6ZnBsM99zLDaaDTSH5tHWr1pD6bZ1a7hvte5Pax2k21oV9da1EvtF4R5tIeHRbzKQGQD
 oMog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXemm0/gr2yl196r61eJdt7+6aO8YjqR54HBnxnkf+NEBsyOSgTKqMCIzausoRQzf0P5Y9aHDLLdOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGDJTlBG0P/77QmSUDliZU9v/ul5VOLwdn/ez2z067pDRY/ayT
 9Sa/yZJ8yj3MFR0rEm6lMuVpE9sobvUvavdasNhQtJCyM8szhgP0A9xTKT8YJTE=
X-Google-Smtp-Source: AGHT+IETH0Hm2buMkvy/Ll4++F3Vi1yZx/qAIhcIkteGjWjEm1IVZlr1JHBK3iJywT3czzSrxctNNg==
X-Received: by 2002:a05:600c:3491:b0:431:58bc:ad5e with SMTP id
 5b1f17b1804b1-432df7901femr123471485e9.28.1732039015397; 
 Tue, 19 Nov 2024 09:56:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 09:56:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:43 +0100
Subject: [PATCH v2 08/11] drm/msm: adreno: request for maximum bus
 bandwidth usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-8-4deb87be2498@linaro.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oXkj1C6Jx8yUMHy3C9MjrWlRZXnbo4AjWBLbi4B14uI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFaHpmsc8d0QhqhvhKQzuhIHbOW/nweLHVI4J4K
 yOvheo2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRWgAKCRB33NvayMhJ0a6wD/
 wMgXLGer+Gwmpc2QXN/wUIVfxGxIJekwSowXEGKXdUnynbp8xruE7XqMXPRugx8J70wKaRkPVIDBAq
 YlvzhmgygfqOd99bB4cxv/m+LhYaB/sqeIpGxXxIFg9JUTmOww07+g5wSg8uS6g4x/6m/AE1QW6inw
 6Vi/BiDDegOqKGTC04oXy/3wuJGJkjx/hLAsfoQnmKO6rNLc7nlepQN+a86EgENOC9uP5dWo51XxiH
 Qcw0D+UEhPz7Sywxlxx7/x7hYR42vAQ9XIZE6df2tJtl+qSn5RqVSdnuk+VpVOZeN5GLzycCdaAQZZ
 +BpzDDGet1cB9RPKolF1+3rtxHRPKGaf44xlgrXdngpLlCDX3feji1t2DqUyVLy26qj+wBGcF3yC62
 5zcZUam9IXez+ZA6dmDUpWQ8bDHDUN8pH/tnJQ5NxqC5H2AUPhl6X7UgH1GVhn4wBI6oACdLFbfRLS
 cMR6fJTddxi7KPzvhhZo+GYeEA1oP/PnjjCSPMzGW/h+tSi/RVAGm5s/NBp+sO//57MwUqIIcmMYhO
 74L35njgwh0bb2h+YhE8Sbonu83uTFPWOvTov/B+Qp8FRQOiZkHZnmAgPO6L5jvzvJUZhLOTrl/Tda
 bmMyLXaUOA/pQYp//Bky30nqQHwALOEFRZJO8MR5XVxt+ciFfsVHs8vCb7uQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

When requesting a DDR bandwidth level along a GPU frequency
level via the GMU, we can also specify the bus bandwidth usage in a 16bit
quantitized value.

For now simply request the maximum bus usage.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index dc2d0035544e7848e5c4ea27f1ea9a191f9c4991..36c0f67fd8e109aabf09a0804bacbed3593c39d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -134,6 +134,17 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			if (bw == gmu->gpu_bw_table[bw_index])
 				break;
 		}
+
+		if (bw_index) {
+			/*
+			 * Append AB vote to the maximum bus usage.
+			 * AB represents a quantitized 16bit value of the
+			 * max ddr bandwidth we could use, let's simply
+			 * request the maximum for now.
+			 */
+			bw_index |= AB_VOTE(MAX_AB_VOTE);
+			bw_index |= AB_VOTE_ENABLE;
+		}
 	}
 
 	gmu->current_perf_index = perf_index;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 528110169398f69f16443a29a1594d19c36fb595..52ba4a07d7b9a709289acd244a751ace9bdaab5d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -173,6 +173,11 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
 	u32 bw;
 };
 
+#define AB_VOTE_MASK		GENMASK(31, 16)
+#define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)
+#define AB_VOTE(vote)		FIELD_PREP(AB_VOTE_MASK, (vote))
+#define AB_VOTE_ENABLE		BIT(8)
+
 #define HFI_H2F_MSG_PREPARE_SLUMBER 33
 
 struct a6xx_hfi_prep_slumber_cmd {

-- 
2.34.1

