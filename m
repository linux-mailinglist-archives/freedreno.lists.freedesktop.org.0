Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9255A44D
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 00:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0910EAF2;
	Fri, 24 Jun 2022 22:19:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A06010E7A9
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 22:19:13 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-101dc639636so5596861fac.6
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 15:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=CyvBY3o6akwDhbTyUnp7S1ZlB8cDpp5Z1nlTYcNTFxU=;
 b=auGjjc0Mj0VFveoavb01xQCfpkr+jD11y+oq6aS0lfPFoo2Qoe784OKRry3x4sZRLO
 pwv+0hCmGexeAavPgfq+10X+qBzoMtcKHMKAMlu7nT4fpInzFMGHcPs+ugPK/AEHHmqu
 RkDn1P3TXhxU/boNeBoIdAEb7yO/fom6ZEX88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=CyvBY3o6akwDhbTyUnp7S1ZlB8cDpp5Z1nlTYcNTFxU=;
 b=bYd0/KMxT7IExeTkQMoS1uPC++lUtXYc7+E0PzIg70s9d0lQLM45Qdyl1wa/CcOj+f
 SqzbS1aPMVH1Pahvtt+yE2X8+yAZjlvEKpCmr0Co8bzACpytk8Z6dXwm4EN6s7W/MGAl
 pPXJx+qClgAHicK/mGg+4OMBAbiCoD8xw+8kdCbFQZGwqoGYBuLUvAbi83BQfh+VAyW3
 DSokQC0pYZyHZwSirrEJQDUj5dy02XyIv/8ssvqAS43wRb5VjDnSlKktYTygN3/QNa/J
 Ii1V3XAK8VKr1QF2c71G6nj3EyD2eYWItAP4tHJ53hhpe1+dwW3bGAz6ZJORwfBSOXBs
 5joA==
X-Gm-Message-State: AJIora9xkVCD8hQQI6a7+gux4uPsOdCSGhkCmqOnnVhQ360MUmdQpPLd
 9ExeyfcooZzNMLgKjRU0g5XN6S6YqNopsEaPwa4M2A==
X-Google-Smtp-Source: AGRyM1ta9IChV8i9AY3F7HqXJ7U2xfER4Z9xoWBB3POe6nuFgx0iOlcYkdI2qbn3ObkLqTjmum1sin2idrz6vVpTVgM=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr810637oap.63.1656109152273; Fri, 24 Jun
 2022 15:19:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 15:19:11 -0700
MIME-Version: 1.0
In-Reply-To: <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 15:19:11 -0700
Message-ID: <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-24 14:49:57)
>
> On 6/24/2022 2:40 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-06-24 14:17:50)
> >> On 6/24/2022 1:00 PM, Stephen Boyd wrote:
> >>> Quoting Kuogee Hsieh (2022-06-24 10:15:11)
> >>>> Current the index (dp->id) of DP descriptor table (scxxxx_dp_cfg[]) =
are tightly
> >>>> coupled with DP controller_id. This means DP use controller id 0 mus=
t be placed
> >>>> at first entry of DP descriptor table (scxxxx_dp_cfg[]). Otherwise t=
he internal
> >>>> INTF will mismatch controller_id. This will cause controller kickoff=
 wrong
> >>>> interface timing engine and cause dpu_encoder_phys_vid_wait_for_comm=
it_done
> >>>> vblank timeout error.
> >>>>
> >>>> This patch add controller_id field into struct msm_dp_desc to break =
the tightly
> >>>> coupled relationship between index (dp->id) of DP descriptor table w=
ith DP
> >>>> controller_id.
> >>> Please no. This reverts the intention of commit bb3de286d992
> >>> ("drm/msm/dp: Support up to 3 DP controllers")
> >>>
> >>>       A new enum is introduced to document the connection between the
> >>>       instances referenced in the dpu_intf_cfg array and the controll=
ers in
> >>>       the DP driver and sc7180 is updated.
> >>>
> >>> It sounds like the intent of that commit failed to make a strong enou=
gh
> >>> connection. Now it needs to match the INTF number as well? I can't
> >>> really figure out what is actually wrong, because this patch undoes t=
hat
> >>> intentional tight coupling. Is the next patch the important part that
> >>> flips the order of the two interfaces?
> >> The commit bb3de286d992have two problems,
> >>
> >> 1)=C2=A0 The below sc7280_dp_cfg will not work, if eDP use
> >> MSM_DP_CONTROLLER_2 instead of=C2=A0 MSM_DP_CONTROLLER_1
> > Why would we use three indices for an soc that only has two indices
> > possible? This is not a real problem?
>
> I do not what will happen at future, it may have more dp controller use
> late.
>
> at current soc, below table has only one eDP will not work either.
>
> static const struct msm_dp_config sc7280_dp_cfg =3D {
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .descs =3D (const struct msm=
_dp_desc[]) {
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [MSM_DP_CONTROLLER_1] =3D { .io_start =3D 0x0aea0000,
> .connector_type =3D DRM_MODE_CONNECTOR_eDP, .wide_bus_en =3D true },
>
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_descs =3D 1,

So the MSM_DP_CONTROLLER_* number needs to match what exactly?

>
> >
> >> since it have num_descs =3D2 but eDP is at index 2 (CONTROLLER_2) whic=
h
> >> never be reached.
> >>
> >> static const struct msm_dp_config sc7280_dp_cfg =3D {
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .descs =3D (const struct =
msm_dp_desc[]) {
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 [MSM_DP_CONTROLLER_2] =3D { .io_start =3D 0x0aea00=
00,
> >> .connector_type =3D DRM_MODE_CONNECTOR_eDP, .wide_bus_en =3D true },
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 [MSM_DP_CONTROLLER_0] =3D { .io_start =3D 0x0ae900=
00,
> >> .connector_type =3D DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en =3D t=
rue },
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_descs =3D 2,
> >> };
> >>
> >> 2)=C2=A0 DP always has index of 0 (dp->id =3D 0) and the first one to =
call
> >> msm_dp_modeset_init(). This make DP always place at head of bridge cha=
in.
> > What does this mean? Are you talking about the list of bridges in drm
> > core, i.e. 'bridge_list'?
> yes,

I changed the drm_bridge_add() API and that doesn't make any difference.
The corruption is still seen. That would imply it is not the order of
the list of bridges.

---8<---
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e275b4ca344b..e3518101b65e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -165,7 +165,7 @@ void drm_bridge_add(struct drm_bridge *bridge)
 	mutex_init(&bridge->hpd_mutex);

 	mutex_lock(&bridge_lock);
-	list_add_tail(&bridge->list, &bridge_list);
+	list_add(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
 }
 EXPORT_SYMBOL(drm_bridge_add);

> >
> >> At next patch eDP must be placed at head of bridge chain to fix eDP
> >> corruption issue. This is the purpose of this patch. I will revise the
> >> commit text.
> >>
> > Wouldn't that be "broken" again if we decided to change drm_bridge_add(=
)
> > to add to the list head instead of list tail? Or if somehow
> > msm_dp_modeset_init() was called in a different order so that the DP
> > bridge was added before the eDP bridge?
>
> we have no control of drm_bridge_add().
>
> Since drm perform screen update following bridge chain sequentially, we
> have to make sure primary always update first.
>
