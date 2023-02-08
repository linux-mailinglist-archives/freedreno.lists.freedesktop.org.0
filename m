Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDAB68F418
	for <lists+freedreno@lfdr.de>; Wed,  8 Feb 2023 18:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C8D10E7CD;
	Wed,  8 Feb 2023 17:14:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E19B10E7C4
 for <freedreno@lists.freedesktop.org>; Wed,  8 Feb 2023 17:14:02 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id v13so21334116eda.11
 for <freedreno@lists.freedesktop.org>; Wed, 08 Feb 2023 09:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CNCNsQd95KkPPYVE5Xn6suXE13YKHSzEDImJA4YDVGk=;
 b=Crlcgrcx5e/Hl3G9vyX8MSvRJdSOZgNN67aBRcQZzZJ3f1M+kTzLTUL0L7J8W7NAqO
 QcwnIlGMqgY//2VLb5IjsH8hMGQbnUEOTEZv+hhuVpzXmqfunzAvlUjKWta6LPZVaegU
 aBS/AKq3HlszzzrRPLpvP9ityCtmkH9DrBbzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CNCNsQd95KkPPYVE5Xn6suXE13YKHSzEDImJA4YDVGk=;
 b=Bdus97Eypelx1j+nrGkPMoFxxZuMuXQAd+kTyhqipc6E7hVWaRkv3J+2sNH5zRZ2TK
 JvXdd0qHhH89b3cbIWGznLAGGxPlcaQbHYCh1JgvNOK2iRIfzDDCfsd+dVO5UJ32CzjM
 GAqEsEp0bBuE6lkU4d0dOGYxqjifw2/S28FBa5Ta2sZd9+2T4thvzpGRV2DzvbUV74My
 oqEPC11Z6Gmtkj9D8/eCCYdiJYbeF++Pcq8GLx4pL8WLlGjuQKmJqG3Zn28piHoyW9Zb
 9RP4upqs3mD0hOuntg/5f4Nw9iKGSzNjsJhRe9AguEG+0q4pcQD+Y6fDCVu/tz0zlDD4
 mKhw==
X-Gm-Message-State: AO0yUKWO0awHNfYNOkw4IlxWtuWWs3TIY28AfSXSFnZIwvMpSgxuh37B
 lQSGFxh3hQh1UaplsciqgAE7QCtpgAabohC6/14=
X-Google-Smtp-Source: AK7set8PQgQxcmvLxlnVhNCsbax/nQhU+FBDlC+mI67MQwospL+2V3jPrxs7HtB8cYu8ZOGfakxg7Q==
X-Received: by 2002:a50:99c1:0:b0:49e:1f0e:e209 with SMTP id
 n1-20020a5099c1000000b0049e1f0ee209mr3992249edb.10.1675876440723; 
 Wed, 08 Feb 2023 09:14:00 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 k27-20020a50ce5b000000b004aac44175e7sm3425344edj.12.2023.02.08.09.13.57
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 09:13:59 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id y1so17503746wru.2
 for <freedreno@lists.freedesktop.org>; Wed, 08 Feb 2023 09:13:57 -0800 (PST)
X-Received: by 2002:adf:da42:0:b0:2c3:d98e:21 with SMTP id
 r2-20020adfda42000000b002c3d98e0021mr161800wrl.690.1675876437492; 
 Wed, 08 Feb 2023 09:13:57 -0800 (PST)
MIME-Version: 1.0
References: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1675863724-28412-1-git-send-email-quic_kalyant@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Feb 2023 09:13:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
Message-ID: <CAD=FV=WbzmF_Jkwrcm27eqXaqNhGq_D=8yfCKqELET+=+EaLAA@mail.gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 0/4] Reserve DSPPs based on user request
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, quic_vpolimer@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 8, 2023 at 5:42 AM Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> This series will enable color features on sc7280 target which has
> primary panel as eDP
>
> The series removes DSPP allocation based on encoder type and allows
> the DSPP reservation based on user request via CTM.
>
> The series will release/reserve the dpu resources when ever there is
> a topology change to suit the new requirements.
>
> Kalyan Thota (4):
>   drm/msm/dpu: clear DSPP reservations in rm release
>   drm/msm/dpu: add DSPPs into reservation upon a CTM request
>   drm/msm/dpu: avoid unnecessary check in DPU reservations
>   drm/msm/dpu: reserve the resources on topology change
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 58 ++++++++++++++++-------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  2 +
>  3 files changed, 37 insertions(+), 25 deletions(-)

I tried out your changes, but unfortunately it seems like there's
something wrong. :( I did this:

1. Picked your 5 patches to the chromeos-5.15 tree (this series plus [1])

2. Put them on herobrine villager.

3. Booted up with no external display plugged in.

4. Tried to enable night light in the ChromeOS UI.

5. Night light didn't turn on for the internal display.


I also tried applying them to the top of msm-next (had to resolve some
small conflicts). Same thing, night light didn't work.


I thought maybe this was because the Chrome browser hasn't been
updated to properly use atomic_check for testing for night light, so I
hacked my herobrine device tree to not mark "mdss_dp" as "okay". Now
there's _only_ an eDP display. Same thing, night light didn't work.


I could only get night light to work for the internal display if I
plugged and unplugged an external display in.


Is the above the behavior that's expected right now?


[1] https://lore.kernel.org/all/1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com/
