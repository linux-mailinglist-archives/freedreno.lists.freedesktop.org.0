Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02DE53AD8B
	for <lists+freedreno@lfdr.de>; Wed,  1 Jun 2022 21:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418A110FBCE;
	Wed,  1 Jun 2022 19:58:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF2710FBCB
 for <freedreno@lists.freedesktop.org>; Wed,  1 Jun 2022 19:58:21 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id o68so2156988qkf.13
 for <freedreno@lists.freedesktop.org>; Wed, 01 Jun 2022 12:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WqzzjZ/+YoAfsOt70hJSK1v4NOwUp//67c0gdA4z8gE=;
 b=o+8DoKQbuB6vo34q94PbCmoOZ1E42JHaRrsMzhV2F/ynt8Q+VdQtnDeWLT592DvZ7t
 AeMy3LYefWHmvgfCUohLgLa0KCbaal0aw7qMTAwwLRq6xfqCUug5WfT+u86M35AjoI91
 Emy6jxRdlsMSGIG6vRz8kwjnFKa3jFTpW1+pvaVa/+/LwfGm1MYRZQ/+BK+yeUtO5WUL
 mEQMcYZVBuDTpS2uWVEdGM6Xk19p34D75EanhUz/tcJ6SHYj4qcW5her+JqRSnS93jQC
 Baxr0ZA84v+AOXMoYiwB2Zcw7cV3bhjrdqtXX+iJaz0V12UJ4K8O75k0rjJOOUi9AFs7
 x/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WqzzjZ/+YoAfsOt70hJSK1v4NOwUp//67c0gdA4z8gE=;
 b=XuS2rykzP/ik/ObRTbyfYlQK5sTAIvbKLrvyLtSeJIkiXd5NAsh5YrMjxzaWhK+tiq
 TA7ecTOtWVDWUsnOTCCYLmXbbCXIH/Veh1LvXRwGx6tHdQPu/dOmxpaJ2Cg1Yd/nJ5gT
 O8m4TkB/TRnMNJh7y1hNFanpOb3ZkltKYlxzuk7CHhDhfigeMzwpVYRGs/ds4f7zMP0Z
 cs7XNmfgsiffb1utXjpVKL2gBhmb+co+AEw8efpxPT+oUqgrlp3cAAy23bF1DSqS9KiL
 ezkhTgOR3CbhuYzr4fZ7F26gdjkarVuYkG3uz8E4yYYKdcOEO9wDeHF5ngU7GBdSrsFU
 lzrQ==
X-Gm-Message-State: AOAM5316+kPdQQA6O/ET9H5O2Lo1fU7OEX5dSsi8XBTz1igmENGpmLx/
 slkCO3ZgiocTwrPD6yQ4vU2gH81O8CHorRxOd82qiA==
X-Google-Smtp-Source: ABdhPJx4nAJPu/OXd+0EBsy6h9EWGrczLq7bqqCKi8jtBPrQeHOAUACKV0KVNp25KQQV9tdKC24tm1njoXJQNx7sc1A=
X-Received: by 2002:a37:582:0:b0:6a3:2ce4:3c72 with SMTP id
 124-20020a370582000000b006a32ce43c72mr913331qkf.203.1654113500549; Wed, 01
 Jun 2022 12:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220531160059.v2.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
 <CAA8EJpqp64eDmXPN1qMTZ78My8BKPUcu7zKunZV1SJpzjSRDuQ@mail.gmail.com>
 <f8d5e4a7-bba8-ca51-41f7-885ce14a55fe@quicinc.com>
In-Reply-To: <f8d5e4a7-bba8-ca51-41f7-885ce14a55fe@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 Jun 2022 22:58:09 +0300
Message-ID: <CAA8EJpp5v3qR2M-6Jms=3GgrzUeMOiMzQtgvQc_LPVE78aE=aw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Move min BW request and
 full BW disable back to mdss
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 1 Jun 2022 at 20:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 6/1/2022 3:04 AM, Dmitry Baryshkov wrote:
> > On Wed, 1 Jun 2022 at 02:01, Douglas Anderson <dianders@chromium.org> wrote:
> >>
> >> In commit a670ff578f1f ("drm/msm/dpu: always use mdp device to scale
> >> bandwidth") we fully moved interconnect stuff to the DPU driver. This
> >> had no change for sc7180 but _did_ have an impact for other SoCs. It
> >> made them match the sc7180 scheme.
> >
> > [skipped the description]
> >
> >>
> >> Changes in v2:
> >> - Don't set bandwidth in init.
> >>
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  8 ----
> >>   drivers/gpu/drm/msm/msm_mdss.c          | 57 +++++++++++++++++++++++++
> >>   2 files changed, 57 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> index 2b9d931474e0..3025184053e0 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> @@ -49,8 +49,6 @@
> >>   #define DPU_DEBUGFS_DIR "msm_dpu"
> >>   #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
> >>
> >> -#define MIN_IB_BW      400000000ULL /* Min ib vote 400MB */
> >> -
> >>   static int dpu_kms_hw_init(struct msm_kms *kms);
> >>   static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
> >>
> >
> > [skipped]
> >
> >> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> >> index 0454a571adf7..e13c5c12b775 100644
> >> --- a/drivers/gpu/drm/msm/msm_mdss.c
> >> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> >> @@ -5,6 +5,7 @@
> >>
> >>   #include <linux/clk.h>
> >>   #include <linux/delay.h>
> >> +#include <linux/interconnect.h>
> >>   #include <linux/irq.h>
> >>   #include <linux/irqchip.h>
> >>   #include <linux/irqdesc.h>
> >> @@ -25,6 +26,8 @@
> >>   #define UBWC_CTRL_2                    0x150
> >>   #define UBWC_PREDICTION_MODE           0x154
> >>
> >> +#define MIN_IB_BW      400000000UL /* Min ib vote 400MB */
> >
> > As msm_mdss is now used for both DPU and MDP5 devices, could you
> > please confirm that this value is valid for older devices too? E.g.
> > db410c or 8974
> >
> I need to check with Kalyan on this value (400MB) as I am unable to find
> documentation on this. Will update this thread when I do.
>
> So prior to this change 627dc55c273da ("drm/msm/disp/dpu1: icc path
> needs to be set before dpu runtime resume"), this value was coming from
> the hw catalog
>
> @@ -1191,10 +1193,10 @@ static int __maybe_unused
> dpu_runtime_resume(struct device *dev)
>
>          ddev = dpu_kms->dev;
>
> +       WARN_ON(!(dpu_kms->num_paths));
>          /* Min vote of BW is required before turning on AXI clk */
>          for (i = 0; i < dpu_kms->num_paths; i++)
> -               icc_set_bw(dpu_kms->path[i], 0,
> -                       dpu_kms->catalog->perf.min_dram_ib);
> +               icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
>
> After this, we moved to a hard-coded value, I am not sure why.
>
> So nothing wrong with this change as such, the only question is whether
> this value is correct for older chips.
>
> But the question here is, are older chips even using icc.
>
> It seems like only sc7180, RB3/RB5 are unless i am mistaken.

We are not using it for msm8916 (but we should most probably). And for
the msm8996 the icc patches were by Yassine.

> So is there really any impact to the older chips with this change.
>
> If not, we should probably let this one go ahead and move back to
> catalog based approach while extending ICC for older chips.

Let's get this sorted out. I'm fine with 400 MBps, if that works for
all chipsets.

-- 
With best wishes
Dmitry
