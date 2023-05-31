Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8E97184C9
	for <lists+freedreno@lfdr.de>; Wed, 31 May 2023 16:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E8D10E4E7;
	Wed, 31 May 2023 14:23:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA9810E4E7
 for <freedreno@lists.freedesktop.org>; Wed, 31 May 2023 14:23:04 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-33b4552e55cso2838375ab.0
 for <freedreno@lists.freedesktop.org>; Wed, 31 May 2023 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685542982; x=1688134982;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEeMcGwsmQcWXT4vssRRefgYUtAVUNcH/IZjc9KyPZo=;
 b=nl6ZncCyLlb0//swZpa/cW1OOoof1YurlLrT0As3THnOC5paCGiiezrAe6ZP3mFMyL
 lfeBOvC/VUPhAOWMUQv7M1tmzulReiXgR0kmhKXkRmc8r6Nh8x3t9H6V1okoxEoO1vyX
 hci3H0ASHYLYkRFxcFeaPkTkVVan8Zfp4oNCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685542982; x=1688134982;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BEeMcGwsmQcWXT4vssRRefgYUtAVUNcH/IZjc9KyPZo=;
 b=U4U8hq2mN1cKZZL5kmfa2tJwarjxhIY6pAIMwC8Ukzx0j6WJCogmfh6wq7Aycxg330
 J3g70bN6i2HZ8FDJDBXYzlLnbyF8hk2QjO3BVdvi7TxT2rJKeFWTeS10Y6SUH7cO2l4v
 1DKWGpUAjE3fz2Vt8uBfHTPQHps/8pPhe1/7lMwwEYmg1UCnrt6gO2qizX+JGn78hXEf
 EUZALbtU7sqCwDBTCBK2RoSUlsqmxtFN0Vl0S1b1uXkt+UTZSrLeK6AqTCpextHfgqyf
 aQvjV+NiP0lMXc9+tO2BLFkOZTeyvj1DSZVyfcUalhwcA0Is2BmAskV1nFhvBYLBo0Gt
 RgFw==
X-Gm-Message-State: AC+VfDwYxeqKUT4F6knuSus24VD051mXWUZzenPvrcwHLUxU1hkYA71Z
 N5Besy7YYzbkEecDt0W8kDyhpOVaz/6IUZqE1bE=
X-Google-Smtp-Source: ACHHUZ5ZMImoT4pGNkH6EOex3X0LaYgnELACdD/2wQxSZKDQ6tHt65ydLJsmkTbrFhYYpxy5iXqC5Q==
X-Received: by 2002:a92:d34a:0:b0:337:d335:6469 with SMTP id
 a10-20020a92d34a000000b00337d3356469mr2169067ilh.5.1685542982121; 
 Wed, 31 May 2023 07:23:02 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171]) by smtp.gmail.com with ESMTPSA id
 q25-20020a02c8d9000000b00408c8da83ffsm1538772jao.127.2023.05.31.07.23.00
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 07:23:01 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-33baee0235cso141765ab.1
 for <freedreno@lists.freedesktop.org>; Wed, 31 May 2023 07:23:00 -0700 (PDT)
X-Received: by 2002:a05:6e02:2196:b0:331:4d3c:db55 with SMTP id
 j22-20020a056e02219600b003314d3cdb55mr209123ila.4.1685542980288; Wed, 31 May
 2023 07:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230531075854.703-1-johan+linaro@kernel.org>
In-Reply-To: <20230531075854.703-1-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 May 2023 07:22:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UtyMSekPYfamMkswC=mSRnBpQUygMxZ+Wgf6Y2dB2Qhw@mail.gmail.com>
Message-ID: <CAD=FV=UtyMSekPYfamMkswC=mSRnBpQUygMxZ+Wgf6Y2dB2Qhw@mail.gmail.com>
To: Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: fix uninitialised lock in
 init error path
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 stable@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 31, 2023 at 1:00=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> A recent commit started taking the GMU lock in the GPU destroy path,
> which on GPU initialisation failure is called before the GMU and its
> lock have been initialised.
>
> Make sure that the GMU has been initialised before taking the lock in
> a6xx_destroy() and drop the now redundant check from a6xx_gmu_remove().
>
> Fixes: 4cd15a3e8b36 ("drm/msm/a6xx: Make GPU destroy a bit safer")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++++++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

I think Dmitry already posted a patch 1.5 months ago to fix this.

https://lore.kernel.org/r/20230410165908.3094626-1-dmitry.baryshkov@linaro.=
org

Can you confirm that works for you?

-Doug
