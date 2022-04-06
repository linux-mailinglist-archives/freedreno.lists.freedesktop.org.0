Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319024F52FE
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 06:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFD910F0FF;
	Wed,  6 Apr 2022 04:01:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA0510F0FF
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 04:01:31 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id z8so1238522oix.3
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 21:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fIVejTEIid4k3Br38o3vOB4Nk9WqXrcCLUm7LB9wI3g=;
 b=IG5KZiqjlYqUD90FPrmnIgW+5KsruCkJ4uZoErUI/mKHOTGCUWeMFTYnc7WKctoNOP
 cYTd85rDYHam1mnYrEea4ubBLmeYxEsTtViLox71HIP/rXEZ7lIujl5B1vVbEX3a01el
 pfHVZE6Xtpql9NhpcOvG+eD92M4DdC2WqQQdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fIVejTEIid4k3Br38o3vOB4Nk9WqXrcCLUm7LB9wI3g=;
 b=s9MGPsxBgKEfppLgeqmjg2Gjh80nNH3fRpLBnJf2BALGrFgzT5UJ2YbZ+2k/wnHiJT
 U6dlsWaigLNxT2Ra89tEjlf22L+GS4ENj5G6YMn8T2QnB84zZOc4zM2rTN4rdYgSpreN
 ST47SWv9d86x2BdKGcM/H11Lg+h8rhyzpAx7hA2iI8lsbIWyR+qk264kGfv88fk1rsnp
 6sQU/H6fZE/Pr/8fo/uLYw1qiH2ywaxjp5IxwsVFWkDDNrM00kV7wyLOVKZ+FkiMKUiL
 1P78OI7gq8UbhYwQLG3Wu60kyU0w1ohpSpVaZltr3OGONviH0wTGWNTLrbzO7Gdj0eDN
 Gqmg==
X-Gm-Message-State: AOAM531iQMU0BF5b1AafqcpkjlHPYkusdRsmAtnUzHb6S4HWdVjIN2C6
 1t1FHlBKeIg3v/2ZWpadlUmOSqGVdda3Z4Cp05UZtzPZ9Us=
X-Google-Smtp-Source: ABdhPJy4kKtuxcG2c6xjt9MqzFhHOds4NrTsKjmMV009Br4gwIA2ZK4qn18tizd30AhF8wyIdheSb6Saw6YHfHoaFNg=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2653100oie.193.1649217690556; Tue, 05
 Apr 2022 21:01:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 21:01:30 -0700
MIME-Version: 1.0
In-Reply-To: <20220405235059.359738-3-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
 <20220405235059.359738-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Apr 2022 21:01:30 -0700
Message-ID: <CAE-0n51ayjyfEdne_=R6FU-3+O91JiYz-GRg2C7jeXB_9HTiRA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm: loop over encoders using
 drm_for_each_encoder()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-05 16:50:58)
> Rather than manually looping over encoders array, use standard
> drm_for_each_encoder() macro.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
