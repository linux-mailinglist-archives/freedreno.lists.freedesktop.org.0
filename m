Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44915F4591
	for <lists+freedreno@lfdr.de>; Tue,  4 Oct 2022 16:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C0C10E705;
	Tue,  4 Oct 2022 14:36:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8877310E5E7
 for <freedreno@lists.freedesktop.org>; Tue,  4 Oct 2022 14:35:58 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id f189so16971511yba.12
 for <freedreno@lists.freedesktop.org>; Tue, 04 Oct 2022 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=WM6PfXHHse3/yexDzL/5HR9PYYLOMXw7VQRCht6d5SU=;
 b=oBLmmmDLvD4KT4Ygj0QEZVj8j8wvotDFRb6yACIepSPEPq4m7ZyTAaIp56eT0s0Uiz
 VihDiSrOFKmz51MqD0s6lckh4+0mo2DtAAv1ieii5EyD3pIRW/fq8FQbpBs042IaTHVW
 QUkrOPiWtjqphFL5n5WTLv5yaDvabw9x3RSIeZjR/J2MkG2OcC3cJjvRdrvt7jKNPgSG
 viNv3Q+d0JMQWkGyA3vcBYDUnppyztYIioMsqJ2aKQvWSuc4aBIEf5R5n9s4q3LOeAOf
 G2yjwRoij9c+LQL7bgjtdbYSb5zxlj/HDf0PTA5GFgSBMk1ScQ3r7HwVq+2AbAf2Bo3b
 JOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=WM6PfXHHse3/yexDzL/5HR9PYYLOMXw7VQRCht6d5SU=;
 b=O+7Tjdguho6X6F763JrNuaDKmX94ZJLOflbTKvUYDamocejYTBzJk1dua/su1IO6jU
 A1dnf/z7SHYybXiU88eenesSkTI6NhE698ebGRrnkO3JPpCXbjix+TCs2yzB2TGG30xz
 tRvIH0LBreG05aCFb/aHe2yhSQF1OQ8g9V3yF65/NkcFpgd405mKBiFOpT6gr5/m68I/
 zRmXVXn3hBLTay1ztbX3L71f5rPUW1e3SwFfOMVfOdYErk2m6cXQX8iG0kBHyBsbPZ7Y
 fJh2uVvmDCbqLpbGnS5fNnpay+QAoTBXBs3MSG4H5syhTCKrNv8dYWYlmiF1AoqC2Mf+
 CQIA==
X-Gm-Message-State: ACrzQf2w0r1gtTgk6kuL4YsSkkv06UOarA9kKCvtILK6bZptlGCVdgt5
 XaZkkjH0miUjTA40pIr2vANHj0iVaP1h+uj/7p1iZA==
X-Google-Smtp-Source: AMsMyM5QPwacWT/plAClT9ufk5FfkV8GOwFid2Fa66k5LdXW5Xbi864YzwABxgdaZdmjDK3I1DPXXwRupYr/vj3MDMI=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr26917511ybj.194.1664894157723; Tue, 04
 Oct 2022 07:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-5-marijn.suijten@somainline.org>
In-Reply-To: <20221001190807.358691-5-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Oct 2022 17:35:46 +0300
Message-ID: <CAA8EJpoEUuJqj4hAa-qU1ovZuR0ivu3Jzeyx50JPw3k2mv2Lmg@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 4/5] drm/msm/dpu1: Account for DSC's
 bits_per_pixel having 4 fractional bits
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
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 1 Oct 2022 at 22:08, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> According to the comment this DPU register contains the bits per pixel
> as a 6.4 fractional value, conveniently matching the contents of
> bits_per_pixel in struct drm_dsc_config which also uses 4 fractional
> bits.  However, the downstream source this implementation was
> copy-pasted from has its bpp field stored _without_ fractional part.
>
> This makes the entire convoluted math obsolete as it is impossible to
> pull those 4 fractional bits out of thin air, by somehow trying to reuse
> the lowest 2 bits of a non-fractional bpp (lsb = bpp % 4??).
>
> The rest of the code merely attempts to keep the integer part a multiple
> of 4, which is rendered useless thanks to data |= dsc->bits_per_pixel <<
> 12; already filling up those bits anyway (but not on downstream).
>
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry
