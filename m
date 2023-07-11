Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777A74F1E1
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 16:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5783910E091;
	Tue, 11 Jul 2023 14:22:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4BC10E3B9
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:06 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b69923a715so91351171fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085325; x=1691677325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OV++g5l7T0tRimgh3Jdezm1NyLyIWbATkO5QIhsASFo=;
 b=GOGEgC2ipXyiP3z8IPmu6hx07i1nnE6D8nNnrVDnxnbxtZ00eD2Z4AxKmABjOTqqAA
 XWdJo20QqnwehJwRel3LDfnq7n12b1GXNLh8u65COO29VUqTk/gF3m04MAw7nSvKNAL0
 fC/irLnhTiQG6Swu05WSTLjE4vIJwN4Q61xD5OTqkWBppG31WsujxCFYHedJlaikqAny
 aRJ7PLjY8zchGwRbsqnk6nJ8LMRCVZYijeBuBKwSUhU1NbrR/GUT6TAEOwG07UdxpZZD
 nN/CbN8MIdqJL2+esbOxHqKxFHiUjl6FN4cZeVcTabmq+PTEC11Ly+CeXUxYUQ6hjaR2
 EayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085325; x=1691677325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OV++g5l7T0tRimgh3Jdezm1NyLyIWbATkO5QIhsASFo=;
 b=UYBGjWXP4b9dUQcTELM+LG9zVaBmTu0WBE3dn6k6zVQkWeyt/AKBrI3q84PkVQzexy
 o1K2v2bN/8a+agvzgZUOaqjZD0J3e92KExzWXeVz6CEnjfTwD6HjJ9Vu4fG3ZPbHVs1c
 jP53D0az+GzdkbR+cxk6WGGnwSDC+eET4g12dB9QJiNCx/zoOqFZKq2cZDxiP07A8yD6
 CJz7XJ1Afp1f4Pl4NRiv+6dygT7h39xo0BM+JL2D90GYUns0W34GoPYM6nFazMjD6OZ5
 zjOXl5UZv3+cql81k6svAlD67eqrRq4Voi+9TA2GlwANvjJLCRFyR49NkAiyncVzkrUu
 mtAQ==
X-Gm-Message-State: ABy/qLack7HU1/6Rn4RuCJKg1v0PYrtGHB/U8aiSQD6RrGNCpMAvnLoD
 kVpmcXVOO0cJESfSqqnfsaLUdg==
X-Google-Smtp-Source: APBJJlE5VMnrx88cqkH8qJJRYAzPzrxXbOp0E7ZXLk5iTSk06igrGHB6WXj0hcZsVHc8i8W/u5edgA==
X-Received: by 2002:a2e:700e:0:b0:2b5:97a3:3ba5 with SMTP id
 l14-20020a2e700e000000b002b597a33ba5mr12518675ljc.10.1689085324766; 
 Tue, 11 Jul 2023 07:22:04 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:22:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ryan McCann <quic_rmccann@quicinc.com>
Date: Tue, 11 Jul 2023 17:21:54 +0300
Message-Id: <168908465040.1869384.8490726560198921888.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
References: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v5 0/6] Add support to print sub-block
 registers in dpu hw catalog
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 07 Jul 2023 18:24:39 -0700, Ryan McCann wrote:
> The purpose of this patch series is to add support to print the registers
> of sub-blocks in the DPU hardware catalog and fix the order in which all
> hardware blocks are dumped for a device core dump. This involves:
> 
> 1. Changing data structure from stack to queue to fix the printing order
> of the device core dump.
> 
> [...]

Applied, thanks!

[1/6] drm/msm: Update dev core dump to not print backwards
      https://gitlab.freedesktop.org/lumag/msm/-/commit/beef5b6c4050
[2/6] drm/msm/dpu: Drop unused num argument from relevant macros
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c8c931fb7426
[3/6] drm/msm/dpu: Define names for unnamed sblks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/785150043166
[4/6] drm/msm/dpu: Remove redundant prefix/suffix in name of sub-blocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8875840d60a8
[5/6] drm/msm/dpu: Refactor printing of main blocks in device core dump
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f63f29b1d2d5
[6/6] drm/msm/dpu: Update dev core dump to dump registers of sub-blocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4183857e5747

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
