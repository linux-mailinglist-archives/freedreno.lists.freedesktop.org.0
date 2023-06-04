Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240B172143A
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 05:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5158710E0D7;
	Sun,  4 Jun 2023 03:01:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB03310E0AB
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:42 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b1bdfe51f8so8990031fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847701; x=1688439701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZsc3aGkFQ4mtkU8bHm6rosN4mKrVYoDnfgPOZGJhME=;
 b=QCey47maO+t74HGIdbJrsjx7ZXdv+yxbH2TwtWnM/Qs9ITfhHQdwl4tAsT/MVb8TKv
 X5uqXdC3HKnX4ErwLk93llLPkFfDZyk0l2s9lsVbXYDLUUJTcQ6FgkBWo2/gc2CG57v7
 5Gy9kmKv/NixurvbEg1kRxdTLQgdxlS1iCvhXgiJjJZQUdS/QnoQYcMaoZ1q6YCKv+4L
 v9JvmiOTB1A4CkwfNoBcYNyereVfF3VREz6LJXASdiDPGfh2xSYuCk8GrQrVgizBEzJc
 1jwP9pLnn//9OAf0y3wgVQ343zqQydTdZgfPoE22oKv5ZdSDC6VkdStOk74TDKyFTVxO
 REGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847701; x=1688439701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZsc3aGkFQ4mtkU8bHm6rosN4mKrVYoDnfgPOZGJhME=;
 b=jC7w+iFriMMIp5pSGJ4lgOmNaF3YWuG8kJIRCkg7g7tD6Y2vugIYTy/pF+IoGyIzKA
 rlSd5EaSifE3xvSyZIUKw+PlnQnt4xdE3vV4c/kRCvHvqgjzNWI1J/3sZjluISdzYNOg
 qYuujbg/pmFdzw6/ypHjDVQXzjkQXiJl6v60diOPzussTQ7e2m0ZaDne1TUslT2uFDLD
 ujQ5VleBV0J4fPAxE8ZOd3cACTMAIujppt6dXpVxqBF9pRs4FXD11zTiWlK55soMQaQC
 eMsF2s0LyFADlgZ2f397Z29ZeJ8TC3VKpC0UJsxr542sPrKJg7M+P4XJ7SXHswImHcSk
 P3Fg==
X-Gm-Message-State: AC+VfDxU1Ip+PS40lsMulXPw83uraBlBoAsz2YI5MP6QyZ2iX8T5y7FJ
 yFN6G3CACMxhwCwncJlNLKVtbA==
X-Google-Smtp-Source: ACHHUZ5d0YQUCBNH0BnZQCDKBW0ZR+yGOC9h7dCtgJ9kkcgMZzJEi1nlx+baS2WEvceSbXjICdkBUw==
X-Received: by 2002:a05:6512:118c:b0:4eb:412f:9e0e with SMTP id
 g12-20020a056512118c00b004eb412f9e0emr2085756lfr.26.1685847700899; 
 Sat, 03 Jun 2023 20:01:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun,  4 Jun 2023 06:01:28 +0300
Message-Id: <168584750430.890410.10572067780292340630.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
References: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dsi: remove extra call to
 dsi_get_pclk_rate()
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sat, 20 May 2023 23:01:02 +0300, Dmitry Baryshkov wrote:
> In dsi_calc_clk_rate_v2() there is no need to call dsi_get_pclk_rate().
> This function has just been called (from dsi_calc_pclk()) and its
> result is stored at msm_host->pixel_clk_rate. Use this variable
> directly.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: remove extra call to dsi_get_pclk_rate()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6de6c28d97c0
[2/2] drm/msm/dsi: use mult_frac for pclk_bpp calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/374918d2c396

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
