Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B560180200E
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 01:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6128810E24E;
	Sun,  3 Dec 2023 00:32:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66C810E24A
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 00:32:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bf32c0140so43055e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 16:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701563525; x=1702168325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H1sh+e6WV9mxF+sYcaPaBBaaZreS9crd7exAJRUxSZY=;
 b=zBnjbnXkEf0oQbgWzKEge0QMb0c70t+khmuRP5rI+opA5Ht5Cb0zyoH6BZ/VSHKAF8
 /CWTwSjKaq9FtWibW+k1FI3XidXBZ4tkIh0K4XZZpoyn46F7V/HABN8wM+wWktKa06Je
 6XjHe5j8BoC2bk5E2I+9c9KXP9bKRcp0AgnRnLVlPJ1/WlM7S8WYvCZfNHg3dlLLm3v7
 lIUtkoKqehx64AtF0FFJfhN7lCqOXYvHoT8IoHtZi9PJcB2uhdAV3/yyKXb+TrRO8ne5
 mI8E53godvwr/OTK1FrB7sIZaBH0aXb9KDUmWRupb2AxtpewZRvzr4ESGo3/FpWw1VSB
 Hq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701563525; x=1702168325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H1sh+e6WV9mxF+sYcaPaBBaaZreS9crd7exAJRUxSZY=;
 b=qio5YcFwQ/Y2xEapZ4/lK2TGgOTTmJKmpCcyUBwy/ik6ddhkMDDv/CFfuwd1mLIBkl
 5Qs0A50KURGQm7CJvEdGvAutShCSTBVprEW0JklRhZ54c6e1ZG58pATpLmuL1y7ck7XS
 KBE14KHF7qAKsnQtkNEwaSY2zveNzKROQGr8ieuNFStLwSUmKkKY9jAbDvOg+DCkMXKi
 3L9PBV5piuWxIJicicr9XGiU8zQgxGpHuuTV/f33TzjquzAk/5PXRRIwOejaGaQLDcYO
 jZCC2wb7qJdmWzargjEk1R9ebaKeUiwCl7tZ76Pw4q5ed257CTeLPOF7kvKgf0wD1P0N
 kPcg==
X-Gm-Message-State: AOJu0Yzioqry3tUJU+VggpC7pUp6Oxf14Wi3Dnku2fzWVi27+1Ab1vnl
 92RDmUCMmfBo1i0Fvbz4UI664g==
X-Google-Smtp-Source: AGHT+IExV7d8TC5LUgJOCMr0Y0PtwxL8cWlbUdf980HQHway8QjDisIeQIpeJucyZJBGGAgpBBjIGQ==
X-Received: by 2002:a05:6512:3e09:b0:50b:d764:64d1 with SMTP id
 i9-20020a0565123e0900b0050bd76464d1mr2401906lfv.134.1701563524761; 
 Sat, 02 Dec 2023 16:32:04 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i7-20020ac25b47000000b0050ba4a26fccsm422408lfp.117.2023.12.02.16.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:32:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  3 Dec 2023 03:31:59 +0300
Message-Id: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the
 other platforms
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

I was not able to test it on my own, this is a call for testing for the
owners of these platforms. The git version of modetest now fully
supports writeback.

Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
connector, cat /sys/kernel/debug/dri/0/state to determine
spare CRTC and plane, then run something like:

modetest -M msm -a -s 36@85:1024x768 -o test.d -P 79@85:1024x768

where 36 is the Writeback connector id, 85 is CRTC and 79 is the plane.

Then press Enter and check the test.d file for the raw image dump.

Changes since v1:
- Fixed the DPU_CLK_CTRL_WB2 definition

Dmitry Baryshkov (4):
  drm/msm/dpu: enable writeback on SM8150
  drm/msm/dpu: enable writeback on SC8108X
  drm/msm/dpu: enable writeback on SM6125
  drm/msm/dpu: enable writeback on SM6350

 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 4 files changed, 72 insertions(+)

-- 
2.39.2

