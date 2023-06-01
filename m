Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C5071F2B6
	for <lists+freedreno@lfdr.de>; Thu,  1 Jun 2023 21:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F8D10E043;
	Thu,  1 Jun 2023 19:14:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BF010E043
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jun 2023 19:14:10 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-ba8cd61ee2dso3786131276.1
 for <freedreno@lists.freedesktop.org>; Thu, 01 Jun 2023 12:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685646849; x=1688238849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CssJZdLrRZ/V6FVae/m7OqKnsOQwlYYiWk08TJo4VnQ=;
 b=GcCLGEcudNw/dbsQVaGRKXiqMwnTGEiv4gX8egl286jn5JV62pRMGAe306lcNlUMu2
 GiPyPfB07J51hN36TqBOJeQTgm4ubvKJvf+z5izSmyxtGeYh13OxqQZUsk07w23ZZ+J2
 4OY+1npaE+of6gBbU4BJolPFzlmAJg8CB4yqaN5/8TEvcejHr56t3mZoF0KlyJ7YEiqJ
 /UQIoDQEag3tLi5Ad8mDa0GmGTDFCMV9rus/MLsmlvIWiF9yhjYBiEfAaJkWdPjNLHCk
 V36ANA+ZR7JehK8sorXjR9sCicsrbEA0QZUNe0VIKlk9JGozffqnkabDAGY0sJbiNWL2
 fbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685646849; x=1688238849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CssJZdLrRZ/V6FVae/m7OqKnsOQwlYYiWk08TJo4VnQ=;
 b=EWVF1eWgsZ5N8e6T3Uov+51OZ6vr5suoqkv3H2M0xuMxa1VbLtUVC7L5pZNngMkJVi
 jy1+XB3TloIHL2Xxpq0miQXFqp3h7JYyt9DALso2GiTOM6xVpO3zqg9ngK1NM52ONm9O
 Ba1Stc/fr8FPwpLBKQQkbcyclARDs2k4aQrcr+P/QGYB4blf8HKfRyNIBk0yK1VidqNN
 wnLww1rK6b6SIGDJhFeLqR5hXMVdTpDAuKPSUpXREZ4Z9mMpAzRfg40TU+dCHtm1CKpZ
 v/ipZRgpAFVt+v6UlwCIy+M5GKk5lJ/32NBGYaTx65ptns5u+1cMpfRlBJvWMgsYBw/6
 NNWg==
X-Gm-Message-State: AC+VfDz6WXw1z4iVkmPLxpijIeAXHD0UihyDY5Gc2eIR3Sit9onzw4Vq
 et8Sn6TnTXp/AjssAzEQm/Ikl4B5LJthZXZtpvjRtrDK+kE3/Bzg
X-Google-Smtp-Source: ACHHUZ44Q7JQo20oIgXDJLAbfcCYKegCgJuIFwqXkFhdm2NrGejewEBkqkQMyWJNZwsYWfIeCO0u9TCGj1l/9a5Vp5E=
X-Received: by 2002:a25:c504:0:b0:b9e:45e1:75e with SMTP id
 v4-20020a25c504000000b00b9e45e1075emr1005677ybe.28.1685646848925; Thu, 01 Jun
 2023 12:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
 <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
 <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
 <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
 <e69f02b7-eba9-5f33-5ca1-eb0638928414@quicinc.com>
 <CAA8EJpr9dfrrEsFf8heOvG3BWRTVCY-q1QYNH_3OBeMAWEwotA@mail.gmail.com>
 <d1a320c4-d851-ba75-ef7b-80dc369d1cfd@quicinc.com>
