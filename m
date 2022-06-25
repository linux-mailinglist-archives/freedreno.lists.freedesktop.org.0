Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B7555A821
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 10:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D092C11A5FB;
	Sat, 25 Jun 2022 08:48:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0690F11A5F4
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 08:48:37 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id b125so3447289qkg.11
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GwAWG5aNymIe8GONpxgKHM0TD4mxy/BWPypQDwrjLVo=;
 b=GPpGfz/knOT3/AjER09tzOY1PgbZVeV/eCZzbZtGCN+uJdwy1zEFWSj9Mfp5FD35Q5
 Nxc77DRAeOcEyf6dGCFNAlysNjiykzlIKp5pn+COoSkeR3+kRnqSvhmGTtvLgiS/9b7L
 W80J0/W6lbR1l0HVWk3cp8yTbjziiKPAF800uis5Vprtlic6lnk7dZqikXUpnU2WeQ/M
 HVxZuH7b591RgdKfz6LwpX1L4dU9NoOe2AO5+jSmhnlMhHA9SOgE60XgsljAO+ja2yf9
 qIsa1x8Ndz0GbhStTCzVQO4LZu90tCxRz48rySqBiYdJIn9TCsHvAMzYvtwXw2x49CzG
 VugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GwAWG5aNymIe8GONpxgKHM0TD4mxy/BWPypQDwrjLVo=;
 b=VKeR5BLENn7HpTZi/XEK0KM+pjTDjWHycvdC2IxKTi4P2+vJC9bM4QGuilXhb/wYB/
 2GEQFPk9nl3N/LybWwj21uuhBIu67kEqFJ+DH3iZ1McWXl9NtSxI6H0Jqcf1/sDPvx08
 adZ2DBfNE1dXoIFxgrdWWsmgPCiNP3sokyZtYdqwRWjLN0V7J5uwYP3wLA7oMgioAs1M
 e4KtZI1lnqkLoJv/dMZtQSmJ2btmzFy5/rv2gY5APdPudhqqkCwF8YPI+PuWEuT6pQMs
 InVcWelPsTNojn4y+XWon0nA5gHJMiwY0zBR7nzbkNQqFfs8gJbO5GnyOd8uIzCTwgU2
 lUOg==
X-Gm-Message-State: AJIora/b0V7OWL4TjDo+JzxWT2j2PCqsWHhVuUwTgj30DxyN3pYuf8UY
 WWuMDAaR7/SNnsOeat+bcf2CQJuFiSpXpW2coV3osA==
X-Google-Smtp-Source: AGRyM1u16jRrSTlBD4cKdLquQJhMiuhvjfK/cJx2+pLsiqrF9JIae2Lil6WCLqGl0uJCrZPslZuCBSr1t08kFR+rUq4=
X-Received: by 2002:a05:620a:2a0e:b0:6a7:8346:1601 with SMTP id
 o14-20020a05620a2a0e00b006a783461601mr2062914qkp.593.1656146916001; Sat, 25
 Jun 2022 01:48:36 -0700 (PDT)
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
In-Reply-To: <6523e533-960b-d148-0f87-2ad327a3ac3b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 11:48:24 +0300
Message-ID: <CAA8EJprQBnZAc-2AxXD8cV_qMoKrusNa+VSHW9Kw-xKS_ZWAkg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, airlied@linux.ie,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, robdclark@gmail.com, agross@kernel.org,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 04:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 6/24/2022 5:11 PM, Dmitry Baryshkov wrote:
> > On Sat, 25 Jun 2022 at 03:03, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >> On 6/24/2022 4:56 PM, Kuogee Hsieh wrote:
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index dcd80c8a794c..7816e82452ca 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -140,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg = {
> >>
> >>    static const struct msm_dp_config sc7280_dp_cfg = {
> >>           .descs = (const struct msm_dp_desc[]) {
> >> -               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
> >> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> >>                   [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000,
> >> .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> >> +               [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000,
> >> .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> >>           },
> >>           .num_descs = 2,
> >>    };
> >>
> >>
> >> The reason order is important is because  in this function below, even
> >> though it matches the address to find which one to use it loops through
> >> the array and so the value of *id will change depending on which one is
> >> located where.
> >>
> >> static const struct msm_dp_desc *dp_display_get_desc(struct
> >> platform_device *pdev,
> >>                                unsigned int *id)
> >> {
> >>       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> >>       struct resource *res;
> >>       int i;
> >>
> >>       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>       if (!res)
> >>           return NULL;
> >>
> >>       for (i = 0; i < cfg->num_descs; i++) {
> >>           if (cfg->descs[i].io_start == res->start) {
> >>               *id = i;
> >
> > The id is set to the index of the corresponding DP instance in the
> > descs array, which is MSM_DP_CONTROLLER_n. Correct up to now.
>
> Right, this is where I misunderstood his explanation.
>
> Even if we swap the order, but retain the index correctly it will still
> work today.
>
> Hes not sure of the root-cause of why turning on the primary display
> first fixes the issue.
>
> I think till we root-cause that, lets put this on hold.

Agreed. Let's find the root cause.


-- 
With best wishes
Dmitry
