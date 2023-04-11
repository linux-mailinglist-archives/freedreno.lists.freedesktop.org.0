Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329A86DE43C
	for <lists+freedreno@lfdr.de>; Tue, 11 Apr 2023 20:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E010910E617;
	Tue, 11 Apr 2023 18:46:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861DC10E617
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 18:46:24 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e20so9322127lji.6
 for <freedreno@lists.freedesktop.org>; Tue, 11 Apr 2023 11:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681238782;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=iGi56Bg5OUpWDH44viG14oM0bwik+WxXcsnn4rAhg4g=;
 b=JY3NR6Kd1R5Edh80q6U5b5maTRy1MgNEFB7cvjkoR4ryfX9BcbYUpwbEWlneTCEvkb
 3fCyg1MyVZoGNKT/AG/5Gn6gtxonf0T7UF3/U6O50Hqy0TZbB8zmRMvLwnigcSUKedf9
 rChAExcHpw7ETolrqjkkCvtgaHVaRHyfcrkuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681238782;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGi56Bg5OUpWDH44viG14oM0bwik+WxXcsnn4rAhg4g=;
 b=VVjhbEsX1Jg833p378l8Kpc7cRIPXMubVXx2FqFrPD9OGwbYMr3K/2HSjBfI/CuNx7
 ctWEbxiOl4uP8NyyLTQVx3gaToTZT3iMV6X8kxO98x0t5Du4ExKkPDY0L7R5Nc+TCsq5
 NlAGCbV8YW1UZHthwClig5zi0BZdlqxeo1QkhRiwoTfUJ0dnmHwdiZgIIiSqH24rF36G
 sm8E73OrAK1HNayDdVcNC3yh8Tmf7kIl5r19bi2xVWqcVKlNd7xPTkBMetiLhfmBtjgs
 wdJHsU8LFulljpbVOGUOSrVCRcGoLrghLGKyxFceOaELEXZNJ2fXNtahCb5zvalJlx27
 2nvA==
X-Gm-Message-State: AAQBX9eOQRLdVIhUWOI+u0ALz8j756JOU9dZf8ifhrKtrTI6PJ/R1+Ya
 2FoyXgJLV41K6+4/J/JAgzjysipnXfs23Z7TZn8LUg==
X-Google-Smtp-Source: AKy350ZfMTgXBCfIYGkHy5hZyhZsQ32BoV8dwK3uBPbJHXwS8s/7arQZv8IsNfSSDQyzo3Fu3PuMODQh8egr6Uw8r5M=
X-Received: by 2002:a2e:3005:0:b0:295:bb34:9c2 with SMTP id
 w5-20020a2e3005000000b00295bb3409c2mr3646077ljw.10.1681238782309; Tue, 11 Apr
 2023 11:46:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Apr 2023 11:46:21 -0700
MIME-Version: 1.0
In-Reply-To: <20230411161903.599222-2-dmitry.baryshkov@linaro.org>
References: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
 <20230411161903.599222-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 11 Apr 2023 11:46:21 -0700
Message-ID: <CAE-0n508=PMma-X8rANuA0ogk9147mTR6XT1YsxcYyq3f-Oj9Q@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/adreno: change adreno_is_*
 functions to accept const argument
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-04-11 09:19:03)
> All adreno_is_*() functions do not modify their argument in any way, so
> they can be changed to accept const struct adreno_gpu pointer.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
