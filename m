Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B05614CC0
	for <lists+freedreno@lfdr.de>; Tue,  1 Nov 2022 15:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB5610E3DA;
	Tue,  1 Nov 2022 14:37:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110CD10E3D4
 for <freedreno@lists.freedesktop.org>; Tue,  1 Nov 2022 14:37:50 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id u24so12815087edd.13
 for <freedreno@lists.freedesktop.org>; Tue, 01 Nov 2022 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SgtoTIoJy9S3cxUJ6sw0M4fPt26RITcHwkYCKl6O/Bg=;
 b=JeHW0fb1128o+sH7HJOn49rh8Qwx7I8XiydSY//3MQLwswILpjmk87sU+vpVYKg/6o
 sD1zjXUyKoTbzPnH0FL5Yqar7+iW/pxN3F8RK7366udxwZPeWHVgzzRy5aiMEQL1jFC/
 KDwoonlGYhpqxY0pl9rj9cWtAh9J6e7eB9fT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SgtoTIoJy9S3cxUJ6sw0M4fPt26RITcHwkYCKl6O/Bg=;
 b=3e7qZnZaMmCf9yPcvUPLDQIfphWCZiZ4LxGb42UXhiFXA86rj8wD7q0rhqCn3VV6Bo
 f+PJudY32u/3QbNEXuPPwdDOTlGR5UY1Z213H0ubW1V4ZdNG6FaKdrPO8vMdTbetCjer
 1Obs4ulzjl1K8g/OvDxgO1xqNFxNBmcXXMDczKlWE9v+fL26EoNKgDqWRZ5H7hKDVk3g
 g4IrUeCU6OCCGNECc/e8hHvsbuVIcysKqAN1deqrgp9EZzs1U6vk9iUF2VSan1lo3uO/
 NTCkv9T8gB0PwpzgjpFJmvIUTfFG30lyZU9jUApplX8RoHY2WGgZLo/4S3R25mww5YCV
 RAPw==
X-Gm-Message-State: ACrzQf3sGWR5L/g21F1Jp9zYkME5uo6D8eqSCXBrrcw6lyedcsM7F1xa
 wd8Sq+ITh33LaIfHPn3E90RbrH1JBsWSdJDC
X-Google-Smtp-Source: AMsMyM6COjSR3013NmDNKCLltCb6JvIwnT1XCVwfQpZHoavjrgt8SXNsxTRkv4uOvRog6uvlfdltfA==
X-Received: by 2002:aa7:da42:0:b0:461:9465:b019 with SMTP id
 w2-20020aa7da42000000b004619465b019mr20074600eds.144.1667313468145; 
 Tue, 01 Nov 2022 07:37:48 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 r10-20020a17090609ca00b00780ab5a9116sm4229534eje.211.2022.11.01.07.37.46
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 07:37:46 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id j15so20447188wrq.3
 for <freedreno@lists.freedesktop.org>; Tue, 01 Nov 2022 07:37:46 -0700 (PDT)
X-Received: by 2002:adf:d1ec:0:b0:236:880f:2adf with SMTP id
 g12-20020adfd1ec000000b00236880f2adfmr11978578wrd.617.1667313466088; Tue, 01
 Nov 2022 07:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <1667237245-24988-1-git-send-email-quic_khsieh@quicinc.com>
 <94b507e8-5b94-12ae-4c81-95f5d36279d5@linaro.org>
 <deb60200-5a37-ec77-9515-0c0c89022174@quicinc.com>
 <CAD=FV=X_fs_4JYcRvAwkU9mAafOten9WdyzPfSVWdAU=ZMo8zg@mail.gmail.com>
 <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org>
In-Reply-To: <155e4171-187c-4ecf-5a9b-12f0c2207524@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Nov 2022 07:37:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
Message-ID: <CAD=FV=Wk5rBSq9Mx1GCO0QFYckKV9KUFKL36Ld7dQX1ypHVcYw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove limitation of link rate
 at 5.4G to support HBR3
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 robdclark@gmail.com, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Oct 31, 2022 at 5:15 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 01/11/2022 03:08, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Oct 31, 2022 at 2:11 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>
> >> Hi Dmitry,
> >>
> >>
> >> Link rate is advertised by sink, but adjusted (reduced the link rate)
> >> by host during link training.
> >>
> >> Therefore should be fine if host did not support HBR3 rate.
> >>
> >> It will reduce to lower link rate during link training procedures.
> >>
> >> kuogee
> >>
> >> On 10/31/2022 11:46 AM, Dmitry Baryshkov wrote:
> >>> On 31/10/2022 20:27, Kuogee Hsieh wrote:
> >>>> An HBR3-capable device shall also support TPS4. Since TPS4 feature
> >>>> had been implemented already, it is not necessary to limit link
> >>>> rate at HBR2 (5.4G). This patch remove this limitation to support
> >>>> HBR3 (8.1G) link rate.
> >>>
> >>> The DP driver supports several platforms including sdm845 and can
> >>> support, if I'm not mistaken, platforms up to msm8998/sdm630/660.
> >>> Could you please confirm that all these SoCs have support for HBR3?
> >>>
> >>> With that fact being confirmed:
> >>>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>>
> >>>>
> >>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_panel.c | 4 ----
> >>>>    1 file changed, 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> index 5149ceb..3344f5a 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> @@ -78,10 +78,6 @@ static int dp_panel_read_dpcd(struct dp_panel
> >>>> *dp_panel)
> >>>>        if (link_info->num_lanes > dp_panel->max_dp_lanes)
> >>>>            link_info->num_lanes = dp_panel->max_dp_lanes;
> >>>>    -    /* Limit support upto HBR2 until HBR3 support is added */
> >>>> -    if (link_info->rate >=
> >>>> (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> >>>> -        link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> >>>> -
> >>>>        drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> >>>>        drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> >>>>        drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
> >>>> link_info->num_lanes);
> >
> > Stephen might remember better, but I could have sworn that the problem
> > was that there might be something in the middle that couldn't support
> > the higher link rate. In other words, I think we have:
> >
> > SoC <--> TypeC Port Controller <--> Display
> >
> > The SoC might support HBR3 and the display might support HBR3, but the
> > TCPC (Type C Port Controller) might not. I think that the TCPC is a
> > silent/passive component so it can't really let anyone know about its
> > limitations.
> >
> > In theory I guess you could rely on link training to just happen to
> > fail if you drive the link too fast for the TCPC to handle. Does this
> > actually work reliably?
> >
> > I think the other option that was discussed in the past was to add
> > something in the device tree for this. Either you could somehow model
> > the TCPC in DRM and thus know that a given model of TCPC limits the
> > link rate or you could hack in a property in the DP controller to
> > limit it.
>
> Latest pmic_glink proposal from Bjorn include adding the drm_bridge for
> the TCPC. Such bridge can in theory limit supported modes and rates.

Excellent! Even so, I think this isn't totally a solved problem,
right? Even though a bridge seems like a good place for this, last I
remember checking the bridge API wasn't expressive enough to solve
this problem. A bridge could limit pixel clocks just fine, but here we
need to take into account other considerations to know if a given
pixel clock can work at 5.4 GHz or not. For instance, if we're at 4
lanes we could maybe make a given pixel clock at 5.4 GHz but not if we
only have 2 lanes. I don't think that the DP controller passes the
number of lanes to other parts of the bridge chain, though maybe
there's some trick for it?

...I guess the other problem is that all existing users aren't
currently modeling their TCPC in this way. What happens to them?

-Doug
