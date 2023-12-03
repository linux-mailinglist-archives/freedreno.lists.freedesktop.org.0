Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D188022F2
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A4110E291;
	Sun,  3 Dec 2023 11:27:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2560110E27D
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:47 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bf32c0140so251697e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602805; x=1702207605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUAZdkQfSAqXRz9x79MrIU9qVt7c+xHhhtTJPbP5odQ=;
 b=ATjea1t63hNkdHGEdM/iQx+9S0hKCzWNYGuPARCBw1lKkyOFDSJvZ7EdOpl4NNfBJI
 Jpb2PmWOQSzvORMlkCIRUntNCj2NNXjRw2nTQrAKGN8ZG/YzYLWHSF3qIdMU3AjeKren
 sYbeDQUivjkg9I6mjsRYTx2i75eRusczHxajzX0nDoVYTpVNN5qSAmcXYRnDqcFPSWyT
 8nktrzqcWeCCpv2WOMUSuBwEHTKzTmz/FKn/I82jIr6cUb/6Od5Hqn9c06rZGyeSQ9jr
 710piFMifZtzY8PYHO7ylR9S6r26g9AcZUGYNo+hWiF5JkZEK/TAuHGDqTvuiljvxZQJ
 qBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602805; x=1702207605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RUAZdkQfSAqXRz9x79MrIU9qVt7c+xHhhtTJPbP5odQ=;
 b=U9eqspqB2ZAL4qRlnKmkdmmtdP8Rv0xGVKeZb+NNcotxllwQhXkwMCQUnLUFC20Ym8
 QCUheWiAw0p4slvtFxQ0K1vMmuqrHn6eTZNk6qV16iKuRqwvSfRVozHMY3Q1rrh4K4Cn
 sOX6bypTTlktsE+RBj4ycNJVWEsivAKDThwGH2qEo0gt6HAO1r0zHfcrsukAAzuSy5D9
 CliIILsnJNgOl2SlhQbVjb1JUG2NxpRwRVfLottzsDE8Xb1WJIio4qPsBpWd+9shehuU
 rz0JVxWIDlsO+D6hVivKCJmr2Mx2emC9R/vzfpPtUZYsaRgsr7iVlvYZ+g7IfpUxCoIk
 m9FA==
X-Gm-Message-State: AOJu0YypG+Ef86ug39n/PMyCQvhhR4gjmpry8+2zS187zMJCIm4Ynhk8
 R5QtXFRSH8buxkcKdA5s74VEKywvz/nm0TZoZM0=
X-Google-Smtp-Source: AGHT+IHpk/z4/x3A1ROGUbkKTKcCtG2yf3p8Kv9XcKn7Zchlb9ULC0uBiXCrO5CVwkjyr6QNXtGPDw==
X-Received: by 2002:a05:6512:2352:b0:50a:778b:590 with SMTP id
 p18-20020a056512235200b0050a778b0590mr2401244lfu.68.1701602805313; 
 Sun, 03 Dec 2023 03:26:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
 Paloma Arellano <quic_parellan@quicinc.com>
Date: Sun,  3 Dec 2023 14:26:30 +0300
Message-Id: <170160265539.1305159.16684138495833882761.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130224740.24383-1-quic_parellan@quicinc.com>
References: <20231130224740.24383-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dpu: Capture dpu snapshot when
 frame_done_timer timeouts
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
Cc: neil.armstrong@linaro.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 30 Nov 2023 14:47:37 -0800, Paloma Arellano wrote:
> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> state when the frame_done_timer timeouts.
> 
> v2: Optimize the format in which frame_done_timeout_cnt is incremented
> v3: Describe parameter frame_done_timeout_cnt in dpu_encoder_virt
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Capture dpu snapshot when frame_done_timer timeouts
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9cad81143ef0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
