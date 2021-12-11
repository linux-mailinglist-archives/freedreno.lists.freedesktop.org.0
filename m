Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C74716E2
	for <lists+freedreno@lfdr.de>; Sat, 11 Dec 2021 22:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B6E10E30F;
	Sat, 11 Dec 2021 21:49:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A01810E2F2
 for <freedreno@lists.freedesktop.org>; Sat, 11 Dec 2021 21:49:21 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id l25so1665204qkl.5
 for <freedreno@lists.freedesktop.org>; Sat, 11 Dec 2021 13:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=216kzXBuHrtR+pLZX4A3zjdY7dFTRS45ivYaDgXHWiQ=;
 b=WIirWmQcQEqP2Wsh1HLpBUmtp5ElEGVZPHWWrXCao2NbowwGB49iuKgypZmpAC2RG9
 aGTY7flkNkCdjmv+wnoyOgDhmP2dPwD1X3mgpOKJosfDx84GAzH7k2nAjP5EueMZhFSD
 kDzJWY3PCHC587bNDcQChGc+W+o1R+H+5zzPoHCG72QhcbGIxXXBJSQgIwtO2G5qtJsv
 gHzqK7H+bwqKePEbgEA/5Sj9jvJPjynaVxfZmDcQlsAUwd0FL6/soXcCkl8IkkkcG5np
 foCd0OtqOqE8sNhtjtSJt1Z5LVVJpc8GFgcjiZ25KlnecQBG3EU0iiLWweWdYbbq4ggk
 eP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=216kzXBuHrtR+pLZX4A3zjdY7dFTRS45ivYaDgXHWiQ=;
 b=saKz/fWWnQSeGsmeTEVjSiGF5SVKk0Dy5YdAX7v6nxY4iqXDQHKuhQSovZtL0deBIn
 cd4spBwQjPjznsd4Cevoa1QKV9PVRQNCLKqKF4+BXPaoJ5qinjOgDtEyyusoDmWvGutz
 vqbUTTbyW+bmijcCeT7Ar9BXNbmfXrsKg6f+x/qGMy3ofaP8lfhugGbGCC+lhc+F9gGm
 mJLE1ietoiyW3AnvFDZe4iEcTrkT/CpgPUAE9ms7Awo+8LM2EwxwNrqZfXMzxXndvX0q
 5xdQ492HPQuzBsUoGz8QhVTyfXt0CbmBjuRbFwpPaECjdHYrszP+WRgJX0XLurjAsJI5
 ersA==
X-Gm-Message-State: AOAM531OXVn8AubV8hb3Cht5603KQw7h75ZEkGgA3bzjuk9dGBCHEVw8
 vZs+tRAf+HTaz1636urvnBN/Ytt7+GZJC6fGQTiL5A==
X-Google-Smtp-Source: ABdhPJx0HA+TFdXFAe/Fn75girIuuARUxIWPNthwtIiISDoqzb4TtSUHLZLxUyYEMWCTuNAKiVa9lepST9gbf9uY4UQ=
X-Received: by 2002:a05:620a:13ea:: with SMTP id
 h10mr27102972qkl.30.1639259360286; 
 Sat, 11 Dec 2021 13:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
 <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
 <b325fc8d-e06b-36de-b40a-b5ffbcebb1c5@linaro.org>
 <94bedea3-0e5f-5ae8-79d1-ceb17ccdea23@somainline.org>
 <20211211213528.uroqfdksvokspbxf@SoMainline.org>
In-Reply-To: <20211211213528.uroqfdksvokspbxf@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 Dec 2021 00:49:09 +0300
Message-ID: <CAA8EJprT5gcWOsS5jJk8egUpxutBpUdW2Pnh-8FFXhgOd3hr=A@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 sean@poorly.run, 
 airlied@linux.ie, daniel@ffwll.ch, abhinavk@codeaurora.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 konrad.dybcio@somainline.org, martin.botka@somainline.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 paul.bouchara@somainline.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on
 command mode panels
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

On Sun, 12 Dec 2021 at 00:35, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2021-12-09 18:02:40, AngeloGioacchino Del Regno wrote:
> > Il 02/10/21 00:33, Dmitry Baryshkov ha scritto:
> > > On 11/09/2021 19:39, AngeloGioacchino Del Regno wrote:
> > >> [..]
> > > I've compared this with the MDP5 driver, where we always wait for PP_DONE
> > > interrupt. Would it be enough to always wait for it (= always call
> > > dpu_encoder_phys_cmd_wait_for_tx_complete())?
> > >
> >
> > Jokes apart, yes it would make sense to do that, it's something that works
> > at least... but we should verify that such a thing doesn't break new platforms
> > (like sm8150 and newer).
>
> On sm6125 (keeping in mind that we're on llvmpipe, will bring up the GPU
> later) none of this hurts the display:
>
> - Without this patch, so only checking for wait_for_ctl_start;
> - With this patch, checking for idle if it was already started;
> - With this patch altered to only ever call wait_for_tx_complete (wait
>   for idle), in place of wait_for_ctl_start.
>
> Working in the sense that glxgears, which actually reports a framerate
> of approx 170 despite being on llvmpipe on an SoC that is still in
> snail-mode, seems to update (commit) the panel smoothly on every
> occasion.
>
> On this note, does it perhaps make more sense to call the "internal"
> _dpu_encoder_phys_cmd_wait_for_idle function directly, instead of going
> through the "public" dpu_encoder_phys_cmd_wait_for_tx_complete which
> seems solely intended to handle the wait_for_tx_complete callback?

Either one would work. The main difference is the error message. Do
you want to see it here if the wait times out or not?

-- 
With best wishes
Dmitry
