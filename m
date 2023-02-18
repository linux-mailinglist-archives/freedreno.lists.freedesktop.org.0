Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6B69B778
	for <lists+freedreno@lfdr.de>; Sat, 18 Feb 2023 02:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C4510F0FB;
	Sat, 18 Feb 2023 01:25:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47BD10E4B4
 for <freedreno@lists.freedesktop.org>; Sat, 18 Feb 2023 01:25:49 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id be32so3626123lfb.10
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 17:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vZN8uJ9WEeY6aEq+aXSFu1WAwsJtvGTMBCWQRkOvTtU=;
 b=RG1ZSQCxSbFEH1zRFfiy/r0wIdVzpKvZX48cpn/j6poDVcgHQlHU3Yfls4vRV6cl5G
 ohXair0HwZK3cV/FqTV0ma1q7Zs6ooF40EsnI+l17MLuzg9QPZ6Tx9asqMNewWLX55nR
 QBhotNlTyKzExBaA2o2ZISUzRUjVxXFFEfoy9zX4XrBDmzvQx+sATIGCIVi6zLXX41WC
 Kw7RTpSL0PkEicZ/9Ua1eojUTZ0cAtjZWryi7cz7soKBKx3+yw2jz+aMfCFteGnwinq0
 9XI3J+dxo7CQR6UcjamiakK7i40M9MNhF4XeMN43+qrt7VtenKJQLwrAjzaClmHTPo38
 b5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZN8uJ9WEeY6aEq+aXSFu1WAwsJtvGTMBCWQRkOvTtU=;
 b=Dmr0jw3zVXYmVUqf/OIQZDJKpka0a7wL8G991jJ71F98YV8ddmMr4gHaAyelg5dVaG
 rfrvVIzh1/u7Gcip2XXHCZ91aDOQ16o9kERF3KW4SBimHCjo4sYXPiQPXjZaysWK2osn
 WRP7ghpR2wFcBWzvlROx86vU9sxZ3xCo5dkevVjwCKiO+vfBkmwK+AaqbvgPPzWnUhf9
 Z3i69Y81k2JHXkwbhEkTSNykBJHUm8M9y1kxPxHDtxR0HBub5gu48uHe4Niro6tIF4Fp
 HxkgoVrprTmRJVxHrRs7FF0jcRnIFLgDIaTLUpc3+BY/XqAR7kTJXE2x/VQGTydMJQO4
 gSAA==
X-Gm-Message-State: AO0yUKUjQEylV7YjfO9kX0yDLvKeZtzQ7eUMlEg1F64WJkF1Vy3HnQu1
 hBKBbYEihAkoFxOM4FPmK9G9JA==
X-Google-Smtp-Source: AK7set/GPnstIoBrqi4vNc0v8xAxOwkrJsHUWl+EZb+jCq7yRRK8uH88DiUVmkVInScxTfDSlpqo2A==
X-Received: by 2002:ac2:4852:0:b0:4dc:828f:ef88 with SMTP id
 18-20020ac24852000000b004dc828fef88mr1182462lfy.7.1676683547934; 
 Fri, 17 Feb 2023 17:25:47 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j11-20020a19f50b000000b004d85f2acd8esm826414lfb.295.2023.02.17.17.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 17:25:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 18 Feb 2023 03:25:44 +0200
Message-Id: <20230218012546.3655999-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/2] drm/msm: rework msm_parse_deps() and
 msm_parse_post_deps()
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

As discusssed in the the review of [1], rework these two functions to
separate single point parser and provide clean error path.

Depenencies: [1]

[1] https://lore.kernel.org/all/20230215235048.1166484-1-robdclark@gmail.com

Dmitry Baryshkov (2):
  drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
  drm/msm: simplify msm_parse_deps() and msm_parse_post_deps()

 drivers/gpu/drm/msm/msm_gem_submit.c | 206 ++++++++++++++-------------
 drivers/gpu/drm/msm/msm_gpu_trace.h  |  10 +-
 2 files changed, 113 insertions(+), 103 deletions(-)

-- 
2.39.1

