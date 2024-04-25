Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649F38B230B
	for <lists+freedreno@lfdr.de>; Thu, 25 Apr 2024 15:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3778811201D;
	Thu, 25 Apr 2024 13:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NhkIndaa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B8411200B
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 13:44:45 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41b3692b508so7341585e9.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 06:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714052684; x=1714657484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qoEMADvMjWj3xeGnJPbLimlzA6/nm9cxyaovRQ7wvgQ=;
 b=NhkIndaansWTPozcEckzH7vb8jxnyzRpgJWbMzu7kW1WtOWTSLaeU25xHLB5kMvPNy
 IaPbl3CU+C4v7CVjoHEwbmfIYunXHKClP++NvsTs6TyHZLdCvJ6ODS/tOEiU9MOZhPR9
 ckJUbsmPySN3vIX3p9BnPoTLOJUWUEEqg0obW3yI9SIKnWlskAYgrCN5xyDLQrWnGpmi
 UQfzELncjCLv+HV0tiLnINGY/RQdeflN9aM8PhFyjRatZlSHh/pXXNh1jx5E8LTfvuX/
 LJh2ALg8XepWKveLtA21Yr6m/AfOluXf4MBJD1uwJsHDajdCW3uvTHnT/AFw17uN0iKj
 R1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714052684; x=1714657484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qoEMADvMjWj3xeGnJPbLimlzA6/nm9cxyaovRQ7wvgQ=;
 b=bsoYUOqA6rlXPEs9ucVoY65xruNsVJ1dXM3RPaY0dxG/uFFXO3OyD22ClVZGe0eOt6
 RQMlNVGLyR1/16YActLOaNjhDFjqCFS1VoXFYyZ5Lu2WQWIH0FBtO5oWwYqUubzpfHPh
 I6fCYJBjBERH/h9/MpDajrOVwDCbZnOfhPhZq68M+qHUpmuKyGSzN+NoBynf8hp44jAw
 EXXIyGoJsZnIDmYhrLvSr363rl07lcoPfR+w3zzdgnPGnC3+MNbBeg2j85sRd+W55lIc
 aoUWQcwmHhBXHCaYX//HG0KTff8pEpbGBT+kmW0R5aZB42SHxhUT5HS8ghvFmGpQ1Jlm
 upQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEYJJ4aA0q0s6Span/YDyxWj+MIX11g29khDyASYdrIQk0/Jnu2a14ADqvZrdjtKJS9iQg3cVOaTDNpPiskgao2M1SUG+qZjseYRL3YRbD
X-Gm-Message-State: AOJu0YyxUypWID4e+wSp/8h73xCDIpqRG3SycSKo6+rYtSQZ2V41GAAd
 X7Dg5oV93TwNsBiQxSQvBwJ1AWwYJt8qMM8mxilgQAoUija5aXhP
X-Google-Smtp-Source: AGHT+IE5SABtnMFpdtnqjwHpqsEeIm2ZZLuDFDsoeynZvy6crf1faYiT9YDQ1min2Ft8ld+JrMFuXg==
X-Received: by 2002:a05:600c:45cf:b0:419:ec38:f34b with SMTP id
 s15-20020a05600c45cf00b00419ec38f34bmr3481391wmo.20.1714052684027; 
 Thu, 25 Apr 2024 06:44:44 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net.
 [86.12.82.21]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 06:44:43 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/6] drm/msm: Support a750 "software fuse" for raytracing
Date: Thu, 25 Apr 2024 14:43:48 +0100
Message-Id: <20240425134354.1233862-1-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
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

On a750, Qualcomm decided to gate support for certain features behind a
"software fuse." This consists of a register in the cx_mem zone, which
is normally only writeable by the TrustZone firmware.  On bootup it is
0, and we must call an SCM method to initialize it. Then we communicate
its value to userspace. This implements all of this, copying the SCM
call from the downstream kernel and kgsl.

So far the only optional feature we use is ray tracing (i.e. the
"ray_intersection" instruction) in a pending Mesa MR [1], so that's what
we expose to userspace. There's one extra patch to write some missing
registers, which depends on the register XML bump but is otherwise
unrelated, I just included it to make things easier on myself.

The drm/msm part of this series depends on [2] to avoid conflicts.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28447
[2] https://lore.kernel.org/all/20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com/T/

Connor Abbott (6):
  arm64: dts: qcom: sm8650: Fix GPU cx_mem size
  firmware: qcom_scm: Add gpu_init_regs call
  drm/msm: Update a6xx registers
  drm/msm/a7xx: Initialize a750 "software fuse"
  drm/msm: Add MSM_PARAM_RAYTRACING uapi
  drm/msm/a7xx: Add missing register writes from downstream

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
 drivers/firmware/qcom/qcom_scm.c              | 14 +++
 drivers/firmware/qcom/qcom_scm.h              |  3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 97 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 +++++-
 include/linux/firmware/qcom/qcom_scm.h        | 23 +++++
 include/uapi/drm/msm_drm.h                    |  1 +
 9 files changed, 168 insertions(+), 5 deletions(-)

-- 
2.31.1