In-Reply-To: <d1a320c4-d851-ba75-ef7b-80dc369d1cfd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Jun 2023 22:13:57 +0300
Message-ID: <CAA8EJpqzyYQAg+VXLzttan7zGWv4w+k6kgS2SbRo26hFZ_9Efg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dpu: retrieve DSI DSC struct
 at atomic_check()
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 1 Jun 2023 at 20:37, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 5/31/2023 10:53 AM, Dmitry Baryshkov wrote:
> > On Wed, 31 May 2023 at 20:29, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>
> >> On 5/31/2023 10:12 AM, Dmitry Baryshkov wrote:
> >>> On Wed, 31 May 2023 at 18:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>>>
> >>>>>>     +    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> >>>>> INTF_DSI
> >>>>>
> >>>>>> +        struct drm_bridge *bridge;
> >>>>>> +
> >>>>>> +        if (!dpu_enc->dsc) {
> >>>>> This condition is not correct. We should be updating the DSC even if
> >>>>> there is one.
> >>>>>
> >>>>>> +            bridge = drm_bridge_chain_get_first_bridge(drm_enc);
> >>>>>> +            dpu_enc->dsc = msm_dsi_bridge_get_dsc_config(bridge);
> >>>>> This approach will not work for the hot-pluggable outputs. The dpu_enc
> >>>>> is not a part of the state. It should not be touched before
> >>>>> atomic_commit actually commits changes.
> >>>> where can drm_dsc_config be stored?
> >>> I'd say, get it during atomic_check (and don't store it anywhere).
> >>> Then get it during atomic_enable (and save in dpu_enc).
> >> got it.
> >>>>> Also, I don't think I like the API. It makes it impossible for the
> >>>>> driver to check that the bridge is the actually our DSI bridge or not.
> >>>>> Once you add DP here, the code will explode.
> >>>>>
> >>>>> I think instead we should extend the drm_bridge API to be able to get
> >>>>> the DSC configuration from it directly. Additional care should be put
> >>>>> to design an assymetrical API. Theoretically a drm_bridge can be both
> >>>>> DSC source and DSC sink. Imagine a DSI-to-DP or DSI-to-HDMI bridge,
> >>>>> supporting DSC on the DSI side too.
> >>>> Form my understanding, a bridge contains two interfaces.
> >>>>
> >>>> Therefore I would think only one bridge for dsi-to-dp bridge? and this
> >>>> bridge should represent the bridge chip?
> >>>>
> >>>> I am thinking adding an ops function, get_bridge_dsc() to struct
> >>>> drm_bridge_funcs to retrieve drm_dsc_config.
> >>> So, for this DSI-to-DP bridge will get_bridge_dsc() return DSC
> >>> configuration for  the DSI or for the DP side of the bridge?
> >> I would think should be DP side. there is no reason to enable dsc on
> >> both DSI and DP fro a bridge chip.
>
> My above statement is not correct. For DSI-to-DP bridge,
> drm_bridge_chain_get_first_bridge(drm_enc) return DSI bridge.
>
> Is possible that DSC feature can be added to DSI-to-DP bridge?
>
> If it is not possible, then we can rule out DSI-to-DP bridge case, then
> use struct drm_bridge to retrieve DSC form controller will work.
>
>
>
> > Well, there can be. E.g. to lower the clock rates of the DSI link.
> >
> >> drm_bridge_chain_get_first_bridge(drm_enc) should return the bridge of
> >> the controller.
> >>
> >> In DSI-to-DP bridge chip case, this controller will be the bridge chip
> >> who configured to perform protocol conversion between DSI and DP.
> >>
> >> If DSC enabled should be at DP size which connect to panel.
> > Ok, so it returns the DSC configuration of the bridge's source side.
> > Now let's consider a panel bridge for the DSC-enabled DSI panel.
> > Should get_bridge_dsc() return a DSC config in this case?
> >
> >>>> Do you have other suggestion?
> >>> Let me think about it for a few days.
>
> There is one option which is keep current
>
> 1) keep struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi
> *msm_dsi) at dsi.c
>
> 2) use  struct msm_display_info *disp_info saved at dpu_enc to locate
> struct msm_dsi from priv->dsi[] list (see item #3)
>
> 3)  info.dsc = msm_dsi_get_dsc_config(priv->dsi[info.h_tile_instance[0]]);
>
> 4) ballistically, keep original code but move  info.dsc =
> msm_dsi_get_dsc_config(priv->dsi[i]); to other place sush as
> atomic_check() and atomic_enable().
>

5) leave drm_dsc_config handling as is, update the dsc config from the
DP driver as suitable. If DSC is not supported, set
dsc->dsc_version_major = 0 and dsc->dsc_version_minor = 0 on the DP
side. In DPU driver verify that dsc->dsc_version_major/_minor != 0.

-- 
With best wishes
Dmitry
