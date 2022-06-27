Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B855BC74
	for <lists+freedreno@lfdr.de>; Tue, 28 Jun 2022 01:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD26710E46F;
	Mon, 27 Jun 2022 23:20:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE87B10E43E
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 23:20:25 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id n8so1217171eda.0
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 16:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Spj1S0nEmr3mdqe+SBysZnlIvOHa+5hXVGG2oJZ/gY4=;
 b=gw3JBCSK7pUmYmcwcMUIWMn5+CWQcbCcDcRx8oxASvz6jD1mczE+qT/ZBB96doH0dX
 qxC84Qwu/KkCO1VhbGAoN9YlrzNXn09yMegVa/n1J8QvW3Q3oJx4knBJfVyM5HtrHzZJ
 Ev5mkfHH/F3gv31lSwwOzmPUd433yiR6r7Vq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Spj1S0nEmr3mdqe+SBysZnlIvOHa+5hXVGG2oJZ/gY4=;
 b=fYbLmZc6fk9UruCo871W1egRs5SI/SsyvGbDSkmPJ6Fvbp1Ubck0r5ac0DdLSnjE9I
 dd2sr0oxBPx59bMv8hdoV36X7BR0YFCsUR+nsjNFBMnbSQExgIDlHYa8aUqbjWeGvQgT
 ATpfxpBngr7/qQKPdBcDhb927F3FhEzD2N7eAeIDPpBen2+nlBQQA5BVPsgccxPhmFG7
 k269H/zfhNtrFyC0XXaBhj8XE0i0YJ25l/Uj37t+Ae9RUmwE/DNpM21nDhILM/uI2hAI
 IhrjtfvOdGsCzuDhwax8deZRxxbXxtdgsHzlg7YgigiBM+cK5VvS85kcXqJFeWpayhxc
 XyLA==
X-Gm-Message-State: AJIora8sjOJoklp1IuCzPLw82qDC4CVIexQ1OehOcMRvtncizy/ihvLF
 1mvh9QUcz4gz0b1Xije+p17s469zj5YCVSXz
X-Google-Smtp-Source: AGRyM1vDnLugnpHGXvFttLe9++nPNIWHDDCDccGcM1/tcbwODf/SFw9ugMz6fi4eu6rhC2zIHAmukA==
X-Received: by 2002:a05:6402:5ce:b0:435:65f3:38c2 with SMTP id
 n14-20020a05640205ce00b0043565f338c2mr20295146edx.347.1656372023945; 
 Mon, 27 Jun 2022 16:20:23 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 i10-20020a170906698a00b00705fa7087bbsm5605648ejr.142.2022.06.27.16.20.21
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 16:20:22 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 o19-20020a05600c4fd300b003a0489f414cso2988756wmq.4
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 16:20:21 -0700 (PDT)
X-Received: by 2002:a05:600c:5107:b0:3a0:4342:ed75 with SMTP id
 o7-20020a05600c510700b003a04342ed75mr15187921wms.93.1656372020510; Mon, 27
 Jun 2022 16:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <6523e533-960b-d148-0f87-2ad327a3ac3b@quicinc.com>
 <CAA8EJprQBnZAc-2AxXD8cV_qMoKrusNa+VSHW9Kw-xKS_ZWAkg@mail.gmail.com>
In-Reply-To: <CAA8EJprQBnZAc-2AxXD8cV_qMoKrusNa+VSHW9Kw-xKS_ZWAkg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Jun 2022 16:20:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvNrfYaUgbDayxU0wJUbZbgwVMWjeyTjtd+Sqcvj=e2A@mail.gmail.com>
Message-ID: <CAD=FV=WvNrfYaUgbDayxU0wJUbZbgwVMWjeyTjtd+Sqcvj=e2A@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of
 dp controller_id at scxxxx_dp_cfg table
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
Cc: Vinod Koul <vkoul@kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 25, 2022 at 1:48 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 25 Jun 2022 at 04:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > On 6/24/2022 5:11 PM, Dmitry Baryshkov wrote:
> > > On Sat, 25 Jun 2022 at 03:03, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >> On 6/24/2022 4:56 PM, Kuogee Hsieh wrote:
> > >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> > >> b/drivers/gpu/drm/msm/dp/dp_display.c
> > >> index dcd80c8a794c..7816e82452ca 100644
> > >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > >> @@ -140,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg = {
> > >>
> > >>    static const struct msm_dp_config sc7280_dp_cfg = {
> > >>           .descs = (const struct msm_dp_desc[]) {
> > >> -               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
> > >> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > >>                   [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000,
> > >> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> > >> +               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
> > >> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > >>           },
> > >>           .num_descs = 2,
> > >>    };
> > >>
> > >>
> > >> The reason order is important is because  in this function below, even
> > >> though it matches the address to find which one to use it loops through
> > >> the array and so the value of *id will change depending on which one is
> > >> located where.
> > >>
> > >> static const struct msm_dp_desc *dp_display_get_desc(struct
> > >> platform_device *pdev,
> > >>                                unsigned int *id)
> > >> {
> > >>       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> > >>       struct resource *res;
> > >>       int i;
> > >>
> > >>       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > >>       if (!res)
> > >>           return NULL;
> > >>
> > >>       for (i = 0; i < cfg->num_descs; i++) {
> > >>           if (cfg->descs[i].io_start == res->start) {
> > >>               *id = i;
> > >
> > > The id is set to the index of the corresponding DP instance in the
> > > descs array, which is MSM_DP_CONTROLLER_n. Correct up to now.
> >
> > Right, this is where I misunderstood his explanation.
> >
> > Even if we swap the order, but retain the index correctly it will still
> > work today.
> >
> > Hes not sure of the root-cause of why turning on the primary display
> > first fixes the issue.
> >
> > I think till we root-cause that, lets put this on hold.
>
> Agreed. Let's find the root cause.

FWIW, I was poking a little bit about the glitch that Kuogee was
trying to fix here. Through a bunch of hacky heuristics I think the
dpu_hw_ctl_trigger_flush_v1() is the function that "causes" the
corruption. Specifically I managed to do something like:

if (hacky_heuristic)
  pr_info("About to call flush\n);
  mdelay(2000);
}
ctl->ops.trigger_flush(ctl)
if (hacky_heuristic)
  pr_info("Finished calling flush\n);
  mdelay(2000);
  pr_info("Finished calling flush delay done\n);
}

I then watched my display and reproduced the problem. When I saw the
problem I looked over at the console and saw "Finished calling flush"
was the last thing printed.

I don't know if this helps much. Presumably we're flushing a bunch of
previous operations so whatever we had queued up probably matters
more, but maybe it'll give a clue?


Other notes FWIW:

* If you increase the amount of time of the glitching, you can
actually see that we are glitching both the internal and external
displays.

* You can actually make the glitch stay on the screen "permanently" by
unplugging the external display while the internal screen is off. I
don't know why it doesn't always happen, but it seems to happen often
enough. Presumably if someone knew the display controller well they
could try to figure out what state it was in and debug the problem.


-Doug
