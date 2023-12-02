Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E95801ED7
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 22:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757B310E14B;
	Sat,  2 Dec 2023 21:42:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1745010E0DA
 for <freedreno@lists.freedesktop.org>; Sat,  2 Dec 2023 21:40:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50be58a751cso940530e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 13:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553218; x=1702158018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiCAbk6dndh08EfRyE7PVjUQK6TGLTbC0HzTfoaWIqo=;
 b=DZhBtMuK09q367Wy1+rS79Ys+Qva/62otj9ksd+vCkFlYv0xn4y3hjHpraM52OsKhs
 /zHDv5WSxStgKk9rfer28N6TEP/+ff3UI2dTuhWtvE4g8mqX5FyZgDi85YI+1cEs33Hs
 poh7BkbhkJ3z2Qi3DJ6tSs3HEKfjpeS9DBhv3O5A7qNKQTSp5ew+WNZcFqfFt+AwKCqV
 wnaxw3XGBZok61QUdXdcwuxCGUwhgO3HgqiWtn3k5juniAyP4yBTNn5ucjZxUY14YVBi
 UJnGiRSkKcfwrL90uFkX874Kgryskg4/Q9Ja3g7XoNDnRWguNUamB1eqFmE4pLa96xpa
 flnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553218; x=1702158018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PiCAbk6dndh08EfRyE7PVjUQK6TGLTbC0HzTfoaWIqo=;
 b=GKX98Wubu2y8H6npZK9Nes7Iizjqa6uIX2LZGe8GXPQuwjaVP8apLsehFvHZNzjsq+
 98i7N1zm18KJyvRfLzF331WNDJ/43qpovkpqmqv9kPBg/CpYZMtQyoYEwNzGS3LB4vcN
 fNkBtDjjwoVqV2/ctl74fXRg6s0GToIPSs2CANTUJu4WVMcKK2vwwXioQ0iJCSo4TAAl
 lmjKt35FHhPlUQW8hPhlolf+NPTOSNqiYZKvnz0Wx6lInFmRJAhydgZyFH2VYyXn63Oz
 jYRTTEcc+O8l4SCP2Gr826bkfYlT1p6mWJeyfGmuYJ+VUQfoFDWaZge1zEtpZWZqicE6
 SMuQ==
X-Gm-Message-State: AOJu0YytNFPKhkLyrd+kL2aaxus4KYhq45GY/beXH8Y9qbjBrzjWmkZr
 ZxXPTle/67qMXKWI+GYuYMJVfA==
X-Google-Smtp-Source: AGHT+IGiPaedwuCuq0vO0ehGgLaLBwZlPgKeQUpXZ/lDG/74lbGNQyNaWWopxYhcYDnxQmH1AciGFg==
X-Received: by 2002:a05:6512:480a:b0:50b:eb83:3506 with SMTP id
 eo10-20020a056512480a00b0050beb833506mr316574lfb.93.1701553218163; 
 Sat, 02 Dec 2023 13:40:18 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:40:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 00:40:05 +0300
Message-Id: <20231202214016.1257621-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 01/12] drm/msm: fix BPC1 -> BPC4
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

Fix enum mdp_bpc::BPC1 value to be BPC4 instead (as shown in the DPU
driver). This commit should be replaced with the registers sync with
Mesa instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_common.xml.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_common.xml.h b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
index 4dd8d7db2862..5220688727e4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_common.xml.h
+++ b/drivers/gpu/drm/msm/disp/mdp_common.xml.h
@@ -94,7 +94,7 @@ enum mdp_component_type {
 };
 
 enum mdp_bpc {
-	BPC1 = 0,
+	BPC4 = 0,
 	BPC5 = 1,
 	BPC6 = 2,
 	BPC8 = 3,
-- 
2.39.2

