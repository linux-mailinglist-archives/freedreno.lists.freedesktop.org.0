Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2BE913889
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 09:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC2710E0D1;
	Sun, 23 Jun 2024 07:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hHSvCTd6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2BC10E0D1
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:17 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so1155505e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126856; x=1719731656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFJAq35jeUfYu0Q755yYYR78x5vyrjKi2e0M/c+GQ0Q=;
 b=hHSvCTd6UHZm4Agvr2HXfNmQTdZPGrm7fJkVgoNLGp38oJH2IluXN+7rZcVYak17nS
 0M71+qQoAQO5WgOtAmftq/y18Kk1Fspti49TV1kbXO90Fi6wUQ4vC79TwmC4xgM3JtPH
 /1NaqrJRCyaFYWV4JTKI/1VdAmLaOICnFBgr5SDhlMig1WuPlvFURTvnxf2j7L0OIp/w
 fgoXQgvQ3MZ/vaMph3lAOMMNM41qI5+blfhC5xjfTyQTWWAiNEQeXCyaKDWK37sVMWYZ
 YkEJcms8DQqy7vI5nyAkhrk8B/7LGc9HlROVdoVciC/SAIhFOoUQMzXydSdkb5SZ/KYO
 /oIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126856; x=1719731656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFJAq35jeUfYu0Q755yYYR78x5vyrjKi2e0M/c+GQ0Q=;
 b=Wnwm6IKq/usa4qQYY3qdlsCaWn0IBVPUC46g4gBzJfGmzTWeHtlEw1HG+BvVNgsj4O
 bDLDfsUUWymR2kmgxVoY+zANaiFsmJT16T+v/mutzIuqH51PmyE4Z7erd2KzCvD0ciT7
 rVC0yC5iz+w5dZQvUnzM3PMHycUFTUZk+xZKr8TvwMB2zWm48kqfUDkwwT2F/Xxl0i5C
 jMAN+zKHH7WqsRE1jmj014U3VDh6hfcrl4luEf2zgfnXaF+lIVCK6j8yrj6bqAFK/D+k
 dsQDwnPH1lSwtrvJTLWyJ0tH3/TtKvho/7y4uV5tb3jBJOVF3A1BB/ReLCzm0xp9n+/n
 ZEkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSZFoE+0ufv/cJ4cZdyyJhWHWsEzE5wP0FXQcPu2bpwtPn2x1E9ppAX/khc1bP4vC4zODrYZXJleERgtjUJWJDTgt24MkwX5ugkqsmxcID
X-Gm-Message-State: AOJu0Yzql+joMveej4sfHoO+ndW3Vopa0YWqH95ed0HCvgws5sQs/t43
 SK8UddTC8dCCaXU5M5rScnw3fQS2ShLwBbawkHhynEYKa5K1nMhCYhfqfFyiJiA=
X-Google-Smtp-Source: AGHT+IEMbjEmaH7+DYR5ilu78Zy766qs3toD5t35p6uDn52e2juXI3EJ3jd+a3h4Ght7Hbsge4I2ag==
X-Received: by 2002:a2e:9f10:0:b0:2eb:fc08:5d83 with SMTP id
 38308e7fff4ca-2ec59389fffmr13590671fa.44.1719126855720; 
 Sun, 23 Jun 2024 00:14:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 0/6] Add DSC support to DSI video panel
Date: Sun, 23 Jun 2024 10:14:08 +0300
Message-Id: <171912674298.840248.15697903647146535027.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Thu, 30 May 2024 13:56:44 +0800, Jun Nie wrote:
> This is follow up update to Jonathan's patch set.
> 
> Changes vs V5:
> - Add hardware version check for compression bit change in cfg2 register
> 
> Changes vs V4:
> - Polish width calculation with helper function
> - Split cfg2 compression bit into another patch
> 
> [...]

Applied, thanks!

[1/6] drm/msm/dpu: fix video mode DSC for DSI
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f9ce482d7dc0
[2/6] drm/msm/dpu: adjust data width for widen bus case
      https://gitlab.freedesktop.org/lumag/msm/-/commit/17236bc0ee0a
[3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/063557239c26
[4/6] drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
      https://gitlab.freedesktop.org/lumag/msm/-/commit/007870b8eaf5
[5/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9ecd0ddd223b
[6/6] drm/msm/dsi: add a comment to explain pkt_per_line encoding
      https://gitlab.freedesktop.org/lumag/msm/-/commit/294b38100595

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
