Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03350718839
	for <lists+freedreno@lfdr.de>; Wed, 31 May 2023 19:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B349710E1D7;
	Wed, 31 May 2023 17:12:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61C210E507
 for <freedreno@lists.freedesktop.org>; Wed, 31 May 2023 17:12:43 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4572fc781daso1628015e0c.2
 for <freedreno@lists.freedesktop.org>; Wed, 31 May 2023 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685553161; x=1688145161;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ha/IiHaH5j6Z2Cbh1nO+UGmSDQbqB1V+I93hhUI/9O8=;
 b=mhhJO60JV+y4yC2WvXQhRUZyuDqeajiEG8mRNQu0Z11kY7HL+8EAExQLenYZqH7z+2
 2Mzuf9o4IusHjj3MIZfkmPEGuHE5kI6AlerYuypAxDa9bcVAgVZ5UDmC8L+8kB35CRLQ
 PLG+y1whclaJ2hDGwEHNZhA0uec3QSAi4hM9WfzLBBAVV1fN0YEEr/40yZPpgQzFvTt2
 7rEhfgpLsOrEd35guANV18iRfJ+4089lf/mkJToW6y72IHKvYr5/tv6Jf15oIxwmEN2P
 KBD4pK9y5HmuoSr5dGUw0aDtS6LEuwi2zPBapnZ9fOR4sYBv5bsmBaySBb1FXslIxQiH
 882A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685553161; x=1688145161;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ha/IiHaH5j6Z2Cbh1nO+UGmSDQbqB1V+I93hhUI/9O8=;
 b=j1NtaL6E2/NjsuH/YuTekfe/xq7U/vCsEvrc5U0bIG4PJ+UFfDIdF6ReYaU+mTIQ3m
 2VkgOBxfOKeFZkALoSJULRdRVb5o1xU6LNLx/Z1q7nYYzriW0vnrf/uastURs6L6h0Tx
 m3W6KaAjh2VLuciso1xz68HlVZCEoRTHCJfQGQLlgK2DBQRiJUauYbCztT/58sLLRKgQ
 j4/dClf4riXi7z/XZ4pynXW4AvYwAD0ymPxLS3XbmeKQpw+FbSR+Q03SFJBZ0Bw1d2Md
 F0kuIDRiw7bZV5D3p8CMQVcKexz8yUSOsI3u1wd3CQxYOG2okqg4CYgULZalQq+uYSi5
 ycaA==
X-Gm-Message-State: AC+VfDyuwaYGnkpYI776sChhLE0+kpB8VUGlPkzPwopcA0ICi68PLt4C
 64plJiDdjh45J9KOgXjuyCaAqO8fKhFtYkzp9EckZw==
X-Google-Smtp-Source: ACHHUZ6oRlQHMt3xDrn+41gUpjU+uA1RCTiAOhFhwhwc1iVr5n/7DlebDHtwxCujodDYMCeRKw4G+OdExuKthRhprqg=
X-Received: by 2002:a1f:cb44:0:b0:457:2d6a:7b4d with SMTP id
 b65-20020a1fcb44000000b004572d6a7b4dmr2205147vkg.10.1685553161697; Wed, 31
 May 2023 10:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
 <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
 <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
In-Reply-To: <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 May 2023 20:12:31 +0300
Message-ID: <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 31 May 2023 at 18:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
>
> >>   +    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> >
> > INTF_DSI
> >
> >> +        struct drm_bridge *bridge;
> >> +
> >> +        if (!dpu_enc->dsc) {
> >
> > This condition is not correct. We should be updating the DSC even if
> > there is one.
> >
> >> +            bridge = drm_bridge_chain_get_first_bridge(drm_enc);
> >> +            dpu_enc->dsc = msm_dsi_bridge_get_dsc_config(bridge);
> >
> > This approach will not work for the hot-pluggable outputs. The dpu_enc
> > is not a part of the state. It should not be touched before
> > atomic_commit actually commits changes.
> where can drm_dsc_config be stored?

I'd say, get it during atomic_check (and don't store it anywhere).
Then get it during atomic_enable (and save in dpu_enc).

> >
> > Also, I don't think I like the API. It makes it impossible for the
> > driver to check that the bridge is the actually our DSI bridge or not.
> > Once you add DP here, the code will explode.
> >
> > I think instead we should extend the drm_bridge API to be able to get
> > the DSC configuration from it directly. Additional care should be put
> > to design an assymetrical API. Theoretically a drm_bridge can be both
> > DSC source and DSC sink. Imagine a DSI-to-DP or DSI-to-HDMI bridge,
> > supporting DSC on the DSI side too.
>
> Form my understanding, a bridge contains two interfaces.
>
> Therefore I would think only one bridge for dsi-to-dp bridge? and this
> bridge should represent the bridge chip?
>
> I am thinking adding an ops function, get_bridge_dsc() to struct
> drm_bridge_funcs to retrieve drm_dsc_config.

So, for this DSI-to-DP bridge will get_bridge_dsc() return DSC
configuration for  the DSI or for the DP side of the bridge?

>
> Do you have other suggestion?

Let me think about it for a few days.

-- 
With best wishes
Dmitry
