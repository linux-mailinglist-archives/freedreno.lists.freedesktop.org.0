Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA78707117
	for <lists+freedreno@lfdr.de>; Wed, 17 May 2023 20:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0184B10E245;
	Wed, 17 May 2023 18:49:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B100410E245
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 18:49:03 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-559de1d36a9so12557337b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684349342; x=1686941342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PjCzP3OsnAlJ4zycHQiFOaIzzYirGdCJl26HQltsXhg=;
 b=tmo5ze1nXBQxtwU1JIEtuoFDXbJgQ4qzHnc4WmBAUTTssg5iRVTr3GH1BDhX3EZW2s
 XMrSLi+cpD2DyoRyu4sjcf1r1Mi6J90z0aTEWrJawfz8Ii/v9dcKceVTOhZjsCgne4/N
 5/O+sN9qMt8zKwkrzNqDd1B8GvYvT5gma6X+lEFAs/x2rLweCNQC1+5rk3SVH6Su7ihu
 RSOMzmP6U86qrkKED95sEY/CK+m5z27pUTcKzrLPHA1PNNpaiTTM3/qPzi923lYVvkSY
 H8eKUdEINHaIsYQ89tX4/5HNY9Y3iWzIhlwjm4crOG5vUZQr2iMg1mQbRiqeHWVuZ2aU
 Up2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684349342; x=1686941342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PjCzP3OsnAlJ4zycHQiFOaIzzYirGdCJl26HQltsXhg=;
 b=dDC0i9Lv5X6pPSl5GS1FEiaQadKc3Vc4vIUwPcry+4KezZSHPns1U4baJhRpMif3Zg
 FWMzx/tNqTOoL5D/Vk0vFuaivJaKKbfejv2DZEYAaAb79zPLWxo7psyW3DmAOtnQ/WMH
 WfLdcRYLuzZTyWkRBTwR+wzzzc4JVhACGxYDwoCGITY3vhdpF7glukdhlKml/vCdGYSy
 5j7EfeLJS/88dmsK0y/k79UWsHNB98QuzSEmAICFxEHgOdBFQO3cPPjKR8wqRLc6hInl
 u26x3dPZPkSgSBvkP0gBc0y0pf+JJOZGMtgQniwmy/CxExDNMWdAEvQtn257JxNjaZ8M
 RZnA==
X-Gm-Message-State: AC+VfDxjeuHD8n7vsQkUBolIFiCCfI0NhLEEpV2VVtWhrYR0GQDWMH2+
 jYaTcD+6JN3r56+WeV0qecDVFAgBxQ51jkcud61N/g==
X-Google-Smtp-Source: ACHHUZ6bbf9rwAlEixsmlO/i6cs+C7yHcM+ljyru6ukwZ0ya4ZVc8XCJQGVikzndS4sUdAArY1vdcOVL2fFmp1RHaNE=
X-Received: by 2002:a81:88c2:0:b0:55a:7c7:7be1 with SMTP id
 y185-20020a8188c2000000b0055a07c77be1mr36000828ywf.22.1684349342230; Wed, 17
 May 2023 11:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprtQF0x_LCOTrt5bvRnJ+xRz6QxLF6QAP-4Pff6V5TJ2g@mail.gmail.com>
 <20230511155331.2jmfe7xcs5tihdgb@ripper>
 <5ef83699-01de-d062-6239-9bb834c70458@linaro.org>
 <8ac0b5f5-27da-2b28-8f10-b2fca447511a@quicinc.com>
 <CAA8EJpokAoGni7vNwuijs7EvmjCweO3pgChij3Qx3OUkVTVpiQ@mail.gmail.com>
 <cf8b7c38-b716-e44a-86e5-d65ba7fa2869@quicinc.com>
 <CAA8EJprN7Kp_NdBi9NHqheDdgEhj=3gyBRwr5ufTSH47P9L_-Q@mail.gmail.com>
 <0456cbfe-66bf-9cc3-16ca-a85be603af01@quicinc.com>
 <2d1fad81-c1dc-77db-de67-caf130af9767@quicinc.com>
 <6a2d1417-7333-7f8c-af87-628e5977aad6@linaro.org>
 <4a904c23-77b9-283d-ff6b-606f5a2606cb@quicinc.com>
 <02a63057-5c2a-5e26-d8e0-95a2c49a5e5e@linaro.org>
 <094834a4-d7c2-64d4-7658-cf039f8c7d69@quicinc.com>
