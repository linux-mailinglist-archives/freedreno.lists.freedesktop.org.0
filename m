Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31882588E21
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 16:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5232A660;
	Wed,  3 Aug 2022 14:00:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CA52A660
 for <freedreno@lists.freedesktop.org>; Wed,  3 Aug 2022 14:00:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id j8so6403866ejx.9
 for <freedreno@lists.freedesktop.org>; Wed, 03 Aug 2022 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=0kFvvVa1Ry8lFNFwqRcLz5HfPPFKIoO5GClVTFVHKAo=;
 b=Pm+xw36k75MgbBYWtIlvzPVrEx1sxmMi8PhC7QjORA4TpioAt1Y653gXwcZnqM9GAJ
 uRV1XrvItB7XOV23G8z6Tztth/UWRNpO9yBmRRYZxXJI+jL2XiuM4cAujb2TzKuEofAQ
 AScoKYAzpWNkClXatjzcWb6M+Nhj0lckjKEBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0kFvvVa1Ry8lFNFwqRcLz5HfPPFKIoO5GClVTFVHKAo=;
 b=oeg44rVJ6UXIYpjvFQZBXl4xZcsdf1EOZSyjrEubVF/oUTVUlgzsZeCy0/vyryZqrE
 MEkgQ0SUB2siSfCR/jduvkCwGfxhCKgER1QNwbc1xNUctw3KDEj3BVCzhh9GtGgURt1M
 Rb6BsEmkCfML0LNVK3fLYMBu1UvuYOxhnvZRPqyNIjabkF0RFjuG7/a1dE3K5h4xbfm8
 LcXpdsBkgVAVZ4iq9+hYmdBYk+zARTS/SgujB30aVX6n2zRv/jAiIf1WlyzlDjmKB1Dz
 l3aKHsUra+QnOylplNO6ww1EdVOT/jqRGAFLn0TFDQ3so53KKHh2+FSszha7/yeyje/i
 2zcw==
X-Gm-Message-State: AJIora/AwU4Aak9m0gF6+OPa/F0zOtjb2IttwnCVUbbIqWh85WWnFQHS
 Jr2f3ZrMlLzg1gjEoTY5/KppRkDeYdh2vWM6tnw=
X-Google-Smtp-Source: AGRyM1tnlsWCoEyijMAErG6OPU2Pg+03MVF0q/F7rliSctEvIuvUOOoU07gzpK7ysA1hcJiJLhDxXg==
X-Received: by 2002:a17:907:6d26:b0:72b:3a72:a117 with SMTP id
 sa38-20020a1709076d2600b0072b3a72a117mr20280930ejc.280.1659535206961; 
 Wed, 03 Aug 2022 07:00:06 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 k8-20020a17090627c800b0072af0b036f3sm6723485ejc.41.2022.08.03.07.00.06
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 07:00:06 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso981349wma.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Aug 2022 07:00:06 -0700 (PDT)
X-Received: by 2002:a05:600c:1549:b0:3a3:2aa2:6f60 with SMTP id
 f9-20020a05600c154900b003a32aa26f60mr2974636wmg.57.1659534836576; Wed, 03 Aug
 2022 06:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid>
 <228e5e34-6467-a75b-129d-2b37b32acf13@linaro.org>
In-Reply-To: <228e5e34-6467-a75b-129d-2b37b32acf13@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Aug 2022 06:53:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XRM=KvnBGwgOLtfAEcAejPkQ8M9TFQGuu+832zR8z1nA@mail.gmail.com>
Message-ID: <CAD=FV=XRM=KvnBGwgOLtfAEcAejPkQ8M9TFQGuu+832zR8z1nA@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 5/6] drm/msm/dsi: Take advantage of
 devm_regulator_bulk_get_const()
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>, Sireesh Kodali <sireeshkodali1@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Mark Brown <broonie@kernel.org>, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 3, 2022 at 12:19 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/08/2022 01:37, Douglas Anderson wrote:
> > As of the commit 1de452a0edda ("regulator: core: Allow drivers to
> > define their init data as const") we no longer need to do copying of
> > regulator bulk data from initdata to something dynamic. Let's take
> > advantage of that.
> >
> > In addition to saving some code, this also moves us to using
> > ARRAY_SIZE() to specify how many regulators we have which is less
> > error prone.
> >
> > This gets rid of some layers of wrappers which makes it obvious that
> > we can get rid of an extra error print.
> > devm_regulator_bulk_get_const() prints errors for you so you don't
> > need an extra layer of printing.
> >
> > In all cases here I have preserved the old settings without any
> > investigation about whether the loads being set are sensible. In the
> > cases of some of the PHYs if several PHYs in the same file used
> > exactly the same settings I had them point to the same data structure.
> >
> > NOTE: Though I haven't done the math, this is likely an overall
> > savings in terms of "static const" data. We previously always
> > allocated space for 8 supplies. Each of these supplies took up 36
> > bytes of data (32 for name, 4 for an int).
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Ah, so to array conversion is already done. That's great.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> > ---
> >
> > Changes in v3:
> > - Do all the PHYs too.
>
> It would have been easier if DSI and DSI PHY were split to separate patches.

One of the earlier patches in the series (where we remove the
"disable" load) was harder to split since the DSI and DSI PHY code was
sharing a single data structure. Once I had one patch touching both at
the same time I figured I'd keep them all like that. If you need me to
rework them to be separate patches to make it easier to land then
please yell. Otherwise I'll assume it's OK.

-Doug
