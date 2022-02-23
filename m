Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679274C068C
	for <lists+freedreno@lfdr.de>; Wed, 23 Feb 2022 02:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA5610E314;
	Wed, 23 Feb 2022 01:00:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B6310E282;
 Wed, 23 Feb 2022 01:00:36 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id p9so36664768wra.12;
 Tue, 22 Feb 2022 17:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XG2WJdS64Zv9xka8Qt6oMTSA17ZmaSgIVCdRSg9oCbM=;
 b=DeOnaD5P4Lhhd2HeWPLW/pcTMV+nWweTaPBFJW+9UbVYq8fDWdvSwZNkLVbcf8mqq7
 ZSt1ZSfbwfUSF3IsWu60W72SxId+T4CY25htuVkb8clEN/hR1l9vKwWseJ570iczN64b
 V2aurt/i0THReQj7ATd/7j0KZc84YgEoDPo/4aSlfbCul0S0KKZf8ONsT2mS42z4W7+s
 eHJVKADSpdIDvONxIqXEQr4eHc1ZfVr5WFhQu+onfBA80jOjmIsQ0Ve91bCNpkCBxN1h
 iS24esJJrGAFYwrc3rNhDUjOnN/qMXpk6PeKsGN4WqUawJ2QAGgCMHIfnee6m8jANo1/
 rCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XG2WJdS64Zv9xka8Qt6oMTSA17ZmaSgIVCdRSg9oCbM=;
 b=JexFn6eoXyun3Pn3FzAKBqQCzafmAy4Q3J7Ogskko+0zpZULg/REBWm7N6tRlZghQr
 G8WtgCVBQnx6TcV4zGZ/gCUVC8SyhwQsaNw3QY53rrNcLh67UWGd5KQMyuADn/JAqwt0
 xaXI6qAPnfDbhhuufg9lespfO5zD3dRt1dVf61Wf4h0skE59BpNyvDAHSgOH+eTmrnm+
 Se/E5BmBrGIJqGon0AYHMHvDkHFLPyk1TiGO6hLjlnOSGe/AqDk7JFQMUR2BE3DNhT5N
 a/w+C6g1FO//DTvYt/phtSZ6IXd/pALicwMWw/SZyzQASTfbVrq8zXr3mPJc8v7uisqU
 +1Gg==
X-Gm-Message-State: AOAM530kcYR89QzkAe97qB1Oc1Y5APB5QnOJQJoJNkCHx73qtFMNzGje
 jKjxM9UGICiOtC0q86+t0b65dx6hNu6iB46g1/M=
X-Google-Smtp-Source: ABdhPJxIURKeTA1QUcPbVoVTcHRlzqa0GY9K67gjU65XtpVZWAn1l2OUwllxJtPnac3iRFwrHB7EgaSI1sUkL1SMzfo=
X-Received: by 2002:a5d:5847:0:b0:1e3:ee8:e6c7 with SMTP id
 i7-20020a5d5847000000b001e30ee8e6c7mr21707901wrf.328.1645578034712; Tue, 22
 Feb 2022 17:00:34 -0800 (PST)
MIME-Version: 1.0
References: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
In-Reply-To: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 22 Feb 2022 17:00:54 -0800
Message-ID: <CAF6AEGtF440x7Sho03ujeL6J4XXqOrF_NcqiQXGTewwLM5SObA@mail.gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 0/5] Support 7c3 gpu SKUs
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
Cc: Sean Paul <sean@poorly.run>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 6:41 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> This series supercedes [1]. Major change in this series is that it is now
> optional to include a gpu name in the gpu-list. This helps to avoid the
> confusion when we have different SKUs with different gpu names. And also
> I am pretty happy that the overall changes are smaller now.
>
> [1] https://patchwork.freedesktop.org/series/99048/
>

Other than a nit in 2/5, this looks good to me

BR,
-R

>
> Akhil P Oommen (5):
>   drm/msm: Use generic name for gpu resources
>   drm/msm/adreno: Generate name from chipid for 7c3
>   drm/msm/a6xx: Add support for 7c3 SKUs
>   drm/msm/adreno: Expose speedbin to userspace
>   arm64: dts: qcom: sc7280: Support gpu speedbin
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi       | 46 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 18 ++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  1 -
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 35 +++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  3 ++
>  drivers/gpu/drm/msm/msm_gpu.c              |  4 +--
>  6 files changed, 96 insertions(+), 11 deletions(-)
>
> --
> 2.7.4
>