In-Reply-To: <094834a4-d7c2-64d4-7658-cf039f8c7d69@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 May 2023 21:48:50 +0300
Message-ID: <CAA8EJpoF2OhUJhcJ=R+ecSQvLjLMq_yZksjx5Lz=uuSnvt6mkg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 1/2] drm/msm/dp: enable HDP
 plugin/unplugged interrupts to hpd_enable/disable
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 17 May 2023 at 20:42, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 5/16/2023 4:20 PM, Dmitry Baryshkov wrote:
> > On 17/05/2023 01:35, Abhinav Kumar wrote:
> >>
> >>
> >> On 5/16/2023 6:50 AM, Dmitry Baryshkov wrote:
> >>> On 13/05/2023 00:28, Abhinav Kumar wrote:
> >>>> Hi Bjorn and Dmitry
> >>>>
> >>>> On 5/12/2023 12:34 PM, Kuogee Hsieh wrote:
> >>>>>
> >>>>> On 5/12/2023 10:28 AM, Dmitry Baryshkov wrote:
> >>>>>> On Fri, 12 May 2023 at 19:52, Kuogee Hsieh
> >>>>>> <quic_khsieh@quicinc.com> wrote:
> >>>>>>>
> >>>>>>> On 5/11/2023 5:54 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Fri, 12 May 2023 at 03:16, Kuogee Hsieh
> >>>>>>>> <quic_khsieh@quicinc.com> wrote:
> >>>>>>>>> On 5/11/2023 8:57 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On 11/05/2023 18:53, Bjorn Andersson wrote:
> >>>>>>>>>>> On Thu, May 11, 2023 at 07:24:46AM +0300, Dmitry Baryshkov
> >>>>>>>>>>> wrote:
> >>>>>>>>>>>> On Wed, 10 May 2023 at 23:31, Kuogee Hsieh
> >>>>>>>>>>>> <quic_khsieh@quicinc.com>
> >>>>>>>>>>>> wrote:
> >>>>>>>>>>>>> The internal_hpd flag was introduced to handle external DP
> >>>>>>>>>>>>> HPD
> >>>>>>>>>>>>> derived from GPIO
> >>>>>>>>>>>>> pinmuxed into DP controller. HPD plug/unplug interrupts
> >>>>>>>>>>>>> cannot be
> >>>>>>>>>>>>> enabled until
> >>>>>>>>>>>>> internal_hpd flag is set to true.
> >>>>>>>>>>>>> At both bootup and resume time, the DP driver will enable
> >>>>>>>>>>>>> external DP
> >>>>>>>>>>>>> plugin interrupts and handle plugin interrupt accordingly.
> >>>>>>>>>>>>> Unfortunately
> >>>>>>>>>>>>> dp_bridge_hpd_enable() bridge ops function was called to set
> >>>>>>>>>>>>> internal_hpd
> >>>>>>>>>>>>> flag to true later than where DP driver expected during
> >>>>>>>>>>>>> bootup time.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> This causes external DP plugin event to not get detected and
> >>>>>>>>>>>>> display stays blank.
> >>>>>>>>>>>>> Move enabling HDP plugin/unplugged interrupts to
> >>>>>>>>>>>>> dp_bridge_hpd_enable()/disable() to
> >>>>>>>>>>>>> set internal_hpd to true along with enabling HPD
> >>>>>>>>>>>>> plugin/unplugged
> >>>>>>>>>>>>> interrupts
> >>>>>>>>>>>>> simultaneously to avoid timing issue during bootup and
> >>>>>>>>>>>>> resume.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable
> >>>>>>>>>>>>> callbacks")
> >>>>>>>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>>>>>>>>> Thanks for debugging this!
> >>>>>>>>>>>>
> >>>>>>>>>>>> However after looking at the driver I think there is more
> >>>>>>>>>>>> than this.
> >>>>>>>>>>>>
> >>>>>>>>>>>> We have several other places gated on internal_hpd flag,
> >>>>>>>>>>>> where we do
> >>>>>>>>>>>> not have a strict ordering of events.
> >>>>>>>>>>>> I see that dp_hpd_plug_handle() and dp_hpd_unplug_handle()
> >>>>>>>>>>>> also toggle
> >>>>>>>>>>>> DP_DP_IRQ_HPD_INT_MASK and DP_DP_HPD_REPLUG_INT_MASK
> >>>>>>>>>>>> depending on
> >>>>>>>>>>>> internal_hpd. Can we toggle all 4 interrupts from the
> >>>>>>>>>>>> hpd_enable/hpd_disable functions? If we can do it, then I
> >>>>>>>>>>>> think we can
> >>>>>>>>>>>> drop the internal_hpd flag completely.
> >>>>>>>>>>>>
> >>>>
> >>>> No we cannot. The HPD logic works in a flip-flop model. When we get
> >>>> the plug interrupt, we need to flip to tell the hw to wait for
> >>>> unplug and when we get unplug, we need to tell the hw to wait for
> >>>> plug.
> >>>
> >>> But, doesn't dp_display_config_hpd() (current code) or
> >>> dp_bridge_hpd_enable() (after this patch) enable both plug and
> >>> unplug interrupts? This doesn't fit well into the flip-flop
> >>> description.
> >>>
> >>
> >> Let me clarify / correct the response. Ideally thats what is usually
> >> done to wait for disconnect when we get connect and vice-versa. HDMI
> >> still does it the same way.
> >>
> >> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c#L196
> >>
> >
> > So, HDMI HPD is real flip-flop, sounds fine.
> >
> >>
> >> But I checked with kuogee that DP always enabled HPD connect and
> >> disconnect interrupts by default and he mentioned its mainly because
> >> we wanted to enable HPD connect / disconnect by default but not the
> >> others.
> >>
> >> That being said, the logic is close to flip-flop that when you get a
> >> connect event, you wait for the "other" interrupts which are possible
> >> which is IRQ_HPD and REPLUG and during disconnect, those are not
> >> possible so disable them. Thats why the calls to
> >> dp_catalog_hpd_config_intr() are present in the plug_handle /
> >> unplug_handle to enable the "other possible" interrupts.
> >
> > Can we keep them always enabled? Are these interrupts edge-triggered
> > or level-triggered? What prevents us from enabling these interrupts
> > all the time? Or enabling all 4 interrupts in hpd_enable() and
> > disabling them in hpd_disable()? Can IRQ_HPD or REPLUG fire when the
> > cable is disconnected?
>
> > 1) edge-trigger at hpd pin low. However hpd block will start
> > debouncing logic and set status bit (plug, unplug, hpd_irq ore replug)
> > properly base on the result of debunce.
>
> 2) there should be fine to have all interrupts enabled
>
> 3) IRQ_HPD and REPLUG will not happen when disconnected.
>
>
> >>
> >> The logic from dp_display_config_hpd() is getting removed in this
> >> patch, in case you didnt check to align just with hpd_enable /
> >> hpd_disable callbacks.
> >
> > I saw this. The code is being moved to dp_bridge_hpd_enable(), as I
> > mentioned in the email.
> >
> >>
> >>>>
> >>>> The two calls in plug_handle() / unplug_handle() are doing that
> >>>> whereas hpd_enable/hpd_disable are disabling the hpd interrupts
> >>>> altogether.
> >>>>
> >>>> In other words, we cannot rely on hpd_enable() / hpd_disable()
> >>>> calls to do the flip part as that has to be done every plug/unplug.
> >>>> In addition we need to handle the compliance test cases with REPLUG.
> >>>
> >>> Thank you for the explanation. Would it be possible to keep
> >>> mask/unmask, but make hpd_enable/hpd_disable toggle
> >>> DP_DP_HPD_CTRL_HPD_EN instead?
> >>>
> >>
> >> Yes, this should be possible but we would like to test this. But what
> >> about the interrupt masks then. So you are saying, hpd_enable will
> >> only toggle the DP_DP_HPD_CTRL_HPD_EN but leave the HPD connect and
> >> disconnect interrupts intact? That also doesnt sound right.
> >>
> >> enabling the block all the time and then toggling the interrupt masks
> >> seemed like a better thing.
> >
> > Why? We do not need the block outside of the
> > hpd_enable()/hpd_disable() pair. Even from the power consumption
> > perspective, disabling the unused block sounds better to me.
>
>
> We are mean within the block of hpd_enabled and hdp_disabled pair,
>
> At hpd_enabled, we will do both item 1) and 2) instead of just only item
> 1) as you mentioned.  you still need power on hpd block to just do item2).
>
> 1) enabled DP_DP_HPD_CTRL_HPD_EN
>
> 2) enable HDP interrupts (plug, unplug, hpd_irq and replug)

If I got you correct (and you are proposing to move
DP_DP_HPD_CTRL_HPD_EN and toggling all 4 interrupts to
hpd_enable/hpd_disable), this should be fine with me. It will allow us
to remove most of the internal_hpd cruft while keeping the logic
functional. I'm looking forward to seeing this patch.

-- 
With best wishes
Dmitry
